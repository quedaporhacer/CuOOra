Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-CuOOra-test'
}

{ #category : #running }
UsuarioTest >> setUp [
	usuario := Usuario newConNombre: 'juan' conContraseña: 'admin2020'
]

{ #category : #'as yet unclassified' }
UsuarioTest >> testAgregarPreguntaConTituloconDescripcionconTopicos [
	| topicos topico1 topico2 |
	topico1 := Topico newConNombre: 'top1' unaDescripcion: 'prueba'.
	topico2 := Topico newConNombre: 'top2' unaDescripcion: 'prueba'.
	topicos := OrderedCollection new.
	topicos add: topico1.
	topicos add: topico2.
	self assert: usuario preguntas size equals: 0.
	self assert: topico1 preguntas size equals: 0.
	self assert: topico2 preguntas size equals: 0.
	usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'desctipcion'
		conTopicos: topicos.
	self assert: usuario preguntas size equals: 1.
	self assert: topico1 preguntas size equals: 1.
	self assert: topico2 preguntas size equals: 1
]

{ #category : #tests }
UsuarioTest >> testAgregarRespuestaDeConDescripcion [
	| preg usuario2 |
	preg := Pregunta newConTitulo: '?' conDescripcion: 'desc'.
	self assert: usuario respuestas size equals: 0.
	self assert: preg respuestas size equals: 0.
	usuario agregarRespuestaDe: preg conDescripcion: 'res'.
	self assert: usuario respuestas size equals: 1.
	self assert: preg respuestas size equals: 1.
	usuario2 := Usuario newConNombre: 'manu' conContraseña: 'contrasenia'.
	usuario2 agregarRespuestaDe: preg conDescripcion: 'res2'.
	self assert: usuario2 respuestas size equals: 1.
	self assert: preg respuestas size equals: 2 
]

{ #category : #accessing }
UsuarioTest >> testBorrarPosteo [
	| topicos topico pregunta respuesta |
	self assert: (usuario borrarPosteo: 'EstoNoEsUnPosteo') equals: false.
	topicos := OrderedCollection new.
	topico := Topico newConNombre: '?' unaDescripcion: ''.
	topicos add: topico.
	pregunta := usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'desc'
		conTopicos: topicos.
	respuesta := usuario
		agregarRespuestaDe: pregunta
		conDescripcion: 'res'.
	self assert: (usuario borrarPosteo: respuesta) equals: true.
	self assert: (usuario borrarPosteo: pregunta) equals: true.
	self assert: (usuario borrarPosteo: respuesta) equals: false.
]

{ #category : #tests }
UsuarioTest >> testCalcularPuntaje [
	| topicos top |
	self assert: usuario calcularPuntaje equals: 0.
	topicos := OrderedCollection new.
	top := Topico newConNombre: 'top1' unaDescripcion: 'prueba'.
	topicos add: top.
	usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'desctipcion'
		conTopicos: topicos.
	self assert: usuario calcularPuntaje equals: 50.
	usuario
		agregarRespuestaDe: (Pregunta newConTitulo: '?' conDescripcion: 'dec')
		conDescripcion: 'desc'.
	self assert: usuario calcularPuntaje equals: 70.
	usuario preguntas first agregarLikeConEstado: true conAutor: usuario.
	self assert: usuario calcularPuntaje equals: 71.
	usuario preguntas first agregarLikeConEstado: false conAutor: usuario.
	self assert: usuario calcularPuntaje equals: 69.
	
	usuario
		agregarRespuestaDe: usuario preguntas first
		conDescripcion: 'desc'.
	self assert: usuario calcularPuntaje equals: 69
]

{ #category : #tests }
UsuarioTest >> testEsAutorDe [
	| pregunta otraPregunta topico topicos |
	topico := Topico newConNombre: 'moto' unaDescripcion: ''.
	topicos := OrderedCollection new.
	topicos add: topico.
	pregunta := usuario
		agregarPreguntaConTitulo: '¿Y candela?'
		conDescripcion: 'y la moto?'
		conTopicos: topicos.
	self assert: (usuario esAutorDe: pregunta).
	otraPregunta := (Usuario newConNombre: 'otro' conContraseña: nil)
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'des'
		conTopicos: topicos.
	self assert: (usuario esAutorDe: otraPregunta)not.
]

{ #category : #tests }
UsuarioTest >> testPreguntasPrincipales [
	| usuario2 topicos topicos2 topico1 topico2 pregunta1 pregunta2 |
	self assert: usuario preguntasPrincipales size equals: 0.
	topicos := OrderedCollection new.
	topico1 := Topico newConNombre: 'top1' unaDescripcion: 'top1'.
	topico2 := Topico newConNombre: 'top2' unaDescripcion: 'top2'.
	topicos add: topico1.
	usuario2 := Usuario
		newConNombre: 'seguido'
		conContraseña: 'contraseña'.
	pregunta1 := usuario2
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'pregunta relevante'
		conTopicos: topicos.
	usuario agregarFollower: usuario2.
	self assert: (usuario preguntasPrincipales includes: pregunta1).
	topicos2 := OrderedCollection new.
	topicos2 add: topico2.
	pregunta2 := usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'pregunta relevante'
		conTopicos: topicos2.
	usuario agregarTopicoDeInteres: topico2.
	self assert: (usuario preguntasPrincipales includes: pregunta2).
	"agregamos mas de 5 preguntas "
	usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'pregunta relevante'
		conTopicos: topicos2.
	usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'pregunta relevante'
		conTopicos: topicos2.
	usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'pregunta relevante'
		conTopicos: topicos2.
	usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'pregunta relevante'
		conTopicos: topicos2.
	self assert: usuario preguntasPrincipales size equals: 5
]

{ #category : #tests }
UsuarioTest >> testPreguntasRelevantes [
	| usuario2 topicos topicos2 topico1 topico2 |
	self assert: usuario preguntasRelevantes size equals: 0.
	topicos := OrderedCollection new.
	topico1 := Topico newConNombre: 'top1' unaDescripcion: 'top1'.
	topico2 := Topico newConNombre: 'top2' unaDescripcion: 'top2'.
	topicos add: topico1.
	usuario2 := Usuario
		newConNombre: 'seguido'
		conContraseña: 'contraseña'.
	usuario2
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'pregunta relevante'
		conTopicos: topicos.
	usuario agregarFollower: usuario2.
	self assert: usuario preguntasRelevantes size equals: 1.
	topicos2 := OrderedCollection new.
	topicos2 add: topico2.
	usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'pregunta relevante'
		conTopicos: topicos2.
	usuario agregarTopicoDeInteres: topico2.
	self assert: usuario preguntasRelevantes size equals: 2.
	usuario agregarTopicoDeInteres: topico1.
	self assert: usuario preguntasRelevantes size equals: 2.
]

{ #category : #tests }
UsuarioTest >> testRespuestasValidas [
	| topicos |
	self assert: usuario respuestasValidas size equals: 0.
	usuario
		agregarRespuestaDe: (Pregunta newConTitulo: '?' conDescripcion: 'desc')
		conDescripcion: 'des'.
	self assert: usuario respuestasValidas size equals: 1.
	topicos := OrderedCollection new.
	topicos add: (Topico newConNombre: 'top' unaDescripcion: 'desc').
	usuario
		agregarPreguntaConTitulo: '?'
		conDescripcion: 'desc'
		conTopicos: topicos.
	usuario
		agregarRespuestaDe: usuario preguntas first
		conDescripcion: 'invalid'.
	self assert: usuario respuestasValidas size equals: 1
]
