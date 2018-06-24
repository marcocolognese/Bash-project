#!/bin/bash

while(( 1 ))
	do
		echo -e "\n————————————————————————\n\t  MENU\n————————————————————————"
        echo -e -n "1. Prenota\n2. Elimina prenotazione\n3. Mostra aula\n4. Prenotazioni per aula\n5. Esci\n\nScelta: "

		read var
		
		case $var in
			1) ./prenota.sh;;
			2) ./elimina_prenotazione.sh;;
			3) ./mostra_aula.sh;;
			4) ./prenotazioni_per_aula.sh;;
			5) exit;;
			*) echo ERRORE INSERIMENTO;;
		esac
	done
