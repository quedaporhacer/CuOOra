Class {
	#name : #HomeComponent,
	#superclass : #MainComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #adding }
HomeComponent >> addQuestion [
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
		level: 2;
		with: 'Ultimas Preguntas'.
	aCanvas anchor
		callback: [ self addQuestion ];
		with: '+ hacer una pregunta'.
	aCanvas break.
	aCanvas break.
	self session usuario preguntasPrincipales 
		do: [ :each | self renderQuestionOn: aCanvas aQuestion: each ]
]
