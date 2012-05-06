'From Cuis 4.0 of 21 April 2012 [latest update: #1271] on 6 May 2012 at 5:38:30 pm'!
'Description Please enter a description for this package '!
!classDefinition: #SampleSystem category: #'GSA-Cuis-Performance-Testing'!
Object subclass: #SampleSystem
	instanceVariableNames: 'cities addresses clients'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GSA-Cuis-Performance-Testing'!
!classDefinition: 'SampleSystem class' category: #'GSA-Cuis-Performance-Testing'!
SampleSystem class
	instanceVariableNames: 'instance'!

!classDefinition: #TestObject category: #'GSA-Cuis-Performance-Testing'!
Object subclass: #TestObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GSA-Cuis-Performance-Testing'!
!classDefinition: 'TestObject class' category: #'GSA-Cuis-Performance-Testing'!
TestObject class
	instanceVariableNames: ''!

!classDefinition: #Address category: #'GSA-Cuis-Performance-Testing'!
TestObject subclass: #Address
	instanceVariableNames: 'street number city'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GSA-Cuis-Performance-Testing'!
!classDefinition: 'Address class' category: #'GSA-Cuis-Performance-Testing'!
Address class
	instanceVariableNames: ''!

!classDefinition: #City category: #'GSA-Cuis-Performance-Testing'!
TestObject subclass: #City
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GSA-Cuis-Performance-Testing'!
!classDefinition: 'City class' category: #'GSA-Cuis-Performance-Testing'!
City class
	instanceVariableNames: ''!

!classDefinition: #Client category: #'GSA-Cuis-Performance-Testing'!
TestObject subclass: #Client
	instanceVariableNames: 'firstName lastName address'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GSA-Cuis-Performance-Testing'!
!classDefinition: 'Client class' category: #'GSA-Cuis-Performance-Testing'!
Client class
	instanceVariableNames: ''!


!SampleSystem commentStamp: 'GermanArduino 5/6/2012 17:24' prior: 0!
Ojo, en categor�a testing de la clase falta agregar este m�todo (el que sigue) y arreglar #assignAddressToClients

!Address methodsFor: 'accessing' stamp: 'dgd 5/21/2002 12:02'!
city

!Address methodsFor: 'initialization' stamp: 'dgd 5/21/2002 11:55'!
initializeStreet: streetString number: numberString city: aCity

!Address methodsFor: 'accessing' stamp: 'dgd 5/21/2002 12:02'!
number

!Address methodsFor: 'printing' stamp: 'dgd 5/21/2002 11:57'!
printOn: aStream 

!Address methodsFor: 'accessing' stamp: 'dgd 5/21/2002 12:02'!
street

!Address class methodsFor: 'private' stamp: 'dgd 5/21/2002 11:55'!
newStreet: streetString number: numberString city: aCity 

!Address class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 11:59'!
street: streetString number: numberString city: aCity 

!City methodsFor: 'initialization' stamp: 'dgd 5/21/2002 11:16'!
initializeName: aString

!City methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:33'!
name

!City methodsFor: 'printing' stamp: 'dgd 5/21/2002 11:17'!
printOn: aStream 

!City class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 11:58'!
named: aString 

!City class methodsFor: 'private' stamp: 'dgd 5/21/2002 11:28'!
newNamed: aString 

!Client methodsFor: 'accessing' stamp: 'dgd 5/21/2002 14:21'!
address

!Client methodsFor: 'accessing' stamp: 'dgd 5/21/2002 14:19'!
address: anObject

!Client methodsFor: 'accessing' stamp: 'dgd 5/21/2002 13:49'!
firstName

!Client methodsFor: 'initialization' stamp: 'dgd 5/21/2002 13:38'!
initializeFirstName: firstNameString lastName: lastNameString

!Client methodsFor: 'accessing' stamp: 'dgd 5/21/2002 13:50'!
lastName

!Client methodsFor: 'printing' stamp: 'dgd 5/21/2002 13:37'!
printOn: aStream 

!Client class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 13:40'!
firstName: firstNameString lastName: lastNameString 

!Client class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 12:05'!
named: aString 

!Client class methodsFor: 'private' stamp: 'dgd 5/21/2002 13:39'!
newFirstName: firstNameString lastName: lastNameString 

!SampleSystem methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:27'!
addresses

!SampleSystem methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:22'!
cities

!SampleSystem methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:21'!
clients

!SampleSystem methodsFor: 'initialization' stamp: 'dgd 5/21/2002 11:27'!
initialize

!SampleSystem methodsFor: 'printing' stamp: 'dgd 5/21/2002 11:27'!
printOn: aStream 

!SampleSystem class methodsFor: 'testing' stamp: 'dgd 5/21/2002 13:02'!
allNames

!SampleSystem class methodsFor: 'testing' stamp: 'gsa 5/6/2012 17:33'!
assignAddressToClients

!SampleSystem class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 11:26'!
clearInstance

!SampleSystem class methodsFor: 'testing' stamp: 'dgd 5/21/2002 13:35'!
composedNames

!SampleSystem class methodsFor: 'testing' stamp: 'dgd 5/21/2002 12:03'!
createSampleAddresses

!SampleSystem class methodsFor: 'testing' stamp: 'dgd 5/21/2002 11:41'!
createSampleCities

!SampleSystem class methodsFor: 'testing' stamp: 'gsa 5/6/2012 17:34'!
createSampleClients
	"creates a set of sample clients"
	| lastNames composedNames clientsToCreate created clients |
	Transcript show: 'creating names';
		 cr.
	lastNames _ #('G�mez Deck' 'Goldberg' 'Ingalls' 'Kay' ).
	composedNames _ self composedNames.
	""
	clientsToCreate _ composedNames size * lastNames size.
	Transcript show: 'clients to create: ';
		 show: clientsToCreate;
		 cr.
	""
	clients _ self instance clients.
	created _ 0.
	lastNames
		do: [:lastName | composedNames
				do: [:composedName | 
					clients
						add: (Client newFirstName: composedName lastName: lastName).
					""
					created _ created + 1.
					(created isDivisibleBy: 50000)
						ifTrue: [Transcript show: 'created: ';
								 show: created;
								 show: ' (';
								
								show: (100.0 * created / clientsToCreate roundTo: 0.01);
								 show: '%)';
								 cr]]].
	Transcript show: 'done!!';
		 cr
		
	! !

!SampleSystem class methodsFor: 'testing' stamp: 'dgd 5/21/2002 14:30'!
createSampleObjects

!SampleSystem class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 11:19'!
instance

!SampleSystem class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 11:20'!
new

!TestObject methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:29'!
system

!TestObject class methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:33'!
system