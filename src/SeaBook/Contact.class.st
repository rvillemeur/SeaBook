Class {
	#name : #Contact,
	#superclass : #Object,
	#instVars : [
		'name',
		'emailAddress'
	],
	#classVars : [
		'Database'
	],
	#category : #'SeaBook-iAddress'
}

{ #category : #adding }
Contact class >> addContact: aContact [

	self contacts add: aContact
]

{ #category : #'as yet unclassified' }
Contact class >> contacts [
	"answers an OrderedCollection of the contact information instances"

	Database ifNil: [ self createSampleDatabase ].
	^ Database
]

{ #category : #'as yet unclassified' }
Contact class >> createSampleDatabase [

	Database := OrderedCollection new
		            add:
			            (self name: 'Bob Jones' emailAddress: 'bob@nowhere.com');
		            add:
			            (self
				             name: 'Steve Smith'
				             emailAddress: 'sm@somewhere.com');
		            yourself
]

{ #category : #'as yet unclassified' }
Contact class >> name: nameString emailAddress: emailString [

	^ self new
		  name: nameString;
		  emailAddress: emailString;
		  yourself
]

{ #category : #removing }
Contact class >> removeContact: aContact [

	self contacts remove: aContact
]

{ #category : #accessing }
Contact >> emailAddress [

	^ emailAddress
]

{ #category : #accessing }
Contact >> emailAddress: aString [

	emailAddress := aString
]

{ #category : #accessing }
Contact >> name [

	^ name
]

{ #category : #accessing }
Contact >> name: aString [

	name := aString
]
