Class {
	#name : #ScrapBook,
	#superclass : #WAComponent,
	#category : #'SeaBook-hello'
}

{ #category : #'class initialization' }
ScrapBook class >> initialize [

	"ScrapBook initialize"
	WAAdmin register: self asApplicationAt: 'hello'
]

{ #category : #accessing }
ScrapBook >> items [

	^ #( 'Calendars' 'Todo list' 'Shopping cart' 'And lot more...' )
]

{ #category : #rendering }
ScrapBook >> renderContentOn: html [

	html paragraph: 'A plain text paragraph'.
	html paragraph: [
		html render: 'A paragraph with plain text followed by a line break.'.
		html break.
		html emphasis: 'Emphasized text '.
		html render: 'followed by a horizontal rule. '.
		html horizontalRule.
		html render: 'An image: '.
		html image url: 'http://www.seaside.st/styles/logo-plain.png' ].
	html paragraph: [
		10 timesRepeat: [
			html image
				url: 'http://www.seaside.st/styles/logo-plain.png';
				width: 50 ].
		html horizontalRule ].
	html paragraph: [
		html render: 'Today: '.
		html render: Date today ].
	html horizontalRule.
	html heading: 'Hello world'.
	html paragraph: 'welcome to seaside website'.
	html orderedList: [ 
		self items do: [ :each | html listItem: each ] ].
	html horizontalRule.
	html table: [ 
		html tableRow: [ 
			html tableHeading: 'Calendars'.
			html tableData: '1/1/2006'.
			html tableData: 'Track events, holiday, etc.' ].
		html tableRow: [ 
			html tableHeading: 'Todo lists'.
			html tableData: '5/1/2006'.
			html tableData: 'Keep track of all the things to remember to do' ].
		html tableRow: [ 
			html tableHeading: 'Shopping carts'.
			html tableData: '8/1/2006'.
			html tableData: 'Enable your customer to shop online' ] ].
	html horizontalRule.
	html span class: 'error'; with: 'This site does not work yet'
	
]

{ #category : #hooks }
ScrapBook >> style [ 
^ 'h1  { text-align: center; }
span.error {background-color: red}'
]
