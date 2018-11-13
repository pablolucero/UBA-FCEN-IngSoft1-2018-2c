!classDefinition: #TerniLapilliConsoleTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliConsoleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliConsoleTest methodsFor: 'tests' stamp: 'HGZ 11/11/2018 18:34:29'!
test01afterFirstMarkConsoleShouldInformIsPlayingO
	| game console lines |
	game _ TerniLapilli new.
	console _ TerniLapilliConsole new.
	game register: console.
	game markWithXAt: 2 @ 2.
	lines _ console lines.
	self
		assert: console lines size
		equals: 2.
	self assert: (lines at: 1) = 'X marcó en 2@2'.
	self assert: (lines at: 2) = 'Estado: Jugando O'.! !

!TerniLapilliConsoleTest methodsFor: 'tests' stamp: 'HGZ 11/11/2018 18:34:29'!
test02afterSecondMarkConsoleShouldInformIsPlayingX
	| game console lines |
	game _ TerniLapilli new.
	console _ TerniLapilliConsole new.
	game register: console.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	lines _ console lines.
	self
		assert: lines size
		equals: 4.
	self assert: (lines at: 1) = 'X marcó en 2@2'.
	self assert: (lines at: 2) = 'Estado: Jugando O'.
	self assert: (lines at: 3) = 'O marcó en 1@1'.
	self assert: (lines at: 4) = 'Estado: Jugando X'.! !

!TerniLapilliConsoleTest methodsFor: 'tests' stamp: 'HGZ 11/11/2018 18:34:29'!
test03afterXWonConsoleShouldInformXWon
	| game console lines |
	game _ TerniLapilli new.
	console _ TerniLapilliConsole new.
	game register: console.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 1.
	lines _ console lines.
	self
		assert: lines size
		equals: 10.
	self assert: (lines at: 1) = 'X marcó en 2@2'.
	self assert: (lines at: 2) = 'Estado: Jugando O'.
	self assert: (lines at: 3) = 'O marcó en 1@1'.
	self assert: (lines at: 4) = 'Estado: Jugando X'.
	self assert: (lines at: 5) = 'X marcó en 1@3'.
	self assert: (lines at: 6) = 'Estado: Jugando O'.
	self assert: (lines at: 7) = 'O marcó en 1@2'.
	self assert: (lines at: 8) = 'Estado: Jugando X'.
	self assert: (lines at: 9) = 'X marcó en 3@1'.
	self assert: (lines at: 10) = 'Estado: Juego terminado - Ganó X!!'.! !

!TerniLapilliConsoleTest methodsFor: 'tests' stamp: 'HGZ 11/11/2018 18:34:29'!
test04afterOWonConsoleShouldInformOWon
	| game console lines |
	game _ TerniLapilli new.
	console _ TerniLapilliConsole new.
	game register: console.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 1 @ 3.
	lines _ console lines.
	self
		assert: lines size
		equals: 12.
	self assert: (lines at: 1) = 'X marcó en 2@2'.
	self assert: (lines at: 2) = 'Estado: Jugando O'.
	self assert: (lines at: 3) = 'O marcó en 1@1'.
	self assert: (lines at: 4) = 'Estado: Jugando X'.
	self assert: (lines at: 5) = 'X marcó en 3@2'.
	self assert: (lines at: 6) = 'Estado: Jugando O'.
	self assert: (lines at: 7) = 'O marcó en 1@2'.
	self assert: (lines at: 8) = 'Estado: Jugando X'.
	self assert: (lines at: 9) = 'X marcó en 3@3'.
	self assert: (lines at: 10) = 'Estado: Jugando O'.
	self assert: (lines at: 11) = 'O marcó en 1@3'.
	self assert: (lines at: 12) = 'Estado: Juego terminado - Ganó O!!'.! !

