Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#instVars : [
		'topico'
	],
	#category : #'Objetos2-CuOOraTest'
}

{ #category : #tests }
TopicoTest >> setUp [
	topico:= (Topico newConNombre: 'top' unaDescripcion: 'setUp')
]

{ #category : #tests }
TopicoTest >> testBorrarPregunta [
	| topicos pregunta |
	self assert: topico preguntas size equals: 0.
	topicos := OrderedCollection new.
	topicos add: topico.
	pregunta := (Usuario newConNombre: 'elIndio' conContraseña: 'jijiji')
		agregarPreguntaConTitulo: '¿soñe?'
		conDescripcion: 'no lo soñe'
		conTopicos: topicos.
	self assert: topico preguntas size equals: 1.
	self assert: (topico borrarPregunta: pregunta) equals: true.
	self assert: (topico borrarPregunta: pregunta) equals: false.
	self assert: topico preguntas size equals: 0
]
