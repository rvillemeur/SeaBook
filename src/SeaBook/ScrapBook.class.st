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
		html image url: 'http://www.seaside.st/styles/logo-plain.png'  ]
]
