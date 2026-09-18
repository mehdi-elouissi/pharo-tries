Class {
	#name : 'Scissors',
	#superclass : 'SPSElement',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'as yet unclassified' }
Scissors >> playAgainstPaper [
	^ #scissors
]

{ #category : 'as yet unclassified' }
Scissors >> playAgainstScissors [ 
	^ #draw
]

{ #category : 'as yet unclassified' }
Scissors >> playAgainstStone [
	^ #stone
]

{ #category : 'as yet unclassified' }
Scissors >> vs: anElement [
	^ anElement playAgainstScissors
]
