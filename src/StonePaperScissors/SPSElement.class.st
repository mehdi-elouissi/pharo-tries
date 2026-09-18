Class {
	#name : 'SPSElement',
	#superclass : 'Object',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'as yet unclassified' }
SPSElement >> playAgainstPaper [
	^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
SPSElement >> playAgainstScissors [
	^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
SPSElement >> playAgainstStone [
	^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
SPSElement >> vs: anElement [
	^ self subclassResponsibility 
]
