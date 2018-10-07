!classDefinition: #TelefonicaSimpleTest category: #'Telefonica-simple'!
TestCase subclass: #TelefonicaSimpleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica-simple'!

!TelefonicaSimpleTest methodsFor: 'testing' stamp: 'PML 10/7/2018 01:50:49'!
test01CalcularValorLlamadaLocal

	| facturador llamada |
	llamada := LlamadaSimple deTipo: 'local' conDuracion: (10 * second).

	facturador := FacturadorSimple new.
	self assert: (facturador calcularCostoLLamada: llamada) equals: (1.0 * peso).! !

!TelefonicaSimpleTest methodsFor: 'testing' stamp: 'PML 10/7/2018 00:48:47'!
test02CalcularValorLlamadaNacional

	| facturador llamada |
	llamada := LlamadaSimple deTipo: 'nacional' conDuracion: (10 * second) .

	facturador := FacturadorSimple new.
	self assert: (facturador calcularCostoLLamada: llamada) equals: (2.5 * peso).! !

!TelefonicaSimpleTest methodsFor: 'testing' stamp: 'PML 10/7/2018 00:48:33'!
test03CalcularValorLlamadaInternacional

	| facturador llamada |
	llamada := LlamadaSimple deTipo: 'internacional' conDuracion: (10 * second) .

	facturador := FacturadorSimple new.
	self assert: (facturador calcularCostoLLamada: llamada) equals: (10 * peso).! !

!TelefonicaSimpleTest methodsFor: 'testing' stamp: 'PML 10/7/2018 00:48:41'!
test04CalcularValorLlamadaInvalida

	| facturador llamada |
	llamada := LlamadaSimple deTipo: 'no valida' conDuracion: (10 * second) .
	
	facturador := FacturadorSimple new.
	
	self should: [ facturador calcularCostoLLamada: llamada ] 
	raise: Error 
	withExceptionDo: [ :anError | self assert: (anError messageText ) equals: (CalculadorDeLlamada mensajeTipoDeLlamadaInvalido) ] 
	! !


!classDefinition: #CalculadorDeLlamada category: #'Telefonica-simple'!
Object subclass: #CalculadorDeLlamada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica-simple'!

!CalculadorDeLlamada methodsFor: 'operations' stamp: 'PML 10/7/2018 00:19:43'!
calcular: unaLlamada
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CalculadorDeLlamada class' category: #'Telefonica-simple'!
CalculadorDeLlamada class
	instanceVariableNames: ''!

!CalculadorDeLlamada class methodsFor: 'instance creation' stamp: 'PML 10/7/2018 00:42:06'!
para: unaLlamada 
	^ self subclasses detect: [ :calculador | calculador esPara: unaLlamada ]  ifNone: [ ^ self error: self mensajeTipoDeLlamadaInvalido ] .! !


!CalculadorDeLlamada class methodsFor: 'associating' stamp: 'PML 10/7/2018 00:27:39'!
esPara: unaLlamada 
	self subclassResponsibility ! !


!CalculadorDeLlamada class methodsFor: 'error handling' stamp: 'PML 10/7/2018 00:34:23'!
mensajeTipoDeLlamadaInvalido
	^ 'tipo de llamada no valida'! !


!classDefinition: #CalculadorDeLlamadaInternacional category: #'Telefonica-simple'!
CalculadorDeLlamada subclass: #CalculadorDeLlamadaInternacional
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica-simple'!

!CalculadorDeLlamadaInternacional methodsFor: 'operations' stamp: 'PML 10/7/2018 00:19:25'!
calcular: unaLlamada
	^ (unaLlamada duracion convertTo: second) amount * (1 * peso)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CalculadorDeLlamadaInternacional class' category: #'Telefonica-simple'!
CalculadorDeLlamadaInternacional class
	instanceVariableNames: ''!

!CalculadorDeLlamadaInternacional class methodsFor: 'associating' stamp: 'PML 10/7/2018 00:30:30'!
esPara: unaLlamada 
	^ unaLlamada tipo = 'internacional'! !


!classDefinition: #CalculadorDeLlamadaLocal category: #'Telefonica-simple'!
CalculadorDeLlamada subclass: #CalculadorDeLlamadaLocal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica-simple'!

!CalculadorDeLlamadaLocal methodsFor: 'operations' stamp: 'PML 10/7/2018 00:20:07'!
calcular: unaLlamada
	^ (unaLlamada duracion convertTo: second) amount * (0.10 * peso)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CalculadorDeLlamadaLocal class' category: #'Telefonica-simple'!
CalculadorDeLlamadaLocal class
	instanceVariableNames: ''!

!CalculadorDeLlamadaLocal class methodsFor: 'associating' stamp: 'PML 10/7/2018 00:28:15'!
esPara: unaLlamada 
	^ unaLlamada tipo = 'local'.! !


!classDefinition: #CalculadorDeLlamadaNacional category: #'Telefonica-simple'!
CalculadorDeLlamada subclass: #CalculadorDeLlamadaNacional
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica-simple'!

!CalculadorDeLlamadaNacional methodsFor: 'operations' stamp: 'PML 10/7/2018 00:19:55'!
calcular: unaLlamada
	^ (unaLlamada duracion convertTo: second) amount * (0.25 * peso)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CalculadorDeLlamadaNacional class' category: #'Telefonica-simple'!
CalculadorDeLlamadaNacional class
	instanceVariableNames: ''!

!CalculadorDeLlamadaNacional class methodsFor: 'associating' stamp: 'PML 10/7/2018 00:29:58'!
esPara: unaLlamada 
	^ unaLlamada tipo = 'nacional'! !


!classDefinition: #FacturadorSimple category: #'Telefonica-simple'!
Object subclass: #FacturadorSimple
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica-simple'!

!FacturadorSimple methodsFor: 'operations' stamp: 'PML 10/7/2018 00:30:48'!
calcularCostoLLamada: unaLlamada

	| calculador |
	
	calculador := (CalculadorDeLlamada para: unaLlamada) new.
	^calculador calcular: unaLlamada ! !


!classDefinition: #LlamadaSimple category: #'Telefonica-simple'!
Object subclass: #LlamadaSimple
	instanceVariableNames: 'tipo duracion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica-simple'!

!LlamadaSimple methodsFor: 'accessing' stamp: 'PML 10/6/2018 22:38:00'!
duracion
	^ duracion! !

!LlamadaSimple methodsFor: 'accessing' stamp: 'PML 10/6/2018 20:48:24'!
tipo
	^tipo ! !


!LlamadaSimple methodsFor: 'testing' stamp: 'PML 10/6/2018 22:31:41'!
esInternacional

	^tipo = 'internacional'! !

!LlamadaSimple methodsFor: 'testing' stamp: 'PML 10/6/2018 22:31:54'!
esLocal

	^tipo = 'local'! !

!LlamadaSimple methodsFor: 'testing' stamp: 'PML 10/6/2018 22:31:29'!
esNacional

	^tipo = 'nacional'! !


!LlamadaSimple methodsFor: 'initialization - private' stamp: 'PML 10/7/2018 01:58:58'!
initializeTipo: unTipo duracion: unaDuracion 
	tipo _ unTipo.
	duracion _ unaDuracion ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LlamadaSimple class' category: #'Telefonica-simple'!
LlamadaSimple class
	instanceVariableNames: ''!

!LlamadaSimple class methodsFor: 'instance creation' stamp: 'PML 10/7/2018 01:57:33'!
deTipo: unTipo conDuracion: unaDuracion
	
	^self new initializeTipo: unTipo duracion: unaDuracion 
! !
