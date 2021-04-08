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
AnswerQuestionComponent >> descripcion^descripcion [ 
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
		form: [ aCanvas textInput on: #descripcion of: self.
			aCanvas submitButton
				callback: [ self addAnswer ];
				with: 'aceptar' ].
	aCanvas button with: 'cancelar'
]
