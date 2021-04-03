Class {
	#name : #Puntaje,
	#superclass : #Object,
	#instVars : [
		'state',
		'fechaYHora',
		'autor'
	],
	#category : #'Objetos2-CuOOra-model'
}

{ #category : #'instance creation' }
Puntaje class >> newConEstado: unBoolean conAutor: unUsuario [
	^ self new initializeConEstado: unBoolean conAutor: unUsuario
]

{ #category : #accessing }
Puntaje >> autor [
	 ^autor
]

{ #category : #initialization }
Puntaje >> initializeConEstado: unBoolean conAutor: unUsuario [
	state := unBoolean.
	autor := unUsuario. 
	fechaYHora:= DateAndTime now.
	 
]

{ #category : #accessing }
Puntaje >> state [ 	
	^state
]
