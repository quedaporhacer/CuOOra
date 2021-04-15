Class {
	#name : #HeaderComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #'as yet unclassified' }
HeaderComponent >> homeRedirect [
	self call: HomeComponent new.
]

{ #category : #callback }
HeaderComponent >> logOut [
	self session unregister.
	self requestContext redirectTo: self application  url
]

{ #category : #accessing }
HeaderComponent >> model [ 
^CuOOra soleInstance 
]

{ #category : #callback }
HeaderComponent >> profileRedirect: unUsuario [ 
	self call: (ProfileComponent newConUsuario: unUsuario )
]

{ #category : #rendering }
HeaderComponent >> renderContentOn: aCanvas [
	self renderHedaerOn: aCanvas
]

{ #category : #rendering }
HeaderComponent >> renderHedaerOn: aCanvas [
	aCanvas heading: [
		aCanvas anchor 
		callback: [ self homeRedirect ];
		with: 'CuOOra '.].
	aCanvas div
		style: 'float: right';
		with: [ aCanvas anchor
				callback: [ self profileRedirect: self session usuario ];
				with: self session usuario nombre.
			aCanvas space.
			aCanvas anchor
				callback: [ self logOut ];
				with: 'logout'.
			aCanvas space ].
	aCanvas break.
	aCanvas horizontalRule
]
