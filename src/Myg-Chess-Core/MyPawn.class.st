Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	|direction startRank squares next|
	direction := self isWhite ifTrue: [ #up ] ifFalse: [ #down ].
	startRank := self isWhite ifTrue: [ $2 ] ifFalse: [ $7 ].
	squares := OrderedCollection new.
	
	next := square perform: direction.
	(next notNil and: [next hasPiece not]) ifFalse: [ ^squares asArray ].
	squares add: next.
	
	square file = startRank ifTrue: [ 
		next := next perform: direction.
		(next notNil and: [next hasPiece not]) ifTrue: [ squares add: next ] ].
	
	^squares asArray 
]
