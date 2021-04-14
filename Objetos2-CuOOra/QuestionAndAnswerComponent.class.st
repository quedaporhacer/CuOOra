Class {
	#name : #QuestionAndAnswerComponent,
	#superclass : #QuestionConstructorComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #'as yet unclassified' }
QuestionAndAnswerComponent >> answerQuestionRedirect [
	self call: (AnswerQuestionComponent newConPregunta: pregunta).
]

{ #category : #rendering }
QuestionAndAnswerComponent >> renderAnchorOn: aCanvas [
	aCanvas anchor
		callback: [ self answerQuestionRedirect  ];
		with: '+ agregar una respuesta'
]

{ #category : #rendering }
QuestionAndAnswerComponent >> renderAnswerOn: aCanvas [
	pregunta respuestas
		do: [ :res | 
			aCanvas big: [ self renderAuthorPostOn: aCanvas De: res.  ].
			
			aCanvas break.
			aCanvas text: res descripcion.
			aCanvas break.
			self renderScorePostOn: aCanvas De: res.
			aCanvas break.
			self renderAnchorScorePostOn: aCanvas De: res.
			aCanvas horizontalRule ].
	aCanvas text: 'No hay mas respuestas'
]

{ #category : #rendering }
QuestionAndAnswerComponent >> renderButtonOn: aCanvas [
	aCanvas anchor
	callback: [  ];
	with: '+ agregar una respuesta'.
]

{ #category : #rendering }
QuestionAndAnswerComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self renderQuestionOn: aCanvas aQuestion: pregunta.
	self renderAnswerOn: aCanvas.
	aCanvas break.
	self renderAnchorOn: aCanvas
]
