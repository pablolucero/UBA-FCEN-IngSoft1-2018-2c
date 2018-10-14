!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'PML 10/14/2018 15:16:24'!
netValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'PML 10/14/2018 15:16:45'!
netValue
	
	^ self value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'PML 10/14/2018 15:16:55'!
netValue
	
	^ self value negated ! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #SummarizingAccount category: #'Portfolio-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:28'!
doesManage: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'balance' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'balance' stamp: 'HGZ 10/14/2018 16:42:52'!
canBeManagedBy: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'PML 10/13/2018 20:04:46'!
balance

	^ accounts sum: [ :account | account balance ] ! !

!Portfolio methodsFor: 'balance' stamp: 'HGZ 10/14/2018 16:49:10'!
canBeManagedBy: aPortfolio

	^ accounts inject: true into: [:conjuntion :anAccount | conjuntion and: (anAccount canBeManagedBy: aPortfolio )]! !

!Portfolio methodsFor: 'balance' stamp: 'HGZ 10/14/2018 16:49:36'!
canManage: anAccount

	^ accounts inject: true into: [:conjuntion :aManagedAccount | conjuntion and: (aManagedAccount doesManage: anAccount ) not]! !


!Portfolio methodsFor: 'testing' stamp: 'HGZ 10/14/2018 16:17:34'!
doesManage: anAccount

	^anAccount = self or: (accounts anySatisfy: [ :aManagedAccount | aManagedAccount doesManage: anAccount ])! !

!Portfolio methodsFor: 'testing' stamp: 'PML 10/14/2018 02:55:38'!
hasRegistered: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !


!Portfolio methodsFor: 'transactions' stamp: 'PML 10/14/2018 01:58:27'!
transactions 

	^accounts 
		inject: OrderedCollection new 
		into: [ :allTransactions :anAccount |
			allTransactions addAll: anAccount transactions.
			allTransactions 
		] 
! !

!Portfolio methodsFor: 'transactions' stamp: 'PML 10/14/2018 14:01:19'!
transactionsOf: anAccount 
"
	(self doesManage: anAccount) ifFalse: [ ^ self error: self class accountNotManagedMessageDescription ]. 

	^ anAccount transactions
"
	accounts detect: [:managedAccount | managedAccount doesManage: anAccount ] 
	ifNone: [^ self error: self class accountNotManagedMessageDescription].
 
	^ anAccount transactions	
	! !


!Portfolio methodsFor: 'initialization' stamp: 'HGZ 10/14/2018 16:48:37'!
initializeWith: anOrderedCollection 
	
	accounts _ Set new.
	
	anOrderedCollection do: [ :anAccount | 
		"(anAccount manageConflictWith: accounts)"
		(anAccount canBeManagedBy: self)
			ifTrue: [ accounts add: anAccount ]
			ifFalse: [ self error: self class accountAlreadyManagedErrorMessage ] 
	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'PML 10/13/2018 23:42:28'!
with: leftAccount with: rightAccount

	|accounts|

	accounts _ OrderedCollection with: leftAccount with: rightAccount .

	^ self withAll: accounts ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'PML 10/13/2018 23:41:15'!
withAll: aCollectionOfAccounts

	 ^ self new initializeWith: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/8/2018 16:08:43'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/8/2018 16:08:53'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'PML 10/14/2018 00:38:34'!
initialize

	super initialize.
	transactions := Set new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'PML 10/14/2018 15:25:08'!
balance

	^ transactions inject: 0 into: [:total :aTransaction | total + aTransaction netValue ] ! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HGZ 10/14/2018 16:48:06'!
canBeManagedBy: aPortfolio

	^ aPortfolio canManage: self! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HGZ 10/14/2018 16:17:49'!
doesManage: anAccount

	^ self = anAccount ! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !
