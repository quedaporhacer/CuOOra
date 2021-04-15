Class {
	#name : #Posteo,
	#superclass : #Object,
	#instVars : [
		'descripcion',
		'fechaYHora',
		'puntajes'
	],
	#category : #'Objetos2-CuOOra-model'
}

{ #category : #'instance creation' }
Posteo class >> newConDescripcion: unaDescripcion [
	^(self new) initializeConDescripcion: unaDescripcion 
]

{ #category : #'as yet unclassified' }
Posteo >> agregarLikeConEstado: unEstado conAutor: unUsuario [
|like|
	(self getLikeDe: unUsuario)
		ifNotNil: [ puntajes remove: (self getLikeDe: unUsuario) ].
		like:= Puntaje newConEstado: unEstado conAutor: unUsuario.
	puntajes add: like.
	^like
]

{ #category : #'as yet unclassified' }
Posteo >> borrarLike [
	puntajes removeAll
]

{ #category : #'as yet unclassified' }
Posteo >> calcularPuntaje [
	^ (self like - self dislike) + 20
]

{ #category : #accessing }
Posteo >> descripcion [
	^descripcion
]

{ #category : #'private ' }
Posteo >> dislike [
	^ (puntajes reject: [ :puntaje | puntaje state ]) size 

]

{ #category : #accessing }
Posteo >> fechaYHora [
	^fechaYHora 
]

{ #category : #'as yet unclassified' }
Posteo >> getLikeDe: unUsuario [


	^ puntajes detect: [ :each | each autor = unUsuario ] ifNone: [ nil ]
]

{ #category : #initialization }
Posteo >> initializeConDescripcion: unaDescripcion [
	descripcion := unaDescripcion.
	fechaYHora := DateAndTime now.
	puntajes := OrderedCollection new
]

{ #category : #'private ' }
Posteo >> like [
^ (puntajes select: [ :puntaje | puntaje state ]) size
]

{ #category : #'as yet unclassified' }
Posteo >> puntaje [
	^puntajes 
]
