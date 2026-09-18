Class {
	#name : 'TestTwo',
	#superclass : 'TestCase',
	#instVars : [
		'c',
		'count'
	],
	#category : 'Counter',
	#package : 'Counter'
}

{ #category : 'tests' }
TestTwo >> testIncrement [
	
	c := Counter new.
	
	self assert: c count equals: 7
]
