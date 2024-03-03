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
		html textInput on: #name of: self contact.
		html break.
		html text: 'Email address: '.
		html textInput on: #emailAddress of: self contact.
		html break.

		"list box"
		html text: 'Gender: '.
		html select
			size: 2;
			list: #( #Male #Female );
			selected: self contact gender;
			callback: [ :value |
				value = #Male
					ifTrue: [ self contact beMale ]
					ifFalse: [ self contact beFemale ] ].
		html break.

		html submitButton on: #save of: self ]
]

{ #category : #actions }
ContactView >> save [
	"for now, let's just display the contact information"

	self inform:
		self contact name , '--' , self contact emailAddress , '--'
		, self contact gender
]
