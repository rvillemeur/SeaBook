"
A counter that can count up and down

instances variables:
	count <Number>
"
Class {
	#name : #WebCounter,
	#superclass : #WAComponent,
	#instVars : [
		'count'
	],
	#category : #'SeaBook-WebCounter'
}

{ #category : #'class initialization' }
WebCounter class >> initialize [

	"WebCounter initialize"
	WAAdmin register: self asApplicationAt: 'webcounter'
]

{ #category : #actions }
WebCounter >> decrease [

	count := count - 1
]

{ #category : #actions }
WebCounter >> increase [
	count := count +1
	
]

{ #category : #initialization }
WebCounter >> initialize [

	super initialize.
	count := 0
]

{ #category : #rendering }
WebCounter >> renderContentOn: html [

	html heading: count.
	html anchor
		callback: [ self increase ];
		with: '++'.
	html space.
	html anchor
		callback: [ self decrease ];
		with: '--'
]

{ #category : #hooks }
WebCounter >> states [

	^ Array with: self
]
