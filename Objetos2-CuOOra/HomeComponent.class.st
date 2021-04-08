Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-ui'
}

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra '.
	aCanvas text: self session usuario nombre.
	aCanvas horizontalRule.
	self renderQuestiosnOn: aCanvas .

]

{ #category : #rendering }
HomeComponent >> renderQuestiosnOn: aCanvas [
	self session usuario preguntasRelevantes 
		do: [ :each | 
			aCanvas
				div: [ aCanvas paragraph: each titulo.
					aCanvas paragraph: each descripcion ] ]
]
