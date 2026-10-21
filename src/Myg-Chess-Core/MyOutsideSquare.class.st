Class {
	#name : 'MyOutsideSquare',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'arithmetic' }
MyOutsideSquare >> + aPoint [
	^ self
]

{ #category : 'api - configuration' }
MyOutsideSquare >> down [
	^ self
]

{ #category : 'testing' }
MyOutsideSquare >> hasPiece [
	^ false
]

{ #category : 'highlighting' }
MyOutsideSquare >> highlightTarget [ 
	^ self
]

{ #category : 'testing' }
MyOutsideSquare >> isOnBoard [
	^ false
]

{ #category : 'accessing' }
MyOutsideSquare >> left [
	^ self
]

{ #category : 'accessing' }
MyOutsideSquare >> right [
	^ self
]

{ #category : 'highlighting' }
MyOutsideSquare >> unhighlightTarget [ 
	^ self
]

{ #category : 'instance creation' }
MyOutsideSquare >> up [
	^ self
]
