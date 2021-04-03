Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora'
	],
	#category : #'Objetos2-CuOOraTest'
}

{ #category : #running }
CuOOraTest >> setUp [
	cuoora:= (CuOOra new) initialize.
]

{ #category : #'as yet unclassified' }
CuOOraTest >> testAgregarUsuarioConNombreconContraseña [
	self assert: cuoora usuarios size equals: 0.
	cuoora agregarUsuarioConNombre: 'santiago' conContraseña: '123'.
	self assert: cuoora usuarios size equals: 1.
	cuoora agregarUsuarioConNombre: 'manuel' conContraseña: 'kaius'.
	self assert: cuoora usuarios size equals: 2.
]

{ #category : #tests }
CuOOraTest >> testBorrarPregunta [
	| usuario topico pregunta |
	usuario := cuoora
		agregarUsuarioConNombre: 'nombre'
		conContraseña: 'contrasenia'.
	topico := Topicos newConNombre: 'top' unaDescripcion: 'top'.
	cuoora agregarTopico: topico.
	pregunta := usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'desc'
		conTopicos: cuoora topicos.
	self assert: topico preguntas size equals: 1.
	self assert: usuario preguntas size equals: 1.
	usuario agregarRespuestaDe: pregunta conDescripcion: 'pregunta 1'.
	pregunta agregarLikeConEstado: true conAutor: usuario.
	self assert: pregunta respuestas size equals: 1.
	self assert: pregunta puntaje size equals: 1.
	cuoora borrarPregunta: pregunta.
	self assert: topico preguntas size equals: 0.
	self assert: usuario preguntas size equals: 0.
	self assert: pregunta respuestas size equals: 0.
	self assert: pregunta puntaje size equals: 0.
]

{ #category : #tests }
CuOOraTest >> testBorrarRespuesta [
	| usuario pregunta topicos respuesta |
	usuario := cuoora
		agregarUsuarioConNombre: 'santiago'
		conContraseña: '123'.
	topicos := OrderedCollection new.
	topicos add: (Topicos newConNombre: 'top' unaDescripcion: 'top').
	pregunta := usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'desc'
		conTopicos: topicos.
	respuesta := usuario
		agregarRespuestaDe: pregunta
		conDescripcion: 'desc'.
	respuesta agregarLikeConEstado: true conAutor: usuario.
	self assert: usuario respuestas size equals: 1.
	self assert: pregunta respuestas size equals: 1.
	self assert: respuesta puntaje size equals: 1.
	cuoora borrarRespuesta: respuesta.
	self assert: usuario respuestas size equals: 0.
	self assert: pregunta respuestas size equals: 0.
	self assert: respuesta puntaje size equals: 0.
]
