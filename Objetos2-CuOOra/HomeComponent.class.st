Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Bienvenido ' , self session usuario nombre.
	aCanvas horizontalRule
]
