Class {
	#name : #LoginComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #'private protocol' }
LoginComponent >> login [
	(self model userWithEmail: nombre protectedBy: contraseña )
		ifNotNil: [ :it | self proceedWith: it ].
	nombre := nil.
	contraseña := nil
]

{ #category : #rendering }
LoginComponent >> registerNewUser [
	self call: MainRegisterComponent new
]

{ #category : #rendering }
LoginComponent >> renderButtonsOn: aCanvas [
	self renderSignInButtonOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas paragraph: 'Don''t have an account?'.
	self renderSignUpButtonOn: aCanvas
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
		with: 'Sign Up, it''s free'
]
