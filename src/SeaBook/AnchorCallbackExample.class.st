Class {
	#name : #AnchorCallbackExample,
	#superclass : #WAComponent,
	#instVars : [
		'count'
	],
	#category : #'SeaBook-Anchors'
}

{ #category : #'class initialization' }
AnchorCallbackExample class >> initialize [

	"AnchorCallbackExample initialize"
	WAAdmin register: self asApplicationAt: 'anchor'
]

{ #category : #initialization }
AnchorCallbackExample >> anchorClicked [

	count := count + 1
]

{ #category : #initialization }
AnchorCallbackExample >> initialize [

	super initialize.
	count := 0
]

{ #category : #initialization }
AnchorCallbackExample >> renderContentOn: html [

	html text: count.
	html break.
	html anchor
		callback: [ self anchorClicked ];
		with: 'click to increment.'
]
