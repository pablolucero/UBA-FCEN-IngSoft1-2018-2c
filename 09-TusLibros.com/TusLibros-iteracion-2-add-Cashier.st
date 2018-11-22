!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'PML 11/15/2018 20:42:48'!
defaultCatalog
	| catalog |
	catalog _ Dictionary new.
	catalog at: self itemSellByTheStore put: 10 * peso.
	^ catalog ! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'setup' stamp: 'PML 11/20/2018 02:42:11'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ].! !


!CashierTest methodsFor: 'support' stamp: 'PML 11/15/2018 20:56:25'!
checkout: aCart with: aCreditCard onDate: aDate 
	aCart isEmpty ifTrue: [ ^self error: self class emptyCartErrorMessage ].
	(aCreditCard isExpiredOnDate: aDate) ifTrue: [^ self error: self class expiredCardErrorMessage. ].
	
	
	
	"self debit: amount from: aCreditCard."! !

!CashierTest methodsFor: 'support' stamp: 'PML 11/15/2018 19:02:58'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CashierTest methodsFor: 'support' stamp: 'PML 11/15/2018 20:44:47'!
defaultCatalog
	| catalog |
	catalog _ Dictionary new.
	catalog at: self itemSellByTheStore put: 10 * peso.
	^ catalog ! !

!CashierTest methodsFor: 'support' stamp: 'PML 11/15/2018 19:03:56'!
itemSellByTheStore
	
	^ 'validBook'! !


!CashierTest methodsFor: 'tests' stamp: 'PML 11/19/2018 18:17:34'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook _ OrderedCollection new.
	
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
			self assert: salesBook isEmpty.
		]! !

!CashierTest methodsFor: 'tests' stamp: 'PML 11/19/2018 18:37:19'!
test02CanNotCheckoutWithAnExpiredCreditCard

	| aCart salesBook |
	
	salesBook _ OrderedCollection new.
	aCart _ testObjectsFactory createCart.
	aCart add: testObjectsFactory itemSellByTheStore.
	
	self 
		should: [ Cashier toCheckout: aCart 
			charging: testObjectsFactory expiredCreditCard 
			throught: self 
			on: testObjectsFactory today
			registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]
! !

!CashierTest methodsFor: 'tests' stamp: 'PML 11/20/2018 02:33:11'!
test03ACheckoutGeneratesAValidTicket

	| aCart cashier |
	
	aCart _ testObjectsFactory createCart.
	aCart add: 2 of: self itemSellByTheStore.
	
	cashier _ Cashier toCheckout: aCart 
	charging: testObjectsFactory notExpiredCreditCard
	throught: self
	on: testObjectsFactory today 
	registeringOn: OrderedCollection new.
	
	self assert: cashier checkOut equals: (testObjectsFactory itemSellByTheStorePrice * 2).
	! !

!CashierTest methodsFor: 'tests' stamp: 'PML 11/22/2018 01:02:50'!
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

!CashierTest methodsFor: 'tests' stamp: 'PML 11/22/2018 01:24:47'!
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


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'PML 11/20/2018 02:41:14'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierTest class' category: #TusLibros!
CashierTest class
	instanceVariableNames: ''!

!CashierTest class methodsFor: 'error messages' stamp: 'PML 11/15/2018 19:05:25'!
emptyCartErrorMessage
	^ 'No se puede hacer checkout de un carrito vacio'.! !

!CashierTest class methodsFor: 'error messages' stamp: 'PML 11/15/2018 19:19:26'!
expiredCardErrorMessage
	^'No se puede hacer checkout con una tarjeta vencida'.! !


