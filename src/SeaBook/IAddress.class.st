Class {
	#name : #IAddress,
	#superclass : #WAComponent,
	#instVars : [
		'editor'
	],
	#category : #'SeaBook-iAddress'
}

{ #category : #'class initialization' }
IAddress class >> initialize [

	"IAddress initialize"
	WAAdmin register: self asApplicationAt: 'iAddress'
]

{ #category : #adding }
IAddress >> addContact: aContact [

	Contact addContact: aContact
]

{ #category : #'as yet unclassified' }
IAddress >> askAndCreateContact [

	| name emailAddress |
	name := self request: 'Name'.
	emailAddress := self request: 'Email address'.
	self addContact: (Contact name: name emailAddress: emailAddress)
]

{ #category : #hooks }
IAddress >> children [

	^ Array with: editor
]

{ #category : #'as yet unclassified' }
IAddress >> contacts [

	^ Contact contacts
]

{ #category : #'as yet unclassified' }
IAddress >> editContact: aContact [

	editor contact: aContact
]

{ #category : #initialization }
IAddress >> initialize [

	super initialize.
	editor := ContactView new.
	editor contact: self contacts first
]

{ #category : #removing }
IAddress >> removeContact: aContact [

	(self confirm: 'Are you sure that you want to remove this contact ?')
		ifTrue: [ Contact removeContact: aContact ]
]

{ #category : #rendering }
IAddress >> renderBarOn: html [

	html anchor
		callback: [ self askAndCreateContact ];
		with: 'Add contact'
]

{ #category : #rendering }
IAddress >> renderContact: aContact on: html [

	html tableData: [
		html anchor
			callback: [ self editContact: aContact ];
			with: aContact name ].
	html tableData: aContact emailAddress.
	html tableData: [
		html anchor
			callback: [ self removeContact: aContact ];
			with: '--' ]
]

{ #category : #rendering }
IAddress >> renderContentOn: html [

	html form: [
		self renderTitleOn: html.
		self renderBarOn: html.
		html table: [
			html tableRow: [
				html tableHeading: 'Name'.
				html tableHeading: 'Address' ].
			self renderDatabaseRowsOn: html ].
		html horizontalRule.
		html render: editor ]
]

{ #category : #rendering }
IAddress >> renderDatabaseRowsOn: html [

	self contacts do: [ :contact |
		html tableRow: [ self renderContact: contact on: html ] ]
]

{ #category : #rendering }
IAddress >> renderTitleOn: html [

	html heading
		level: 2;
		with: 'iAddress'
]
