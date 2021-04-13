Class {
	#name : #CreateQuestionComponent,
	#superclass : #HeaderComponent,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos'
	],
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #rendering }
CreateQuestionComponent >> addQuestion [
	| colTopicos |
	colTopicos := topicos findBetweenSubstrings: ','.
	(colTopicos
		allSatisfy: [ :nombreTopico | (self model existeTopico: nombreTopico) notNil ])
		ifTrue: [ self session usuario
				agregarPreguntaConTitulo: titulo
				conDescripcion: descripcion
				conTopicos:
					(colTopicos
						collect: [ :nombreTopico | self model existeTopico: nombreTopico ]) ]
]

{ #category : #accessing }
CreateQuestionComponent >> descripcion [
	^descripcion 
]

{ #category : #accessing }
CreateQuestionComponent >> descripcion: unaDescripcion [
	descripcion := unaDescripcion 
]

{ #category : #accessing }
CreateQuestionComponent >> model [ 
^CuOOra soleInstance 
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
					aCanvas textArea on: #descripcion of: self ].
			aCanvas
				paragraph: [ aCanvas text: 'topicos'.
					aCanvas textInput on: #topicos of: self ].
			aCanvas submitButton
				callback: [ self addQuestion ];
				with: 'aceptar'.
			aCanvas space.
			aCanvas button
				callback: [ self answer  ];
				with: 'cancelar' ]
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
CreateQuestionComponent >> topicos: unTopico [ 
	topicos := unTopico.
]
