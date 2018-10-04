!classDefinition: #QueueTest category: #'Queue-Exercise'!
TestCase subclass: #QueueTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test01QueueShouldBeEmptyWhenCreated

	| queue |

	queue _ Queue new.

	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test02EnqueueAddElementsToTheQueue

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.

	self deny: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test03DequeueRemovesElementsFromTheQueue

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.
	queue dequeue.

	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test04DequeueReturnsFirstEnqueuedObject

	| queue firstQueued secondQueued |

	queue _ Queue new.
	firstQueued _ 'Something1'.
	secondQueued _ 'Something2'.
	queue enqueue: firstQueued.
	queue enqueue: secondQueued.
	
	self assert: queue dequeue equals: firstQueued.! !

!QueueTest methodsFor: 'test' stamp: 'CGCM 9/27/2018 16:34:58'!
test05QueueBehavesFIFO

	| queue firstQueued secondQueued |

	queue _ Queue new.
	firstQueued _ 'First'.
	secondQueued _ 'Second'.
	queue enqueue: firstQueued.
	queue enqueue: secondQueued.

	self assert: queue dequeue equals: firstQueued.
	self assert: queue dequeue equals: secondQueued.
	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test06NextReturnsFirstEnqueuedObject

	| queue firstQueued |

	queue _ Queue new.
	firstQueued _ 'Something'.
	queue enqueue: firstQueued.

	self assert: queue next equals: firstQueued.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test07NextDoesNotRemoveObjectFromQueue

	| queue firstQueued |

	queue _ Queue new.
	firstQueued _ 'Something'.
	queue enqueue: firstQueued.

	queue next.
	self assert: queue size equals: 1.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test08CanNotDequeueWhenThereAreNoObjectsInTheQueue

	| queue |

	queue _ Queue new.
	
	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test09CanNotDequeueWhenThereAreNoObjectsInTheQueueAndTheQueueHadObjects

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.
	queue dequeue.

	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test10CanNotNextWhenThereAreNoObjectsInTheQueue

	| queue |

	queue _ Queue new.

	self
		should: [ queue next ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !


!classDefinition: #Queue category: #'Queue-Exercise'!
Object subclass: #Queue
	instanceVariableNames: 'contents state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!Queue methodsFor: 'initialization' stamp: 'PML 9/29/2018 16:40:41'!
initialize

	super initialize.
	contents := OrderedCollection new.
	state := Empty new.! !


!Queue methodsFor: 'testing' stamp: 'PML 9/29/2018 00:45:48'!
isEmpty
	
	^ contents isEmpty! !

!Queue methodsFor: 'testing' stamp: 'PML 9/29/2018 01:58:22'!
size

	^ contents size! !


!Queue methodsFor: 'operations' stamp: 'PML 10/4/2018 09:41:51'!
dequeue

	| primerElemento |
	
	state chequeoHayElementos.
	
	primerElemento := contents removeFirst.
	
	state := (State subclasses detect: [:unEstado | unEstado esElEstadoAdecuadoPara: contents]) new.

	^ primerElemento! !

!Queue methodsFor: 'operations' stamp: 'PML 10/4/2018 09:42:22'!
enqueue: anElement 
	
	state := NotEmpty new.
	
	^ contents add: anElement.
! !

!Queue methodsFor: 'operations' stamp: 'PML 10/4/2018 09:42:08'!
next

	state chequeoHayElementos.
	
	^ contents at: 1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Queue class' category: #'Queue-Exercise'!
Queue class
	instanceVariableNames: ''!

!Queue class methodsFor: 'error descriptions'!
queueEmptyErrorDescription
	^ 'Queue is empty'.! !


!classDefinition: #State category: #'Queue-Exercise'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!State methodsFor: 'testing' stamp: 'HGZ 10/3/2018 19:55:07'!
chequeoHayElementos

	self subclassResponsibility ! !

!State methodsFor: 'testing' stamp: 'PML 9/29/2018 16:50:06'!
isEmpty

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'State class' category: #'Queue-Exercise'!
State class
	instanceVariableNames: ''!

!State class methodsFor: 'testing' stamp: 'HGZ 10/3/2018 19:49:01'!
esElEstadoAdecuadoPara: unaColeccion
	self subclassResponsibility ! !


!classDefinition: #Empty category: #'Queue-Exercise'!
State subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!Empty methodsFor: 'testing' stamp: 'PML 10/4/2018 09:42:57'!
chequeoHayElementos
	
	self error: Queue queueEmptyErrorDescription
! !

!Empty methodsFor: 'testing' stamp: 'PML 9/29/2018 16:51:24'!
isEmpty

	^ true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: #'Queue-Exercise'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'testing' stamp: 'HGZ 10/3/2018 19:43:15'!
esElEstadoAdecuadoPara: unaColeccion

	^ unaColeccion isEmpty! !


!classDefinition: #NotEmpty category: #'Queue-Exercise'!
State subclass: #NotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!NotEmpty methodsFor: 'testing' stamp: 'HGZ 10/3/2018 19:56:20'!
chequeoHayElementos! !

!NotEmpty methodsFor: 'testing' stamp: 'PML 9/29/2018 16:51:39'!
isEmpty

	^ false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmpty class' category: #'Queue-Exercise'!
NotEmpty class
	instanceVariableNames: ''!

!NotEmpty class methodsFor: 'testing' stamp: 'HGZ 10/3/2018 19:43:55'!
esElEstadoAdecuadoPara: unaColeccion

	^ unaColeccion isEmpty not! !
