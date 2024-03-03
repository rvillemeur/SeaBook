Class {
	#name : #ContactListView,
	#superclass : #WAComponent,
	#category : #'SeaBook-iAddress'
}

{ #category : #'class initialization' }
ContactListView class >> initialize [

	"ContactListView initialize"
	WAAdmin register: self asApplicationAt: 'contacts'
]

{ #category : #adding }
ContactListView >> addContact [

	| name emailAddress |
	name := self request: 'Name'.
	emailAddress := self request: 'Email address'.
	Contact addContact: (Contact name: name emailAddress: emailAddress)
]

{ #category : #removing }
ContactListView >> removeContact: aContact [

	(self confirm: 'Are you sure that you want to remove this contact ?')
		ifTrue: [ Contact removeContact: aContact ]
]

{ #category : #rendering }
ContactListView >> renderContact: aContact on: html [

	html text: aContact name.
	html space.
	html anchor
		url: 'mailto:' , aContact emailAddress;
		with: aContact emailAddress.
	html text: '('.
	html anchor
		callback: [ self removeContact: aContact ];
		with: 'remove'.
	html text: ')'
]

{ #category : #rendering }
ContactListView >> renderContentOn: html [

	html anchor
		callback: [ self addContact ];
		with: 'add contact'.
	html unorderedList: [
		Contact contacts do: [ :contact |
			html listItem: [ self renderContact: contact on: html ] ] ]
]
