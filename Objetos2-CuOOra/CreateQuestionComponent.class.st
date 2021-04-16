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

{ #category : #accessing }
CreateQuestionComponent >> descripcion [
	^descripcion 
]

{ #category : #accessing }
CreateQuestionComponent >> descripcion: unaDescripcion [
	descripcion := unaDescripcion 
]

{ #category : #callback }
CreateQuestionComponent >> newQuestionRedirect [
	| colTopicos |
	colTopicos := topicos findBetweenSubstrings: ','.
	(colTopicos
		allSatisfy: [ :nombreTopico | (self model existeTopico: nombreTopico) notNil ])
		ifTrue: [ self session usuario
				agregarPreguntaConTitulo: titulo
				conDescripcion: descripcion
				conTopicos:
					(colTopicos
						collect: [ :nombreTopico | self model existeTopico: nombreTopico ]) ].
					self answer.
]

{ #category : #rendering }
CreateQuestionComponent >> renderContentOn: aCanvas [
	self renderHedaerOn: aCanvas.
	self renderFormOn: aCanvas.
	
]

{ #category : #rendering }
CreateQuestionComponent >> renderFormOn: aCanvas [
	aCanvas heading
		level: 1;
		with: 'Nueva Preguntas'.
	aCanvas horizontalRule.
	aCanvas
		form: [ aCanvas
				paragraph: [ aCanvas text: 'Titulo'.
					aCanvas break.
					aCanvas textInput
						on: #titulo of: self;
						style: 'width: 250px';
						placeholder: 'Escriba aqui el titulo de su pregunta' ].
			aCanvas
				paragraph: [ aCanvas text: 'Descripcion'.
					aCanvas break.
					aCanvas textArea
						on: #descripcion of: self;
						style: 'width: 250px; height: 200px';
						placeholder: 'Escriba aqui el desarollo de su pregunta' ].
			aCanvas
				paragraph: [ aCanvas text: 'Topicos'.
					aCanvas break.
					aCanvas textInput
						on: #topicos of: self;
						style: 'width: 250px;';
						placeholder: 'ingrese topicos separados por coma' ].
			aCanvas submitButton
				callback: [ self newQuestionRedirect ];
				with: 'aceptar'.
			aCanvas space.
			aCanvas button
				callback: [ self answer ];
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
