# Bash project
Si vuole realizzare uno script bash che implementi un semplice sistema di gestione delle aule. \
\
Le prenotazioni delle aule saranno memorizzate sul file aule.txt, e conterrà le informazioni relative a ciascuna aula secondo il formato CSV con il carattere ';' come separatore:
*\<aula\>;\<data\>;\<ora\>;\<utente\>* , dove:
- **aula**: è il nome dell'aula
- **data**: è la data per cui l'aula e' prenotata
- **ora**: è l'ora per cui e' prenotata
- **utente**: è il nome dell'utente che l'ha prenotata
    
Ad esempio:
- *A;20160605;8;Marco*
- *Tessari;20160605;8;Andrea*
- *A;20160605;9;Anna*

Eseguendo lo script, apparirà il seguente menù interattivo:
1.  Prenota
2.  Elimina prenotazione
3.  Mostra aula
4.  Prenotazioni per aula
5.  Esci
    

Il comportamento per ciascuna voce del menu deve essere il seguente:
- Il **comando Prenota** consente di aggiungere una nuova prenotazione. Verrà chiesto all'utente di inserire l'aula, la data e l'ora, oltre al nome utente, leggendo l'input da tastiera. Gli orari validi sono dalle 8 alle 17. Si assumano per gli orari numeri interi. Deve essere controllato che non ci sia già una prenotazione per il giorno aula ed ora specificati.
Al termine dell'inserimento, le informazioni relative al nuovo studente verranno aggiunte in coda al file aule.txt su un'unica riga secondo il formato specificato in precedenza.
- Il **comando Elimina** prenotazione consente di eliminare una prenotazione. Verranno richieste le informazioni necessarie (aula, data, ora) tramite riga di comando. In caso di prenotazione inesistente, verrà restituito un errore all'utente.
- Il **comando Mostra** aula consente di visualizzare in formato tabulare l'elenco delle prenotazioni di un'aula. Si dovrà richiedere l'aula per cui visualizzare le prenotazioni. L'elenco deve essere ordinato per data e ora crescenti. Per esempio, se l'aula specificata è la A, un possibile output fornito dal comando potrebbe essere il seguente:
PRENOTAZIONI AULA A: Giorno Ora Utente
*20160103 11 Giorgio*
*20160605 8 Marco 20160605 9 Anna*
I vari campi relativi ad ogni prenotazione devono essere separati da almeno uno spazio (o una tabulazione o più spazi). Non è richiesto che i vari campi siano allineati alle rispettive colonne.

- Il **comando Prenotazioni** per aula deve mostrare il numero totale di prenotazioni per ciascuna aula, ordinato in modo crescente. Un possibile output potrebbe essere il seguente:
*C: 2*
*A: 7*
*Tessari: 14*

### FAQ
1.  *E’ possibile inserire il codice su script separati, oppure bisogna usare le funzioni?*
Questa decisione è lasciata allo studente, che può scegliere il modo più opportuno. E’ quindi possibile sviluppare il programma inserendo il codice su funzioni oppure su file separati.
    
2.  *E’ possibile usare il comando comm/sed/awk/etc.?*
Sì. Qualsiasi comando bash è consentito, anche se non spiegato a lezione. Lo studente e' pero' tenuto a conoscere i comandi che usa nel codice. Non è lecito usare script in altri linguaggi, quali ad esempio Perl o TCL.

**N.B.:** Tutto quanto non esplicitato in questo documento può essere implementato liberamente.