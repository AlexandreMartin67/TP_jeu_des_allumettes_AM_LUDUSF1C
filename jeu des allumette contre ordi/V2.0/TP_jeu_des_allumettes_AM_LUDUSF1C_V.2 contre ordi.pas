PROGRAM allumette_contre_ordi_avec_plusieur_ligne;

//BUT : Le jeu se joue seul contre l'ordi .Le joueur et l'ordi se partagent un tas d'allumette sub-diviser en ligne. au debut du jeu le joueur choisi le nombre de ligne disponible. la premiére ligne posséde 1 allumette .
//Les lignes suivante on x+2 allumette (x étant le nombre d'allumette de la ligne précedante).À tour de rôle, ils doivent retirer 1, 2 ou 3 allumettes du tas ; le dernier à prendre une allumette a perdu.
//ENTREE : nombres d'allumettes prise , nombre de ligne
//SORTIE : message gagner ou perdu

uses crt;

TYPE
	tableau = array [1..100] of integer;

PROCEDURE prendre_allumette (var nb_allumette_prise , nb_allumette_total , nb_ligne , nb_allumette_sur_la_ligne, x: integer ;var joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2: boolean); // effectue la prise d'allumette

	Begin
		REPEAT
			writeln ('vous pouvez prendre une à trois allumette, combien voulez vous en prendre ?');
			writeln ('il reste ', nb_allumette_sur_la_ligne ,' allumette sur la ligne !');
			writeln ('il reste ', nb_ligne-x+1 , ' ligne d''allumette');
			readln (nb_allumette_prise);
		UNTIL ((nb_allumette_prise > 0 ) AND (nb_allumette_prise < 4 ) AND (nb_allumette_prise <= nb_allumette_sur_la_ligne )); // verifie qu'il y as assez d'allumette et que le chiffre est entre 1 et 3
		nb_allumette_total := nb_allumette_total - nb_allumette_prise;
		nb_allumette_sur_la_ligne := nb_allumette_sur_la_ligne -nb_allumette_prise;
		IF (nb_allumette_total = 0 ) THEN
			victoire_joueur_2 := true;

	End;	

PROCEDURE prendre_allumette_ordi(var nb_allumette_prise , nb_allumette_total , nb_allumette_sur_la_ligne: integer ;var joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2: boolean); // change de joueur actif

	Begin
		REPEAT
			randomize;
			nb_allumette_prise := random(3+1);
		UNTIL ((nb_allumette_prise > 0 ) AND (nb_allumette_prise < 4 ) AND (nb_allumette_prise <= nb_allumette_sur_la_ligne )); // veridfie qu'il y as assez d'allumette et que le chiffre est entre 1 et 3
		nb_allumette_total := nb_allumette_total - nb_allumette_prise;
		nb_allumette_sur_la_ligne := nb_allumette_sur_la_ligne -nb_allumette_prise;
		writeln('l''ordinateur a pris ', nb_allumette_prise ,' allumette');
		IF (nb_allumette_total = 0 ) THEN
			victoire_joueur_1 := true;
		writeln('appuyez sur entrer pour continuer');
		readln;
		clrscr;
	End;	

PROCEDURE victoire (victoire_joueur_1,victoire_joueur_2 :boolean);

	Begin
		IF (victoire_joueur_1 = true) THEN
			writeln ('vous avez gagner !');
		IF (victoire_joueur_2 = true) THEN
			writeln ('vous avez perdu !');
	End;

PROCEDURE initialisation_du_nombre_de_ligne(var nb_ligne , nb_allumette_total :integer ;var tableau_allumette : tableau);

	var
		x,i,j :integer;

	Begin
		REPEAT
			writeln('combien de ligne voulez vous ?');
			readln(nb_ligne);
		UNTIL (nb_ligne>0);
		x:=-1 ;
		FOR i:=1 TO nb_ligne DO
			Begin
				x := x+2;
				tableau_allumette[i] := x;
				nb_allumette_total := nb_allumette_total+x
			End;
		writeln('il y as ',nb_ligne,' ligne d''allumette');
	End;

PROCEDURE redefinition_nb_allumette_sur_ligne(var x , nb_allumette_sur_la_ligne : integer ; tableau_allumette : tableau);

	Begin
		IF nb_allumette_sur_la_ligne = 0 THEN
			Begin
				x:=x+1;
				nb_allumette_sur_la_ligne := tableau_allumette[x];
			End;
	End;

