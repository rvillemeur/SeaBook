Class {
	#name : #Contact,
	#superclass : #Object,
	#instVars : [
		'name',
		'emailAddress',
		'gender',
		'requestEmailUpdates',
		'birthDate'
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
Contact >> beFemale [

	gender := #Female
]

{ #category : #accessing }
Contact >> beMale [

	gender := #Male
]

{ #category : #accessing }
Contact >> birthDate [

	^ birthDate ifNil: [ birthDate := '1/1/1970' asDate]
]

{ #category : #accessing }
Contact >> birthDate: anObject [

	birthDate := anObject
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
Contact >> gender [

	^ gender ifNil: [ gender := #male ]
]

{ #category : #accessing }
Contact >> isFemale [

	^ self gender = #Female
]

{ #category : #accessing }
Contact >> isMale [

	^ self gender = #male
]

{ #category : #accessing }
Contact >> name [

	^ name
]

{ #category : #accessing }
Contact >> name: aString [

	name := aString
]

{ #category : #accessing }
Contact >> requestEmailUpdates [

	^ requestEmailUpdates ifNil: [ requestEmailUpdates := false ]
]

{ #category : #accessing }
Contact >> requestEmailUpdates: aBoolean [

	^ requestEmailUpdates := aBoolean
]
