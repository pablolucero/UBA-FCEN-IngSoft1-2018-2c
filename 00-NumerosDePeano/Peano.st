!classDefinition: #I category: #Peano!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #Peano!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'PML 9/9/2018 17:17:38'!
* unNumeroDePeano
	
	^unNumeroDePeano ! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:44:20'!
+ unNumeroDePeano

	^unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 00:53:57'!
- unNumeroDePeano

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados ! !

!I class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 04:21:15'!
/ unNumeroDePeano

 	(unNumeroDePeano = self) 
		ifTrue: [ ^ self ] 
		ifFalse: [ ^ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].! !

!I class methodsFor: 'as yet unclassified' stamp: 'PML 9/10/2018 21:37:42'!
<= unNumeroDePeano 
	^ (self name size) <= (unNumeroDePeano name size)! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 9/6/2018 21:29:22'!
next

	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 00:47:55'!
previous

	self error: 'El 1 no es el sucesor de ningún número natural'! !

!I class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 03:51:35'!
restateAVosMismoAEsteNumeroMasGrandeQueUno: unNumeroDePeano

	^ unNumeroDePeano previous.! !

!I class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:28:05'!
vecesDivideA: unNumeroDePeano
	
	^ unNumeroDePeano ! !


!I class methodsFor: 'errores' stamp: 'PML 9/16/2018 02:54:23'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^'No se puede dividir por un numero mayor al numero dividido'! !

!I class methodsFor: 'errores' stamp: 'PML 9/16/2018 00:55:59'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se puede restar a un numero otro numero mas grande o igual'! !


!classDefinition: #II category: #Peano!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #Peano!
II class
	instanceVariableNames: 'prev next'!

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 01:08:10'!
* unNumeroDePeano

	^ self previous * unNumeroDePeano + unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 00:48:24'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 03:57:48'!
- unNumeroDePeano

	^ unNumeroDePeano restateAVosMismoAEsteNumeroMasGrandeQueUno: self.! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:50:35'!
/ divisor

	divisor <= self ifFalse:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	( self = divisor ) 
		ifTrue: 
			[ ^ I ]
		ifFalse: 
			[ ^ ((self - divisor) / divisor) + I ]! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/10/2018 21:37:03'!
<= unNumeroDePeano 
	^ (self name size) <= (unNumeroDePeano name size)! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:51:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prev := I.
	next := III.! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 00:49:01'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next previous: self.
	].
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 00:48:24'!
previous

	^prev! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 00:49:01'!
previous: unNumeroDePeano

	prev _ unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/9/2018 21:10:59'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 03:49:02'!
restateAVosMismoAEsteNumeroMasGrandeQueUno: unNumeroDePeano

	^ unNumeroDePeano previous - self previous.! !

!II class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:34:26'!
vecesDivideA: unNumeroDePeano

	 ( self = unNumeroDePeano ) 
		ifTrue: 
			[ ^ I ]
		ifFalse: 
			[ ^ unNumeroDePeano - self / self + I ]
				
			 ! !


!II class methodsFor: 'errores' stamp: 'PML 9/16/2018 02:55:40'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^'No se puede dividir por un numero mayor al numero dividido'! !

!II class methodsFor: 'errores' stamp: 'PML 9/16/2018 02:55:12'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se puede restar a un numero otro numero mas grande o igual'! !


!classDefinition: #III category: #Peano!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #Peano!
III class
	instanceVariableNames: 'prev next'!

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:35'!
* unNumeroDePeano

	^ self previous * unNumeroDePeano + unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:35'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:35'!
- unNumeroDePeano

	^ unNumeroDePeano restateAVosMismoAEsteNumeroMasGrandeQueUno: self.! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:50:26'!
/ divisor

	divisor <= self ifFalse:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	( self = divisor ) 
		ifTrue: 
			[ ^ I ]
		ifFalse: 
			[ ^ ((self - divisor) / divisor) + I ]! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:35'!
<= unNumeroDePeano 
	^ (self name size) <= (unNumeroDePeano name size)! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:51:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prev := II.
	next := IIII.! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:35'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next previous: self.
	].
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:35'!
previous

	^prev! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:35'!
previous: unNumeroDePeano

	prev _ unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:35'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:35'!
restateAVosMismoAEsteNumeroMasGrandeQueUno: unNumeroDePeano

	^ unNumeroDePeano previous - self previous.! !

