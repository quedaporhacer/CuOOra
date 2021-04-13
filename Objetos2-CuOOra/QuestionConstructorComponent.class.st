Class {
	#name : #QuestionConstructorComponent,
	#superclass : #QuestionComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #'instance creation' }
QuestionConstructorComponent class >> newConPregunta: unaPregunta [
	^ self new initializeCon: unaPregunta
]

{ #category : #initialization }
QuestionConstructorComponent >> initializeCon: unaPregunta [
	pregunta := unaPregunta .
]
