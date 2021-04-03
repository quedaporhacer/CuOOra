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