!III class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:35'!
vecesDivideA: unNumeroDePeano

	 ( self = unNumeroDePeano ) 
		ifTrue: 
			[ ^ I ]
		ifFalse: 
			[ ^self - unNumeroDePeano / unNumeroDePeano + I ]
				
			 ! !


!III class methodsFor: 'errores' stamp: 'PML 9/16/2018 05:23:35'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^'No se puede dividir por un numero mayor al numero dividido'! !

!III class methodsFor: 'errores' stamp: 'PML 9/16/2018 05:23:35'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se puede restar a un numero otro numero mas grande o igual'! !


!classDefinition: #IIII category: #Peano!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #Peano!
IIII class
	instanceVariableNames: 'prev next'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:42'!
* unNumeroDePeano

	^ self previous * unNumeroDePeano + unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:42'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:42'!
- unNumeroDePeano

	^ unNumeroDePeano restateAVosMismoAEsteNumeroMasGrandeQueUno: self.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:50:01'!
/ divisor

	divisor <= self ifFalse:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	( self = divisor ) 
		ifTrue: 
			[ ^ I ]
		ifFalse: 
			[ ^ ((self - divisor) / divisor) + I ]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:42'!
<= unNumeroDePeano 
	^ (self name size) <= (unNumeroDePeano name size)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:51:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prev := III.
	next := nil.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:42'!
next
	
	next ifNil:
	[
		next _ self cloneNamed: self name , 'I'.
		next previous: self.
	].
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:42'!
previous

	^prev! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:42'!
previous: unNumeroDePeano

	prev _ unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:42'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:42'!
restateAVosMismoAEsteNumeroMasGrandeQueUno: unNumeroDePeano

	^ unNumeroDePeano previous - self previous.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:23:42'!
vecesDivideA: unNumeroDePeano

	 ( self = unNumeroDePeano ) 
		ifTrue: 
			[ ^ I ]
		ifFalse: 
			[ ^self - unNumeroDePeano / unNumeroDePeano + I ]
				
			 ! !


!IIII class methodsFor: 'errores' stamp: 'PML 9/16/2018 05:23:42'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^'No se puede dividir por un numero mayor al numero dividido'! !

!IIII class methodsFor: 'errores' stamp: 'PML 9/16/2018 05:23:42'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se puede restar a un numero otro numero mas grande o igual'! !


!classDefinition: #PeanoTest category: #Peano!
DenotativeObject subclass: #PeanoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PeanoTest class' category: #Peano!
PeanoTest class
	instanceVariableNames: ''!

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 12:51:26'!
test01UnoMasUnSumandoEsElProximoDelSumando

	Assert that: I + II isEqualTo: II next.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:24:08'!
test02NumerosMayoresaUnoSumanBien

	Assert that: II + II isEqualTo: IIII.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:12:19'!
test03UnNumeroMenosUnoEsElPrevioDelNumero

	Assert that: II - I isEqualTo: II previous.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:24:17'!
test04NumerosMayoresaUnoRestanBien

	Assert that: IIII - II isEqualTo: II.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 12:51:02'!
test05RestaNoSoportaNumerosNegativos

	Assert should: [ I - II ] signal: Error withDescription: I descripcionDeErrorDeNumerosNegativosNoSoportados.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:15:53'!
test06UnNumeroMultiplicadoPorUnoEsIgualAlNumero

	Assert that: II * I isEqualTo: II.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:24:33'!
test07NumerosMayoresaUnoMultiplicanBien

	Assert that: II * II isEqualTo: IIII.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:16:46'!
test08UnoMultiplicadoUnoEsIgualAUno

	Assert that: I * I isEqualTo: I.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:28:48'!
test09NumerosMayoresaUnoDividenBien

	Assert that: IIII / II isEqualTo: II.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:28'!
test10UnNumeroDivididoUnoEsIgualAlNumero

	Assert that: II / I isEqualTo: II.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:38'!
test11UnoDivididoUnoEsIgualAUno

	Assert that: I / I isEqualTo: I.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'PML 9/16/2018 05:35:12'!
test12DivisionNoSoportaDividirPorUnNumeroMayor

	Assert should: [ III /  IIII ] signal: Error withDescription: II descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.
	
	Assert should: [ I /  II] signal: Error withDescription: I descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.
! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!