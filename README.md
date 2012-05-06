GSA-Performance-Testing
=======================

Some code to check performance in different Smalltalks

SampleSystem explore.

-- System creation --
Time millisecondsToRun: [SampleSystem createSampleObjects]

-- Instance Creation --
x1 := SampleSystem instance.


Time millisecondsToRun: [x1 cities collect: [:each | Transcript show: each name; cr]]

Time millisecondsToRun: [x1 clients select: [:each | each lastName = 'Gomez Deck'] thenCollect:[:each | Transcript show: each name; cr]]

-- Caution, near 6 hours in a PIV box --
Time millisecondsToRun: [x1 clients select: [:each | '*Deck*' match: each name] thenCollect:[:each | Transcript show: each name; cr]] 

-- Caution, near 1 hour in a PIV box --
Time millisecondsToRun: [x1 clients select: [:each | '*Deck*' match: each name]]