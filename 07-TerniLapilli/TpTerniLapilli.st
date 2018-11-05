!classDefinition: #TerniLapilliTests category: #TpTerniLapilli!
TestCase subclass: #TerniLapilliTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TpTerniLapilli'!

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 17:06:01'!
test01EmpiezaElJugadorX
	|juego|
	juego _ Juego new.
	self assert: juego turno equals: $X! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 17:07:24'!
test02DespuesDeXLeTocaAO
	|juego|
	juego _ Juego new.
	juego colocarFicha: 1@1.
	self assert: juego turno equals: $O! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 17:08:40'!
test03DespuesDeOLeVuelveATocarAX
	|juego|
	juego _ Juego new.
	juego colocarFicha: 1@1.
	juego colocarFicha: 1@2.
	self assert: juego turno equals: $X! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 17:10:09'!
test04ElTableroEmpiezaVacio
	|juego|
	juego _ Juego new.
	
	self assert: (juego fichaEnPosicion: 1@1) equals: $_! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 17:10:40'!
test05AlColocarUnaFichaSeActualizaElTablero
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	self assert: (juego fichaEnPosicion: 1@1) equals: $X ! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 17:11:39'!
test06NoSePuedePonerUnaFichaEnUnaPosicionOcupada
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	
	self should: [ juego colocarFicha: 1@1 ] 
	raise: Error
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorPosicionOcupada]! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 17:12:28'!
test07NoSePuedenPonerMasDe3FichasPorJugador
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

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 17:56:40'!
test08NingunoGanoAlPrincipio
	|juego|
	juego _ Juego new.
	
	self deny: juego ganoX.
	self deny: juego ganoO! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 18:06:49'!
test09XGanaPorFila
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 2@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 2@2.
	juego colocarFicha: 1@3.
	
	self assert: juego ganoX.
	self deny: juego ganoO! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 18:06:52'!
test10XGanaPorColumna
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 2@1.
	juego colocarFicha: 2@2.
	juego colocarFicha: 3@1.
	
	self assert: juego ganoX.
	self deny: juego ganoO! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 18:06:56'!
test11XGanaPorDiagonal
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 2@2.
	juego colocarFicha: 2@1.
	juego colocarFicha: 3@3.
	
	self assert: juego ganoX.
	self deny: juego ganoO! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 18:07:04'!
test12OGanaPorFila
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 2@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 2@2.
	juego colocarFicha: 3@3.
	juego colocarFicha: 2@3.
	
	self assert: juego ganoO.
	self deny: juego ganoX! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 18:07:07'!
test13OGanaPorColumna
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 2@1.
	juego colocarFicha: 2@2.
	juego colocarFicha: 3@3.
	juego colocarFicha: 3@2.
	
	self assert: juego ganoO.
	self deny: juego ganoX! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 18:07:10'!
test14OGanaPorDiagonal
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 3@1.
	juego colocarFicha: 2@3.
	juego colocarFicha: 2@2.
	juego colocarFicha: 3@3.
	juego colocarFicha: 1@3.
	
	self assert: juego ganoO.
	self deny: juego ganoX! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 18:17:07'!
test15NoSePuedenPonerFicasFueraDelTablero
	|juego|
	juego _ Juego new.
	
	self should: [ juego colocarFicha: 5@1. ] 
	raise: Error
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorPosicionInvalida]! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 20:21:08'!
test16AlMoverUnaFichaSeActualizaElTableroYElTurno
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 1@3.
	juego colocarFicha: 2@1.
	juego colocarFicha: 2@2.
	juego colocarFicha: 2@3.

	juego moverFichaDe: 2@2 hacia: 3@2.
	self assert: juego turno equals: $O.
	self assert: (juego fichaEnPosicion: 2@2) equals: $_.
	self assert: (juego fichaEnPosicion: 3@2) equals: $X.! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 18:48:30'!
test17NoSePuedenMoverFichasAPosicionesOcupadas
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 1@3.
	juego colocarFicha: 2@1.
	juego colocarFicha: 2@2.
	juego colocarFicha: 2@3.
	
	self should: [ juego moverFichaDe: 1@1 hacia: 1@2. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorPosicionOcupada ]! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 18:58:20'!
test18NoSePuedenMoverFichasAfueraDelTablero
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 3@3.
	juego colocarFicha: 1@2.
	juego colocarFicha: 1@3.
	juego colocarFicha: 2@1.
	juego colocarFicha: 2@2.
	juego colocarFicha: 2@3.
	
	self should: [ juego moverFichaDe: 3@3 hacia: 3@4. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorPosicionInvalida ]! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 18:59:39'!
test19NoSePuedenMoverFichasAntesDeColocarTodasLasFichas
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 2@2.
	
	self should: [ juego moverFichaDe: 1@1 hacia: 1@2. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorFaltanColocarFichas]! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 19:03:28'!
