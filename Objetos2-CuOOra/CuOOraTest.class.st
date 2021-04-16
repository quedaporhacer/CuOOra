Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora'
	],
	#category : #'Objetos2-CuOOra-test'
}

{ #category : #running }
CuOOraTest >> setUp [
	cuoora := CuOOra new 
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
CuOOraTest >> testAutorDe [
	| santi manu topico topicos pregunta respuesta|
	santi := cuoora agregarUsuarioConNombre: 'santi' conContraseña: '123'.
	manu := cuoora agregarUsuarioConNombre: 'manu' conContraseña: '123'.
	topico := Topico newConNombre: 'top' unaDescripcion: 'des'.
	topicos := OrderedCollection new.
	topicos add: topico.
	pregunta := santi
		agregarPreguntaConTitulo: '?'
		conDescripcion: ''
		conTopicos: topicos.
	self assert: (cuoora autorDe: pregunta) equals: santi.
	respuesta:= manu agregarRespuestaDe: pregunta  conDescripcion: 'res'. 
	self assert: (cuoora autorDe: respuesta) equals: manu.
]

{ #category : #tests }
CuOOraTest >> testBorrarPregunta [
	| usuario topico pregunta |
	usuario := cuoora
		agregarUsuarioConNombre: 'nombre'
		conContraseña: 'contrasenia'.
	topico := Topico newConNombre: 'top' unaDescripcion: 'top'.
	cuoora agregarTopico: topico.
	pregunta := usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'desc'
		conTopicos: cuoora topicos.
	self assert: topico preguntas size equals: 1.
	self assert: usuario preguntas size equals: 1.
	usuario agregarRespuestaDe: pregunta conDescripcion: 'pregunta 1'.
	pregunta agregarPuntajeConEstado: true conAutor: usuario.
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
	topicos add: (Topico newConNombre: 'top' unaDescripcion: 'top').
	pregunta := usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'desc'
		conTopicos: topicos.
	respuesta := usuario
		agregarRespuestaDe: pregunta
		conDescripcion: 'desc'.
	respuesta agregarPuntajeConEstado: true conAutor: usuario.
	self assert: usuario respuestas size equals: 1.
	self assert: pregunta respuestas size equals: 1.
	self assert: respuesta puntaje size equals: 1.
	cuoora borrarRespuesta: respuesta.
	self assert: usuario respuestas size equals: 0.
	self assert: pregunta respuestas size equals: 0.
	self assert: respuesta puntaje size equals: 0.
]

{ #category : #tests }
CuOOraTest >> testExisteTopico [
	| topico |
	self assert: (cuoora existeTopico: 'topico') isNil.
	topico := (Topico newConNombre: 'topico' unaDescripcion: '').
		cuoora agregarTopico: topico.
	self assert: (cuoora existeTopico: 'topico') equals: topico
]

{ #category : #tests }
CuOOraTest >> testTopicosDe [
	| usuario pregunta topicos top1 top2 top3 |
	usuario := cuoora
		agregarUsuarioConNombre: 'santi'
		conContraseña: '123'.
	topicos := OrderedCollection new.
	top1 := Topico newConNombre: 't1' unaDescripcion: ''.
	top2 := Topico newConNombre: 't2' unaDescripcion: ''.
	top3 := Topico newConNombre: 't3' unaDescripcion: ''.
	cuoora
		agregarTopico: top1;
		agregarTopico: top2;
		agregarTopico: top3.
	topicos add: top1.
	topicos add: top2.
	pregunta := usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'desc'
		conTopicos: topicos.
	self assert: ((cuoora topicosDe: pregunta) includes: top1).
	self assert: ((cuoora topicosDe: pregunta) includes: top2).
	self assert: ((cuoora topicosDe: pregunta) includes: top3) not.
]

{ #category : #tests }
CuOOraTest >> testUsuarioConNombreconContraseña [
	|juan|
	self
		assert: (cuoora usuarioConNombre: 'juan' conContraseña: '123') isNil.
	juan:=cuoora agregarUsuarioConNombre: 'juan' conContraseña: '123'.
	self
		assert: (cuoora usuarioConNombre: 'juans' conContraseña: '123') isNil.
	self
		assert: (cuoora usuarioConNombre: 'juan' conContraseña: '1234') isNil.
	self
		assert: (cuoora usuarioConNombre: 'juan' conContraseña: '123') equals: juan.
]