!TerniLapilliConsoleTest methodsFor: 'tests' stamp: 'HGZ 11/11/2018 18:34:29'!
test05afterGameTiedConsoleShouldInformGameTied
	| game console lines |
	game _ TerniLapilli new.
	console _ TerniLapilliConsole new.
	game register: console.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 1 @ 3.
	lines _ console lines.
	self
		assert: lines size
		equals: 18.
	self assert: (lines at: 1) = 'X marcó en 2@2'.
	self assert: (lines at: 2) = 'Estado: Jugando O'.
	self assert: (lines at: 3) = 'O marcó en 1@1'.
	self assert: (lines at: 4) = 'Estado: Jugando X'.
	self assert: (lines at: 5) = 'X marcó en 3@2'.
	self assert: (lines at: 6) = 'Estado: Jugando O'.
	self assert: (lines at: 7) = 'O marcó en 1@2'.
	self assert: (lines at: 8) = 'Estado: Jugando X'.
	self assert: (lines at: 9) = 'X marcó en 3@3'.
	self assert: (lines at: 10) = 'Estado: Jugando O'.
	self assert: (lines at: 11) = 'O marcó en 3@1'.
	self assert: (lines at: 12) = 'Estado: Jugando X'.
	self assert: (lines at: 13) = 'X marcó en 2@1'.
	self assert: (lines at: 14) = 'Estado: Jugando O'.
	self assert: (lines at: 15) = 'O marcó en 2@3'.
	self assert: (lines at: 16) = 'Estado: Jugando X'.
	self assert: (lines at: 17) = 'X marcó en 1@3'.
	self assert: (lines at: 18) = 'Estado: Juego terminado - Empate!!'.! !


!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 10/27/2017 17:25:54'!
functionalException

	^Error - MessageNotUnderstood! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test01GameStartsWithAnEmptyBoarAndPlayingX

	"I initialize it on each test and not in the setUp to facilitate the restar of the test - Hernan"
	
	game _ TerniLapilli new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO

	game _ TerniLapilli new.
	
	game markAll: {1@1}.

	self assertXIsMarkedOn: {1@1} andOOn: {}.
	self assertIsPlayingO

! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsY

	game _ TerniLapilli new.

	game markAll: { 1 @ 1. 2 @ 2 }.

	self assertXIsMarkedOn: {1@1} andOOn: {2@2}.
	self assertIsPlayingX.

! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test04CanNotMarkWithXWhenLastMarkWasX

	game _ TerniLapilli new.
	
	game markAll: { 1@1 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self assert: TerniLapilli notXTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test05CanNotMarkWithOWhenLastMarkWasO

	game _ TerniLapilli new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli notOTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX

	game _ TerniLapilli new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO

	game _ TerniLapilli new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX

	game _ TerniLapilli new.
	
	game markAll: { 1@1 }.
	
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO

	game _ TerniLapilli new.

	game markAll: {1@1. 2@2. 3@3 }.

	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1. 3@3} andOOn: {2@2} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test10XWinsWhenCompletesRowNumber1

	game _ TerniLapilli new.

	game markAll: {1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self assertXWon.
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test11XWinsWhenCompletesRowNumber2

	game _ TerniLapilli new.

	game markAll: {2@1. 1@1. 2@2. 3@1. 2@3 }.

	self assertXWon ! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test12XWinsWhenCompletesRowNumber3

	game _ TerniLapilli new.

	game markAll: {3@1. 1@1. 3@2. 2@1. 3@3 }.

	self assertXWon ! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test13XWinsWhenCompletesAColumn

	game _ TerniLapilli new.

	game markAll: { 1@1. 2@2. 1@2. 3@3. 1@3}.

	self assertXWon ! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test14XWinsWhenCompletesDiagonalGoingDown

	game _ TerniLapilli new.

	game markAll: { 1@1. 1@2. 2@2. 1@3. 3@3 }.

	self assertXWon ! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test15XWinsWhenCompletesDiagonalGoingUp

	game _ TerniLapilli new.

	game markAll: { 1@3. 1@2. 2@2. 2@1. 3@ 1 }.

	self assertXWon ! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test16OWinsWhenCompletesARow

	game _ TerniLapilli new.

	game markAll: {2@1. 1@1. 2@2. 1@2. 3@1. 1@3 }.

	self assertOWon! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test17OWinsWhenCompletesAColumn

	game _ TerniLapilli new.

	game markAll: { 2@2. 1@1. 3@3. 1@2. 2@3. 1@3 }.

	self assertOWon! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test18OWinsWhenCompletesDiagonalGoingDown

	game _ TerniLapilli new.

	game markAll: { 3@2. 1@3. 1@2. 2@2. 1@1. 3@1 }.

	self assertOWon ! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test19OWinsWhenCompletesDiagonalGoingUp

	game _ TerniLapilli new.

	game markAll: {1@2. 1@1. 1@3. 2@2. 2@1. 3@3 }.

	self assertOWon ! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test20OCanNotPlayWhenXWon

	game _ TerniLapilli new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test21XCanNotPlayWhenOWon

	game _ TerniLapilli new.

	game markAll: { 2@2. 1@1. 2@1. 1@2. 3@1. 1@3 }.

	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: { 2@2. 2@1. 3@1 } ]
		! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test22GameCanEndUpTied

	game _ TerniLapilli new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self assertGameIsTied! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test23XCanWinOnLastEmptyPosition

	game _ TerniLapilli new.

	game markAll: { 2@2. 1@2. 1@1. 2@1. 1@3. 2@3. 3@2. 3@1. 3@3 }.

	self assertXWon ! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test24CanNotPlayWhenGameIsTied

	game _ TerniLapilli new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test25CanNotMarkOutsideBoard

	game _ TerniLapilli new.

	#(0 4) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test26OCanNotMarkWhenGameIsOver

	game _ TerniLapilli new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test27XPlayIsLastPlay

	game _ TerniLapilli new.
	game markAll: {1@1}.
	
	self assert: game lastPlay equals: 1@1.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test28ThereIsNoLastPlayInNewGame

	game _ TerniLapilli new.
	self
		should: [ game lastPlay ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli ThereAreNoPlaysYetErrorMessage equals: anError messageText.
		]
		! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HGZ 11/11/2018 18:33:08'!
test29OPlayIsLastPlay

	game _ TerniLapilli new.
	game markAll: {1@1. 1@2}.
	
	self assert: game lastPlay equals: 1@2.! !


!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:06'!
assertCanNotMarkAt: aPosition

	self assertCanNotMarkUsing: [ game markWithXAt: aPosition ].
	self assertCanNotMarkUsing: [ game markWithOAt: aPosition ].
	
	! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HGZ 11/11/2018 18:33:08'!
assertCanNotMarkUsing: aMarkingClosure

	self
		should: aMarkingClosure 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionOutsideBoardErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {} andOOn: {} ].! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:14'!
assertGameIsNotOver

	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.	! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:48'!
assertGameIsOver
	
	self assert: game isOver.

	self deny: game isPlayingX.
	self deny: game isPlayingO.
		
! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:40:41'!
assertGameIsTied

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:13:05'!
assertIsPlayingO
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	self assertGameIsNotOver ! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:05'!
assertIsPlayingX
		
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.
	! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:38:07'!
assertOIsMarkedOn: oPositions
		
	self assert: oPositions size equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions) isEmpty.
! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:32:18'!
assertOWon

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self deny: game isTied.
! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:56'!
assertXIsMarkedOn: xPositions

	self assert: xPositions size equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions) isEmpty.
	! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:44'!
assertXIsMarkedOn: xPositions andOOn: oPositions
 
	self assertXIsMarkedOn: xPositions.
	self assertOIsMarkedOn: oPositions.
	! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:30'!
assertXWon
	
	self assertGameIsOver.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
! !


