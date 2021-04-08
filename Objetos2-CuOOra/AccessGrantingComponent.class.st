Class {
	#name : #AccessGrantingComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombre',
		'contraseña'
	],
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #accessing }
AccessGrantingComponent >> contraseña [
^contraseña 
]

{ #category : #accessing }
AccessGrantingComponent >> contraseña: unaContraseña [. 
	contraseña:= unaContraseña 
]

{ #category : #accessing }
AccessGrantingComponent >> model [ 
	^ CuOOra soleInstance
]

{ #category : #accessing }
AccessGrantingComponent >> nombre [
 ^nombre 
]

{ #category : #accessing }
AccessGrantingComponent >> nombre: unNombre [
	nombre:= unNombre 
]

{ #category : #private }
AccessGrantingComponent >> proceedWith: unUsuario [
	self session usuario: unUsuario.
	self call: HomeComponent new
]

{ #category : #rendering }
AccessGrantingComponent >> renderButtonsOn: aCanvas [
	self subclassResponsibility 
]

{ #category : #rendering }
AccessGrantingComponent >> renderContentOn: aCanvas [
	aCanvas
		form: [ 
			self renderInputElementsOn: aCanvas.
			self renderButtonsOn: aCanvas 
			]
]

{ #category : #rendering }
AccessGrantingComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Nombre'.
	aCanvas paragraph: [ aCanvas textInput on: #nombre of: self ].
	aCanvas label: 'Contraseña'.
	aCanvas paragraph: [ aCanvas passwordInput on: #contraseña of: self ]
]
