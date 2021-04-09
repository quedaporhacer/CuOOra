Class {
	#name : #AnswerQuestionComponent,
	#superclass : #MainComponent,
	#instVars : [
		'descripcion'
	],
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #rendering }
AnswerQuestionComponent >> addAnswer [
	self session usuario
		agregarRespuestaDe: pregunta
		conDescripcion: descripcion.
	self answer.
]

{ #category : #accessing }
AnswerQuestionComponent >> descripcion: unaDescripcion [
	descripcion := unaDescripcion  
]

{ #category : #rendering }
AnswerQuestionComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self renderQuestionOn: aCanvas aQuestion: pregunta.
	self renderInputOn: aCanvas.
]

{ #category : #rendering }
AnswerQuestionComponent >> renderInputOn: aCanvas [
	aCanvas text: 'RESPONDER'.
	aCanvas
		form: [ aCanvas textArea on: #descripcion of: self.
			aCanvas break.
			aCanvas submitButton
				callback: [ self addAnswer ];
				with: 'aceptar'.
			aCanvas space.
			aCanvas button
				callback: [ self answer ];
				with: 'cancelar' ]
]
