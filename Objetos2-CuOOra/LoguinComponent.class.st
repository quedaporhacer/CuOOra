Class {
	#name : #LoguinComponent,
	#superclass : #WAComponent,
	#instVars : [
		'usuario',
		'nombre',
		'contraseña'
	],
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #initialization }
LoguinComponent >> initialize [ 
	super initialize.
	
]

{ #category : #rendering }
LoguinComponent >> renderContentOn: aCanvas [
	aCanvas
		form: [ aCanvas
				paragraph: [ aCanvas textInput
						callback: [  ];
						placeholder: 'nombre' ].
					aCanvas
		paragraph: [ aCanvas textInput
				callback: [  ];
				placeholder: 'contraseña' ].
			aCanvas
		paragraph: [ aCanvas button
				callback: [  ];
				with: 'aceptar' ] ].
	
	
]