!classDefinition: #TerniLapilliViewTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliViewTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliViewTest methodsFor: 'tests' stamp: 'HGZ 11/11/2018 18:34:41'!
test01afterFirstMarkInTheMiddleViewShouldShowAnXInTheMiddle
	| game view boardStateText playingStateText lines nl |
	game _ TerniLapilli new.
	view _ TerniLapilliView new.
	game register: view.
	nl _ Character newLineCharacter asString.
	boardStateText _ ' | | ' , nl , '-----' , nl , ' |X| ' , nl , '-----' , nl , ' | | '.
	playingStateText _ 'Playing O'.
	game markWithXAt: 2 @ 2.
	lines _ view lines.
	self assert: (lines at: 1) = boardStateText.
	self assert: (lines at: 2) = playingStateText.! !

!TerniLapilliViewTest methodsFor: 'tests' stamp: 'HGZ 11/11/2018 18:34:41'!
test02afterThirdMarkViewShouldShowTwoXsAndOneO
	| game view boardStateText playingStateText lines nl |
	game _ TerniLapilli new.
	view _ TerniLapilliView new.
	game register: view.
	nl _ Character newLineCharacter asString.
	boardStateText _ 'X| | ' , nl , '-----' , nl , ' |X| ' , nl , '-----' , nl , 'O| | '.
	playingStateText _ 'Playing O'.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	lines _ view lines.
	self assert: (lines at: 1) = boardStateText.
	self assert: (lines at: 2) = playingStateText.! !

!TerniLapilliViewTest methodsFor: 'tests' stamp: 'HGZ 11/11/2018 18:34:41'!
test03afterXWonViewShouldInformXWonAndShowTheBoard
	| game view lines nl boardStateText playingStateText |
	game _ TerniLapilli new.
	view _ TerniLapilliView new.
	nl _ Character newLineCharacter asString.
	boardStateText _ 'X| | ' , nl , '-----' , nl , 'O|X| ' , nl , '-----' , nl , 'O| |X'.
	playingStateText _ 'X Won!!'.
	game register: view.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 1.
	lines _ view lines.
	self
		assert: lines size
		equals: 2.
	self assert: (lines at: 1) = boardStateText.
	self assert: (lines at: 2) = playingStateText.! !

!TerniLapilliViewTest methodsFor: 'tests' stamp: 'HGZ 11/11/2018 18:34:41'!
test04afterOWonViewShouldInformOWonAndShowTheBoard
	| game view lines nl boardStateText playingStateText |
	game _ TerniLapilli new.
	view _ TerniLapilliView new.
	nl _ Character newLineCharacter asString.
	boardStateText _ 'O| |X' , nl , '-----' , nl , 'O|X|X' , nl , '-----' , nl , 'O| | '.
	playingStateText _ 'O Won!!'.
	game register: view.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 1 @ 3.
	lines _ view lines.
	self
		assert: lines size
		equals: 2.
	self assert: (lines at: 1) = boardStateText.
	self assert: (lines at: 2) = playingStateText.! !

!TerniLapilliViewTest methodsFor: 'tests' stamp: 'HGZ 11/11/2018 18:34:41'!
test05afterGameTiedViewShouldInformGameTiedAndShowTheBoardWithTheGameTied
	| game view lines nl boardStateText playingStateText |
	game _ TerniLapilli new.
	view _ TerniLapilliView new.
	nl _ Character newLineCharacter asString.
	boardStateText _ 'X|O|X' , nl , '-----' , nl , 'O|X|X' , nl , '-----' , nl , 'O|X|O'.
	playingStateText _ 'Tied!!'.
	game register: view.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 1 @ 3.
	lines _ view lines.
	self
		assert: lines size
		equals: 2.
	self assert: (lines at: 1) = boardStateText.
	self assert: (lines at: 2) = playingStateText.! !


!classDefinition: #ActiveVariable category: #TerniLapilli!
Object subclass: #ActiveVariable
	instanceVariableNames: 'value observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!ActiveVariable methodsFor: 'initialization' stamp: 'HGZ 11/11/2018 18:43:31'!
