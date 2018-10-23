!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 18:48:48'!
affectBalance: currentBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !



!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:10:59'!
accept: aVisitor
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HGZ 10/20/2018 13:01:58'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value interestRate numberOfDays'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'value' stamp: 'PML 10/18/2018 21:38:39'!
affectBalance: currentBalance

	^currentBalance - value! !


!CertificateOfDeposit methodsFor: 'initialization' stamp: 'HGZ 10/20/2018 13:05:30'!
initializeFor: anAmount during: aNumberOfDays at: anInterestRate
	value _ anAmount.
	numberOfDays _ aNumberOfDays.
	interestRate _ anInterestRate ! !


!CertificateOfDeposit methodsFor: 'accessing' stamp: 'HGZ 10/20/2018 13:14:22'!
interestRate
	^interestRate! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'HGZ 10/20/2018 13:14:32'!
numberOfDays
	^numberOfDays! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'PML 10/18/2018 21:50:39'!
value
	^value! !


!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:10:32'!
accept: aVisitor
	^aVisitor visitCertificateOfDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'instance creation' stamp: 'HGZ 10/20/2018 13:04:40'!
for: anAmount during: aNumberOfDays at: anInterestRate

	^ self new initializeFor: anAmount during: aNumberOfDays at: anInterestRate! !

!CertificateOfDeposit class methodsFor: 'instance creation' stamp: 'HGZ 10/20/2018 13:45:28'!
register: anAmount during: aNumberOfDays at: anInterestRate on: anAccount

	| transaction |
	
	transaction := self for: anAmount during: aNumberOfDays at: anInterestRate.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HAW 10/18/2018 18:49:00'!
affectBalance: currentBalance

	^currentBalance + value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !



!Deposit methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:09:51'!
accept: aVisitor
	^aVisitor visitDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #LegTransfer category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #LegTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!LegTransfer methodsFor: 'initialization' stamp: 'PML 10/18/2018 20:39:57'!
initializeFor: aTransfer

	transfer  _ aTransfer ! !


!LegTransfer methodsFor: 'accessing' stamp: 'PML 10/18/2018 20:00:59'!
transfer
	^transfer! !


!LegTransfer methodsFor: 'value' stamp: 'PML 10/18/2018 20:42:41'!
value
	^transfer value! !


!LegTransfer methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:10:02'!
accept: aVisitor
	^aVisitor visitLegTransfer: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LegTransfer class' category: #'PortfolioTreePrinter-Ejercicio'!
LegTransfer class
	instanceVariableNames: ''!

!LegTransfer class methodsFor: 'instance creation' stamp: 'PML 10/18/2018 20:38:46'!
for: aTransfer

	^ self new initializeFor: aTransfer ! !


!classDefinition: #DepositTransfer category: #'PortfolioTreePrinter-Ejercicio'!
LegTransfer subclass: #DepositTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!DepositTransfer methodsFor: 'value' stamp: 'PML 10/18/2018 20:50:07'!
affectBalance: currentBalance

	^currentBalance + self value! !


!classDefinition: #WithdrawTransfer category: #'PortfolioTreePrinter-Ejercicio'!
LegTransfer subclass: #WithdrawTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!WithdrawTransfer methodsFor: 'value' stamp: 'PML 10/18/2018 20:50:26'!
affectBalance: currentBalance

	^currentBalance - self value! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HAW 10/18/2018 18:49:08'!
affectBalance: currentBalance

	^currentBalance - value! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 05:54'!
value

	^ value ! !



!Withdraw methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:10:18'!
accept: aVisitor
	^aVisitor visitWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #InvestmentEarningsVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #InvestmentEarningsVisitor
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentEarningsVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:31:25'!
initializeFor: aReceptiveAccount
	account _ aReceptiveAccount ! !

!InvestmentEarningsVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:34:03'!
visitCertificateOfDeposit: aCertificateOfDeposit
	^ aCertificateOfDeposit value * (aCertificateOfDeposit interestRate / 360) * aCertificateOfDeposit numberOfDays! !

!InvestmentEarningsVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:35:54'!
visitDeposit: aDeposit
	^0! !

!InvestmentEarningsVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:36:04'!
visitLegTransfer: aLegTransfer
	^ 0! !

!InvestmentEarningsVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:36:12'!
visitWithdraw: aWithdraw
	^0! !


!InvestmentEarningsVisitor methodsFor: 'evaluating' stamp: 'PML 10/22/2018 19:36:34'!
value
	^(account visitAllTransactions: self) sum! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentEarningsVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentEarningsVisitor class
	instanceVariableNames: ''!

!InvestmentEarningsVisitor class methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:30:41'!
for: aReceptiveAccount
	^ self new initializeFor: aReceptiveAccount ! !


!classDefinition: #InvestmentNetVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #InvestmentNetVisitor
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:40:47'!
initializeFor: aReceptiveAccount
	account _ aReceptiveAccount ! !

!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:41:14'!
value
	^(account visitAllTransactions: self) sum! !

!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:42:21'!
visitCertificateOfDeposit: aCertificateOfDeposit
	^aCertificateOfDeposit value ! !

!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:42:29'!
visitDeposit: aDeposit
	^0! !

!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:42:43'!
visitLegTransfer: aLegTransfer
	^0! !

!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:42:48'!
visitWithdraw: aWithdraw
	^0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentNetVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentNetVisitor class
	instanceVariableNames: ''!

!InvestmentNetVisitor class methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:39:55'!
for: aReceptiveAccount
	^self new initializeFor: aReceptiveAccount ! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'accounts' stamp: 'PML 10/14/2018 17:48:28'!
managedAccounts
	
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'PML 10/14/2018 18:29:03'!
canManage: anAccount

	^ ( self managedAccounts includesAnyOf: anAccount managedAccounts ) not ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount doesManage: anAccount) or: [ anAccount doesManage: managedAccount ] ] ! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]  ! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!
balance

	^ accounts sum: [ :account | account balance ]
! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!
transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 10/18/2018 16:31:24'!
transactionsOf: anAccount 

	^ (self doesManage: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !


!Portfolio methodsFor: 'initialization' stamp: 'PML 10/14/2018 18:29:46'!
initializeWith: aCollectionOfAccounts 
	
	accounts _ Set new.
	
	aCollectionOfAccounts do: [ :anAccount | 
		(self canManage: anAccount )
			ifTrue: [ accounts add: anAccount ]
			ifFalse: [ self error: self class accountAlreadyManagedErrorMessage ] 
	]! !

!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !


!Portfolio methodsFor: 'accounts' stamp: 'PML 10/22/2018 19:57:43'!
managedAccounts

	^ accounts inject: OrderedCollection new into: [ :allAccounts :anAccount |
			allAccounts addAll: anAccount managedAccounts.
			allAccounts
		] ! !


!Portfolio methodsFor: 'printing' stamp: 'PML 10/22/2018 20:38:00'!
printTreeWithNames: aDictionary level: whiteSpaces 
	
	^accounts inject: (OrderedCollection with: (  (String new: whiteSpaces) atAllPut: $ ), (aDictionary at: self)  ) into: [:res :anAccount |
		res addAll: (anAccount printTreeWithNames: aDictionary level: whiteSpaces + 1).
		res
	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!
with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!
withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!Portfolio class methodsFor: 'assertions' stamp: 'HAW 10/18/2018 16:31:24'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount doesManage: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HGZ 10/20/2018 13:44:48'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HGZ 10/20/2018 13:45:03'!
balance

	^transactions inject: 0 into: [ :balance :transaction | transaction affectBalance: balance ]! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'accounts' stamp: 'PML 10/14/2018 18:08:02'!
managedAccounts
	
	^ Set with: self! !




!ReceptiveAccount methodsFor: 'associating' stamp: 'PML 10/18/2018 21:41:04'!
registerCertificateOfDepositOf: anAmount during: aNumberOfDays at: anInterestRate
	CertificateOfDeposit register: anAmount on: self! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:21:17'!
visitAllTransactions: aVisitor
	^transactions collect: [:trx | trx accept: aVisitor]! !


!ReceptiveAccount methodsFor: 'printing' stamp: 'PML 10/22/2018 20:37:32'!
printTreeWithNames: aDictionary level: whiteSpaces 
  ^OrderedCollection with: (((String new: whiteSpaces) atAllPut: $ ), (aDictionary at: self))! !

!ReceptiveAccount methodsFor: 'printing' stamp: 'PML 10/22/2018 22:47:48'!
printTreeWithNamesReversed: aDictionary level: whiteSpaces 
	
	^ (self printTreeWithNames: aDictionary level: whiteSpaces ) reverse! !


!classDefinition: #SummaryLinesVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummaryLinesVisitor
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummaryLinesVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:02:29'!
initializeFor: aReceptiveAccount
	account _ aReceptiveAccount ! !

!SummaryLinesVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:06:39'!
value
	^account visitAllTransactions: self! !

!SummaryLinesVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 18:58:46'!
visitCertificateOfDeposit: aCertificateOfDeposit
	^ 'Plazo fijo por ' , aCertificateOfDeposit value printString , ' durante ' , aCertificateOfDeposit numberOfDays printString , ' dias a una tna de ' , (100 * aCertificateOfDeposit interestRate) printString , '%' ! !

!SummaryLinesVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 18:55:34'!
visitDeposit: aDeposit
	^'Deposito por ', (aDeposit affectBalance: 0) printString ! !

!SummaryLinesVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:11:34'!
visitLegTransfer: aLegTransfer
	^'Transferencia por ', (aLegTransfer affectBalance: 0) printString ! !

!SummaryLinesVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 18:57:42'!
visitWithdraw: aWithdraw
	^ 'Extraccion por ', aWithdraw value printString ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SummaryLinesVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
SummaryLinesVisitor class
	instanceVariableNames: ''!

!SummaryLinesVisitor class methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:01:37'!
for: aReceptiveAccount
	^self new initializeFor: aReceptiveAccount ! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'depositLeg withdrawLeg value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'PML 10/18/2018 20:48:53'!
intializeFor: anAmount

	withdrawLeg _ WithdrawTransfer for: self.
	depositLeg _ DepositTransfer for: self.
	value _ anAmount ! !


!Transfer methodsFor: 'accessing' stamp: 'PML 10/18/2018 19:46:45'!
depositLeg
	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'PML 10/18/2018 20:44:08'!
value

	^value! !

!Transfer methodsFor: 'accessing' stamp: 'PML 10/18/2018 19:46:25'!
withdrawLeg

	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'PML 10/18/2018 19:43:10'!
for: anAmount
	
	^self new intializeFor: anAmount ! !

!Transfer class methodsFor: 'instance creation' stamp: 'PML 10/18/2018 19:39:40'!
register: anAmount from: aReceptiveAccount to: aReceptiveAccount2
	
	| transfer |
	
	transfer := self for: anAmount.
	aReceptiveAccount register: transfer withdrawLeg.
	aReceptiveAccount2 register: transfer depositLeg.		
	^ transfer! !


!classDefinition: #TransferNetVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #TransferNetVisitor
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:16:07'!
initializeFor: aReceptiveAccount
	account _ aReceptiveAccount ! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:23:26'!
value
	^(account visitAllTransactions: self) sum! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:24:16'!
visitCertificateOfDeposit: aCertificateOfDeposit
	^0! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:18:09'!
visitDeposit: aDeposit
	^0! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:19:08'!
visitLegTransfer: aLegTransfer
	^aLegTransfer affectBalance: 0! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:23:59'!
visitWithdraw: aWithdraw
	^0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNetVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferNetVisitor class
	instanceVariableNames: ''!

!TransferNetVisitor class methodsFor: 'as yet unclassified' stamp: 'PML 10/22/2018 19:15:40'!
for: aReceptiveAccount
	^self new initializeFor: aReceptiveAccount ! !
