Class {
	#name : #ProfileComponent,
	#superclass : #QuestionComponent,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #'instance creation' }
ProfileComponent class >> newConUsuario: unUsuario [
^self new intializeConUsuario: unUsuario 
]

{ #category : #callbacks }
ProfileComponent >> follow [
	self session usuario agregarFollower: usuario.
]

{ #category : #initialization }
ProfileComponent >> intializeConUsuario: unUsuario [ 
usuario := unUsuario 
]

{ #category : #rendering }
ProfileComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self renderTitleOn: aCanvas .
	self renderQuestiosnOn: aCanvas  		
]

{ #category : #rendering }
ProfileComponent >> renderQuestiosnOn: aCanvas [
	 usuario preguntas
		do: [ :each | self renderQuestionOn: aCanvas aQuestion: each ]
]

{ #category : #rendering }
ProfileComponent >> renderTitleOn: aCanvas [
	self session usuario == usuario
		ifTrue: [ aCanvas heading: [ aCanvas span: 'Tus preguntas' ] ]
		ifFalse: [ aCanvas
				heading: [ aCanvas span: 'Preguntas de '.
					aCanvas span: usuario nombre.
					aCanvas space.
					aCanvas
						small: [ aCanvas anchor
								callback: [ self follow ];
								with: 'follow' ] ] ]
]
