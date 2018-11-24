!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #InternalRestInterfaceTest category: #TusLibros!
TestCase subclass: #InternalRestInterfaceTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InternalRestInterfaceTest methodsFor: 'tests' stamp: 'PML 11/22/2018 20:22:26'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	
	 ! !

!InternalRestInterfaceTest methodsFor: 'tests' stamp: 'PML 11/23/2018 00:08:47'!
test01CanNotCreateCartWithInvalidUserId
	
	| interface aPassword anInvalidUser |
	
	anInvalidUser _ testObjectsFactory notRegisteredUser.
	aPassword _ ''.
	interface _ testObjectsFactory createInternalRestInterface. 
	
	self should: [ interface createCartWithUserId: anInvalidUser andPassword: aPassword. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:error | 
			self assert: InternalRestInterface errorNotRegisteredUser equals: error messageText.
		]
	! !

!InternalRestInterfaceTest methodsFor: 'tests' stamp: 'PML 11/23/2018 00:09:34'!
test02CanNotCreateCartWithIncorrecPassword
	
	| interface aPassword anInvalidUser |
	
	anInvalidUser _ testObjectsFactory registeredUser.
	aPassword _ testObjectsFactory registeredUserPassword, 'lorem ipsum'.
	
	interface _ testObjectsFactory createInternalRestInterface.
	
	self should: [ interface createCartWithUserId: anInvalidUser andPassword: aPassword. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:error | 
			self assert: InternalRestInterface errorIncorrectPassword equals: error messageText.
		]
	! !

!InternalRestInterfaceTest methodsFor: 'tests' stamp: 'PML 11/22/2018 21:14:53'!
test03WithValidUserAnEmptyCartCanBeCreated
	
	| interface aPassword anUser aCartId cartItems |
	
	anUser _ testObjectsFactory registeredUser.
	aPassword _ testObjectsFactory registeredUserPassword.	
	interface _ testObjectsFactory createInternalRestInterface.
	
	aCartId _ interface createCartWithUserId: anUser andPassword: aPassword. 
	cartItems _ interface listCart: aCartId.
	self assert: cartItems isEmpty.! !

!InternalRestInterfaceTest methodsFor: 'tests' stamp: 'PML 11/22/2018 21:34:11'!
test04TwoCreatedCartsHaveDifferentIds
	
	| interface aPassword anUser aCartId anotherCartId |
	
	anUser _ testObjectsFactory registeredUser.
	aPassword _ testObjectsFactory registeredUserPassword.	
	interface _ testObjectsFactory createInternalRestInterface.
	
	aCartId _ interface createCartWithUserId: anUser andPassword: aPassword. 
	anotherCartId _ interface createCartWithUserId: anUser andPassword: aPassword. 
	
	self deny: aCartId = anotherCartId.! !

!InternalRestInterfaceTest methodsFor: 'tests' stamp: 'PML 11/23/2018 00:09:56'!
test05CantAddItemsWithQuantityZero
	
	| interface aPassword anUser aCartId |
	
	anUser _ testObjectsFactory registeredUser.
	aPassword _ testObjectsFactory registeredUserPassword.	
	interface _ testObjectsFactory createInternalRestInterface.
	
	aCartId _ interface createCartWithUserId: anUser andPassword: aPassword. 
	
	self should: [ interface add: 0 Items: testObjectsFactory itemSellByTheStore toCartWithId: aCartId. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:error | 
			self assert: InternalRestInterface errorQuantityNotGreaterThanZero equals: error messageText.
		]! !

!InternalRestInterfaceTest methodsFor: 'tests' stamp: 'PML 11/23/2018 00:10:25'!
test06CantAddItemNotPresentInTheCatalog
	
	| interface aPassword anUser aCartId |
	
	anUser _ testObjectsFactory registeredUser.
	aPassword _ testObjectsFactory registeredUserPassword.	
	interface _ testObjectsFactory createInternalRestInterface.
	
	aCartId _ interface createCartWithUserId: anUser andPassword: aPassword. 
	
	self should: [ interface add: 1 Items: testObjectsFactory itemNotSellByTheStore toCartWithId: aCartId. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:error | 
			self assert: InternalRestInterface errorItemNotPresentInTheCatalog equals: error messageText.
		]! !

!InternalRestInterfaceTest methodsFor: 'tests' stamp: 'PML 11/23/2018 00:12:02'!
test07CanNotAddItemToAnInexistentCartId
	
	| interface |
	
	interface _ testObjectsFactory createInternalRestInterface.
	
	self should: [ interface add: 1 Items: testObjectsFactory itemSellByTheStore toCartWithId: 'invalid cart id'. ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:error | 
			self assert: InternalRestInterface errorInvalidCartId equals: error messageText .
		]! !

!InternalRestInterfaceTest methodsFor: 'tests' stamp: 'PML 11/23/2018 01:33:58'!
test08ListingAnInexistentCartIdRaiseError
	
	| interface |

	interface _ testObjectsFactory createInternalRestInterface.
	
	self should: [ interface listCart: 'an invalid Cart Id' ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:error | 
			self assert: InternalRestInterface errorInvalidCartId equals: error messageText .
		]! !

