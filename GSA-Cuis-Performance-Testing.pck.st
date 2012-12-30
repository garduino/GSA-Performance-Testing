'From Cuis 4.1 of 12 December 2012 [latest update: #1524] on 30 December 2012 at 7:01:46 pm'!
'Description Please enter a description for this package '!
!classDefinition: #SampleSystem category: #'GSA-Cuis-Performance-Testing'!
Object subclass: #SampleSystem
	instanceVariableNames: 'cities addresses clients'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GSA-Cuis-Performance-Testing'!
!classDefinition: 'SampleSystem class' category: #'GSA-Cuis-Performance-Testing'!
SampleSystem class
	instanceVariableNames: 'instance'!

!classDefinition: #TestObject category: #'GSA-Cuis-Performance-Testing'!
Object subclass: #TestObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GSA-Cuis-Performance-Testing'!
!classDefinition: 'TestObject class' category: #'GSA-Cuis-Performance-Testing'!
TestObject class
	instanceVariableNames: ''!

!classDefinition: #Address category: #'GSA-Cuis-Performance-Testing'!
TestObject subclass: #Address
	instanceVariableNames: 'street number city'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GSA-Cuis-Performance-Testing'!
!classDefinition: 'Address class' category: #'GSA-Cuis-Performance-Testing'!
Address class
	instanceVariableNames: ''!

!classDefinition: #City category: #'GSA-Cuis-Performance-Testing'!
TestObject subclass: #City
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GSA-Cuis-Performance-Testing'!
!classDefinition: 'City class' category: #'GSA-Cuis-Performance-Testing'!
City class
	instanceVariableNames: ''!

!classDefinition: #Client category: #'GSA-Cuis-Performance-Testing'!
TestObject subclass: #Client
	instanceVariableNames: 'firstName lastName address'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GSA-Cuis-Performance-Testing'!
!classDefinition: 'Client class' category: #'GSA-Cuis-Performance-Testing'!
Client class
	instanceVariableNames: ''!


!SampleSystem commentStamp: 'GermanArduino 5/6/2012 17:24' prior: 0!
Ojo, en categorìa testing de la clase falta agregar este método (el que sigue) y arreglar #assignAddressToClientscreateSampleClients	"creates a set of sample clients"	| lastNames composedNames clientsToCreate created clients |	Transcript show: 'creating names';		 cr.	lastNames _ #('Gómez Deck' 'Goldberg' 'Ingalls' 'Kay' ).	composedNames _ self composedNames.	""	clientsToCreate _ composedNames size * lastNames size.	Transcript show: 'clients to create: ';		 show: clientsToCreate;		 cr.	""	clients _ self instance clients.	created _ 0.	lastNames		do: [:lastName | composedNames				do: [:composedName | 					clients						add: (Client newFirstName: composedName lastName: lastName).					""					created _ created + 1.					(created isDivisibleBy: 50000)						ifTrue: [Transcript show: 'created: ';								 show: created;								 show: ' (';																show: (100.0 * created / clientsToCreate roundTo: 0.01);								 show: '%)';								 cr]]].	Transcript show: 'done!!';		 cr			!

!Address methodsFor: 'accessing' stamp: 'dgd 5/21/2002 12:02'!
city	^city! !

!Address methodsFor: 'initialization' stamp: 'dgd 5/21/2002 11:55'!
initializeStreet: streetString number: numberString city: aCity	street _ streetString.	number _ numberString.	city _ aCity! !

!Address methodsFor: 'accessing' stamp: 'dgd 5/21/2002 12:02'!
number	^number! !

!Address methodsFor: 'printing' stamp: 'dgd 5/21/2002 11:57'!
printOn: aStream 	super printOn: aStream.	aStream nextPutAll: ' street: ';		 nextPutAll: street printString;		 nextPutAll: ' number: ';		 nextPutAll: number printString;		 nextPutAll: ' city: ';		 nextPutAll: city printString! !

