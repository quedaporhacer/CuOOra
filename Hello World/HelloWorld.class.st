Class {
	#name : #HelloWorld,
	#superclass : #WAComponent,
	#instVars : [
		'number'
	],
	#category : #'Hello World'
}

{ #category : #callbacks }
HelloWorld >> guessAgain [
	number := 10 atRandom. 
	
]

{ #category : #initialization }
HelloWorld >> initialize [

	super initialize.
	number := 0.
]

{ #category : #rendering }
HelloWorld >> renderContentOn: aCanvas [
	aCanvas paragraph
		with: [ aCanvas text: 'El numero que estas pensando es ...'.
			aCanvas space.
			aCanvas strong with: number printString ].
		
	aCanvas anchor 
		callback: [ self guessAgain ];
		with: 'Ni cerca...'
]