!InternalRestInterfaceTest methodsFor: 'tests' stamp: 'PML 11/23/2018 01:35:37'!
test09ListingACartWithOneItem
	
	| interface aPassword anUser aCartId cartItems anItem |
	
	anUser _ testObjectsFactory registeredUser.
	aPassword _ testObjectsFactory registeredUserPassword.	
	interface _ testObjectsFactory createInternalRestInterface.
	anItem _ testObjectsFactory itemSellByTheStore.
	
	aCartId _ interface createCartWithUserId: anUser andPassword: aPassword. 
	interface add: 1 Items: anItem toCartWithId: aCartId.
	cartItems _ interface listCart: aCartId.
	
	self assert: 1 equals: cartItems size.
	self assert: cartItems includes: anItem.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #InternalRestInterface category: #TusLibros!
Object subclass: #InternalRestInterface
	instanceVariableNames: 'userDatabase catalog lastCartId carts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InternalRestInterface methodsFor: 'operations' stamp: 'PML 11/23/2018 01:23:48'!
add: aQuantity Items: anISBN toCartWithId: aCartId
	| aCart |
	(catalog includesKey: anISBN) ifFalse: [ self error: self class errorItemNotPresentInTheCatalog . ].
	aQuantity < 1 ifTrue: [ self error: self class errorQuantityNotGreaterThanZero. ].
	(carts includesKey: aCartId) ifFalse: [ self error: self class errorInvalidCartId . ].
	aCart _ Cart acceptingItemsOf: catalog.
	aCart add: aQuantity of: anISBN.
	carts at: aCartId put: aCart.! !

!InternalRestInterface methodsFor: 'operations' stamp: 'PML 11/23/2018 01:27:39'!
createCartWithUserId: anUserId andPassword: aPassword 
	
	| userPassword |
	userPassword _ userDatabase at: anUserId ifAbsent: [ self error: self class errorNotRegisteredUser. ].
	userPassword = aPassword ifFalse: [ self error: self class errorIncorrectPassword ].
	
	lastCartId _ lastCartId + 1.
	carts at: lastCartId put: (Cart acceptingItemsOf: catalog).
	
	^lastCartId.
	
	! !

!InternalRestInterface methodsFor: 'operations' stamp: 'PML 11/23/2018 01:36:35'!
listCart: aCartId 
	
	carts at: aCartId ifAbsent: [ self error: self class errorInvalidCartId ].
	^carts at: aCartId.! !


!InternalRestInterface methodsFor: 'initialization' stamp: 'PML 11/23/2018 01:17:00'!
initializeWithUserDatabase: anUserDatabase andCatalog: aCatalog 
	catalog  _ aCatalog.
	userDatabase _ anUserDatabase.
	lastCartId _ 0.
	carts _ Dictionary new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InternalRestInterface class' category: #TusLibros!
InternalRestInterface class
	instanceVariableNames: ''!

!InternalRestInterface class methodsFor: 'error messages' stamp: 'PML 11/22/2018 20:36:41'!
errorIncorrectPassword
	^ 'Contraseña incorrecta' ! !

!InternalRestInterface class methodsFor: 'error messages' stamp: 'PML 11/23/2018 00:02:51'!
errorInvalidCartId
	^ 'Invalid card id'.! !

!InternalRestInterface class methodsFor: 'error messages' stamp: 'PML 11/22/2018 21:50:03'!
errorItemNotPresentInTheCatalog
	^'ISBN no disponible'! !

!InternalRestInterface class methodsFor: 'error messages' stamp: 'PML 11/22/2018 20:29:57'!
errorNotRegisteredUser
	^ 'Usuario no registrado'! !

!InternalRestInterface class methodsFor: 'error messages' stamp: 'PML 11/22/2018 21:46:16'!
errorQuantityNotGreaterThanZero
	^'La cantidad debe ser mayor a cero'! !


!InternalRestInterface class methodsFor: 'instance creation' stamp: 'PML 11/22/2018 21:03:57'!
withUserDatabase: anUserDatabase andCatalog: aCatalog  
	^ self new initializeWithUserDatabase: anUserDatabase andCatalog: aCatalog.! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'users' stamp: 'PML 11/22/2018 20:17:51'!
defaultUserDatabase
	
	^ Dictionary new
		at: self registeredUser put: self registeredUserPassword;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'PML 11/22/2018 20:27:28'!
notRegisteredUser
	^ 'Bugs Bunny'! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'PML 11/22/2018 20:19:42'!
registeredUser
	
	^ 'Mickey Mouse'! !

!StoreTestObjectsFactory methodsFor: 'users' stamp: 'PML 11/22/2018 20:20:05'!
registeredUserPassword
	
	^ 'Pluto123'! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'rest interface' stamp: 'PML 11/22/2018 21:06:43'!
createInternalRestInterface
	^ InternalRestInterface withUserDatabase: self defaultUserDatabase andCatalog: self defaultCatalog .! !
