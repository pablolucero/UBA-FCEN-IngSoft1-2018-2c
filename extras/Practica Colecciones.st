!classDefinition: #UnaListaDeNumeros category: #'Practica Colecciones'!
DenotativeObject subclass: #UnaListaDeNumeros
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica Colecciones'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaListaDeNumeros class' category: #'Practica Colecciones'!
UnaListaDeNumeros class
	instanceVariableNames: 'valor'!

!UnaListaDeNumeros class methodsFor: 'as yet unclassified' stamp: 'PML 9/15/2018 01:28:23'!
dobleDeCadaElemento
	|resultado|
	resultado := OrderedCollection new.
	valor do: [ :numero | resultado add: numero * 2  ].
	^resultado ! !

!UnaListaDeNumeros class methodsFor: 'as yet unclassified' stamp: 'PML 9/15/2018 02:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	valor := #(1 2 5 6 7 ).! !

!UnaListaDeNumeros class methodsFor: 'as yet unclassified' stamp: 'PML 9/15/2018 00:57:54'!
listaOriginal
	^ valor! !

!UnaListaDeNumeros class methodsFor: 'as yet unclassified' stamp: 'PML 9/15/2018 01:49:32'!
primerNumeroMayorQueDiez

	^ ((valor findFirst: [ :numero | numero > 10 ]) > 10) ifFalse: [ self error: 'No existe un numero mayor a 10 en la lista' ]! !

!UnaListaDeNumeros class methodsFor: 'as yet unclassified' stamp: 'PML 9/15/2018 01:28:11'!
primerNumeroPar
	^valor findFirst: [:numero | numero even ]! !

!UnaListaDeNumeros class methodsFor: 'as yet unclassified' stamp: 'PML 9/15/2018 02:01:23'!
sumarLosDoblesDeCadaElemento

	^ self dobleDeCadaElemento sum! !

!UnaListaDeNumeros class methodsFor: 'as yet unclassified' stamp: 'PML 9/15/2018 01:58:20'!
sumarTodosLosElementos

	^ valor sum! !

UnaListaDeNumeros initializeAfterFileIn!