initializeFor: aVariable
	value _ aVariable.
	observers _ OrderedCollection new.! !


!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'HGZ 11/11/2018 18:51:39'!
doesNotUnderstand: aMessage
	^aMessage sendTo: value.! !

!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'HGZ 11/11/2018 19:19:35'!
register: anObserver
	observers add: anObserver.! !

!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'HGZ 11/11/2018 19:20:59'!
updateStateAfterAddingTo: positions with: nextPlayingState and: winnerState for: aTerniLapilli
	value _ (aTerniLapilli stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: aTerniLapilli.
	observers do: [
		:anObserver | anObserver updateWith: aTerniLapilli.
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ActiveVariable class' category: #TerniLapilli!
ActiveVariable class
	instanceVariableNames: ''!

!ActiveVariable class methodsFor: 'instance creation' stamp: 'HGZ 11/11/2018 18:41:54'!
for: aVariable
	^self new initializeFor: aVariable.! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'state playerOPositions playerXPositions lastPlay'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'initialization' stamp: 'HGZ 11/11/2018 18:40:13'!
initialize
	playerXPositions _ OrderedCollection new.
	playerOPositions _ OrderedCollection new.
	state _ ActiveVariable for: (PlayingX for: self).
	
	lastPlay _ nil.! !


!TerniLapilli methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:39'!
markAll: positions

	positions do: [ :aPosition | self markAt: aPosition ]! !

!TerniLapilli methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:23'!
markAt: aPosition

	^state markAt: aPosition ! !

!TerniLapilli methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:30:17'!
markWithOAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithOAt: aPosition.! !

!TerniLapilli methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:24:49'!
markWithXAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithXAt: aPosition.! !


!TerniLapilli methodsFor: 'marking board - private' stamp: 'HGZ 11/11/2018 19:18:09'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	positions add: aPosition.
	
	lastPlay _ aPosition.
	state updateStateAfterAddingTo: positions with: nextPlayingState and: winnerState for: self.! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'HAW 10/27/2017 10:26:10'!
assertIsInBoardBounds: aPosition

	(aPosition between: 1@1 and: 3@3) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 5/12/2018 12:34:04'!
markWithOWhenPlayingOAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOWhenPlayingXAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXWhenPlayingOAt: aPoint
	self error: self class notXTurnErrorMessage.! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXWhenPlayingXAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:44:57'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [ ^ winnerState ].
	self shouldBeTiedWhenNoOneWon ifTrue: [ ^ GameTied ].

	^ nextPlayingState.! !


!TerniLapilli methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TerniLapilli methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TerniLapilli methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TerniLapilli methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !


!TerniLapilli methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TerniLapilli methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !


!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 10/25/2017 15:50:52'!
isTaken: aPosition
	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TerniLapilli methodsFor: 'positions' stamp: 'HGZ 11/11/2018 02:28:04'!
lastPlay

	lastPlay isNil ifTrue: [self error: self class ThereAreNoPlaysYetErrorMessage].
	^lastPlay.! !

!TerniLapilli methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TerniLapilli methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:22:42'!
has: positions threeOf: aPositionComponent

	^(positions collect: aPositionComponent) asBag contents values includes: 3 
	! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:09:34'!
hasCompletedColumn: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition x ]
	
	! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:25:55'!
hasCompletedDiagonal: positions 
	
	^(self hasUpDiagonal: positions) or: [self hasDownDiagonal: positions]! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:47'!
hasCompletedLine: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition y ]
! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:25:48'!
hasCompletedStraightLine: positions
	
	^(self hasCompletedColumn: positions) or: [self hasCompletedLine: positions ]! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasUpDiagonal: positions
	
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:26:17'!
hasWin: positions

	^positions size >= 3 and: [ (self hasCompletedStraightLine: positions) or: [ self hasCompletedDiagonal: positions ]].
		
	! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:44:42'!
