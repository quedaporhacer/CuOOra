Class {
	#name : #CreateQuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos'
	],
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #rendering }
CreateQuestionComponent >> addQuestion [
	self session usuario
		agregarPreguntaConTitulo: titulo
		conDescripcion: descripcion
		conTopicos: topicos.
]

{ #category : #accessing }
CreateQuestionComponent >> descripcion [
	^descripcion 
]

{ #category : #accessing }
CreateQuestionComponent >> descripcion: unaDescripcion [
	descripcion := descripcion
]

{ #category : #rendering }
CreateQuestionComponent >> renderContentOn: aCanvas [
	self renderHedaerOn: aCanvas.
	self renderFormOn: aCanvas.
	
]

{ #category : #rendering }
CreateQuestionComponent >> renderFormOn: aCanvas [
	aCanvas big: 'Nueva Pregunta'.
	aCanvas horizontalRule.
	aCanvas
		form: [ aCanvas
				paragraph: [ aCanvas text: 'titulo'.
					aCanvas textInput on: #titulo of: self ].
			aCanvas
				paragraph: [ aCanvas text: 'descripcion'.
					aCanvas textInput on: #descripcion of: self ].
			aCanvas
				paragraph: [ aCanvas text: 'topicos'.
					aCanvas textInput on: #topicos of: self ].
				" findBetweenSubstrings: ','"
			aCanvas submitButton
				callback: [ self addQuestion ];
				with: 'aceptar'.
			aCanvas space.
			aCanvas button
				callback: [  ];
				with: 'cancelar' ]
]

{ #category : #rendering }
CreateQuestionComponent >> renderHedaerOn: aCanvas [
	aCanvas heading: 'CuOOra '.
	aCanvas text: self session usuario nombre.
	aCanvas space.
	aCanvas anchor
		callback: [ self answer ];
		with: 'logout'.
	aCanvas horizontalRule
]

{ #category : #accessing }
CreateQuestionComponent >> titulo [
	^titulo 
]

{ #category : #accessing }
CreateQuestionComponent >> titulo: unTitulo [
	titulo := unTitulo 
]

{ #category : #accessing }
CreateQuestionComponent >> topicos [
		^topicos 
]

{ #category : #accessing }
CreateQuestionComponent >> topicos: unosTopicos [
	topicos addAll: unosTopicos 
]
