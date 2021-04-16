Class {
	#name : #PosteoTest,
	#superclass : #TestCase,
	#instVars : [
		'descripcion'
	],
	#category : #'Objetos2-CuOOra-test'
}

{ #category : #running }
PosteoTest >> setUp [
	descripcion:= Posteo  newConDescripcion: 'descripcion'
]

{ #category : #tests }
PosteoTest >> testAgregarPuntajeConEstadoconAutor [
	| user user2 |
	user := Usuario newConNombre: 'juan' conContraseña: 'perez'.
	self assert: descripcion puntaje size equals: 0.
	descripcion agregarPuntajeConEstado: true conAutor: user.
	self assert: descripcion puntaje size equals: 1.
	descripcion agregarPuntajeConEstado: false conAutor: user.
	self assert: descripcion puntaje size equals: 1.
	user2 := Usuario newConNombre: 'martin' conContraseña: 'diaz'.
	descripcion agregarPuntajeConEstado: true conAutor: user2.
	self assert: descripcion puntaje size equals: 2
]

{ #category : #tests }
PosteoTest >> testCalcularPuntaje [
	| usuario |
	self assert: descripcion calcularPuntaje equals: 20.
	usuario := Usuario newConNombre: 'juan' conContraseña: '123'.
	descripcion agregarPuntajeConEstado: true conAutor: usuario.
	self assert: descripcion calcularPuntaje equals: 21.
	descripcion agregarPuntajeConEstado: false conAutor: usuario.
	self assert: descripcion calcularPuntaje equals: 19.
	descripcion
		agregarPuntajeConEstado: true
		conAutor: (Usuario newConNombre: 'ignacio' conContraseña: '123').
	self assert: descripcion calcularPuntaje equals: 20
]

{ #category : #tests }
PosteoTest >> testPuntajeDe [
	| user like|
	user := Usuario newConNombre: 'juan' conContraseña: 'perez'.
	self assert: (descripcion puntajeDe: user) equals: nil.
	like:= descripcion agregarPuntajeConEstado: true conAutor: user.
	self
		assert: (descripcion puntajeDe: user)
		equals: like
]
