Class {
	#name : #RegisterComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #rendering }
RegisterComponent >> registerAndLogin [
	
	self proceedWith: (self model agregarUsuarioConNombre: nombre conContraseña: contraseña  )
]

{ #category : #rendering }
RegisterComponent >> renderButtonsOn: aCanvas [
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
RegisterComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas 
]

{ #category : #rendering }
RegisterComponent >> renderInputElementsOn: aCanvas [
	super renderInputElementsOn: aCanvas
]

{ #category : #rendering }
RegisterComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerAndLogin ];
		with: 'Register'
]
