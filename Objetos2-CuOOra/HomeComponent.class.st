Class {
	#name : #HomeComponent,
	#superclass : #QuestionConstructorComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #adding }
HomeComponent >> newQuestionRedirect [
	self call: CreateQuestionComponent new.
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self renderQuestiosnOn: aCanvas
]

{ #category : #rendering }
HomeComponent >> renderQuestiosnOn: aCanvas [
	aCanvas heading
		level: 1;
		with: 'Ultimas Preguntas'.
	aCanvas anchor
		callback: [ self newQuestionRedirect ];
		with: '+ hacer una pregunta'.
	aCanvas break.
	aCanvas break.
	self session usuario preguntasPrincipales
		do: [ :each | self renderQuestionOn: aCanvas aQuestion: each ]
]
