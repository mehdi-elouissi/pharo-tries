Class {
	#name : 'Stone',
	#superclass : 'SPSElement',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'as yet unclassified' }
Stone >> playAgainstPaper [
	^ #paper
]

{ #category : 'as yet unclassified' }
Stone >> playAgainstScissors [ 
	^ #stone
]

{ #category : 'as yet unclassified' }
Stone >> playAgainstStone [
	^ #draw
]

{ #category : 'as yet unclassified' }
Stone >> vs: anElement [
	^ anElement playAgainstStone
]