!Address methodsFor: 'accessing' stamp: 'dgd 5/21/2002 12:02'!
street	^street! !

!Address class methodsFor: 'private' stamp: 'dgd 5/21/2002 11:55'!
newStreet: streetString number: numberString city: aCity 	"private - use #street:number:city:"	^ self new initializeStreet: streetString number: numberString city: aCity ! !

!Address class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 11:59'!
street: streetString number: numberString city: aCity 	"answer the instance for streetString numberString and aCity "	| instance addresses |	addresses _ self system addresses.	instance _ addresses				detect: [:each | each street = streetString and:[each number = numberString] and:[each city = aCity]]				ifNone: [addresses						add: (self newStreet: streetString number: numberString city: aCity )].	^ instance! !

!City methodsFor: 'initialization' stamp: 'dgd 5/21/2002 11:16'!
initializeName: aStringname _ aString! !

!City methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:33'!
name	^ name! !

!City methodsFor: 'printing' stamp: 'dgd 5/21/2002 11:17'!
printOn: aStream 	super printOn: aStream.	aStream nextPutAll: ' named:';		 nextPutAll: name printString! !

!City class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 11:58'!
named: aString 	"answer the instance named aString"	| instance cities |	cities _ self system cities.	instance _ cities				detect: [:each | each name = aString]				ifNone: [cities						add: (self newNamed: aString)].	^ instance! !

!City class methodsFor: 'private' stamp: 'dgd 5/21/2002 11:28'!
newNamed: aString 	"private - use #named: "	^ self new initializeName: aString! !

!Client methodsFor: 'accessing' stamp: 'dgd 5/21/2002 14:21'!
address	^address! !

!Client methodsFor: 'accessing' stamp: 'dgd 5/21/2002 14:19'!
address: anObject	address _ anObject! !

!Client methodsFor: 'accessing' stamp: 'dgd 5/21/2002 13:49'!
firstName	^firstName! !

!Client methodsFor: 'initialization' stamp: 'dgd 5/21/2002 13:38'!
initializeFirstName: firstNameString lastName: lastNameString	firstName _ firstNameString.	lastName _ lastNameString! !

!Client methodsFor: 'accessing' stamp: 'dgd 5/21/2002 13:50'!
lastName	^lastName! !

!Client methodsFor: 'printing' stamp: 'dgd 5/21/2002 13:37'!
printOn: aStream 	super printOn: aStream.	aStream nextPutAll: ' firstName:';		 nextPutAll: firstName printString;		 nextPutAll: ', lastName:';		 nextPutAll: lastName printString! !

!Client class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 13:40'!
firstName: firstNameString lastName: lastNameString 	"answer the instance named firstNameString lastNameString"	| instance cities |	cities _ self system clients.	instance _ cities				detect: [:each | each firstName = firstNameString						and: [each lastName = lastNameString]]				ifNone: [cities						add: (self newFirstName: firstNameString lastName: lastNameString)].	^ instance! !

!Client class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 12:05'!
named: aString 	"answer the instance named aString"	| instance cities |	cities _ self system clients.	instance _ cities				detect: [:each | each name = aString]				ifNone: [cities						add: (self newNamed: aString)].	^ instance! !

!Client class methodsFor: 'private' stamp: 'dgd 5/21/2002 13:39'!
newFirstName: firstNameString lastName: lastNameString 	"private - "	^ self new initializeFirstName: firstNameString lastName: lastNameString ! !

!SampleSystem methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:27'!
addresses	^addresses! !

!SampleSystem methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:22'!
cities	^cities! !

!SampleSystem methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:21'!
clients	^clients! !

!SampleSystem methodsFor: 'initialization' stamp: 'dgd 5/21/2002 11:27'!
initialize	cities _ IdentitySet new.	addresses _ IdentitySet new.	clients _ IdentitySet new! !