shouldBeTiedWhenNoOneWon

	^ playerXPositions size = 5 and: [ playerOPositions size = 4 ].! !


!TerniLapilli methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 22:43:35'!
informAGameTiedStateTo: aListener 
	^aListener gameTiedStateIn: self.! !

!TerniLapilli methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 22:40:04'!
informAPlayerOWonStateTo: aListener 
	^aListener playerOWonStateIn: self .! !

!TerniLapilli methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 22:40:51'!
informAPlayerXWonStateTo: aListener
	^ aListener playerXWonStateIn: self.! !

!TerniLapilli methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 22:23:57'!
informAPlayingOTo: aListener 
	^aListener playingOStateIn: self.! !

!TerniLapilli methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 22:33:55'!
informAPlayingXStateTo: aListener
	^aListener playingXStateIn: self.! !

!TerniLapilli methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 23:47:24'!
informLastActionOn: aListener
	^ state
		informActionFrom: self
		to: aListener.! !


!TerniLapilli methodsFor: 'binding' stamp: 'HGZ 11/11/2018 19:18:54'!
register: anObserver
	state register: anObserver.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'HGZ 11/11/2018 02:20:09'!
ThereAreNoPlaysYetErrorMessage
	
	^'There are no plays yet'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'HAW 10/27/2017 10:26:31'!
positionOutsideBoardErrorMessage
	
	^'Position is outside board'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TerniLapilliObserver category: #TerniLapilli!
Object subclass: #TerniLapilliObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliObserver methodsFor: 'state update' stamp: 'HGZ 11/11/2018 23:39:50'!
gameTiedStateIn: aTerniLapilli 

	self subclassResponsibility.! !

!TerniLapilliObserver methodsFor: 'state update' stamp: 'HGZ 11/11/2018 23:39:37'!
playerOWonStateIn: aTerniLapilli 

	self subclassResponsibility.! !

!TerniLapilliObserver methodsFor: 'state update' stamp: 'HGZ 11/11/2018 23:39:28'!
playerXWonStateIn: aTerniLapilli 

	self subclassResponsibility.! !

!TerniLapilliObserver methodsFor: 'state update' stamp: 'HGZ 11/11/2018 23:39:12'!
playingOStateIn: aTerniLapilli

	self subclassResponsibility.! !

!TerniLapilliObserver methodsFor: 'state update' stamp: 'HGZ 11/11/2018 23:38:55'!
playingXStateIn: aTerniLapilli

	self subclassResponsibility.! !


!TerniLapilliObserver methodsFor: 'updating' stamp: 'HGZ 11/11/2018 23:38:29'!
updateWith: aTerniLapilli

	self subclassResponsibility.! !


!classDefinition: #TerniLapilliConsole category: #TerniLapilli!
TerniLapilliObserver subclass: #TerniLapilliConsole
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliConsole methodsFor: 'initialization' stamp: 'HGZ 11/11/2018 22:29:10'!
initialize
	log _ OrderedCollection new.! !


!TerniLapilliConsole methodsFor: 'accessing' stamp: 'HGZ 11/11/2018 20:11:49'!
lines
	^log.! !


!TerniLapilliConsole methodsFor: 'state update' stamp: 'HGZ 11/11/2018 22:43:57'!
gameTiedStateIn: aTerniLapilli 
	log add:  'X marcó en ', aTerniLapilli lastPlay asString.
	log add: 'Estado: Juego terminado - Empate!!'.
! !

!TerniLapilliConsole methodsFor: 'state update' stamp: 'HGZ 11/11/2018 22:41:51'!
playerOWonStateIn: aTerniLapilli 
	log add:  'O marcó en ', aTerniLapilli lastPlay asString.
	log add: 'Estado: Juego terminado - Ganó O!!'.! !

