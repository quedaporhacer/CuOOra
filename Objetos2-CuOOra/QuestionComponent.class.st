Class {
	#name : #QuestionComponent,
	#superclass : #HeaderComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #accessing }
QuestionComponent >> model [
	^ CuOOra soleInstance
	

]

{ #category : #callback }
QuestionComponent >> questionAndAnswerRedirect: unaPregunta [
	self
		call:
			(QuestionAndAnswerComponent
				newConPregunta: unaPregunta)
]

{ #category : #rendering }
QuestionComponent >> renderAnchorScorePostOn: aCanvas De: unPosteo [
	aCanvas anchor
		callback: [ self setScore: unPosteo value: true ];
		with: 'like'.
	aCanvas text: ' |  '.
	aCanvas anchor
		callback: [ self setScore: unPosteo value: false ];
		with: 'dislike'
]

{ #category : #rendering }
QuestionComponent >> renderAnswaersQuestionOn: aCanvas De: unaPregunta [
	aCanvas text: ' | '.
	aCanvas text: unaPregunta respuestas size.
	aCanvas text: ' respuestas'
]

{ #category : #rendering }
QuestionComponent >> renderAuthorPostOn: aCanvas De: unPost [ 
	aCanvas text: 'Realizada por '.
	aCanvas
		strong: [ aCanvas anchor
				callback: [ self profileRedirect: (self model autorDe: unPost) ];
				with: (self model autorDe: unPost) nombre ]
]

{ #category : #rendering }
QuestionComponent >> renderQuestionOn: aCanvas aQuestion: unaPregunta [
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
QuestionComponent >> renderScorePostOn: aCanvas De: unPosteo [
	aCanvas text: 'like '.
	aCanvas text: unPosteo like.
	aCanvas text: ' | dislike '.
	aCanvas text: unPosteo dislike
]

{ #category : #rendering }
QuestionComponent >> renderTitleQuestionOn: aCanvas De: unaPregunta [
	aCanvas 
	 big: [ aCanvas anchor
						callback: [ self questionAndAnswerRedirect: unaPregunta ];
						with: unaPregunta titulo ]. 
]

{ #category : #rendering }
QuestionComponent >> renderTopicQuestionOn: aCanvas De: unaPregunta [
	aCanvas
		small: [ aCanvas text: 'topicos: '.
			(self model topicosDe: unaPregunta)
				do: [ :topico | 
					aCanvas text: topico nombre.
					aCanvas space.
					aCanvas space  ] ]
]

{ #category : #callback }
QuestionComponent >> setScore: unaPregunta value: aBoolean [.
	unaPregunta agregarLikeConEstado: aBoolean conAutor: self session usuario
]