!SampleSystem methodsFor: 'printing' stamp: 'dgd 5/21/2002 11:27'!
printOn: aStream 	aStream nextPutAll: 'the ';		 nextPutAll: self class name;		 nextPutAll: ' cities:';		 nextPutAll: cities size printString;		 nextPutAll: ', addresses:';		 nextPutAll: addresses size printString;		 nextPutAll: ', clients:';		 nextPutAll: clients size printString! !

!SampleSystem class methodsFor: 'testing' stamp: 'dgd 5/21/2002 13:02'!
allNames	"creates a set of sample clients"	| |	^ #('Aaron' 'Abdala' 'Abdenago' 'Abdias' 'Abdiel' 'Abdon' 'Abel' 'Abelardo' 'Abigail' 'Abilio' 'Abraham' 'Abril' 'Abrilia' 'Absalon' 'Abundancia' 'Abundancio' 'Abundio' 'Acacia' 'Acacio' 'Acilino' 'Acisclo' 'Ada' 'Adalberto' 'Adalgisa' 'Adalgiso' 'Adalrico' 'Adaluz' 'Adalvino' 'Adamantina' 'Adamantino' 'Adan' 'Adauto' 'Adela' 'Adelaida' 'Adelardo' 'Adelberga' 'Adelberto' 'Adelelmo' 'Adelfo' 'Adelgario' 'Adelgiro' 'Adelgunda' 'Adelia' 'Adelina' 'Adelinda' 'Adelino' 'Adeliz' 'Adelmo' 'Adeltrudis' 'Adelvisa' 'Ademaro' 'Aderando' 'Adilia' 'Adimaro' 'Adina' 'Admeo' 'Ado' 'Adolfina' 'Adolfo' 'Adon' 'Adoracion' 'Adrian' 'Adriana' 'Adulfo' 'Afra' 'Africa' 'Africana' 'Africano' 'Africo' 'Afrodisio' 'Agabio' 'Agabo' 'Agamenon' 'Agape' 'Agapio' 'Agapito' 'Agar' 'Agata' 'Agatangelo' 'Agatocles' 'Agatoclia' 'Agatodoro' 'Agaton' 'Agaton' 'Agatopo' 'Agatónica' 'Agatónico' 'Agenor' 'Ageo' 'Agerico' 'Agesilao' 'Agia' 'Agilberto' 'Aglaia' 'Agnelo' 'Agoardo' 'Agobardo' 'Agripina' 'Agripino' 'Agrícola' 'Agueda' 'Aguinaldo' 'Agustin' 'Agustina' 'Aicardo' 'Aida' 'Aide' 'Aigulfo' 'Aimardo' 'Aimon' 'Ainara' 'Ainara' 'Ainoa' 'Aitana' 'Aitor' 'Aixa' 'Aladino' 'Alan' 'Alano' 'Alarico' 'Alarico' 'Alba' 'Albano' 'Alberico' 'Alberta' 'Albertina' 'Albertino' 'Alberto' 'Albina' 'Albino' 'Alborada' 'Alceo' 'Alcibiades' 'Alcides' 'Alciza' 'Alda' 'Aldo' 'Aldobrando' 'Aldonza' 'Alejandra' 'Alejandro' 'Alejo' 'Alex' 'Alexa' 'Alexander' 'Alexis' 'Alfardo' 'Alfiero' 'Alfonsa' 'Alfonsina' 'Alfonsino' 'Alfonso' 'Alfreda' 'Alfredo' 'Algiso' 'Alicia' 'Alina' 'Alipio' 'Alma' 'Almanzor' 'Almaquio' 'Almudena' 'Aloisio' 'Alondra' 'Alonso' 'Alvaro' 'Amable' 'Amada' 'Amadeo' 'Amadis' 'Amado' 'Amador' 'Amaia' 'Amalberga' 'Amalberto' 'Amalia' 'Amancio' 'Amanda' 'Amando' 'Amanecer' 'Amante' 'Amapola' 'Amaranta' 'Amaranto' 'Amaro' 'Amasio' 'Amaya' 'Ambrosia' 'Ambrosio' 'Amelia' 'Amelio' 'America' 'Amiano' 'Amilcar' 'Aminta' 'Amparo' 'Ampelio' 'América' 'Américo' 'Amón' 'Ana' 'Anabel' 'Anacaona' 'Anacario' 'Anacleto' 'Ananias' 'Anastasia' 'Anastasio' 'Anatolia' 'Anatolio' 'Ander' 'Andoni' 'Andrea' 'Andres' 'Angel' 'Angela' 'Angeles' 'Angelica' 'Angelina' 'Angelines' 'Angustias' 'Angélico' 'Ania' 'Anibal' 'Aniceto' 'Aniceto' 'Anselmo' 'Ansilta' 'Antonia' 'Antonieta' 'Antonino' 'Antonio' 'Apeles' 'Apolo' 'Apolonio' 'Aquiles' 'Aquilino' 'Araceli' 'Arantxa' 'Aranzazu' 'Arcadio' 'Arcadio' 'Ariadna' 'Ariel' 'Aristeo' 'Aristides' 'Armando' 'Arnaldo' 'Arnau' 'Arnoldo' 'Arsenia' 'Artemio' 'Artemisa' 'Artemisa' 'Arturo' 'Asbel' 'Ascension' 'Asdrúbal' 'Asencio' 'Asuncion' 'Atanasia' 'Atanasio' 'Augusto' 'Aura' 'Aurea' 'Aurelia' 'Aurelio' 'Aureo' 'Aurora' 'Auxiliadora' 'Avelino' 'Axel' 'Azahara' 'Azrael' 'Azucena' 'Baldomero' 'Balduino' 'Baltasar' 'Baradiles' 'Barbara' 'Bartolome' 'Basilio' 'Bautista' 'Beatriz' 'Beda' 'Begoña' 'Belen' 'Beltran' 'Benedicto' 'Benigno' 'Benigno' 'Benito' 'Benjamin' 'Beralides' 'Berenice' 'Bermudo' 'Bernabe' 'Bernarda' 'Bernardina' 'Bernardino' 'Bernardo' 'Berta' 'Bibiana' 'Bibiano' 'Bienvenido' 'Blanca' 'Blas' 'Bonifacio' 'Boris' 'Borja' 'Braulio' 'Brenda' 'Brigida' 'Brisa' 'Brunilda' 'Bruno' 'Buenaventura' 'Calixto' 'Camelia' 'Camila' 'Camilo' 'Candelaria' 'Candida' 'Candido' 'Caridad' 'Carina' 'Carla' 'Carlos' 'Carlota' 'Carmela' 'Carmelo' 'Carmen' 'Carola' 'Carolina' 'Casandra' 'Casiano' 'Casilda' 'Casimira' 'Casimiro' 'Castor' 'Catalina' 'Cayetana' 'Cayetano' 'Cecilia' 'Cecilio' 'Ceferino' 'Celedonio' 'Celestina' 'Celestino' 'Celia' 'Celina' 'Celinda' 'Celso' 'Cesar' 'Cesareo' 'Cielo' 'Cintia' 'Cipriano' 'Ciriaco' 'Cirilo' 'Ciro' 'Clara' 'Claudia' 'Claudio' 'Clemencia' 'Clemente' 'Clotilde' 'Columba' 'Columbo' 'Concepcion' 'Conrado' 'Constancio' 'Constantino' 'Constanza' 'Consuelo' 'Cora' 'Corina' 'Cornelio' 'Cosme' 'Covadonga' 'Crispin' 'Cristiliano' 'Cristina' 'Cristino' 'Cristobal' 'Cruz' 'Dagoberto' 'Dalia' 'Damaso' 'Damian' 'Dana' 'Daniel' 'Daniela' 'Dante' 'Daria' 'Dario' 'Davey' 'David' 'Debora' 'Delfina' 'Delia' 'Delmiro' 'Demetrio' 'Desamparados' 'Desideria' 'Desiderio' 'Diana' 'Diego' 'Dina' 'Dionisio' 'Dolores' 'Dominga' 'Domingo' 'Donato' 'Dora' 'Dorotea' 'Edelmira' 'Edelmiro' 'Edilberto' 'Edmundo' 'Eduardo' 'Edurne' 'Efrain' 'Efren' 'Eladio' 'Elena' 'Eleuterio' 'Elia' 'Elias' 'Elisa' 'Eloisa' 'Eloy' 'Elpidio' 'Elsa' 'Elvira' 'Emeteria' 'Emeterio' 'Emilia' 'Emiliana' 'Emiliano' 'Emilio' 'Emma' 'Emmanuel' 'Encarna' 'Encarnación' 'Enedina' 'Eneko' 'Engracia' 'Enrique' 'Enriqueta' 'Erasmo' 'Ernesto' 'Escolastica' 'Escolastico' 'Esmeralda' 'Esperanza' 'Estanislao' 'Esteban' 'Estefania' 'Estela' 'Ester' 'Esther' 'Estrella' 'Eufemia' 'Eufemio' 'Eufrasia' 'Eufrasio' 'Eugenia' 'Eugenio' 'Eulalia' 'Eulalio' 'Eulogia' 'Eulogio' 'Eusebia' 'Eusebio' 'Eustaquia' 'Eustaquio' 'Eva' 'Evaristo' 'Everardo' 'Exuperio' 'Ezequiel' 'Fabian' 'Fabio' 'Fabiola' 'Fabricio' 'Fatima' 'Faustino' 'Fausto' 'Federico' 'Fedra' 'Felicisimo' 'Felicitas' 'Felipe' 'Felisa' 'Felix' 'Fermin' 'Fernanda' 'Fernando' 'Ferran' 'Fidel' 'Filemon' 'Filiberto' 'Filomena' 'Filomeno' 'Flavio' 'Flor' 'Flora' 'Florencia' 'Florencio' 'Florentino' 'Florian' 'Florida' 'Fortunata' 'Fortunato' 'Francisca' 'Francisco' 'Froilan' 'Fuencisla' 'Fuensanta' 'Gabina' 'Gabino' 'Gabriel' 'Gabriela' 'Gaizka' 'Gala' 'Garazi' 'Gaspar' 'Geaxi' 'Gema' 'Genaro' 'Genoveva' 'Georgina' 'Gerardo' 'German' 'Gil' 'Gilberto' 'Gina' 'Gines' 'Gladis' 'Gloria' 'Goiaz' 'Gonzalo' 'Gorka' 'Gracia' 'Graciela' 'Gregorio' 'Griselda' 'Guadalupe' 'Guillem' 'Guillermina' 'Guillermo' 'Gustavo' 'Haroldo' 'Haydee' 'Hector' 'Heidi' 'Helena' 'Heli' 'Helida' 'Heriberto' 'Herman' 'Hermelando' 'Hermelinda' 'Hermenegilda' 'Herminia' 'Herminio' 'Hernan' 'Hernando' 'Heron' 'Higinia' 'Higinio' 'Hilaria' 'Hilario' 'Hilda' 'Hipolito' 'Honorato' 'Honoria' 'Honorio' 'Horacio' 'Hortensia' 'Hugo' 'Humberto' 'Ierai' 'Ignacio' 'Igor' 'Iker' 'Ildara' 'Ildefonso' 'Imanol' 'Imelda' 'Indalecia' 'Indalecio' 'Indira' 'Ines' 'Inmaculada' 'Iñaki' 'Iñigo' 'Irati' 'Irene' 'Iris' 'Irma' 'Irune' 'Isaac' 'Isabel' 'Isaias' 'Isidoro' 'Isidro' 'Ismael' 'Israel' 'Itziar' 'Ivan' 'Ivana' 'Ivonne' 'Izaskun' 'Jacinto' 'Jacobo' 'Jaime' 'Jairo' 'Jana' 'Javier' 'Jazmin' 'Jennifer' 'Jerano' 'Jeremias' 'Jeronimo' 'Jesica' 'Jesus' 'Jimena' 'Jimeno' 'Joan' 'Joaquin' 'Joaquina' 'Job' 'Jon' 'Jonas' 'Jorge' 'Josafat' 'Jose' 'Joseba' 'Josefina' 'Josep' 'Juan' 'Judas' 'Judas' 'Julia' 'Julian' 'Juliana' 'Julio' 'Justino' 'Justo' 'Juvel' 'Karina' 'Katia' 'Koldo' 'Lara' 'Laudelina' 'Laudelino' 'Laura' 'Lazaro' 'Leandro' 'Leon' 'Leonardo' 'Leoncio' 'Leonila' 'Leonor' 'Leonora' 'Leopoldo' 'Leticia' 'Liberto' 'Libia' 'Librado' 'Lidia' 'Lidon' 'Ligia' 'Lilia' 'Liliana' 'Lina' 'Linda' 'Lino' 'Lirios' 'Llanos' 'Lorena' 'Lorenza' 'Lorenzo' 'Loreto' 'Lourdes' 'Lucas' 'Lucia' 'Luciano' 'Lucila' 'Lucilo' 'Lucinio' 'Lucio' 'Lucrecia' 'Luis' 'Luisa' 'Luminosa' 'Luna' 'Luz' 'Mabel' 'Macarena' 'Magdalena' 'Maite' 'Maite' 'Malena' 'Mamerto' 'Manuel' 'Manuela' 'Mar' 'Mar¡a' 'Mara' 'Marcela' 'Marcelina' 'Marcelino' 'Marcelo' 'Marcia' 'Marcial' 'Marciano' 'Marco' 'Marcos' 'Margarita' 'Maria' 'Mariana' 'Mariano' 'Maribel' 'Mariela' 'Marina' 'Marino' 'Mario' 'Marisa' 'Marisol' 'Marta' 'Martin' 'Martina' 'Mateo' 'Matias' 'Matilde' 'Maura' 'Mauricio' 'Mauro' 'Maximiliano' 'Maximina' 'Maximino' 'Maximo' 'Melania' 'Melba' 'Melchor' 'Melisa' 'Meliton' 'Melitona' 'Mercedes' 'Mercurio' 'Micaela' 'Miguel' 'Mikel' 'Milagros' 'Milena' 'Minerva' 'Miriam' 'Modesto' 'Moises' 'Monica' 'Montiel' 'Montserrat' 'Myriam' 'Nadia' 'Narcisa' 'Narciso' 'Natacha' 'Natalia' 'Natalie' 'Natividad' 'Nazario' 'Nemesio' 'Nerea' 'Nereida' 'Nereo' 'Nestor' 'Nicanor' 'Niceto' 'Nicodemo' 'Nicolas' 'Nicomedes' 'Nidia' 'Nieves' 'Nina' 'Ninive' 'Noe' 'Noelia' 'Noemi' 'Nora' 'Norberto' 'Norma' 'Novarino' 'Nuria' 'Octavio' 'Odon' 'Ofelia' 'Olalla' 'Olegaria' 'Olegario' 'Olga' 'Olimpia' 'Oliva' 'Oliver' 'Oliverio' 'Olivia' 'Olvido' 'Omar' 'Orestes' 'Oriol' 'Orlando' 'Oscar' 'Osvaldo' 'Otilia' 'Ovidio' 'Pablo' 'Paloma' 'Pancracio' 'Pascual' 'Patricia' 'Patricio' 'Paula' 'Paulina' 'Paulino' 'Paz' 'Pedro' 'Pelayo' 'Penelope' 'Pere' 'Perfecto' 'Perpetua' 'Pia' 'Piedad' 'Pilar' 'Pio' 'Placido' 'Policarpio' 'Ponciano' 'Praxedes' 'Presentacion' 'Primitivo' 'Priscilla' 'Prudencia' 'Prudencio' 'Pura' 'Queremón' 'Querubín' 'Quintilia' 'Quintiliano' 'Quintilio' 'Quintin' 'Quiteria' 'Quiterio' 'Rafael' 'Raimundo' 'Ramiro' 'Ramon' 'Ramona' 'Raquel' 'Raul' 'Rebeca' 'Refugio' 'Regina' 'Regina' 'Regis' 'Reina' 'Reinaldo' 'Remedios' 'Remigio' 'Renata' 'Renato' 'Rene' 'Restituta' 'Restituto' 'Reyes' 'Ricardo' 'Rigoberto' 'Rita' 'Roberto' 'Rocio' 'Rodolfo' 'Rodrigo' 'Rogelio' 'Rolando' 'Rolando' 'Roman' 'Romeo' 'Romilda' 'Romildo' 'Romualdo' 'Ronaldo' 'Roque' 'Rosa' 'Rosalia' 'Rosalina' 'Rosalinda' 'Rosana' 'Rosario' 'Rosaura' 'Rosendo' 'Roser' 'Ruben' 'Ruperta' 'Ruperto' 'Rut' 'Ruth' 'Rutilio' 'Sabas' 'Sabina' 'Sabino' 'Sabrina' 'Sacramento' 'Sagrario' 'Salome' 'Salomon' 'Salvador' 'Samanta' 'Samuel' 'Sandra' 'Santiago' 'Sara' 'Saul' 'Sebastian' 'Segundo' 'Selica' 'Serafin' 'Serena' 'Sergio' 'Servando' 'Severiano' 'Sigfredo' 'Sigfrido' 'Silvano' 'Silverio' 'Silvestre' 'Silvia' 'Silvina' 'Silvio' 'Simeon' 'Simon' 'Simona' 'Sinesio' 'Siro' 'Sixto' 'Socorro' 'Sofia' 'Sol' 'Soledad' 'Sonia' 'Soraya' 'Susana' 'Tamar' 'Tamara' 'Tancredo' 'Tania' 'Tatiana' 'Telmo' 'Teodora' 'Teodoro' 'Teodosio' 'Teofila' 'Teofilo' 'Teresa' 'Timoteo' 'Tirso' 'Tito' 'Tito' 'Tomas' 'Torcuato' 'Toribio' 'Trinidad' 'Tulia' 'Tulio' 'Ubaldo' 'Ulderico' 'Ulfrido' 'Ulises' 'Ulrica' 'Ulrico' 'Unai' 'Urbana' 'Urbano' 'Urraca' 'Ursina' 'Ursino' 'Urso' 'Ursula' 'Ursulina' 'Valentin' 'Valentina' 'Valeria' 'Valeriana' 'Valeriano' 'Valerio' 'Vanesa' 'Vasco' 'Velasco' 'Venceslao' 'Ventura' 'Veronica' 'Vicente' 'Victor' 'Victoria' 'Victoriano' 'Vidal' 'Vilma' 'Violeta' 'Virgilio' 'Virginia' 'Vivian' 'Viviano' 'Walter' 'Wenceslao' 'Wilfredo' 'Xavier' 'Xaviera' 'Xenia' 'Xibe' 'Xiberu' 'Ximena' 'Ximeno' 'Yago' 'Yaiza' 'Yanina' 'Yesica' 'Ylenia' 'Yocasta' 'Yolanda' 'Zabulón' 'Zacarias' 'Zaída' 'Zebedeo' 'Zedequías' 'Zefanías' 'Zenas' 'Zenobias' 'Zenobio' 'Zita' 'Zoé' 'Zoila' 'Zoilo' 'Zoraida' 'Zósimo' 'Zótico' 'Zuberoa' 'Zulema' ).	! !

