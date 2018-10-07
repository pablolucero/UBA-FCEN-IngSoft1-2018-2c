!classDefinition: #TelefonicaSimpleTest category: #'Telefonica-simple'!
TestCase subclass: #TelefonicaSimpleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica-simple'!

!TelefonicaSimpleTest methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 23:44:11'!
test01CalcularValorLlamadaLocal

	| facturador llamada |
	llamada := LlamadaSimple deTipo: 'local' conDuracion: (10 * second) .
	llamada tipo .

	facturador := FacturadorSimple new.
	self assert: (facturador calcularCostoLLamada: llamada) equals: (1.0 * peso).! !

!TelefonicaSimpleTest methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 23:48:40'!
test02CalcularValorLlamadaNacional

	| facturador llamada |
	llamada := LlamadaSimple deTipo: 'nacional' conDuracion: (10 * second) .
	llamada tipo .

	facturador := FacturadorSimple new.
	self assert: (facturador calcularCostoLLamada: llamada) equals: (2.5 * peso).! !

!TelefonicaSimpleTest methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 23:49:32'!
test03CalcularValorLlamadaInternacional

	| facturador llamada |
	llamada := LlamadaSimple deTipo: 'internacional' conDuracion: (10 * second) .
	llamada tipo .

	facturador := FacturadorSimple new.
	self assert: (facturador calcularCostoLLamada: llamada) equals: (10 * peso).! !


!classDefinition: #FacturadorSimple category: #'Telefonica-simple'!
Object subclass: #FacturadorSimple
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica-simple'!

!FacturadorSimple methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 23:58:13'!
calcularCostoLLamada: unaLlamada

	unaLlamada esLocal ifTrue: [ ^ (unaLlamada duracion convertTo: second) amount * (0.10 * peso)].
	unaLlamada esNacional ifTrue: [ ^ (unaLlamada duracion convertTo: second) amount * (0.25 * peso)].
	unaLlamada esInternacional ifTrue: [ ^ (unaLlamada duracion convertTo: second) amount * (1 * peso)].
	^ self error: 'tipo de llamada no valida'! !


!classDefinition: #LlamadaSimple category: #'Telefonica-simple'!
Object subclass: #LlamadaSimple
	instanceVariableNames: 'tipo duracion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica-simple'!

!LlamadaSimple methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 22:38:00'!
duracion
	^ duracion! !

!LlamadaSimple methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 22:38:16'!
duracion: unaDuracion
	duracion := unaDuracion! !

!LlamadaSimple methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 22:31:41'!
esInternacional

	^tipo = 'internacional'! !

!LlamadaSimple methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 22:31:54'!
esLocal

	^tipo = 'local'! !

!LlamadaSimple methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 22:31:29'!
esNacional

	^tipo = 'nacional'! !

!LlamadaSimple methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 20:48:24'!
tipo
	^tipo ! !

!LlamadaSimple methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 20:49:56'!
tipo: unTipo
	
	^ tipo := unTipo! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LlamadaSimple class' category: #'Telefonica-simple'!
LlamadaSimple class
	instanceVariableNames: ''!

!LlamadaSimple class methodsFor: 'as yet unclassified' stamp: 'PML 10/6/2018 20:52:36'!
deTipo: unTipo
	| nuevaLLamada |
	nuevaLLamada := self new.
	nuevaLLamada tipo: unTipo.
	^nuevaLLamada ! !


!LlamadaSimple class methodsFor: 'instance creation' stamp: 'PML 10/6/2018 22:38:38'!
deTipo: unTipo conDuracion: unaDuracion 
	| llamada |
	llamada := LlamadaSimple deTipo: unTipo.
	llamada duracion: unaDuracion.
	^ llamada ! !
