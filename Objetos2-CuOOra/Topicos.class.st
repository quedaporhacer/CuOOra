Class {
	#name : #Topicos,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion',
		'preguntas'
	],
	#category : #'Objetos2-CuOOra-model'
}

{ #category : #'instance creation' }
Topicos class >> newConNombre: unNombre unaDescripcion: unaDescripcion [
	^self new initializeConNombre: unNombre unaDescripcion: unaDescripcion
]

{ #category : #settings }
Topicos >> agregarPregunta: unaPregunta [ 
 preguntas add: unaPregunta
]

{ #category : #settings }
Topicos >> borrarPregunta: unaPregunta [
	preguntas remove: unaPregunta ifAbsent: [ ^ false ].
	^true.
]

{ #category : #initialization }
Topicos >> initializeConNombre: unNombre unaDescripcion: unaDescripcion [
	nombre := unNombre.
	descripcion := unaDescripcion.
	preguntas := OrderedCollection new
]

{ #category : #accessing }
Topicos >> preguntas [
	^preguntas 
]
