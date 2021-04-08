Class {
	#name : #HomeComponent,
	#superclass : #MainComponent,
	#category : #'Objetos2-CuOOra-ui'
}

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
	aCanvas
		anchor: [ aCanvas button
				callback: [  ];
				with: 'hacer una pregunta' ].
	aCanvas break.
	aCanvas break.
	
	self session usuario preguntas
		do: [ :each | self renderQuestionOn: aCanvas aQuestion: each ]
]
