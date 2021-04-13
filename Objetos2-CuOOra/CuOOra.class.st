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
	|  juan diego pedro preguntaPedro preguntaDiego |
	^ soleInstance
		ifNil: [ soleInstance := self new.
			pedro := soleInstance
				agregarUsuarioConNombre: 'pedro@cuoora.com'
				conContraseña: 'pedro@cuoora.com'.
			diego := soleInstance
				agregarUsuarioConNombre: 'diego@cuoora.com'
				conContraseña: 'diego@cuoora.com'.
			juan := soleInstance
				agregarUsuarioConNombre: 'juan@cuoora.com'
				conContraseña: 'juan@cuoora.com'.
			juan agregarFollower: diego.
			pedro agregarFollower: juan.
			soleInstance
				agregarTopico: (Topico newConNombre: 'OO1' unaDescripcion: '');
				agregarTopico: (Topico newConNombre: 'Test de unidad' unaDescripcion: '');
				agregarTopico: (Topico newConNombre: 'Smalltalk' unaDescripcion: '').
			preguntaPedro := pedro
				agregarPreguntaConTitulo: '¿Para que sirve el metodo SetUp?'
				conDescripcion: ''
				conTopicos: (soleInstance topicos first: 2).
			diego
				agregarRespuestaDe: preguntaPedro
				conDescripcion:
					'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de cada test.'.
			preguntaDiego := diego
				agregarPreguntaConTitulo: '¿Qué significa #messageNotUnderstood?'
				conDescripcion: ''
				conTopicos: (soleInstance topicos last: 2).
			pedro
				agregarRespuestaDe: preguntaDiego
				conDescripcion:
					'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'.
				 ]
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

{ #category : #'as yet unclassified' }
CuOOra >> autorDe: unPost [
	^ usuarios
		detect: [ :each | each esAutorDe: unPost ]
		ifNone: [ nil ]
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

{ #category : #'as yet unclassified' }
CuOOra >> existeTopico: unStrign [
	^ topicos
		detect: [ :topico | topico nombre = unStrign ]
		ifNone: [ nil ]
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
CuOOra >> topicosDe: unaPregunta [
	^ topicos select: [ :topico | topico dePregunta: unaPregunta ]
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
