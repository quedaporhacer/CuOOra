Class {
	#name : #DescripcionTest,
	#superclass : #TestCase,
	#instVars : [
		'descripcion'
	],
	#category : #'Objetos2-CuOOraTest'
}

{ #category : #running }
DescripcionTest >> setUp [
	descripcion:= Descripcion  newConDescripcion: 'descripcion'
]

{ #category : #tests }
DescripcionTest >> testAgregarLikeConEstadoconAutor [
	| user user2 |
	user := Usuario newConNombre: 'juan' conContraseña: 'perez'.
	self assert: descripcion puntaje size equals: 0.
	
	descripcion agregarLikeConEstado: true conAutor: user.
	self assert: descripcion puntaje size equals: 1.
	
	descripcion agregarLikeConEstado: false conAutor: user.
	self assert: descripcion puntaje size equals: 1.
	
	user2 := Usuario newConNombre: 'martin' conContraseña: 'diaz'.
	descripcion agregarLikeConEstado: true conAutor: user2.
	self assert: descripcion puntaje size equals: 2.
	
]

{ #category : #tests }
DescripcionTest >> testCalcularPuntaje [
	| usuario |
	self assert: descripcion calcularPuntaje equals: 0.
	usuario := Usuario newConNombre: 'juan' conContraseña: '123'.
	descripcion agregarLikeConEstado: true conAutor: usuario.
	self assert: descripcion calcularPuntaje equals: 1.
	descripcion agregarLikeConEstado: false conAutor: usuario.
	self assert: descripcion calcularPuntaje equals: -1.
	descripcion agregarLikeConEstado: true conAutor: (Usuario newConNombre: 'ignacio' conContraseña: '123' ).
	self assert: descripcion calcularPuntaje equals: 0.
]

{ #category : #tests }
DescripcionTest >> testGetLikeDe [
	| user |
	user := Usuario newConNombre: 'juan' conContraseña: 'perez'.
	self assert: (descripcion getLikeDe: user) equals: nil.
	descripcion agregarLikeConEstado: true conAutor: user.
	self
		assert: (descripcion getLikeDe: user)
		equals: descripcion puntaje first.

]
