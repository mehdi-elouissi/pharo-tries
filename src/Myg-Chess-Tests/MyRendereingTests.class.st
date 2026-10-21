Class {
	#name : 'MyRendereingTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyRendereingTests >> testRenderAllPieces [
	"letters: white piece on light square, white on dark, black on light, black on dark"
	{ MyKing -> 'KkLl'. MyQueen -> 'QqWw'. MyRook -> 'RrTt'.
	  MyBishop -> 'BbVv'. MyKnight -> 'NnMm'. MyPawn -> 'PpOo' } do: [ :each |
		| letters |
		letters := each value.
		self assert: (each key white renderPieceOn: MyChessSquare white) equals: (letters at: 1) asString.
		self assert: (each key white renderPieceOn: MyChessSquare black) equals: (letters at: 2) asString.
		self assert: (each key black renderPieceOn: MyChessSquare white) equals: (letters at: 3) asString.
		self assert: (each key black renderPieceOn: MyChessSquare black) equals: (letters at: 4) asString ]
]
