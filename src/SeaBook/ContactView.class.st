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

	html form: [
		html text: 'Name: '.
		html textInput
			callback: [ :value | self contact name: value ];
			value: self contact name.
		html break.
		html text: 'Email address: '.
		html textInput
			callback: [ :value | self contact emailAddress: value ];
			value: self contact emailAddress.
		html break.
		html submitButton
			callback: [ self save ];
			value: 'Save' ]
]

{ #category : #actions }
ContactView >> save [
	"for now, let's just display the contact information"

	self inform: self contact name , '--' , self contact emailAddress
]
