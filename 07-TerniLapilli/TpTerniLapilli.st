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

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 20:52:26'!
test15NoSePuedenPonerFichasFueraDelTablero
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

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 20:43:17'!
test23NoSePuedeMoverAUnaPosicionNoAdyacente1
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 3@1.
	juego colocarFicha: 1@3.
	juego colocarFicha: 3@2.
	juego colocarFicha: 2@2.
	juego colocarFicha: 2@3.
	
	self should: [ juego moverFichaDe: 1@1 hacia: 3@3. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorMovimientoInvalido]

	! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 20:44:20'!
test24NoSePuedeMoverAUnaPosicionNoAdyacente2
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 3@1.
	juego colocarFicha: 1@3.
	juego colocarFicha: 3@2.
	juego colocarFicha: 2@1.
	juego colocarFicha: 2@3.
	
	self should: [ juego moverFichaDe: 2@1 hacia: 1@2. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorMovimientoInvalido]

	! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 20:46:09'!
test25NoSePuedeColocarFichaSiElJuegoYaTermino
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 2@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 2@2.
	juego colocarFicha: 1@3.
	
	self should: [ juego colocarFicha: 3@3. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorJuegoTerminado]

	! !

!TerniLapilliTests methodsFor: 'tests' stamp: 'PML 11/5/2018 20:50:49'!
test26NoSePuedeMoverFichaSiElJuegoYaTermino
	|juego|
	juego _ Juego new.
	
	juego colocarFicha: 1@1.
	juego colocarFicha: 2@1.
	juego colocarFicha: 1@2.
	juego colocarFicha: 2@2.
	juego colocarFicha: 3@3.
	juego colocarFicha: 2@3.
	
	self should: [ juego moverFichaDe: 3@3 hacia: 3@2. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | 
			self assert: anError messageText = Juego errorJuegoTerminado]

	! !


!classDefinition: #Juego category: #TpTerniLapilli!
Object subclass: #Juego
	instanceVariableNames: 'turno jugadorX jugadorO'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TpTerniLapilli'!

!Juego methodsFor: 'accessing' stamp: 'PML 11/5/2018 20:56:38'!
fichaEnPosicion: aPoint
	(jugadorX tieneFichaEn: aPoint) ifTrue: [^$X].
	(jugadorO tieneFichaEn: aPoint) ifTrue: [^$O].
	^$_! !

!Juego methodsFor: 'accessing' stamp: 'PML 11/5/2018 20:59:25'!
ganoO
	^jugadorO hasGanado ! !

!Juego methodsFor: 'accessing' stamp: 'PML 11/5/2018 20:59:34'!
ganoX
	^jugadorX hasGanado ! !

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


!Juego methodsFor: 'operations' stamp: 'PML 11/5/2018 20:48:05'!
colocarFicha: aPoint
	self chequearJuegoNoTerminado.
	self chequearFichasDisponibles.
	self ubicarFicha: aPoint ! !

!Juego methodsFor: 'operations' stamp: 'PML 11/5/2018 20:54:05'!
moverFichaDe: desde hacia: hasta
	self chequearJuegoNoTerminado.
	self chequearTableroCompleto.
	self chequearMovimientoValidoEntre: desde y: hasta.
	turno = $X ifTrue: [
		self chequearPosicionOcupada: desde por: jugadorX.
		jugadorX quitarFicha: desde.
	] ifFalse: [
		self chequearPosicionOcupada: desde por: jugadorO.
		jugadorO quitarFicha: desde.
	].
	self ubicarFicha: hasta! !

!Juego methodsFor: 'operations' stamp: 'PML 11/5/2018 20:59:00'!
ubicarFicha: aPoint
	self chequearPosicionValida: aPoint.
	turno = $X ifTrue: [
		jugadorX jugarEn: aPoint.
		jugadorX hasGanado.
		turno _ $O
	] ifFalse: [
		jugadorO jugarEn: aPoint..
		jugadorO hasGanado.
		turno _ $X
	]! !


!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 19:25:50'!
chequearFichasDisponibles
	self todasLasFichasSobreElTablero ifTrue: [
		self error: self class errorTodasLasFichasColocadas	
	].! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 20:49:15'!
chequearJuegoNoTerminado
	(jugadorX hasGanado or: [jugadorO hasGanado ]) ifTrue: [self error: self class errorJuegoTerminado ]! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 20:41:04'!
chequearMovimientoValidoEntre: desde y: hasta
	(desde x - hasta x) abs > 1 ifTrue: [self error: self class errorMovimientoInvalido ].
	(desde y - hasta y) abs > 1 ifTrue: [self error: self class errorMovimientoInvalido ].
	(((desde x - desde y) abs = 1) and: [
	(hasta x - hasta y) abs = 1]) ifTrue: [self error: self class errorMovimientoInvalido ].! !

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

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 20:54:05'!
chequearPosicionOcupada: aPoint por: aJugador 
	(aJugador tieneFichaEn: aPoint) ifFalse: [
		self error: self class errorPosicionVacia 
	].! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 18:56:03'!
chequearPosicionValida: aPoint
	self chequearPosicionEnRango: aPoint.
	self chequearPosicionLibre: aPoint.! !

!Juego methodsFor: 'private' stamp: 'PML 11/5/2018 19:25:04'!
chequearTableroCompleto
	self todasLasFichasSobreElTablero ifFalse: [
		self error: self class errorFaltanColocarFichas	
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

!Juego class methodsFor: 'error handling' stamp: 'PML 11/5/2018 20:46:42'!
errorJuegoTerminado
	^'No se puede seguir jugando porque el juego ya terminó'! !

!Juego class methodsFor: 'error handling' stamp: 'PML 11/5/2018 20:33:50'!
errorMovimientoInvalido
	^'No se puede mover una ficha en esa dirección'! !

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
