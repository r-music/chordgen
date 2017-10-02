from music21 import *
import random
import re

all_notes = ["C", "D", "E", "F", "G", "A", "B"]
all_accents = ["", "-", "#"]
all_cases = ["4", "5"]
all_pitches = []
for n in all_notes:
    for a in all_accents:
        for c in all_cases:
            all_pitches.append(n + a + c)

my_stream = stream.Stream()
successful_chords = 0
while successful_chords < 40:
    n = random.sample(range(3, 7), 1)[0]
    my_pitches = random.sample(all_pitches, n)
    ch = chord.Chord(my_pitches)
    ch.root(random.sample(my_pitches, 1)[0])
    try:
        h = harmony.chordSymbolFigureFromChord(ch, True)
    except:
        "nada"
    pattern = re.compile("Cannot|power|It|ristan|edal|Gr|Fr|N")
    if pattern.search(h[0]) is None:
        ch.addLyric(h[0])
        ch.duration.type = 'whole'
        my_stream.append(ch.semiClosedPosition())
        successful_chords += 1

my_stream.show()
