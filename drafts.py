# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

from music21 import *

converter.parse("tinynotation: 3/4 c4 d8 f g16 a g f#").show()


import webbrowser
listOfMotets

bwv295 = corpus.parse('bach/bwv295')

bwv295.show()


littleMelody = converter.parse("tinynotation: 3/4 c4 d8 f g16 a g f#")
littleMelody.show("lily.pdf")

a = corpus.parse("monteverdi/madrigal.3.14.rntxt")

a.show()

from music21 import *
p1 = pitch.Pitch('b-4')

p1.transpose('J11').nameWithOctave

p1.transpose

print(pitch.Pitch('b-4').getEnharmonic())
print(pitch.Pitch('b-4').getLowerEnharmonic())

dottedQuarter = duration.Duration(math.pi)
dottedQuarter.type

p = note.Note('C4')
p.duration = duration.Duration(4.5)
p.duration.type


#------------------------------------------------------------------------------

from music21 import *

note1 = note.Note("C4")
note1.duration.type = 'half'
note2 = note.Note("F#4")
note3 = note.Note("B-2")
stream1 = stream.Stream()
stream1.id = 'some notes'
stream1.append(note1)
stream1.append(note2)
stream1.append(note3)
biggerStream = stream.Stream()
note2 = note.Note("D#5")
biggerStream.insert(0, note2)
biggerStream.append(stream1)
biggerStream.show('text')
biggerStream.show()


sBach = corpus.parse('bach/bwv57.8')


sBach.show()



c = chord.Chord(["E3","C7","G4", "B-4", "D4", "F6"])
print harmony.chordSymbolFigureFromChord(c, True)
print("%s  / %s" % (c.pitchedCommonName, c.bass().nameWithOctave))

##############
c = chord.Chord(["C4", "D#4", "F#4", "A4"])
print("%s  / %s" % (c.pitchedCommonName, c.bass().nameWithOctave))

c = chord.Chord(["C4", "E-4", "F#4", "A4"])
print("%s  / %s" % (c.pitchedCommonName, c.bass().nameWithOctave))

c = chord.Chord(["C4", "E-4", "G-4", "A4"])
print("%s  / %s" % (c.pitchedCommonName, c.bass().nameWithOctave))

c = chord.Chord(["C4", "E-4", "G-4", "B--4"])
print("%s  / %s" % (c.pitchedCommonName, c.bass().nameWithOctave))

c.show("lily.png")


##############################################################################
from music21 import *
import random as r
import re

all_notes = ["C", "D", "E", "F", "G", "A", "B"]
all_accents = ["", "-", "#"]
all_cases = ["4", "5"]
all_pitches = []
for n in all_notes:
    for a in all_accents:
        for c in all_cases:
            all_pitches.append(n + a + c)


###############################################################################

tom = random.sample(all_pitches, 1)[0]
modo = random.sample(['major', 'minor'], 1)[0]
if modo == 'major':
    modo_terca = "M3"
else:
    modo_terca = "m3"



tom = 'C'
base = note.Note(tom)
s = stream.Stream()
s.append(key.Key(tom, modo))


# adicionando a terca
acorde = chord.Chord([base])
acorde.root(base)
terca = base.transpose(modo_terca)
acorde.add(terca)

# opcoes para adicionar a quinta
if int_terca.name == 'M3':
    opts = [2,3,4]
else:
    opts = [3,4]
# adicionando a quinta
int_quinta = interval.Interval(r.sample(opts, 1)[0])
quinta = int_quinta.transposeNote(terca)
acorde.add(quinta)


s.append(acorde)
modo
s[0]
s[1]


# adicionando setima
if r.uniform(0, 1) < 0.5:
    if acorde.isDiminishedTriad():



    int_setima = interval.Interval(r.sample([9, 10], 1)[0])
    setima = int_quinta
    int_setima.add(acorde)



inter = interval.Interval(3)


inter.transposeNote(initial_note)


triade.add(initial_note)


triade.

my_stream = stream.Stream()
successful_chords = 0
while successful_chords < 40:
    n = random.sample(range(3, 5), 1)[0]
    my_pitches = random.sample(all_pitches, n)
    ch = chord.Chord(my_pitches)
    ch.root(random.sample(my_pitches, 1)[0])
    try:
        h = harmony.chordSymbolFigureFromChord(ch, True)
    except:
        "nada"
    pattern = re.compile("Cannot|power|It|ristan|edal|Gr|Fr|N|omit|add")
    if pattern.search(h[0]) is None:
        ch.addLyric(h[0])
        ch.duration.type = 'whole'
        my_stream.append(ch.semiClosedPosition())
        successful_chords += 1

my_stream.show()


###############################################################################



harmony.getAbbreviationListGivenChordType('minor-major-13th')

h = harmony.ChordSymbol("CmM13")
aff = [p.nameWithOctave for p in h.pitches]



roman.postFigureFromChordAndKey(chord.Chord("C E G B-"), key.Key("C"))

str(roman.romanNumeralFromChord(c, key.Key("C")).figure)



o = corpus.parse('josquin/laDeplorationDeLaMorteDeJohannesOckeghem')

o.show()

for s in o:
  print(s)

mergedScores = o.mergeScores()
scoreExcerpt = mergedScores.measures(0, 208)
scoreExcerpt.show()

reduction = scoreExcerpt.chordify()
reduction.show()

for c in reduction.recurse().getElementsByClass('Chord'):
    c.closedPosition(forceOctave=4, inPlace=True)
    c.annotateIntervals()

scoreExcerpt.insert(0, reduction)
emptyPart = scoreExcerpt.parts[3]
scoreExcerpt.remove(emptyPart)
scoreExcerpt.show()


