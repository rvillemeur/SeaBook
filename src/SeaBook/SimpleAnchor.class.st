Class {
	#name : #SimpleAnchor,
	#superclass : #WAComponent,
	#category : #'SeaBook-Anchors'
}

{ #category : #'class initialization' }
SimpleAnchor class >> initialize [

	"SimpleAnchor initialize"
	WAAdmin register: self asApplicationAt: 'simple-anchor'
]

{ #category : #rendering }
SimpleAnchor >> renderContentOn: html [

	html anchor
		url: 'http://www.seaside.st';
		with: 'Seaside Website'
]
