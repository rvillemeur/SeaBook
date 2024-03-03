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

	html text: 'Hello World'
]
