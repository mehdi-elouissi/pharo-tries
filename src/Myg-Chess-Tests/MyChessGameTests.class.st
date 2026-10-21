Class {
	#name : 'MyChessGameTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'accessing' }
MyChessGameTests >> movePieceAt: from to: to in: game [
	game move: (game board at: from) contents to: (game board at: to)
]

{ #category : 'tests' }
MyChessGameTests >> testBlackCannotStart [
	| game |
	game := MyChessGame freshGame.
	self movePieceAt: 'e7' to: 'e5' in: game.
	self assert: (game board at: 'e7') hasPiece.
	self deny: (game board at: 'e5') hasPiece
]

{ #category : 'tests' }
MyChessGameTests >> testIllegalMoveKeepsTurn [
	| game |
	game := MyChessGame freshGame.
	self movePieceAt: 'e2' to: 'e5' in: game.  "illegal"
	self assert: game currentPlayer isWhite.
	self movePieceAt: 'e2' to: 'e4' in: game.
	self assert: (game board at: 'e4') hasPiece
]

{ #category : 'tests' }
MyChessGameTests >> testTurnsAlternate [
	| game |
	game := MyChessGame freshGame.
	self movePieceAt: 'e2' to: 'e4' in: game.
	self movePieceAt: 'e7' to: 'e5' in: game.
	self assert: (game board at: 'e5') hasPiece.
	self assert: game currentPlayer isWhite
]

{ #category : 'tests' }
MyChessGameTests >> testWhiteCannotPlayTwice [
	| game |
	game := MyChessGame freshGame.
	self movePieceAt: 'e2' to: 'e4' in: game.
	self movePieceAt: 'd2' to: 'd4' in: game.
	self assert: (game board at: 'd2') hasPiece.
	self deny: (game board at: 'd4') hasPiece
]
