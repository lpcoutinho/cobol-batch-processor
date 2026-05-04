IDENTIFICATION DIVISION.
PROGRAM-ID. ProcessaRemessa.
AUTHOR. Seu Nome.
*> A IDENTIFICATION DIVISION define o nome do programa.
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    *> Mapeia o arquivo físico para uma variável interna
    SELECT ARQUIVO-REMESSA ASSIGN TO 'remessa.txt'
    ORGANIZATION IS LINE SEQUENTIAL.
DATA DIVISION.
FILE SECTION.
*> Define a estrutura (layout) de cada linha do arquivo
FD  ARQUIVO-REMESSA.
01  REGISTRO-REMESSA.
    05 ID-TRANSACAO   PIC 9(05).
    05 DATA-TRANSACAO PIC 9(08).
    *> O 'V' indica onde fica a vírgula imaginária (2 casas decimais)
    05 VALOR          PIC 9(05)V99. 
    05 TIPO           PIC X(01).
WORKING-STORAGE SECTION.
*> Variáveis de memória para controle e cálculos
01  FIM-DO-ARQUIVO    PIC X(01) VALUE 'N'.

*> Acumuladores preenchidos com zeros
01  TOTAL-CREDITOS    PIC 9(07)V99 VALUE ZEROS.
01  TOTAL-DEBITOS     PIC 9(07)V99 VALUE ZEROS.

*> Variáveis formatadas (com pontos e vírgulas) para exibir na tela
01  MOSTRA-VALOR      PIC ZZZ,ZZ9.99.
01  MOSTRA-CREDITOS   PIC ZZZ,ZZ9.99.
01  MOSTRA-DEBITOS    PIC ZZZ,ZZ9.99.
PROCEDURE DIVISION.
INICIO.
    *> Abre o arquivo para leitura
    OPEN INPUT ARQUIVO-REMESSA.
    
    *> Inicia o loop de leitura até o fim do arquivo
    PERFORM UNTIL FIM-DO-ARQUIVO = 'S'
        READ ARQUIVO-REMESSA
            AT END 
                MOVE 'S' TO FIM-DO-ARQUIVO
            NOT AT END
                PERFORM PROCESSA-REGISTRO
        END-READ
    END-PERFORM.
    *> Exibe os totais no final
    PERFORM MOSTRA-TOTAIS.
    *> Fecha o arquivo e encerra o programa
    CLOSE ARQUIVO-REMESSA.
    STOP RUN.
PROCESSA-REGISTRO.
    *> Formata o valor para exibir na tela
    MOVE VALOR TO MOSTRA-VALOR.
    DISPLAY "Processando ID: " ID-TRANSACAO 
            " | Tipo: " TIPO 
            " | Valor: R$ " MOSTRA-VALOR.
    
    *> Soma nos acumuladores dependendo do tipo
    IF TIPO = 'C'
        ADD VALOR TO TOTAL-CREDITOS
    ELSE IF TIPO = 'D'
        ADD VALOR TO TOTAL-DEBITOS
    END-IF.
MOSTRA-TOTAIS.
    MOVE TOTAL-CREDITOS TO MOSTRA-CREDITOS.
    MOVE TOTAL-DEBITOS TO MOSTRA-DEBITOS.
    DISPLAY "-----------------------------------".
    DISPLAY "RESUMO DO PROCESSAMENTO".
    DISPLAY "Total de Creditos : R$ " MOSTRA-CREDITOS.
    DISPLAY "Total de Debitos  : R$ " MOSTRA-DEBITOS.
    DISPLAY "-----------------------------------".