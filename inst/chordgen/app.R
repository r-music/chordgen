library(shiny)
library(chordgen)

write_midi <- function(s, path) {
  aff <- music21$midi$translate$streamToMidiFile(s)
  aff$open(path, "wb")
  aff$write()
  aff$close()
}

ui <- fluidPage(
  tags$script(src = "//www.midijs.net/lib/midi.js"),
  titlePanel("Gerador de acordes"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("n", "Quantidade de acordes", 1, 100, 30),
      sliderInput("n_notes", "Quantidade de notas", 3, 7, c(3, 4),
                  dragRange = FALSE),
      selectInput("triad_types", "Tipos de tríades", c(
        major = 1, minor = 2,
        augmented = 3, diminished = 4,
        sus4 = 5, m3d5 = 6
      ), selected = 1:4, multiple = TRUE),
      sliderInput("octave", "Oitavas:", -1, 1, value = c(0, 0),
                  dragRange = FALSE),
      sliderInput("transpose", "Transposição:", -5, 5, value = c(0, 4),
                  dragRange = FALSE),
      tags$hr(),
      checkboxInput("invert", "Adicionar inversões?", value = FALSE),
      checkboxInput("add_lyric", "Adicionar harmonia?", value = FALSE),
      tags$hr(),
      actionButton("go", "Refazer!")
    ),
    mainPanel(
      uiOutput("play"),
      plotOutput("chordgen", width = '100%', height = "600px")
    )
  )
)

server <- function(input, output) {

  chords <- reactive({
    input$go
    isolate({
      ch <- chordgen::chordgen(
        n = input$n,
        n_notes = input$n_notes,
        invert = input$invert,
        triad_types = as.numeric(input$triad_types),
        octave = seq(input$octave[1], input$octave[2], 1),
        transpose = seq(input$transpose[1], input$transpose[2], 1),
        add_lyric = input$add_lyric
      )
    })
    ch
  })

  observe({
    ch <- chords()
    write_midi(ch, "www/midi.mid")
  })

  output$chordgen <- renderPlot({
    plot(chords())
  })

  output$play <- renderUI({
    wellPanel(
      tags$a("Play!", href = "#", onClick = "MIDIjs.play('midi.mid');"),
      tags$br(),
      tags$a("Stop!", href = "#", onClick = "MIDIjs.stop();")
    )
  })

}

shinyApp(ui = ui, server = server)