test20NoSePuedenMoverFichasDeUnLugarDondeNoEstan
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 1@3.
	juego colocarFicha: 2@1.
	juego colocarFicha: 2@2.
	juego colocarFicha: 2@3.
	
	self should: [ juego moverFichaDe: 3@3 hacia: 3@2. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorPosicionVacia]! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 19:19:03'!
test21XGanaPorFila
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 3@1.
	juego colocarFicha: 1@3.
	juego colocarFicha: 3@2.
	juego colocarFicha: 2@2.
	juego colocarFicha: 2@3.
	
	juego moverFichaDe: 2@2 hacia: 1@2.
	
	self assert: juego ganoX.
	self deny: juego ganoO

	! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 19:21:36'!
test22OGanaPorColumna
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 3@1.
	juego colocarFicha: 1@3.
	juego colocarFicha: 3@2.
	juego colocarFicha: 2@2.
	juego colocarFicha: 2@3.
	
	juego moverFichaDe: 2@2 hacia: 2@1.
	juego moverFichaDe: 2@3 hacia: 3@3.
	
	self assert: juego ganoO.
	self deny: juego ganoX

	! !


!classDefinition: #Juego category: #TpTerniLapilli!
Object subclass: #Juego
	instanceVariableNames: 'turno jugadorX jugadorO ganoX ganoO'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TpTerniLapilli'!

!Juego methodsFor: 'accessing' stamp: 'PML 11/5/2018 20:02:51'!
fichaEnPosicion: aPoint
	(jugadorX tieneFichaEn: aPoint) ifTrue: [^$X].
	(jugadorX tieneFichaEn: aPoint) ifTrue: [^$O].
	^$_! !

!Juego methodsFor: 'accessing' stamp: 'PML 11/5/2018 17:19:42'!
ganoO
	^ganoO! !

!Juego methodsFor: 'accessing' stamp: 'PML 11/5/2018 17:17:08'!
ganoX
	^ganoX! !

!Juego methodsFor: 'accessing' stamp: 'PML 11/5/2018 17:24:32'!
turno	
	^turno! !


!Juego methodsFor: 'initialization' stamp: 'PML 11/5/2018 19:36:55'!
initialize
	turno _ $X.
	jugadorX _ Jugador new.
	jugadorO _ Jugador new.
	ganoX _ false.
	ganoO _ false! !


!Juego methodsFor: 'operations' stamp: 'PML 11/5/2018 18:50:43'!
colocarFicha: aPoint
	self chequearFichasDisponibles.
	self ubicarFicha: aPoint ! !

!Juego methodsFor: 'operations' stamp: 'PML 11/5/2018 20:28:14'!
moverFichaDe: desde hacia: hasta
	self chequearTableroCompleto.
	turno = $X ifTrue: [
		self chequerPosicionOcupada: desde por: jugadorX.
		jugadorX quitarFicha: desde.
	] ifFalse: [
		self chequerPosicionOcupada: desde por: jugadorO.
		jugadorO quitarFicha: desde.
	].
	self ubicarFicha: hasta! !

!Juego methodsFor: 'operations' stamp: 'PML 11/5/2018 19:48:52'!
ubicarFicha: aPoint
	self chequearPosicionValida: aPoint.
	turno = $X ifTrue: [
		jugadorX jugarEn: aPoint.
		ganoX _ jugadorX hasGanado.
		turno _ $O
	] ifFalse: [
		jugadorO jugarEn: aPoint..
		ganoO _ jugadorO hasGanado.
		turno _ $X
	]! !


!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 19:25:50'!
chequearFichasDisponibles
	self todasLasFichasSobreElTablero ifTrue: [
		self error: self class errorTodasLasFichasColocadas	
	].! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 18:31:30'!
chequearJugadasDiagonal: jugadas yEjecutar: bloqueAEjecutar
	((jugadas includesAllOf: (OrderedCollection with: 1@1 with: 2@2 with: 3@3)) or:
	[jugadas includesAllOf: (OrderedCollection with: 3@1 with: 2@2 with: 1@3)]) ifTrue: bloqueAEjecutar.! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 18:23:59'!
chequearJugadasHorizontales: jugadas yEjecutar: bloqueAEjecutar
	(1 to: 3) do: [:aNumber |
		(jugadas count: [:aPoint | aPoint x = aNumber ]) = 3 ifTrue: bloqueAEjecutar .
	]! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 18:29:21'!
chequearJugadasVerticales: jugadas yEjecutar: bloqueAEjecutar
	(1 to: 3) do: [:aNumber |
		(jugadas count: [:aPoint | aPoint y = aNumber ]) = 3 ifTrue: bloqueAEjecutar .
	]! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 18:55:20'!
chequearPosicionEnRango: aPoint
	((aPoint x between: 1 and: 3) and: [
		aPoint y between: 1 and: 3
	]) ifFalse: [self error: self class errorPosicionInvalida ]! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 19:42:11'!
chequearPosicionLibre: aPoint
	((jugadorX tieneFichaEn: aPoint) or: [
	jugadorO tieneFichaEn: aPoint
	]) ifTrue: [
		self error: self class errorPosicionOcupada 
	].! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 18:56:03'!
