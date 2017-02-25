PROGRAM allumette;

//BUT : Le jeu se joue à deux.Les deux joueurs se partagent un tas de 21 allumettes. À tour de rôle, ils doivent retirer 1, 2 ou 3 allumettes du tas ; le joueur qui retire la dernière allumette a perdu.
//ENTREE : nombres d'allumettes prise
//SORTIE : message gagner ou perdu

uses crt;

PROCEDURE prendre_allumette (var nb_allumette_prise , nb_allumette_total : integer ;var joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2: boolean); // effectue la prise d'allumette

	Begin
		REPEAT
			writeln ('vous pouvez prendre une à trois allumette, combien voulez vous en prendre ?');
			writeln ('il reste ', nb_allumette_total ,' allumette !');
			readln (nb_allumette_prise);
		UNTIL ((nb_allumette_prise > 0 ) AND (nb_allumette_prise < 4 ) AND (nb_allumette_prise <= nb_allumette_total)); // verifie qu'il y as assez d'allumette et que le chiffre est entre 1 et 3
		nb_allumette_total := nb_allumette_total - nb_allumette_prise;
		IF (nb_allumette_total = 0 ) THEN
			Begin
				IF (joueur_actif_1 = true) THEN
					victoire_joueur_2 := true;
				IF (joueur_actif_2 = true) THEN
					victoire_joueur_1 := true;
			End;
	End;	
PROCEDURE joueur_actif(var joueur_actif_1 , joueur_actif_2 , victoire_joueur_1,victoire_joueur_2: boolean); // change de joueur actif

	Begin
		IF ((victoire_joueur_1 = false) AND (victoire_joueur_2 = false)) THEN
			Begin
				IF (joueur_actif_1 = true) THEN
					Begin
						joueur_actif_1 := false;
						joueur_actif_2 := true;
						writeln('C''est au joueur 2 de jouer !')
					End
				ELSE
					Begin
						joueur_actif_2 := false;
						joueur_actif_1 := true;
						writeln('C''est au joueur 1 de jouer !')
					End;
			End;
	End;
PROCEDURE victoire (victoire_joueur_1,victoire_joueur_2 :boolean); // determine qui gagne

	Begin
		IF (victoire_joueur_1 = true) THEN
			writeln ('le joueur 1 gagne la patie');
		IF (victoire_joueur_2 = true) THEN
			writeln ('le joueur 2 gagne la patie');
	End;

VAR

	nb_allumette_prise : integer;
	nb_allumette_total : integer;
	joueur_actif_1 , joueur_actif_2 : boolean;
	victoire_joueur_1 , victoire_joueur_2 : boolean;

Begin
	
	clrscr;
	joueur_actif_1 := true;
	joueur_actif_2 := false;
	victoire_joueur_1 := false;
	victoire_joueur_2 := false;
	nb_allumette_total := 21;
	writeln('C''est au joueur 1 de jouer !');
	REPEAT
		prendre_allumette( nb_allumette_prise , nb_allumette_total , joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2);
		joueur_actif( joueur_actif_1 , joueur_actif_2 , victoire_joueur_1,victoire_joueur_2);
	UNTIL ((victoire_joueur_1 = true) OR (victoire_joueur_2 = true));
	victoire (victoire_joueur_1,victoire_joueur_2);
	readln;

End.

