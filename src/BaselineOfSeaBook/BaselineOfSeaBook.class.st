Class {
	#name : #BaselineOfSeaBook,
	#superclass : #BaselineOf,
	#category : #BaselineOfSeaBook
}

{ #category : #baselines }
BaselineOfSeaBook >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec description:
			'All components necessary to use code from seaside book'.
		spec author: 'RdeV'.
		spec
			baseline: 'Seaside3'
			with: [
			spec repository: 'github://SeasideSt/Seaside:master/repository' ].

		spec package: 'SeaBook' with: [ spec requires: 'Seaside3' ] ]
]
