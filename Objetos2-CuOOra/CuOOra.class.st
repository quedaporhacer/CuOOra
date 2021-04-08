Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Objetos2-CuOOra-model'
}

{ #category : #accessing }
CuOOra class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #accessing }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarTopico: unTopico [
	topicos add: unTopico.
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarUsuarioConNombre: unNombre conContraseña: unaContraseña [
	| user |
	user := (Usuario newConNombre: unNombre conContraseña: unaContraseña).
	usuarios add: user.
	^ user
]

{ #category : #settings }
CuOOra >> borrarPregunta: unaPregunta [
	topicos do: [ :topico | topico borrarPregunta: unaPregunta ].
	
	unaPregunta respuestas
		do: [ :respuesta | self borrarRespuesta: respuesta ].
		
	(usuarios
		detect: [ :usuario | usuario preguntas includes: unaPregunta ])
		borrarPregunta: unaPregunta.
		
	unaPregunta borrarLike.
]

{ #category : #'as yet unclassified' }
CuOOra >> borrarRespuesta: unaRespuesta [


	((usuarios flatCollect: [ :usuario | usuario preguntas ])
		detect: [ :pregunta | pregunta respuestas includes: unaRespuesta ])
		borrarRespuesta: unaRespuesta. 
		unaRespuesta borrarLike.
	(usuarios
		detect: [ :usuario | usuario respuestas includes: unaRespuesta ])
		borrarRespuesta: unaRespuesta
]

{ #category : #initialization }
CuOOra >> initialize [ 
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ usuarios flatCollect: [ :usuario | usuario preguntas ]
]

{ #category : #'as yet unclassified' }
CuOOra >> respuestas [
	^ self preguntas flatCollect: [ :pregunta | pregunta respuestas ]
]

{ #category : #accessing }
CuOOra >> topicos [
	^topicos
	
]

{ #category : #'as yet unclassified' }
CuOOra >> usuarioConNombre: unNombre conContraseña: unaContraseña [

		^ usuarios
		detect: [ :each | each nombre  = unNombre  & (each contraseña  = unaContraseña ) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
CuOOra >> usuarios [
	^usuarios
]
