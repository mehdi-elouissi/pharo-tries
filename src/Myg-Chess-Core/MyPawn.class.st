Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPawn >> backwardOf: aSquare [
	^ self isWhite 
		ifTrue: [ aSquare down ] 
		ifFalse: [ aSquare up ].
]

{ #category : 'testing' }
MyPawn >> canCaptureOn: aSquare [
	^ aSquare isOnBoard and: [
		  (aSquare hasPiece and: [ aSquare contents color ~= color ])
			  or: [ aSquare = self board enPassantSquare ] ]
]

{ #category : 'as yet unclassified' }
MyPawn >> captureSquares [
	| front |
	front := self forwardOf: square.
	^ { front left. front right } select: [ :s | self canCaptureOn: s ]
]

{ #category : 'as yet unclassified' }
MyPawn >> forwardOf: aSquare [
	^ self isWhite 
		ifTrue: [ aSquare up ] 
		ifFalse: [ aSquare down ].
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'testing' }
MyPawn >> isOnLastRank [
	^ (self forwardOf: square) isOnBoard not
]

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [
	|from isEnPassant| 
	from := square .
	isEnPassant := aSquare = self board enPassantSquare.
	super moveTo: aSquare.
	
	square  = aSquare ifFalse: [ ^ self ].
	
	isEnPassant ifTrue: [ (self backwardOf: aSquare) emptyContents ].
	
	(self forwardOf: (self forwardOf: from )) = aSquare
		ifTrue: [ self board enPassantSquare: (self forwardOf: from) ].
		
	self isOnLastRank ifTrue: [ self promote ]
	
	
	
	
]

{ #category : 'as yet unclassified' }
MyPawn >> promote [
	| newPiece |
	newPiece := self isWhite
		ifTrue: [ self promotionPieceClass white ]
		ifFalse: [ self promotionPieceClass black ].
	square contents: newPiece.
	newPiece square: square
]

{ #category : 'as yet unclassified' }
MyPawn >> promotionPieceClass [
	^ MyQueen
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	| direction startRank squares next |
	direction := self isWhite ifTrue: [ #up ] ifFalse: [ #down ].
	startRank := self isWhite ifTrue: [ $2 ] ifFalse: [ $7 ].
	squares := OrderedCollection new.

	next := square perform: direction.
	(next notNil and: [ next hasPiece not ]) ifTrue: [
		squares add: next.
		square file = startRank ifTrue: [
			next := next perform: direction.
			(next notNil and: [ next hasPiece not ]) ifTrue: [ squares add: next ] ] ].

	squares addAll: self captureSquares.
	^ squares asArray
]