(*

//PROGRAMME allumette
//BUT : Le jeu se joue à deux.Les deux joueurs se partagent un tas de 21 allumettes. À tour de rôle, ils doivent retirer 1, 2 ou 3 allumettes du tas ; le joueur qui retire la dernière allumette a perdu.
//ENTREE : nombres d'allumettes prise
//SORTIE : message gagner ou perdu

PROCEDURE prendre_allumette (var nb_allumette_prise , nb_allumette_total : ENTIER ;var joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2: BOOLEEN) // effectue la prise d"allumette

	DEBUT
		REPETER
			ECRIRE ("vous pouvez prendre une à trois allumette, combien voulez vous en prendre ?")
			ECRIRE ("il reste ", nb_allumette_total ," allumette !")
			LIRE (nb_allumette_prise)
		JUSQU'A ((nb_allumette_prise > 0 ) ET (nb_allumette_prise < 4 ) ET (nb_allumette_prise <= nb_allumette_total)) // verifie qu"il y as assez d"allumette et que le chSIfre est entre 1 et 3
		nb_allumette_total <- nb_allumette_total - nb_allumette_prise
		SI (nb_allumette_total = 0 ) ALORS
			DEBUT
				SI (joueur_actif_1 = VRAI) ALORS
					victoire_joueur_2 <- VRAI
				FIN SI
				SI (joueur_actif_2 = VRAI) ALORS
					victoire_joueur_1 <- VRAI
				FIN SI
			FIN
		FIN SI
	FIN	
FIN PROCEDURE

PROCEDURE joueur_actif(var joueur_actif_1 , joueur_actif_2 : BOOLEEN) // change de joueur actif

	DEBUT
		SI ((victoire_joueur_1 = FAUX) ET (victoire_joueur_2 = FAUX)) ALORS 
			DEBUT
				SI (joueur_actif_1 = VRAI) ALORS
					DEBUT
						joueur_actif_1 := FAUX
						joueur_actif_2 := VRAI
						ECRIRE('C''est au joueur 2 de jouer !')
					FIN
				SINON
					DEBUT
						joueur_actif_2 := FAUX
						joueur_actif_1 := VRAI
						ECRIRE('C''est au joueur 1 de jouer !')
					FIN
				FIN SI
			FIN
		FIN SI
	FIN
FIN PROCEDURE

PROCEDURE victoire (victoire_joueur_1,victoire_joueur_2 :BOOLEEN)

	DEBUT
		SI (victoire_joueur_1 = VRAI) ALORS
			ECRIRE ("le joueur 1 gagne la patie")
		FIN SI
		SI (victoire_joueur_2 = VRAI) ALORS
			ECRIRE ("le joueur 2 gagne la patie")
		FIN SI
	FIN
FIN PROCEDURE

VAR

	nb_allumette_prise : ENTIER
	nb_allumette_total : ENTIER
	joueur_actif_1 , joueur_actif_2 : BOOLEEN
	victoire_joueur_1 , victoire_joueur_2 : BOOLEEN

DEBUT
	
	joueur_actif_1 <- VRAI
	joueur_actif_2 <- FAUX
	victoire_joueur_1 <- FAUX
	victoire_joueur_2 <- FAUX
	nb_allumette_total <- 21
	ECRIRE("C'est au joueur 1 de jouer !")
	REPETER
		prendre_allumette( nb_allumette_prise , nb_allumette_total , joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2)
		joueur_actif( joueur_actif_1 , joueur_actif_2 , victoire_joueur_1,victoire_joueur_2)
	JUSQU'A ((victoire_joueur_1 = VRAI) OU (victoire_joueur_2 = VRAI))
	victoire (victoire_joueur_1,victoire_joueur_2)

FIN.

JEU D'ESSAI

joueur_actif_1 = VRAI
joueur_actif_2 = FAUX
victoire_joueur_1 = FAUX
victoire_joueur_2 = FAUX
nb_allumette_total = 21

nb_allumette_prise = 3
nb_allumette_total = 18

joueur_actif_1 = FAUX
joueur_actif_2 = VRAI

nb_allumette_prise = 3
nb_allumette_total = 15

joueur_actif_1 = VRAI
joueur_actif_2 = FAUX

nb_allumette_prise = 3
nb_allumette_total = 12

joueur_actif_1 = FAUX
joueur_actif_2 = VRAI

nb_allumette_prise = 3
nb_allumette_total = 15

joueur_actif_1 = VRAI
joueur_actif_2 = FAUX

nb_allumette_prise = 3
nb_allumette_total = 12

joueur_actif_1 = FAUX
joueur_actif_2 = VRAI

nb_allumette_prise = 3
nb_allumette_total = 9

joueur_actif_1 = VRAI
joueur_actif_2 = FAUX

nb_allumette_prise = 3
nb_allumette_total = 6

joueur_actif_1 = FAUX
joueur_actif_2 = VRAI

nb_allumette_prise = 3
nb_allumette_total = 3

joueur_actif_1 = VRAI
joueur_actif_2 = FAUX

nb_allumette_prise = 2
nb_allumette_total = 1

joueur_actif_1 = FAUX
joueur_actif_2 = VRAI

nb_allumette_prise = 1
nb_allumette_total = 0
victoire_joueur_1 = VRAI

joueur_actif_1 = VRAI
joueur_actif_2 = FAUX

"le joueur 1 gagne la patie"
*)