!TerniLapilliConsole methodsFor: 'state update' stamp: 'HGZ 11/11/2018 22:40:51'!
playerXWonStateIn: aTerniLapilli
	log add: 'X marcó en ' , aTerniLapilli lastPlay asString.
	log add: 'Estado: Juego terminado - Ganó X!!'.! !

!TerniLapilliConsole methodsFor: 'state update' stamp: 'HGZ 11/11/2018 22:24:19'!
playingOStateIn: aTerniLapilli 
	log add:  'X marcó en ', aTerniLapilli lastPlay asString.
	log add: 'Estado: Jugando O'.! !

!TerniLapilliConsole methodsFor: 'state update' stamp: 'HGZ 11/11/2018 22:34:35'!
playingXStateIn: aTerniLapilli 
	log add:  'O marcó en ', aTerniLapilli lastPlay asString.
	log add: 'Estado: Jugando X'.! !


!TerniLapilliConsole methodsFor: 'updating' stamp: 'HGZ 11/11/2018 23:47:24'!
updateWith: aTerniLapilli
	aTerniLapilli informLastActionOn: self.! !


!classDefinition: #TerniLapilliView category: #TerniLapilli!
TerniLapilliObserver subclass: #TerniLapilliView
	instanceVariableNames: 'log board state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliView methodsFor: 'private' stamp: 'HGZ 11/11/2018 04:36:43'!
draw: aSymbol at: aPosition 
	(board at: 4 - aPosition y) at: aPosition x put: aSymbol asString.! !

!TerniLapilliView methodsFor: 'private' stamp: 'HGZ 11/11/2018 04:00:04'!
printBoard
	| hLine vSeparator newLine |
	
	hLine _ '-----'.
	vSeparator _ $|.
	newLine _ Character newLineCharacter.
	
	^String streamContents: [ :stream|
		stream nextPutAll: ((board at: 1) at: 1).
		stream nextPut: vSeparator.
		stream nextPutAll: ((board at: 1) at: 2).
		stream nextPut: vSeparator.
		stream nextPutAll: ((board at: 1) at: 3).
		stream nextPut: newLine.
		stream nextPutAll: hLine.
		stream nextPut: newLine.
		stream nextPutAll: ((board at: 2) at: 1).
		stream nextPut: vSeparator.
		stream nextPutAll: ((board at: 2) at: 2).
		stream nextPut: vSeparator.
		stream nextPutAll: ((board at: 2) at: 3).
		stream nextPut: newLine.
		stream nextPutAll: hLine.
		stream nextPut: newLine.
		stream nextPutAll: ((board at: 3) at: 1).
		stream nextPut: vSeparator.
		stream nextPutAll: ((board at: 3) at: 2).
		stream nextPut: vSeparator.
		stream nextPutAll: ((board at: 3) at: 3).
		].! !


!TerniLapilliView methodsFor: 'accessing' stamp: 'HGZ 11/11/2018 04:09:28'!
lines
	^Array with: self printBoard with: state.! !


!TerniLapilliView methodsFor: 'initialization' stamp: 'HGZ 11/11/2018 04:23:26'!
initialize

	log _ OrderedCollection new.
	
	board  _ Array with: (OrderedCollection with: ' ' with: ' ' with: ' ') with: (OrderedCollection with: ' ' with: ' ' with: ' ') with: (OrderedCollection with: ' ' with: ' ' with: ' ').! !


!TerniLapilliView methodsFor: 'state update' stamp: 'HGZ 11/11/2018 23:34:29'!
gameTiedStateIn: aTerniLapilli 

	self draw: #X at: aTerniLapilli lastPlay.
	state _ 'Tied!!'.! !

!TerniLapilliView methodsFor: 'state update' stamp: 'HGZ 11/11/2018 23:30:22'!
playerOWonStateIn: aTerniLapilli 

	self draw: #O at: aTerniLapilli lastPlay.
	state _ 'O Won!!'.! !

