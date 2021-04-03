Class {
	#name : #Respuesta,
	#superclass : #Descripcion,
	#category : #'Objetos2-CuOOra'
}

{ #category : #'as yet unclassified' }
Respuesta >> calcularPuntaje [
	^ super calcularPuntaje + 20
]
