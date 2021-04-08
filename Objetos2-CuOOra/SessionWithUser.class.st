Class {
	#name : #SessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #accessing }
SessionWithUser >> usuario [
	^ usuario
]

{ #category : #accessing }
SessionWithUser >> usuario: unUsuario [ 
	usuario := unUsuario 
]