VAR

	nb_ligne : integer;
	nb_allumette_prise : integer;
	nb_allumette_total : integer;
	joueur_actif_1 , joueur_actif_2 : boolean;
	victoire_joueur_1 , victoire_joueur_2 : boolean;
	tableau_allumette : array [1..100] of integer;
	x :integer;
    nb_allumette_sur_la_ligne :integer;

Begin
	
	clrscr;
	joueur_actif_1 := true;
	joueur_actif_2 := false;
	victoire_joueur_1 := false;
	victoire_joueur_2 := false;
	initialisation_du_nombre_de_ligne(nb_ligne , nb_allumette_total , tableau_allumette);
	x:=x+1;
	nb_allumette_sur_la_ligne := tableau_allumette[x];
	clrscr;
	REPEAT
		redefinition_nb_allumette_sur_ligne( x , nb_allumette_sur_la_ligne , tableau_allumette);
		prendre_allumette( nb_allumette_prise , nb_allumette_total , nb_ligne , nb_allumette_sur_la_ligne, x , joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2);
		IF ((victoire_joueur_1 <> true) AND (victoire_joueur_2 <> true)) THEN
			Begin
				redefinition_nb_allumette_sur_ligne( x , nb_allumette_sur_la_ligne , tableau_allumette);
				prendre_allumette_ordi( nb_allumette_prise , nb_allumette_total , nb_allumette_sur_la_ligne, joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2);
			End;
	UNTIL ((victoire_joueur_1 = true) OR (victoire_joueur_2 = true));
	victoire (victoire_joueur_1,victoire_joueur_2);
	readln;

End.

