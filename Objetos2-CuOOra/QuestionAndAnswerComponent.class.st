Class {
	#name : #QuestionAndAnswerComponent,
	#superclass : #MainComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #'as yet unclassified' }
QuestionAndAnswerComponent >> answerQuestionComponent [
	self call: (AnswerQuestionComponent newConPregunta: pregunta).
]

{ #category : #rendering }
QuestionAndAnswerComponent >> renderAnswerOn: aCanvas [
	pregunta respuestas do: [ :res | aCanvas text:  res descripcion.
		aCanvas break.  ]
]

{ #category : #rendering }
QuestionAndAnswerComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self renderQuestionOn: aCanvas aQuestion: pregunta.
	self renderAnswerOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas paragraph: 'No hay mas respuestas'.
	aCanvas anchor
		callback: [ self answerQuestionComponent ];
		with: '+ agregar una respuesta'
]
