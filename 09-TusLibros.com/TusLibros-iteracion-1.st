!classDefinition: #CarritoTest category: #TusLibros!
TestCase subclass: #CarritoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CarritoTest methodsFor: 'tests' stamp: 'PML 11/12/2018 20:02:05'!
test01AlCrearUnCarritoEsteEstaVacio
	| unCarrito |
	unCarrito _ Carrito new.
	self assert: unCarrito estaVacio.! !

!CarritoTest methodsFor: 'tests' stamp: 'PML 11/12/2018 20:44:02'!
test02AlAgregarItemAlCarritoEsteNoEstaVacio
	| unCarrito |
	unCarrito _ Carrito new.
	unCarrito agregarLibro: '12345'.
	self assert: unCarrito estaVacio not.! !

!CarritoTest methodsFor: 'tests' stamp: 'PML 11/12/2018 20:44:30'!
test03ElCarritoContieneLosItemsAgregados
	| unCarrito |
	unCarrito _ Carrito new.
	unCarrito agregarLibro: '12345'.
	self assert: (unCarrito contiene: '12345').! !

!CarritoTest methodsFor: 'tests' stamp: 'PML 11/12/2018 20:27:04'!
test04ElCarritoNoContieneItemsQueNoAgregue
	| unCarrito |
	unCarrito _ Carrito new.
	self deny: (unCarrito contiene: '12345').! !

!CarritoTest methodsFor: 'tests' stamp: 'PML 11/12/2018 21:06:36'!
test05SiAgregoDosItemsDistintosElCarritoContieneAmbosItems
	| unCarrito |
	unCarrito _ Carrito new.
	unCarrito agregarLibro: '12345'.
	unCarrito agregarLibro: '67890'.
	self assert: (unCarrito contiene: '12345').
	self assert: (unCarrito contiene: '67890').
	self assert: 2 equals: unCarrito cantidadDeItemsDistintos.! !

!CarritoTest methodsFor: 'tests' stamp: 'PML 11/12/2018 21:06:58'!
test06SiAgregoDosItemsIgualesElCarritoContieneAmbosItems
	| unCarrito |
	unCarrito _ Carrito new.
	unCarrito agregarLibro: '12345'.
	unCarrito agregarLibro: '12345'.
	self assert: 1 equals: unCarrito cantidadDeItemsDistintos.
	self assert: 2 equals: unCarrito cantidadTotalDeItems.! !

!CarritoTest methodsFor: 'tests' stamp: 'PML 11/12/2018 21:07:14'!
test07SiAgregoTresItemsIgualesElCarritoContieneTodosEsosItems
	| unCarrito |
	unCarrito _ Carrito new.
	unCarrito agregarLibro: '12345'.
	unCarrito agregarLibro: '12345'.
	unCarrito agregarLibro: '12345'.
	self assert: 1 equals: unCarrito cantidadDeItemsDistintos.
	self assert: 3 equals: unCarrito cantidadTotalDeItems.! !

!CarritoTest methodsFor: 'tests' stamp: 'PML 11/12/2018 21:17:48'!
test08SiAgregoDeAVariosItemsIgualesElCarritoContieneTodosEsosItems
	| unCarrito |
	unCarrito _ Carrito new.
	unCarrito agregarLibro: '12345'.
	unCarrito agregar: 2 unidadesDe: '12345'.
	self assert: 1 equals: unCarrito cantidadDeItemsDistintos.
	self assert: 3 equals: unCarrito cantidadTotalDeItems.! !

!CarritoTest methodsFor: 'tests' stamp: 'PML 11/12/2018 21:36:59'!
test09NoSePuedeAgregarUnLibroFueraDelCatalogo
	| unCarrito |
	unCarrito _ Carrito new.
	self should: [unCarrito agregarLibro: '00000'] 
	raise: Error 
	withExceptionDo: [ :unError | self assert: unError messageText equals: Carrito noSePuedeAgregarUnLibroFueraDelCatalogo ].! !


!classDefinition: #Carrito category: #TusLibros!
Object subclass: #Carrito
	instanceVariableNames: 'items catalogo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'testing' stamp: 'PML 11/12/2018 20:32:04'!
cantidadDeItemsDistintos
	^items size.! !

!Carrito methodsFor: 'testing' stamp: 'PML 11/13/2018 01:43:25'!
cantidadTotalDeItems
	^items keys inject: 0 into: [ :total :unISBN | total + (items at: unISBN) ].! !

!Carrito methodsFor: 'testing' stamp: 'PML 11/12/2018 20:46:48'!
contiene: unISBN
	^ items includesKey: unISBN .! !

!Carrito methodsFor: 'testing' stamp: 'PML 11/12/2018 20:26:45'!
estaVacio
	^items isEmpty .! !


!Carrito methodsFor: 'validations' stamp: 'PML 11/12/2018 21:41:45'!
verificarQueElLibroEsteEnCatalogo: unISBN
	(catalogo includes: unISBN) ifFalse: [ self error: self class noSePuedeAgregarUnLibroFueraDelCatalogo ]. ! !


!Carrito methodsFor: 'operations' stamp: 'PML 11/13/2018 01:44:39'!
agregar: unaCantidad unidadesDe: unISBN 
	self verificarQueElLibroEsteEnCatalogo: unISBN.
	items at: unISBN put: unaCantidad + (items at: unISBN ifAbsent: [0]).! !

!Carrito methodsFor: 'operations' stamp: 'PML 11/12/2018 21:16:32'!
agregarLibro: unISBN
	self agregar: 1 unidadesDe: unISBN.! !


!Carrito methodsFor: 'initialization' stamp: 'PML 11/13/2018 11:23:58'!
initialize
	items _ Dictionary new.
	catalogo _ Catalogo getListadoDeIsbnDeLibros.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: #TusLibros!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'error messages' stamp: 'PML 11/12/2018 21:33:18'!
noSePuedeAgregarUnLibroFueraDelCatalogo
	^'no se puede agregar un libro fuera del catálogo'! !


!classDefinition: #Catalogo category: #TusLibros!
Object subclass: #Catalogo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Catalogo class' category: #TusLibros!
Catalogo class
	instanceVariableNames: ''!

!Catalogo class methodsFor: 'accessing' stamp: 'PML 11/13/2018 11:21:47'!
getListadoDeIsbnDeLibros
	^ Set with: '12345' with: '67890'.! !
