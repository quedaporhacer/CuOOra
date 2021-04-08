Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'contraseña',
		'fechaYHora',
		'preguntas',
		'topicosDeInteres',
		'follower',
		'respuestas'
	],
	#category : #'Objetos2-CuOOra-model'
}

{ #category : #constructor }
Usuario class >> newConNombre: unNombre conContraseña: unaContraseña [
	^self new initializeConNombre: unNombre conContraseña: unaContraseña 
]

{ #category : #settings }
Usuario >> agregarFollower: unUsuario [
	follower add: unUsuario 
]

{ #category : #settings }
Usuario >> agregarPreguntaConTitulo: unTitulo conDescripcion: unaDescripcion conTopicos: topicos [
	| pregunta |
	pregunta := Pregunta
		newConTitulo: unTitulo
		conDescripcion: unaDescripcion.
	preguntas add: pregunta.
	topicos do: [ :topico | topico agregarPregunta: pregunta ].
	^pregunta.
]

{ #category : #'as yet unclassified' }
Usuario >> agregarRespuestaDe: unaPregunta conDescripcion: unaDescipcion [
	| res |
	res := Respuesta newConDescripcion: unaDescipcion.
	unaPregunta agregarRespuesta: res.
	respuestas add: res.
	^res.
]

{ #category : #settings }
Usuario >> agregarTopicoDeInteres: unTopico [
	topicosDeInteres add: unTopico 
]

{ #category : #settings }
Usuario >> borrarPregunta: unaPregunta [
	preguntas remove: unaPregunta ifAbsent: [ ^ false ].
	^true
]

{ #category : #settings }
Usuario >> borrarRespuesta: unaRespuesta [
	respuestas remove: unaRespuesta ifAbsent: [ ^ false ].
	^ true
]

{ #category : #accessing }
Usuario >> calcularPuntaje [
	^ self calcularPuntajePreguntas + self calcularPuntajeRespuestas 
]

{ #category : #'private ' }
Usuario >> calcularPuntajePreguntas [
	^ preguntas 	sumNumbers: [ :pregunta | pregunta calcularPuntaje ]
]

{ #category : #'private ' }
Usuario >> calcularPuntajeRespuestas [
	^ (self respuestasValidas) sumNumbers: [ :respuesta | respuesta calcularPuntaje ]
]

{ #category : #accessing }
Usuario >> contraseña [
	^contraseña
]

{ #category : #initialization }
Usuario >> initializeConNombre: unNombre conContraseña: unaContraseña [
	nombre := unNombre.
	contraseña := unaContraseña.
	fechaYHora := DateAndTime now.
	preguntas := OrderedCollection new.
	respuestas := OrderedCollection new.
	topicosDeInteres := OrderedCollection new.
	follower := OrderedCollection new.
]

{ #category : #accessing }
Usuario >> nombre [
	^nombre
]

{ #category : #accessing }
Usuario >> preguntas [ 
	^preguntas 
]

{ #category : #accessing }
Usuario >> preguntasRelevantes [
	^(topicosDeInteres collect: [ :topico | topico preguntas ]) union: ( follower collect: [ :usuario |  usuario preguntas ] )
]

{ #category : #accessing }
Usuario >> respuestas [
  ^respuestas
]

{ #category : #'private ' }
Usuario >> respuestasValidas [
	^ respuestas
		difference: (preguntas flatCollect: [ :pregunta | pregunta respuestas ])
]
