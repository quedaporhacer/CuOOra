Class {
	#name : #MainComponent,
	#superclass : #WAComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #'instance creation' }
MainComponent class >> newConPregunta: unaPregunta [
	^ self new initializeCon: unaPregunta
]

{ #category : #initialization }
MainComponent >> initializeCon: unaPregunta [
	pregunta := unaPregunta .
]

{ #category : #callback }
MainComponent >> logOut [
	self call: LoginComponent new.
]

{ #category : #accessing }
MainComponent >> model [
	^ CuOOra soleInstance
	

]

{ #category : #callback }
MainComponent >> profileRedirect: unUsuario [ 
	self call: (ProfileComponent newConUsuario: unUsuario )
]

{ #category : #callback }
MainComponent >> questionAndAnswerRedirect: unaPregunta [
	self
		call:
			(QuestionAndAnswerComponent
				newConPregunta: unaPregunta)
]

{ #category : #rendering }
MainComponent >> renderAnchorScorePostOn: aCanvas De: unPosteo [
	aCanvas anchor
		callback: [ self setScore:   unPosteo value: true ];
		with: 'like'.
	aCanvas text: ' |  '.
	aCanvas anchor
		callback: [ self setScore:   unPosteo value: false ];
		with: 'dislike'
]

{ #category : #rendering }
MainComponent >> renderAnswaersQuestionOn: aCanvas De: unaPregunta [
	aCanvas text: ' | '.
	aCanvas text: unaPregunta respuestas size.
	aCanvas text: ' respuestas'
]

{ #category : #rendering }
MainComponent >> renderAuthorPostOn: aCanvas De: unPost [ 
	aCanvas text: 'Realizada por '.
	aCanvas
		strong: [ aCanvas anchor
				callback: [ self profileRedirect: (self model autorDe: unPost) ];
				with: (self model autorDe: unPost) nombre ]
]

{ #category : #rendering }
MainComponent >> renderContentOn: aCanvas [
	self renderHedaerOn: aCanvas
]

{ #category : #rendering }
MainComponent >> renderHedaerOn: aCanvas [
	aCanvas heading: 'CuOOra '.
	aCanvas text: self session usuario nombre.
	aCanvas space.
	aCanvas anchor
		callback: [ self logOut ];
		with: 'logout'.
	aCanvas space.
	aCanvas anchor
		callback: [ self answer ];
		with: 'back'.
	aCanvas horizontalRule
]

{ #category : #rendering }
MainComponent >> renderQuestionOn: aCanvas aQuestion: unaPregunta [
	aCanvas
		div: [ self renderTitleQuestionOn: aCanvas De: unaPregunta.
			aCanvas break.
			self renderTopicQuestionOn: aCanvas De: unaPregunta.
			aCanvas break.
			self renderAuthorPostOn: aCanvas De: unaPregunta.
			self renderAnswaersQuestionOn: aCanvas De: unaPregunta.
			aCanvas break.
			self renderScorePostOn: aCanvas De: unaPregunta.
			aCanvas break.
			self renderAnchorScorePostOn: aCanvas De: unaPregunta.
			aCanvas horizontalRule ]
]

{ #category : #rendering }
MainComponent >> renderScorePostOn: aCanvas De: unPosteo [
	aCanvas text: 'like '.
	aCanvas text: unPosteo like.
	aCanvas text: ' | dislike '.
	aCanvas text: unPosteo dislike
]

{ #category : #rendering }
MainComponent >> renderTitleQuestionOn: aCanvas De: unaPregunta [
	aCanvas 
	 big: [ aCanvas anchor
						callback: [ self questionAndAnswerRedirect: unaPregunta ];
						with: unaPregunta titulo ]. 
]

{ #category : #rendering }
MainComponent >> renderTopicQuestionOn: aCanvas De: unaPregunta [
	aCanvas
				small: [ aCanvas text: 'topicos: '.
					(self model topicosDe: unaPregunta)
						do: [ :topico | 
							aCanvas text: topico nombre.
							aCanvas space ] ].	
]

{ #category : #callback }
MainComponent >> setScore: unaPregunta value: aBoolean [.
	unaPregunta agregarLikeConEstado: aBoolean conAutor: self session usuario
]
