Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion',
		'preguntas'
	],
	#category : #'Objetos2-CuOOra-model'
}

{ #category : #'instance creation' }
Topico class >> newConNombre: unNombre unaDescripcion: unaDescripcion [
	^self new initializeConNombre: unNombre unaDescripcion: unaDescripcion
]

{ #category : #settings }
Topico >> agregarPregunta: unaPregunta [ 
 preguntas add: unaPregunta
]

{ #category : #settings }
Topico >> borrarPregunta: unaPregunta [
	preguntas remove: unaPregunta ifAbsent: [ ^ false ].
	^true.
]

{ #category : #'as yet unclassified' }
Topico >> dePregunta: unaPregunta [
	^ preguntas includes: unaPregunta 
]

{ #category : #initialization }
Topico >> initializeConNombre: unNombre unaDescripcion: unaDescripcion [
	nombre := unNombre.
	descripcion := unaDescripcion.
	preguntas := OrderedCollection new
]

{ #category : #accessing }
Topico >> nombre [
	^nombre
]

{ #category : #accessing }
Topico >> preguntas [
	^preguntas 
]
