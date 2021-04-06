Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-CuOOraTest'
}

{ #category : #running }
PreguntaTest >> setUp [ 
	pregunta := Pregunta newConTitulo: '?' conDescripcion: 'principal' 
]

{ #category : #tests }
PreguntaTest >> testCalcularPuntaje [
	self assert: pregunta calcularPuntaje equals: 50.
	pregunta
		agregarLikeConEstado: true
		conAutor: (Usuario newConNombre: 'juan' conContraseña: '123').
	self assert: pregunta calcularPuntaje equals: 51.
	pregunta
		agregarLikeConEstado: false
		conAutor: (Usuario newConNombre: 'ignacio' conContraseña: '123').
	self assert: pregunta calcularPuntaje equals: 50
]

{ #category : #tests }
PreguntaTest >> testRespuestas [ 
		| r1 r2 r3 |
	self assert: pregunta respuestas size equals: 0.
	r1 := (Usuario newConNombre: 'juan' conContraseña: '123')
		agregarRespuestaDe: pregunta
		conDescripcion: 'r1'.
	r2 := (Usuario newConNombre: 'juan' conContraseña: '123')
		agregarRespuestaDe: pregunta
		conDescripcion: 'r2'.
	r3 := (Usuario newConNombre: 'juan' conContraseña: '123')
		agregarRespuestaDe: pregunta
		conDescripcion: 'r3'.
	self assert: pregunta respuestas size equals: 3.
	r1 agregarLikeConEstado: true conAutor: nil.
	r3 agregarLikeConEstado: false conAutor: nil.
	self assert: pregunta respuestas first equals: r1.
	self assert: pregunta respuestas last equals: r3.
	r2
		agregarLikeConEstado: true conAutor: nil;
		agregarLikeConEstado: true conAutor: nil.
	self assert: pregunta respuestas first equals: r2.
	self assert: pregunta respuestas last equals: r3
]