chequearPosicionValida: aPoint
	self chequearPosicionEnRango: aPoint.
	self chequearPosicionLibre: aPoint.! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 18:31:57'!
chequearSiGanoO
	self chequearJugadasHorizontales: jugadasO yEjecutar: [ganoO _ true].
	self chequearJugadasVerticales: jugadasO yEjecutar: [ganoO _ true].
	self chequearJugadasDiagonal: jugadasO yEjecutar: [ganoO _ true].! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 18:32:13'!
chequearSiGanoX
	self chequearJugadasHorizontales: jugadasX yEjecutar: [ganoX _ true].
	self chequearJugadasVerticales: jugadasX yEjecutar: [ganoX _ true].
	self chequearJugadasDiagonal: jugadasX yEjecutar: [ganoX _ true].! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 19:25:04'!
chequearTableroCompleto
	self todasLasFichasSobreElTablero ifFalse: [
		self error: self class errorFaltanColocarFichas	
	].! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 20:13:31'!
chequerPosicionOcupada: aPoint por: aJugador 
	(aJugador tieneFichaEn: aPoint) ifFalse: [
		self error: self class errorPosicionVacia 
	].! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 19:37:50'!
todasLasFichasSobreElTablero
	^jugadorX cantidadDeFicasJugadas + jugadorO cantidadDeFicasJugadas = 6! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Juego class' category: #TpTerniLapilli!
Juego class
	instanceVariableNames: ''!

!Juego class methodsFor: 'error handling' stamp: 'PML 11/5/2018 18:37:35'!
errorFaltanColocarFichas
	^'Hay que colocar todas las fichas antes de empezar a moverlas'! !

!Juego class methodsFor: 'error handling' stamp: 'PML 11/5/2018 18:17:39'!
errorPosicionInvalida
	^'No se puede poner una ficha fuera del tablero'! !

!Juego class methodsFor: 'error handling' stamp: 'PML 11/1/2018 20:28:01'!
errorPosicionOcupada
	^'No se puede poner una ficha en una posición ocupada'! !

!Juego class methodsFor: 'error handling' stamp: 'PML 11/5/2018 19:04:11'!
errorPosicionVacia
	^'No se puede mover una ficha desde una posición vacía'! !

!Juego class methodsFor: 'error handling' stamp: 'PML 11/1/2018 20:50:39'!
errorTodasLasFichasColocadas
	^'Ya se pusieron todas las fichas, ahora hay que mover'! !


!classDefinition: #Jugador category: #TpTerniLapilli!
Object subclass: #Jugador
	instanceVariableNames: 'jugadas heGanado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TpTerniLapilli'!

!Jugador methodsFor: 'initialization' stamp: 'PML 11/5/2018 19:54:16'!
initialize
	jugadas _ OrderedCollection new.
	heGanado _ false! !


!Jugador methodsFor: 'accessing' stamp: 'PML 11/5/2018 19:39:22'!
cantidadDeFicasJugadas
	^jugadas size! !

!Jugador methodsFor: 'accessing' stamp: 'PML 11/5/2018 19:50:24'!
hasGanado
	self chequearJugadasHorizontales.
	self chequearJugadasVerticales.
	self chequearJugadasDiagonal.
	^heGanado! !

!Jugador methodsFor: 'accessing' stamp: 'PML 11/5/2018 19:42:49'!
tieneFichaEn: aPoint 
	^jugadas includes: aPoint! !


!Jugador methodsFor: 'operations' stamp: 'PML 11/5/2018 19:44:22'!
jugarEn: aPoint 
	jugadas add: aPoint ! !

!Jugador methodsFor: 'operations' stamp: 'PML 11/5/2018 20:26:43'!
quitarFicha: aPoint 
	jugadas remove: aPoint ! !


!Jugador methodsFor: 'private' stamp: 'PML 11/5/2018 20:01:36'!
chequearJugadasDiagonal
	heGanado _ heGanado or: [
		(jugadas includesAllOf: (OrderedCollection with: 1@1 with: 2@2 with: 3@3)) or:
		[jugadas includesAllOf: (OrderedCollection with: 3@1 with: 2@2 with: 1@3)]
	]! !

!Jugador methodsFor: 'private' stamp: 'PML 11/5/2018 19:51:53'!
chequearJugadasHorizontales
	(1 to: 3) do: [:aNumber |
		heGanado _ heGanado or: [(jugadas count: [:aPoint | aPoint x = aNumber ]) = 3].
	]! !

!Jugador methodsFor: 'private' stamp: 'PML 11/5/2018 19:54:59'!
chequearJugadasVerticales
	(1 to: 3) do: [:aNumber |
		heGanado _ heGanado or: [(jugadas count: [:aPoint | aPoint y = aNumber ]) = 3].
	]! !

!Jugador methodsFor: 'private' stamp: 'PML 11/5/2018 20:10:06'!
chequerPosicionOcupada: aPoint 
	self shouldBeImplemented.! !
