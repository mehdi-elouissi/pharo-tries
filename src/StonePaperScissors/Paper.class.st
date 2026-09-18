Class {
	#name : 'Paper',
	#superclass : 'SPSElement',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'as yet unclassified' }
Paper >> playAgainstPaper [
	^ #draw
]

{ #category : 'as yet unclassified' }
Paper >> playAgainstScissors [
	^ #scissors
]

{ #category : 'as yet unclassified' }
Paper >> playAgainstStone [
	^ #paper
]

{ #category : 'as yet unclassified' }
Paper >> vs: anElement [
	^ anElement playAgainstPaper
]
