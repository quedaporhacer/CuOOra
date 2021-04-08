Class {
	#name : #Descripcion,
	#superclass : #Object,
	#instVars : [
		'descripcion',
		'fechaYHora',
		'puntajes'
	],
	#category : #'Objetos2-CuOOra-model'
}

{ #category : #'instance creation' }
Descripcion class >> newConDescripcion: unaDescripcion [
	^(self new) initializeConDescripcion: unaDescripcion 
]

{ #category : #'as yet unclassified' }
Descripcion >> agregarLikeConEstado: unEstado conAutor: unUsuario [
	(self getLikeDe: unUsuario)
		ifNotNil: [ 
			puntajes remove: (self getLikeDe: unUsuario).
			 ].

	puntajes add: (Puntaje newConEstado: unEstado conAutor: unUsuario)
]

{ #category : #'as yet unclassified' }
Descripcion >> borrarLike [
	puntajes removeAll
]

{ #category : #'as yet unclassified' }
Descripcion >> calcularPuntaje [
	^ (self like - self dislike)
]

{ #category : #accessing }
Descripcion >> descripcion [
	^descripcion
]

{ #category : #'private ' }
Descripcion >> dislike [
	^ (puntajes reject: [ :puntaje | puntaje state ]) size 

]

{ #category : #'as yet unclassified' }
Descripcion >> getLikeDe: unUsuario [
	(puntajes anySatisfy: [ :each | each autor = unUsuario ])
		ifTrue: [ ^ puntajes detect: [ :each | each autor = unUsuario ] ].
		^nil
]

{ #category : #initialization }
Descripcion >> initializeConDescripcion: unaDescripcion [
	descripcion := unaDescripcion.
	fechaYHora := DateAndTime now.
	puntajes := OrderedCollection new
]

{ #category : #'private ' }
Descripcion >> like [
^ (puntajes select: [ :puntaje | puntaje state ]) size
]

{ #category : #'as yet unclassified' }
Descripcion >> puntaje [
	^puntajes 
]