!SampleSystem class methodsFor: 'testing' stamp: 'gsa 5/6/2012 17:48'!
assignAddressToClients	| addresses clients assigned |	addresses _ SampleSystem instance addresses asArray.	clients _ SampleSystem instance clients.	assigned _ 0.	clients		do: [:client | 			client				address: (addresses at: assigned \\ addresses size + 1).			assigned _ assigned + 1.			(assigned isDivisibleBy: 50000)				ifTrue: [Transcript show: 'assigned: ';						 show: assigned;						 show: ' (';							show: (100.0 * assigned / clients size roundTo: 0.01);						 show: '%)';						 newLine]]! !

!SampleSystem class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 11:26'!
clearInstance	^ instance _ nil! !

!SampleSystem class methodsFor: 'testing' stamp: 'dgd 5/21/2002 13:35'!
composedNames	| names composedNames |	names _ self allNames.	composedNames _ OrderedCollection new.	names		combinations: 2		atATimeDo: [:each | composedNames add: each first , ' ' , each second].	^ composedNames! !

!SampleSystem class methodsFor: 'testing' stamp: 'dgd 5/21/2002 12:03'!
createSampleAddresses	"creates a set of sample addresses"	Address		street: 'Brunnenwiesstr'		number: '17'		city: (City named: 'Grüningen').	Address		street: 'Uruguay'		number: '255'		city: (City named: 'Buenos Aires').	Address		street: 'Balcarce'		number: '50'		city: (City named: 'Buenos Aires').! !

