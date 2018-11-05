!classDefinition: #TerniLapilliTests category: #TpTerniLapilli!
TestCase subclass: #TerniLapilliTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TpTerniLapilli'!

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/1/2018 19:24:37'!
test01
	|juego|
	juego _ Juego new.
	self assert: juego turno equals: $X! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/1/2018 19:30:47'!
test02
	|juego|
	juego _ Juego new.
	juego colocarFicha: 1@1.
	self assert: juego turno equals: $O! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/1/2018 20:18:15'!
test03
	|juego|
	juego _ Juego new.
	juego colocarFicha: 1@1.
	juego colocarFicha: 1@2.
	self assert: juego turno equals: $X! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/1/2018 20:33:10'!
test03b
	|juego|
	juego _ Juego new.
	juego colocarFicha: 1@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 1@3.
	self assert: juego turno equals: $O! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/1/2018 20:16:12'!
test04a
	|juego|
	juego _ Juego new.
	
	self assert: (juego fichaEnPosicion: 1@1) equals: $_! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/1/2018 19:49:27'!
test04b
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	self assert: (juego fichaEnPosicion: 1@1) equals: $X ! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/1/2018 20:30:28'!
test05
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	
	self should: [ juego colocarFicha: 1@1 ] 
	raise: Error
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorPosicionOcupada]! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/1/2018 20:41:18'!
test06
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 1@3.
	juego colocarFicha: 2@1.
	juego colocarFicha: 2@2.
	juego colocarFicha: 2@3.
	
	self should: [ juego colocarFicha: 3@1. ] 
	raise: Error
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorTodasLasFichasColocadas]! !


!classDefinition: #Juego category: #TpTerniLapilli!
Object subclass: #Juego
	instanceVariableNames: 'turno tablero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TpTerniLapilli'!

!Juego methodsFor: 'accessing' stamp: 'PML 11/1/2018 19:51:11'!
fichaEnPosicion: aPoint 
	^ (tablero at: aPoint x) at: aPoint y! !

!Juego methodsFor: 'accessing' stamp: 'PML 11/1/2018 19:25:52'!
turno
	
	^turno! !


!Juego methodsFor: 'initialization' stamp: 'PML 11/1/2018 20:17:45'!
initialize
	turno _ $X.
	tablero _ Array
		with: (Array with: $_ with: $_ with: $_)
		with: (Array with: $_ with: $_ with: $_)
		with: (Array with: $_ with: $_ with: $_)! !


!Juego methodsFor: 'operations' stamp: 'PML 11/1/2018 20:57:08'!
colocarFicha: aPoint
	self chequearFichasDisponibles.
	self chequearPosicionLibre: aPoint.
	(tablero at: aPoint x) at: aPoint y put: turno.
	turno = $X ifTrue: [ turno _ $O ] ifFalse: [ turno _ $X ]! !


!Juego methodsFor: 'private' stamp: 'PML 11/1/2018 20:52:41'!
chequearFichasDisponibles
	(((tablero at: 1) count: [:c| c = $_]) +
	((tablero at: 2) count: [:c| c = $_]) +
	((tablero at: 3) count: [:c| c = $_]) ) = 3 ifTrue: [
		self error: self class errorTodasLasFichasColocadas	
	].! !

!Juego methodsFor: 'private' stamp: 'PML 11/1/2018 20:54:03'!
chequearPosicionLibre: aPoint
	((tablero at: aPoint x) at: aPoint y) = $_ ifFalse: [
		self error: self class errorPosicionOcupada 
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Juego class' category: #TpTerniLapilli!
Juego class
	instanceVariableNames: ''!

!Juego class methodsFor: 'error handling' stamp: 'PML 11/1/2018 20:28:01'!
errorPosicionOcupada
	^'No se puede poner una ficha en una posición ocupada'! !

!Juego class methodsFor: 'error handling' stamp: 'PML 11/1/2018 20:50:39'!
errorTodasLasFichasColocadas
	^'Ya se pusieron todas las fichas, ahora hay que mover'! !