!TerniLapilliView methodsFor: 'state update' stamp: 'HGZ 11/11/2018 23:20:14'!
playerXWonStateIn: aTerniLapilli 

		self draw: #X at: aTerniLapilli lastPlay.
		state _ 'X Won!!'.! !

!TerniLapilliView methodsFor: 'state update' stamp: 'HGZ 11/11/2018 23:21:37'!
playingOStateIn: aTerniLapilli 

	self draw: #X at: aTerniLapilli lastPlay.
	state _ 'Playing O'.! !

!TerniLapilliView methodsFor: 'state update' stamp: 'HGZ 11/11/2018 23:38:43'!
playingXStateIn: aTerniLapilli

	self draw: #O at: aTerniLapilli lastPlay.
	state _ 'Playing X'.! !


!TerniLapilliView methodsFor: 'updating' stamp: 'HGZ 11/11/2018 23:47:24'!
updateWith: aTerniLapilli
	aTerniLapilli informLastActionOn: self.! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerOWon
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerXWon
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isOver
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isTied
	
	self subclassResponsibility! !


!TerniLapilliState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingO
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingX
	
	self subclassResponsibility! !


!TerniLapilliState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:31'!
markAt: aPosition

	self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	self subclassResponsibility.! !


!TerniLapilliState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !


!TerniLapilliState methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 23:05:29'!
informActionFrom: aTerniLapilli to: aListener

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'HGZ 11/11/2018 19:07:40'!
for: aTerniLapilli
	^self new initializeFor: aTerniLapilli! !


!classDefinition: #GameOverState category: #TerniLapilli!
TerniLapilliState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 11:53:57'!
isOver
	
	^true! !


!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:23'!
isPlayingO
	
	^false! !

!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:27'!
isPlayingX
	
	^false! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:09'!
markAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #GameTied category: #TerniLapilli!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !


!GameTied methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 22:42:59'!
informActionFrom: aTerniLapilli to: aListener 
	^aTerniLapilli informAGameTiedStateTo: aListener.! !


!classDefinition: #PlayerOWon category: #TerniLapilli!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:06:24'!
isTied
	
	^false! !


!PlayerOWon methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 22:39:28'!
informActionFrom: aTerniLapilli to: aListener 
	^aTerniLapilli informAPlayerOWonStateTo: aListener.! !


!classDefinition: #PlayerXWon category: #TerniLapilli!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !


!PlayerXWon methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 22:38:35'!
informActionFrom: aTerniLapilli to: aListener
	^ aTerniLapilli informAPlayerXWonStateTo: aListener.! !


!classDefinition: #PlayingState category: #TerniLapilli!
TerniLapilliState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:10'!
hasPlayerOWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:17'!
hasPlayerXWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:26'!
isOver
	
	^false! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:52'!
isTied
	
	^false! !


!classDefinition: #PlayingO category: #TerniLapilli!
PlayingState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !


!PlayingO methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:13'!
markAt: aPosition

	^game markWithOAt: aPosition ! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:45'!
markWithOAt: aPosition
	game markWithOWhenPlayingOAt: aPosition.! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXAt: aPosition
	game markWithXWhenPlayingOAt: aPosition.! !


!PlayingO methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 22:20:39'!
informActionFrom: aTerniLapilli to: aTerniLapilliConsole 
	^aTerniLapilli informAPlayingOTo: aTerniLapilliConsole.! !


!classDefinition: #PlayingX category: #TerniLapilli!
PlayingState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:17'!
markAt: aPosition

	^game markWithXAt: aPosition ! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOAt: aPosition
	game markWithOWhenPlayingXAt: aPosition.! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXAt: aPosition
	game markWithXWhenPlayingXAt: aPosition.! !


!PlayingX methodsFor: 'state informing' stamp: 'HGZ 11/11/2018 22:33:08'!
informActionFrom: aTerniLapilli to: aListener 
	^aTerniLapilli informAPlayingXStateTo: aListener.! !
