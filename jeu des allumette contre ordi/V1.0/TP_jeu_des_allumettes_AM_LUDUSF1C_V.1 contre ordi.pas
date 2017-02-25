PROGRAM allumette_contre_ordi;

//BUT : Le jeu se joue seul contre l'ordi .Le joueur et l'ordi se partagent un tas de 21 allumettes. À tour de rôle, ils doivent retirer 1, 2 ou 3 allumettes du tas ; le dernier à prendre une allumette a perdu.
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
			victoire_joueur_2 := true;

	End;	
PROCEDURE prendre_allumette_ordi(var nb_allumette_prise , nb_allumette_total : integer ;var joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2: boolean); // change de joueur actif

	Begin
		REPEAT
			randomize;
			nb_allumette_prise := random(3+1);
		UNTIL ((nb_allumette_prise > 0 ) AND (nb_allumette_prise < 4 ) AND (nb_allumette_prise <= nb_allumette_total)); // veridfie qu'il y as assez d'allumette et que le chiffre est entre 1 et 3
		nb_allumette_total := nb_allumette_total - nb_allumette_prise;
		writeln('l''ordinateur a pris ', nb_allumette_prise ,' allumette');
		IF (nb_allumette_total = 0 ) THEN
			victoire_joueur_1 := true;
	End;	
PROCEDURE victoire (victoire_joueur_1,victoire_joueur_2 :boolean);

	Begin
		IF (victoire_joueur_1 = true) THEN
			writeln ('vous avez gagner !');
		IF (victoire_joueur_2 = true) THEN
			writeln ('vous avez perdu !');
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
	REPEAT
		prendre_allumette( nb_allumette_prise , nb_allumette_total , joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2);
		IF ((victoire_joueur_1 <> true) AND (victoire_joueur_2 <> true)) THEN
			prendre_allumette_ordi( nb_allumette_prise , nb_allumette_total , joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2);	
	UNTIL ((victoire_joueur_1 = true) OR (victoire_joueur_2 = true));
	victoire (victoire_joueur_1,victoire_joueur_2);
	readln;

End.

(*

//PROGRAMME allumette_contre_ordi
//BUT : Le jeu se joue seul contre l'ordi .Le joueur et l'ordi se partagent un tas de 21 allumettes. À tour de rôle, ils doivent retirer 1, 2 ou 3 allumettes du tas ; le dernier à prendre une allumette a perdu.
//ENTREE : nombres d'allumettes prise
//SORTIE : message gagner ou perdu

PROCEDURE prendre_allumette (var nb_allumette_prise , nb_allumette_total : ENTIER ; var joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2: BOOLEEN) // effectue la prise d'allumette

	DEBUT
		REPETER
			ECRIRE ('vous pouvez prendre une à trois allumette, combien voulez vous en prendre ?')
			ECRIRE ('il reste '& nb_allumette_total &' allumette !')
			LIRE (nb_allumette_prise)
		JUSQU'A ((nb_allumette_prise > 0 ) ET (nb_allumette_prise < 4 ) ET (nb_allumette_prise <= nb_allumette_total)) // verifie qu'il y as assez d'allumette et que le chiffre est entre 1 et 3
		nb_allumette_total <- nb_allumette_total - nb_allumette_prise
		SI (nb_allumette_total = 0 ) ALORS
			victoire_joueur_2 <- VRAI
		FIN SI

	FIN
FIN PROCEDURE

PROCEDURE prendre_allumette_ordi(var nb_allumette_prise , nb_allumette_total : ENTIER ; var joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2: BOOLEEN) // change de joueur actif

	DEBUT
		REPETER
			ALEATOIRE
			nb_allumette_prise <- ALEATOIRE (3+1)
		JUSQU'A ((nb_allumette_prise > 0 ) ET (nb_allumette_prise < 4 ) ET (nb_allumette_prise <= nb_allumette_total)) // veridfie qu'il y as assez d'allumette et que le chiffre est entre 1 et 3
		nb_allumette_total <- nb_allumette_total - nb_allumette_prise
		ECRIRE('l''ordinateur a pris '& nb_allumette_prise &' allumette')
		SI (nb_allumette_total = 0 ) ALORS
			victoire_joueur_1 <- VRAI
		FINSI
	FIN	
FIN PROCEDURE

PROCEDURE victoire (victoire_joueur_1,victoire_joueur_2 :BOOLEEN)

	DEBUT
		SI (victoire_joueur_1 = VRAI) ALORS
			ECRIRE ('vous avez gagner !')
		FIN SI
		SI (victoire_joueur_2 = VRAI) ALORS
			ECRIRE ('vous avez perdu !')
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
	REPETER
		prendre_allumette( nb_allumette_prise , nb_allumette_total , joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2)
		SI ((victoire_joueur_1 <> VRAI) ET (victoire_joueur_2 <> VRAI)) ALORS
			prendre_allumette_ordi( nb_allumette_prise , nb_allumette_total , nb_allumette_sur_la_ligne, joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2)
		FIN SI
	JUSQU'A ((victoire_joueur_1 = VRAI) OU (victoire_joueur_2 = VRAI))
	victoire (victoire_joueur_1,victoire_joueur_2)

FIN.

JEU D'ESSAI

victoire_joueur_1 = FAUX
victoire_joueur_2 = FAUX
nb_allumette_total = 21

tour joueur
nb_allumette_prise = 3
nb_allumette_total = 18

tour ordi
nb_allumette_prise = 3
nb_allumette_total = 15

tour joueur
nb_allumette_prise = 3
nb_allumette_total = 12

tour ordi
nb_allumette_prise = 3
nb_allumette_total = 15

tour joueur
nb_allumette_prise = 3
nb_allumette_total = 12

tour ordi
nb_allumette_prise = 3
nb_allumette_total = 9

tour joueur
nb_allumette_prise = 3
nb_allumette_total = 6

tour ordi
nb_allumette_prise = 3
nb_allumette_total = 3

tour joueur
nb_allumette_prise = 2
nb_allumette_total = 1

tour ordi
nb_allumette_prise = 1
nb_allumette_total = 0

victoire_joueur_1 = VRAI
"le joueur 1 gagne la patie"
*)
