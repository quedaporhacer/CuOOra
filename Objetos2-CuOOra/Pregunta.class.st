Class {
	#name : #Pregunta,
	#superclass : #Descripcion,
	#instVars : [
		'titulo',
		'respuestas'
	],
	#category : #'Objetos2-CuOOra-model'
}

{ #category : #'instance creation' }
Pregunta class >> newConTitulo: unTitulo  conDescripcion: unaDescripcion [

   ^(self new) initializeConTitulo: unTitulo  conDescripcion:  unaDescripcion 
]

{ #category : #'as yet unclassified' }
Pregunta >> agregarRespuesta: unaRespuesta [ 
	respuestas add: unaRespuesta 
]

{ #category : #'as yet unclassified' }
Pregunta >> borrarRespuesta: unaRespuesta [
	respuestas remove: unaRespuesta ifAbsent: [ ^ false ].
	^ true
]

{ #category : #accessing }
Pregunta >> calcularPuntaje [
	^ super calcularPuntaje + 50
]

{ #category : #initialization }
Pregunta >> initializeConTitulo: unTitulo conDescripcion: unaDescripcion [
	titulo := unTitulo.
	respuestas := OrderedCollection new.
	self initializeConDescripcion: unaDescripcion
]

{ #category : #accessing }
Pregunta >> respuestas [
  ^respuestas 
]

{ #category : #accessing }
Pregunta >> titulo [
	^titulo
]
