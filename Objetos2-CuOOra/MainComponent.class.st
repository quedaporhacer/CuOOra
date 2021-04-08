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

{ #category : #accessing }
MainComponent >> model [
	^ CuOOra soleInstance
	

]

{ #category : #'as yet unclassified' }
MainComponent >> questionAndAnswerRedirect: unaPregunta [
	self
		call:
			(QuestionAndAnswerComponent
				newConPregunta: unaPregunta)
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
		callback: [ self answer ];
		with: 'logout'.
	aCanvas horizontalRule.
]

{ #category : #rendering }
MainComponent >> renderQuestionOn: aCanvas aQuestion: unaPregunta [
	aCanvas
		div: [ aCanvas
				big: [ aCanvas anchor
						callback: [ self questionAndAnswerRedirect: unaPregunta ];
						with: unaPregunta titulo ].
			aCanvas break.
			aCanvas
				small: [ aCanvas text: 'topicos: '.
					(self model topicosDe: unaPregunta)
						do: [ :topico | 
							aCanvas text: topico nombre.
							aCanvas space ] ].	"topicos"
			aCanvas
				paragraph: [ aCanvas text: 'Realizada por '.
					aCanvas strong: (self model autorDe: unaPregunta) nombre.
					aCanvas text: ' | '.
					aCanvas text: unaPregunta respuestas size.
					aCanvas text: ' respuestas' ].
			aCanvas
				paragraph: [ aCanvas text: 'like '.
					aCanvas text: unaPregunta like.
					aCanvas text: ' | dislike '.
					aCanvas text: unaPregunta dislike ].
			aCanvas
				paragraph: [ aCanvas anchor
						callback: [ self setLike: unaPregunta ];
						with: 'like'.
					aCanvas text: ' |  '.
					aCanvas anchor
						callback: [ self setDislike: unaPregunta ];
						with: 'dislike' ].
			aCanvas horizontalRule ]
]

{ #category : #initialization }
MainComponent >> setDislike: unaPregunta [
	unaPregunta agregarLikeConEstado: false conAutor: self session usuario
]

{ #category : #initialization }
MainComponent >> setLike: unaPregunta [
	unaPregunta agregarLikeConEstado: true conAutor: self session usuario.
]
