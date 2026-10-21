Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testBlackPawnPromotesToQueen [
	| board pawn promoted |
	board := MyChessBoard empty.
	board at: 'd2' put: (pawn := MyPawn black).

	pawn moveTo: (board at: 'd1').

	promoted := (board at: 'd1') contents.
	self assert: promoted class equals: MyQueen.
	self deny: promoted isWhite
]

{ #category : 'as yet unclassified' }
MyPawnTests >> testEnPassant [
	
	|whitePawn blackPawn squares board|
	board := MyChessBoard empty.
	board at: 'g5' put: (whitePawn := MyPawn white).
	board at: 'f7' put: (blackPawn := MyPawn black).
	
	blackPawn moveTo: (board at: 'f5').
	
	self assert: (board at: 'f5') contents equals: blackPawn.
	
	squares := whitePawn targetSquares.
	self
		assertCollection: squares 
		hasSameElements: 
			(#('g6' 'f6') collect: [ :name | board at: name])
]

{ #category : 'tests' }
MyPawnTests >> testEnPassantWithCapture [
	|whitePawn blackPawn squares board|
	board := MyChessBoard empty.
	board at: 'g5' put: (whitePawn := MyPawn white).
	board at: 'f7' put: (blackPawn := MyPawn black).
	
	blackPawn moveTo: (board at: 'f5').
	self assert: (board at:'f5') contents equals: blackPawn.
	
	whitePawn moveTo: (board at:'f6').
	self assert: (board at:'f6') contents equals: whitePawn .
	
	self deny: (board at:'f5') hasPiece 
	
]

{ #category : 'tests' }
MyPawnTests >> testNoEnPassantAfterAnotherMove [
	| board whitePawn blackPawn |
	board := MyChessBoard empty.
	board at: 'g5' put: (whitePawn := MyPawn white).
	board at: 'f7' put: (blackPawn := MyPawn black).
	board at: 'a2' put: MyPawn white.

	blackPawn moveTo: (board at: 'f5').
	(board at: 'a2') contents moveTo: (board at: 'a3').

	self deny: (whitePawn targetSquares includes: (board at: 'f6'))
]

{ #category : 'tests' }
MyPawnTests >> testOutsideSquareStaysOutside [
	| board |
	board := MyChessBoard empty.
	self deny: (board at: 'a1') left isOnBoard.
	self deny: (board at: 'h8') up up right isOnBoard
]

{ #category : 'tests' }
MyPawnTests >> testPromotionWithCapture [
	| board pawn |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn white).
	board at: 'd8' put: MyRook black.

	pawn moveTo: (board at: 'd8').

	self assert: (board at: 'd8') contents class equals: MyQueen.
	self assert: (board at: 'd8') contents isWhite.
	self deny: (board at: 'e7') hasPiece
]

{ #category : 'tests' }
MyPawnTests >> testTwoSquaresMoves [
		
	|pawn board squares|
	board := MyChessBoard empty.
	board at: 'g2' put: (pawn := MyPawn white).
		
	squares := pawn targetSquares.
	self
		assertCollection: squares 
		includesAll:
			(#( g3 g4 ) collect: [ :name | board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testWhitePawnPromotesToQueen [
	| board pawn promoted |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn white).

	pawn moveTo: (board at: 'e8').

	promoted := (board at: 'e8') contents.
	self assert: promoted class equals: MyQueen.
	self assert: promoted isWhite.
	self assert: promoted square equals: (board at: 'e8')
]
