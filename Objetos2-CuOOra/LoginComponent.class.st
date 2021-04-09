"
| application |
application := WAAdmin register: LoginComponent asApplicationAt: 'login'.
application sessionClass: SessionWithUser.
"
Class {
	#name : #LoginComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #'private protocol' }
LoginComponent >> login [
	(self model usuarioConNombre: nombre conContraseña: contraseña)
		ifNotNil: [ :it | self proceedWith: it ].
	nombre := nil.
	contraseña := nil
]

{ #category : #rendering }
LoginComponent >> registerNewUser [
	self call: RegisterComponent new
]

{ #category : #rendering }
LoginComponent >> renderButtonsOn: aCanvas [
	self renderSignInButtonOn: aCanvas.	"iniciar sesion"
	aCanvas horizontalRule.
	aCanvas paragraph: '¿No tenes cuenta?'.
	self renderSignUpButtonOn: aCanvas	"Crear cuenta"
]

{ #category : #rendering }
LoginComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self login ];
		with: 'Sign In'
]

{ #category : #rendering }
LoginComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerNewUser ];
		with: 'Sign Up'
]
