Class {
	#name : #ContactView,
	#superclass : #WAComponent,
	#instVars : [
		'contact'
	],
	#category : #'SeaBook-iAddress'
}

{ #category : #'class initialization' }
ContactView class >> initialize [

	"ContactView initialize"
	WAAdmin register: self asApplicationAt: 'contact'
]

{ #category : #accessing }
ContactView >> contact [

	^ contact ifNil: [ contact := Contact contacts first ]
]

{ #category : #accessing }
ContactView >> contact: aContact [

	contact := aContact
]

{ #category : #rendering }
ContactView >> renderContentOn: html [

	| group |
	html form: [
		html text: 'Name: '.
		html textInput on: #name of: self contact.
		html break.
		html text: 'Email address: '.
		html textInput on: #emailAddress of: self contact.
		html break.

		"Radio buttons"
		html text: 'Gender: '.
		group := html radioGroup.
		group radioButton
			selected: self contact isMale;
			callback: [ self contact beMale ].
		html text: 'Male'.
		group radioButton
			selected: self contact isFemale;
			callback: [ self contact beFemale ].
		html text: 'Female'.
		html break.

		"Checkbox"
		html text: 'Send email updates: '.
		html checkbox
			value: self contact requestEmailUpdates;
			callback: [ :value | self contact requestEmailUpdates: value ].
		html break.

		"date input"
		html dateInput
			callback: [ :value | self contact birthDate: value ];
			with: self contact birthDate.
		html break.
		
		html submitButton on: #save of: self ]
]

{ #category : #actions }
ContactView >> save [
	"for now, let's just display the contact information"

	self inform:
		self contact name , '--' , self contact emailAddress , '--'
		, self contact gender , '--'
		, self contact requestEmailUpdates printString
		, '--'
		, self contact birthDate  printString
]