!SampleSystem class methodsFor: 'testing' stamp: 'dgd 5/21/2002 11:41'!
createSampleCities	"creates a set of sample cities"	City named: 'Buenos Aires'.	City named: 'Córdoba'.	City named: 'La Plata'.	City named: 'Santiago del Estero'.	City named: 'Mendoza'.	City named: 'La Plata'.	City named: 'Montevideo'.	City named: 'Zürich'.	City named: 'Grüningen'.	City named: 'New York'.	City named: 'Berlin'.! !

!SampleSystem class methodsFor: 'testing' stamp: 'gsa 5/6/2012 17:47'!
createSampleClients
	"creates a set of sample clients"
	| lastNames composedNames clientsToCreate created clients |
	Transcript show: 'creating names';
		 newLine.
	lastNames _ #('Gómez Deck' 'Goldberg' 'Ingalls' 'Kay' ).
	composedNames _ self composedNames.
	""
	clientsToCreate _ composedNames size * lastNames size.
	Transcript show: 'clients to create: ';
		 show: clientsToCreate;
		 newLine.
	""
	clients _ self instance clients.
	created _ 0.
	lastNames
		do: [:lastName | composedNames
				do: [:composedName | 
					clients
						add: (Client newFirstName: composedName lastName: lastName).
					""
					created _ created + 1.
					(created isDivisibleBy: 50000)
						ifTrue: [Transcript show: 'created: ';
								 show: created;
								 show: ' (';
								
								show: (100.0 * created / clientsToCreate roundTo: 0.01);
								 show: '%)';
								 newLine]]].
	Transcript show: 'done!!';
		 newLine
		
	! !

!SampleSystem class methodsFor: 'testing' stamp: 'dgd 5/21/2002 14:30'!
createSampleObjects	"creates a set of sample objects"	" 	self createSampleObjects  	"	self createSampleCities.	self createSampleAddresses.	self createSampleClients.self assignAddressToClients! !

!SampleSystem class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 11:19'!
instance	^ instance ifNil:[instance _ super new initialize]! !

!SampleSystem class methodsFor: 'instance creation' stamp: 'dgd 5/21/2002 11:20'!
new	^ self error:'#new is not alowed, use #instance'! !

!TestObject methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:29'!
system	^ self class system! !

!TestObject class methodsFor: 'accessing' stamp: 'dgd 5/21/2002 11:33'!
system	^ SampleSystem instance! !