(*

	//PROGRAMME allumette_contre_ordi_avec_plusieur_ligne
	//BUT : Le jeu se joue seul contre l'ordi .Le joueur et l'ordi se partagent un tas d'allumette sub-diviser en ligne. au debut du jeu le joueur choisi le nombre de ligne disponible. la premiére ligne posséde 1 allumette . Les lignes suivante on x+2 allu
mette (x étant le nombre d'allumette de la ligne précedante) . À tour de rôle, ils doivent retirer 1, 2 ou 3 allumettes du tas ; le dernier à prendre une allumette a perdu.
	//ENTREE : nombres d'allumettes prise , nombre de ligne
	//SORTIE : message gagner ou perdu	

	TYPE
		tableau = TABLEAU [1..100] DE ENTIER

	PROCEDURE prendre_allumette (var nb_allumette_prise , nb_allumette_total , nb_ligne , nb_allumette_sur_la_ligne, x: ENTIER ; var joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2: BOOLEEN) // effectue la prise d'allumette

		DEBUT
			REPETER
				ECRIRE ('vous pouvez prendre une à trois allumette, combien voulez vous en prendre ?')
				ECRIRE ('il reste '& nb_allumette_sur_la_ligne &' allumette sur la ligne !')
				ECRIRE ('il reste '& nb_ligne-x+1 & ' ligne d''allumette')
				LIRE (nb_allumette_prise)
			JUSQU'A ((nb_allumette_prise > 0 ) ET (nb_allumette_prise < 4 ) ET (nb_allumette_prise <= nb_allumette_sur_la_ligne )) // verifie qu'il y as assez d'allumette et que le chSIfre est entre 1 et 3
			nb_allumette_total <- nb_allumette_total - nb_allumette_prise
			nb_allumette_sur_la_ligne <- nb_allumette_sur_la_ligne -nb_allumette_prise
			SI (nb_allumette_total = 0 ) ALORS
				victoire_joueur_2 <- VRAI
			FIN SI
		FIN
	FIN PROCEDURE

	PROCEDURE prendre_allumette_ordi(var nb_allumette_prise , nb_allumette_total , nb_allumette_sur_la_ligne: ENTIER ; var joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2: BOOLEEN) // change de joueur actif

		DEBUT
			REPETER
				nb_allumette_prise <- ALEATOIRE(3+1)
			JUSQU'A ((nb_allumette_prise > 0 ) ET (nb_allumette_prise < 4 ) ET (nb_allumette_prise <= nb_allumette_sur_la_ligne )) // veridfie qu'il y as assez d'allumette et que le chSIfre est entre 1 et 3
			nb_allumette_total <- nb_allumette_total - nb_allumette_prise
			nb_allumette_sur_la_ligne <- nb_allumette_sur_la_ligne -nb_allumette_prise
			ECRIRE('l''ordinateur a pris '& nb_allumette_prise &' allumette')
			SI (nb_allumette_total = 0 ) ALORS
				victoire_joueur_1 <- VRAI
			FIN SI
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

	PROCEDURE initialisation_du_nombre_de_ligne(var nb_ligne , nb_allumette_total :ENTIER ; var tableau_allumette : tableau)

		var
			x,i,j :ENTIER

		DEBUT
			REPETER
				ECRIRE('combien de ligne voulez vous ?')
				LIRE(nb_ligne)
			JUSQU'A (nb_ligne>0)
			x <- -1
			POUR i<-1 A nb_ligne FAIRE
				DEBUT
					x <- x+2
					tableau_allumette[i] <- x
					nb_allumette_total <- nb_allumette_total+x
				FIN
			FIN POUR
			ECRIRE('il y as '&nb_ligne&' ligne d''allumette')
		FIN
	FIN PROCEDURE

	PROCEDURE redefinition_nb_allumette_sur_ligne(var x , nb_allumette_sur_la_ligne : ENTIER ; tableau_allumette : tableau)

		DEBUT
			SI nb_allumette_sur_la_ligne = 0 ALORS
				DEBUT
					x<-x+1
					nb_allumette_sur_la_ligne <- tableau_allumette[x]
				FIN
			FIN SI
		FIN
	FIN PROCEDURE

	VAR

		nb_ligne : ENTIER
		nb_allumette_prise : ENTIER
		nb_allumette_total : ENTIER
		joueur_actif_1 , joueur_actif_2 : BOOLEEN
		victoire_joueur_1 , victoire_joueur_2 : BOOLEEN
		tableau_allumette : TABLEAU [1..100] DE ENTIER
		x :ENTIER
	    nb_allumette_sur_la_ligne :ENTIER

	DEBUT
		
		joueur_actif_1 <- VRAI
		joueur_actif_2 <- FAUX
		victoire_joueur_1 <- FAUX
		victoire_joueur_2 <- FAUX
		initialisation_du_nombre_de_ligne(nb_ligne , nb_allumette_total , tableau_allumette)
		x<-x+1
		nb_allumette_sur_la_ligne <- tableau_allumette[x]
		REPETER
			redefinition_nb_allumette_sur_ligne( x , nb_allumette_sur_la_ligne , tableau_allumette)
			prendre_allumette( nb_allumette_prise , nb_allumette_total , nb_ligne , nb_allumette_sur_la_ligne, x , joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2)
			SI ((victoire_joueur_1 <> VRAI) ET (victoire_joueur_2 <> VRAI)) ALORS
				DEBUT
					redefinition_nb_allumette_sur_ligne( x , nb_allumette_sur_la_ligne , tableau_allumette)
					prendre_allumette_ordi( nb_allumette_prise , nb_allumette_total , nb_allumette_sur_la_ligne, joueur_actif_1 , joueur_actif_2 , victoire_joueur_1 , victoire_joueur_2)
				FIN
			FIN SI
		JUSQU'A ((victoire_joueur_1 = VRAI) OU (victoire_joueur_2 = VRAI))
		victoire (victoire_joueur_1,victoire_joueur_2)
		LIRE

	FIN.

JEU D'ESSAI

victoire_joueur_1 = FAUX
victoire_joueur_2 = FAUX

nb_ligne = 3
tableau_allumette[1] = 1
tableau_allumette[2] = 3
tableau_allumette[3] = 5
nb_allumette_total = 9

nb_allumette_sur_la_ligne =1
tour joueur
nb_allumette_prise = 1
nb_allumette_sur_la_ligne =0
nb_allumette_total = 8

nb_allumette_sur_la_ligne =3
tour ordi
nb_allumette_prise = 3
nb_allumette_sur_la_ligne =0
nb_allumette_total = 5

nb_allumette_sur_la_ligne =5
tour joueur
nb_allumette_prise = 3
nb_allumette_sur_la_ligne =2
nb_allumette_total = 2

tour ordi
nb_allumette_prise = 1
nb_allumette_sur_la_ligne =1
nb_allumette_total = 1

tour joueur
nb_allumette_prise = 1
nb_allumette_sur_la_ligne =0
nb_allumette_total = 0

victoire_joueur_1 = VRAI
"le joueur 1 gagne la patie"
*)
