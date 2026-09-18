Class {
	#name : 'StonePaperScissorsTest',
	#superclass : 'TestCase',
	#category : 'StonePaperScissors',
	#package : 'StonePaperScissors'
}

{ #category : 'tests' }
StonePaperScissorsTest >> testInversedTest [
	self assert: (Stone new vs: Paper new) equals: (Paper new vs: Stone new)
]

{ #category : 'tests' }
StonePaperScissorsTest >> testPaperIsWinning [
	self assert: (Stone new vs: Paper new) equals: #paper
]

{ #category : 'tests' }
StonePaperScissorsTest >> testStoneIsWinning [
	self assert: (Stone new vs: Scissors new) equals: #stone

]
