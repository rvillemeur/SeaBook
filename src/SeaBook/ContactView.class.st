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

{ #category : #actions }
ContactView >> cancel [

	self answer: false
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

	html form: [ "Radio buttons""Checkbox""date input"
		self renderNameOn: html.
		self renderEmailOn: html.
		self renderGenderOn: html.
		self renderSendUpdatesOn: html.
		self renderDateOn: html.
		self renderSaveOn: html ]
]

{ #category : #rendering }
ContactView >> renderDateOn: html [

	html dateInput
		callback: [ :value | self contact birthDate: value ];
		with: self contact birthDate.
	html break
]

{ #category : #rendering }
ContactView >> renderEmailOn: html [

	html text: 'Email address: '.
	html textInput on: #emailAddress of: self contact.
	html break
]

{ #category : #rendering }
ContactView >> renderGenderOn: html [

	| group |
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
	html break
]

{ #category : #rendering }
ContactView >> renderNameOn: html [

	html text: 'Name: '.
	html textInput on: #name of: self contact.
	html break
]

{ #category : #rendering }
ContactView >> renderSaveOn: html [

	html submitButton on: #cancel of: self.
	html submitButton on: #save of: self
]

{ #category : #rendering }
ContactView >> renderSendUpdatesOn: html [

	html text: 'Send email updates: '.
	html checkbox
		value: self contact requestEmailUpdates;
		callback: [ :value | self contact requestEmailUpdates: value ].
	html break
]

{ #category : #actions }
ContactView >> save [

	self answer:true.
]
