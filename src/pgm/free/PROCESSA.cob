      *>>SOURCE FORMAT IS FREE
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROCESSA-FREE.
       AUTHOR. LPCOUTINHO.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQUIVO-REMESSA ASSIGN TO 'data/input/remessa.txt'
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  ARQUIVO-REMESSA.
       01  REGISTRO-REMESSA.
           05 ID-TRANSACAO   PIC 9(05).
           05 DATA-TRANSACAO PIC 9(08).
           05 VALOR          PIC 9(05)V99.
           05 TIPO           PIC X(01).

       WORKING-STORAGE SECTION.
       01  FIM-DO-ARQUIVO    PIC X(01) VALUE 'N'.
       01  TOTAL-CREDITOS    PIC 9(07)V99 VALUE ZEROS.
       01  TOTAL-DEBITOS     PIC 9(07)V99 VALUE ZEROS.
       01  MOSTRA-VALOR      PIC ZZZ.ZZ9,99.
       01  MOSTRA-CREDITOS   PIC ZZZ.ZZ9,99.
       01  MOSTRA-DEBITOS    PIC ZZZ.ZZ9,99.

       PROCEDURE DIVISION.
       INICIO.
           OPEN INPUT ARQUIVO-REMESSA.
           
           PERFORM UNTIL FIM-DO-ARQUIVO = 'S'
               READ ARQUIVO-REMESSA
                   AT END 
                       MOVE 'S' TO FIM-DO-ARQUIVO
                   NOT AT END
                       PERFORM PROCESSA-REGISTRO
               END-READ
           END-PERFORM.

           PERFORM MOSTRA-TOTAIS.
           CLOSE ARQUIVO-REMESSA.
           STOP RUN.

       PROCESSA-REGISTRO.
           MOVE VALOR TO MOSTRA-VALOR.
           DISPLAY "ID: " ID-TRANSACAO " | VALOR: R$ " MOSTRA-VALOR.
           
           IF TIPO = 'C'
               ADD VALOR TO TOTAL-CREDITOS
           ELSE
               ADD VALOR TO TOTAL-DEBITOS
           END-IF.

       MOSTRA-TOTAIS.
           MOVE TOTAL-CREDITOS TO MOSTRA-CREDITOS.
           MOVE TOTAL-DEBITOS TO MOSTRA-DEBITOS.
           DISPLAY "-----------------------------------".
           DISPLAY "TOTAL CREDITOS : R$ " MOSTRA-CREDITOS.
           DISPLAY "TOTAL DEBITOS  : R$ " MOSTRA-DEBITOS.
           DISPLAY "-----------------------------------".
