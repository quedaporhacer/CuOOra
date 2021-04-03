Class {
	#name : #Respuesta,
	#superclass : #Descripcion,
	#category : #'Objetos2-CuOOra-model'
}

{ #category : #'as yet unclassified' }
Respuesta >> calcularPuntaje [
	^ super calcularPuntaje + 20
]