!classDefinition: #CreditCardTest category: #TusLibros!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'tests' stamp: 'PML 11/19/2018 19:18:15'!
test01CantCreateACreditCartWithAnInvalidCreditCardNumber

	self 
		should: [ CreditCard withName: 'Pepe Sarsasa' withNumber: '1234' withExpirationDate: (Date newDay: 31 month: #January year: 2017) ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = CreditCard invalidCardNumberErrorMessage. ]! !

!CreditCardTest methodsFor: 'tests' stamp: 'PML 11/19/2018 19:18:08'!
test02CantCreateACreditCartWithAnEmptyCreditCardName

	self 
		should: [ CreditCard withName: '' withNumber: '1234123412341234' withExpirationDate: (Date newDay: 31 month: #January year: 2017) ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = CreditCard invalidCardNameErrorMessage. ]! !

!CreditCardTest methodsFor: 'tests' stamp: 'PML 11/19/2018 19:17:46'!
test03CanAskACreditCartHisOwnerAndIfIsExpiredOnADate

	| card |
	card _ CreditCard withName: 'Pepe Sanchez' withNumber: '1234123412341234' withExpirationDate: (Date newDay: 31 month: #January year: 2017).
	self assert: 'Pepe Sanchez' equals: card owner.
	self assert: (card isExpiredOnDate: (Date newDay: 1 month: #February year: 2017))." 
	self deny: (card isExpiredOnDate: February/1/2000).
	self deny: (card isExpiredOnDate: January/1/2017).
	"! !


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


!Cart methodsFor: 'assertions' stamp: 'PML 11/15/2018 20:43:39'!
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


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'total' stamp: 'PML 11/20/2018 02:39:19'!
total
	
	^ items sum: [ :anItem | catalog at: anItem ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCard merchantProcessor salesBook total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'PML 11/20/2018 02:35:00'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook 
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !


!Cashier methodsFor: 'checkout' stamp: 'PML 11/20/2018 02:35:53'!
checkOut
	
	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'checkout - private' stamp: 'PML 11/20/2018 02:37:59'!
calculateTotal
	
	total _ cart total.! !

!Cashier methodsFor: 'checkout - private' stamp: 'PML 11/20/2018 02:44:24'!
createSale
	
	^ Sale of: total! !

!Cashier methodsFor: 'checkout - private' stamp: 'PML 11/20/2018 02:40:24'!
debitTotal
	
	merchantProcessor debit: total from: creditCard.! !

!Cashier methodsFor: 'checkout - private' stamp: 'PML 11/20/2018 02:43:51'!
registerSale
	salesBook add: self createSale.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'PML 11/19/2018 16:51:32'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'assertions' stamp: 'PML 11/19/2018 18:10:59'!
assertIsNotEmpty: aCart 
	aCart isEmpty ifTrue: [ self error: self cartCanNotBeEmptyErrorMessage ].! !

!Cashier class methodsFor: 'assertions' stamp: 'PML 11/19/2018 18:39:11'!
assertIsNotExpired: aCreditCard on: aDate 
	(aCreditCard isExpiredOnDate: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ].! !


!Cashier class methodsFor: 'exceptions' stamp: 'PML 11/19/2018 16:54:16'!
signalNewVariableCanNotBeEmpty
	self shouldBeImplemented.! !


!Cashier class methodsFor: 'error messages' stamp: 'PML 11/19/2018 19:07:39'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'PML 11/19/2018 18:14:11'!
cartCanNotBeEmptyErrorMessage
	^'Can not check out an empty cart'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'owner number expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'PML 11/19/2018 19:08:15'!
initializeWithName: aName number: aCredicCardNumber andExpirationDate: aMonthOfAYear 
	owner _ aName .
	number _ aCredicCardNumber .
	expiration _ aMonthOfAYear.! !


!CreditCard methodsFor: 'testing' stamp: 'PML 11/19/2018 19:08:15'!
isExpiredOnDate: aDate
	^ expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'accessing' stamp: 'PML 11/19/2018 14:04:18'!
owner
	
	^owner! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'PML 11/19/2018 13:58:25'!
withName: aName withNumber: aCredicCardNumber withExpirationDate: aMonthOfAYear 
	self validateCredicCardNumber: aCredicCardNumber.
	self validateCredicCardName: aName.

	^ self new initializeWithName: aName number: aCredicCardNumber andExpirationDate: aMonthOfAYear ! !


!CreditCard class methodsFor: 'validations' stamp: 'PML 11/15/2018 20:35:30'!
validateCredicCardName: aString 
	aString isEmpty ifTrue: [ self error: self invalidCardNameErrorMessage ]. ! !

!CreditCard class methodsFor: 'validations' stamp: 'PML 11/15/2018 19:40:38'!
validateCredicCardNumber: aCredicCardNumber
	(aCredicCardNumber size = 16) ifFalse: [ self error: self invalidCardNumberErrorMessage ].! !


!CreditCard class methodsFor: 'error messages' stamp: 'PML 11/15/2018 20:33:36'!
invalidCardNameErrorMessage
	^ 'No se puede crear una tarjeta con un nombre vacio'! !

!CreditCard class methodsFor: 'error messages' stamp: 'PML 11/15/2018 20:33:20'!
invalidCardNumberErrorMessage
	^'No se puede crear una tarjeta con un numero que no tenga 16 digitos'.! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'initialization' stamp: 'PML 11/20/2018 02:48:54'!
initializeTotal: aTotal 
	
	total _ aTotal! !


!Sale methodsFor: 'total' stamp: 'PML 11/22/2018 01:06:35'!
total

	^total! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'PML 11/20/2018 02:50:35'!
of: aTotal

	aTotal <= 0 ifTrue: [ self error: self aSaleCanNotBeLessThanOrEqualsToZeroMessage ].
	^ self new initializeTotal: aTotal.! !


!Sale class methodsFor: 'error messages' stamp: 'PML 11/20/2018 02:50:35'!
aSaleCanNotBeLessThanOrEqualsToZeroMessage
	
	^ 'A sale can not be less than or equals to zero'.! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'date' stamp: 'PML 11/19/2018 14:54:25'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'PML 11/19/2018 16:21:13'!
expiredCreditCard
	
	^CreditCard withName: 'Pepe Sanchez' withNumber: '1234123412341234' withExpirationDate: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'PML 11/20/2018 02:29:01'!
notExpiredCreditCard
	
	^ CreditCard withName: 'Pepe Sanchez' 
	withNumber: '1234123412341234' 
	withExpirationDate: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'PML 11/19/2018 15:07:14'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'PML 11/19/2018 14:59:25'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'items' stamp: 'PML 11/19/2018 14:56:41'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'PML 11/19/2018 14:56:34'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'PML 11/19/2018 14:56:27'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'PML 11/19/2018 18:57:08'!
initialize

	today := Date today.
	! !
