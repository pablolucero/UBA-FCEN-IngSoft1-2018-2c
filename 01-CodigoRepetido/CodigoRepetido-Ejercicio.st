!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/23/2018 14:17:58'!
assertNumberOfCustomersIn: customerBook active: active suspended: suspended

	self assert: active equals: customerBook numberOfActiveCustomers.
	self assert: suspended equals: customerBook numberOfSuspendedCustomers.
	self assert: (active + suspended) equals: customerBook numberOfCustomers.


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/23/2018 13:58:57'!
evaluating: codeUnderTest shouldRaise: errorType withErrorDo: postConditionsAssertions
	
	[ codeUnderTest value. 
		self fail. 
	]
	on: errorType 
	do: postConditionsAssertions 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/20/2018 21:14:50'!
should: closure notTakeMoreMillisecondsThan: milliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |	

	millisecondsBeforeRunning := Time millisecondClockValue * milliseconds.
	closure value .
	millisecondsAfterRunning := Time millisecondClockValue * milliseconds.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (milliseconds * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/20/2018 21:09:09'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	customerBook := CustomerBook  new.
		
	self should: [ customerBook addCustomerNamed: 'John Lennon' ] notTakeMoreMillisecondsThan: 50 	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/20/2018 21:10:34'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |

	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	self should: [ customerBook removeCustomerNamed: paulMcCartney ] notTakeMoreMillisecondsThan: 100
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/23/2018 13:58:57'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self evaluating: [ customerBook addCustomerNamed: '' ] 
	shouldRaise: Error 
	withErrorDo: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/23/2018 13:58:57'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self evaluating:  [ customerBook removeCustomerNamed: 'Paul McCartney' ] 
	shouldRaise: NotFound 
	withErrorDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/23/2018 14:19:12'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertNumberOfCustomersIn: customerBook active: 0 suspended: 1. 
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/23/2018 14:19:42'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertNumberOfCustomersIn: customerBook active: 0 suspended: 0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/23/2018 13:58:57'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self evaluating: [ customerBook suspendCustomerNamed: 'Paul McCartney' ]
	shouldRaise: CantSuspend
	withErrorDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PML 9/23/2018 13:58:57'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self evaluating: [ customerBook suspendCustomerNamed: johnLennon ]
	shouldRaise: CantSuspend 
	withErrorDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]

	! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'PML 9/24/2018 01:51:39'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'PML 9/24/2018 01:51:39'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'PML 9/24/2018 01:51:39'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'PML 9/24/2018 01:51:39'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'PML 9/24/2018 01:51:39'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'PML 9/24/2018 01:51:39'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'PML 9/23/2018 03:44:36'!
remove: anObject from: aCollection

	aCollection remove: anObject ifAbsent: [ ^ false ]. 
	^ true ! !

!CustomerBook methodsFor: 'customer management' stamp: 'PML 9/24/2018 01:51:39'!
removeCustomerNamed: aName 

	( self includesCustomerNamed: aName ) 
		
		ifTrue: [ self remove: aName from: active. 
		    	  self remove: aName from: suspended ] 
		
		ifFalse: [^ NotFound signal.].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'PML 9/24/2018 01:51:39'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
