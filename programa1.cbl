      $set sourceformat"free"

      *>Divisão de identificação do programa
       Identification Division.
       Program-id. "Programa1". *> Projeto loteria
       Author. "Jéssica C.Del'agnolo".
       Installation. "PC".
       Date-written. 22/07/2020.
       Date-compiled. 22/07/2020.



      *>Divisão para configuração do ambiente
       Environment Division.
       Configuration Section.
           special-names. decimal-point is comma.

      *>----Declaração dos recursos externos
       Input-output Section.
       File-control.
       I-O-Control.


      *>Declaração de variáveis
       Data Division.

      *>----Variaveis de arquivos
       File Section.

      *>----Variaveis de trabalho
       Working-storage Section.
      *>------------------------------


       01  ws-fim-programa                         pic x(01).
           88  ws-sair                             value "x" "X".
           88  ws-continua                         value spaces.

       01  ws-sorteio.
           05  ws-sort-1                           pic 9(02) value zero.
           05  filler                              pic x(03) value "   ".
           05  ws-sort-2                           pic 9(02) value zero.
           05  filler                              pic x(03) value "   ".
           05  ws-sort-3                           pic 9(02) value zero.
           05  filler                              pic x(03) value "   ".
           05  ws-sort-4                           pic 9(02) value zero.
           05  filler                              pic x(03) value "   ".
           05  ws-sort-5                           pic 9(02) value zero.
           05  filler                              pic x(03) value "   ".
           05  ws-sort-6                           pic 9(02) value zero.

       01  ws-aposta.
           05  ws-num-1                            pic 9(02) value zero.
           05  ws-num-2                            pic 9(02) value zero.
           05  ws-num-3                            pic 9(02) value zero.
           05  ws-num-4                            pic 9(02) value zero.
           05  ws-num-5                            pic 9(02) value zero.
           05  ws-num-6                            pic 9(02) value zero.
           05  ws-num-7                            pic 9(02) value zero.
           05  ws-num-8                            pic 9(02) value zero.
           05  ws-num-9                            pic 9(02) value zero.
           05  ws-num-10                           pic 9(02) value zero.

       01  ws-dados-aposta.
           05  ws-qtd-num.
               10  ws-seis                         pic x(01) value spaces.
               10  ws-sete                         pic x(01) value spaces.
               10  ws-oito                         pic x(01) value spaces.
               10  ws-nove                         pic x(01) value spaces.
               10  ws-dez                          pic x(01) value spaces.
           05  ws-valor                            pic zz9,99 value zero.
           05  ws-selecionado                      pic 9(02) value zero.
           05  ws-confirma.
               10  ws-conf-sim                     pic x(01) value spaces.
               10  ws-conf-nao                     pic x(01) value spaces.
           05  ws-confere                          pic x(01).
               88  ws-tudo-ok                      value "s".
               88  ws-nao-ok                       value "n".
           05  ws-msg-erro                         pic x(50).
           05  ws-tempo.
               10  ws-hora                         pic 9(02).
               10  ws-min                          pic 9(02).
               10  ws-seg                          pic 9(02).
           05  ws-tempo-gasto.
               10  ws-hora-g                       pic 9(02).
               10  filler                          pic x(01) value":".
               10  ws-min-g                        pic 9(02).
               10  filler                          pic x(01) value":".
               10  ws-seg-g                        pic 9(02).
           05  ws-contagem                         pic 9(10).

      *>----Variaveis para comunicação entre programas
       Linkage Section.

      *>----Declaração de tela
       Screen Section.

       01  sc-tela-inicio.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 04 col 01 value "                               Sorteio da Loteria                   [ ]Sair     ".
           05 line 05 col 01 value "     _____________________________________________________________________      ".
           05 line 06 col 01 value "    |                                                                     |     ".
           05 line 07 col 01 value "    |              Ola, Quanto Numeros Voce Deseja Apostar?               |     ".
           05 line 08 col 01 value "    |                                                                     |     ".
           05 line 09 col 01 value "    |                [ ]06  [ ]07  [ ]08  [ ]09  [ ]10                    |     ".
           05 line 10 col 01 value "    |                                                                     |     ".
           05 line 11 col 01 value "    |   Selecionado    :    Numeros                                       |     ".
           05 line 12 col 01 value "    |   Valor da Aposta: R$                                               |     ".
           05 line 13 col 01 value "    |                                                                     |     ".
           05 line 14 col 01 value "    |                                                                     |     ".
           05 line 15 col 01 value "    |   Deseja Confirmar? [ ]Sim  [ ]Nao                                  |     ".
           05 line 16 col 01 value "    |                                                                     |     ".
           05 line 17 col 01 value "    |                                                                     |     ".
           05 line 18 col 01 value "    |                                                                     |     ".
           05 line 19 col 01 value "    |    [___________________________________________________________]    |     ".
           05 line 20 col 01 value "    |                                                                     |     ".
           05 line 21 col 01 value "    |_____________________________________________________________________|     ".



           05 sc-sair              line 04  col 70 pic x(01)
           using ws-fim-programa   foreground-color 12.

           05 sc-seis-num          line 09  col 23 pic x(01)
           using ws-seis           foreground-color 15.

           05 sc-sete-num          line 09  col 30 pic x(01)
           using ws-sete           foreground-color 15.

           05 sc-oito-num          line 09  col 37 pic x(01)
           using ws-oito           foreground-color 15.

           05 sc-nove-num          line 09  col 44 pic x(01)
           using ws-nove           foreground-color 15.

           05 sc-dez-num           line 09  col 51 pic x(01)
           using ws-dez            foreground-color 15.

           05 sc-qtd-sele          line 11  col 26 pic 9(02)
           from  ws-selecionado    foreground-color 15.

           05 sc-valor             line 12  col 29 pic zz9,99
           from  ws-valor          foreground-color 15.

           05 sc-confima-s         line 15  col 28 pic x(01)
           using ws-conf-sim       foreground-color 15.

           05 sc-confirma-n        line 15  col 36 pic x(01)
           using ws-conf-nao       foreground-color 15.

           05 sc-msg-erro          line 19  col 15 pic x(50)
           from  ws-msg-erro       foreground-color 15.


       01  sc-tela-aposta-seis-num.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 02 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".
           05 line 03 col 01 value "   $$                                                                      $$   ".
           05 line 04 col 01 value "   $$                Escolha os Seis Numeros da Sua Aposta:                $$   ".
           05 line 05 col 01 value "   $$                                                                      $$   ".
           05 line 06 col 01 value "   $$                    [  ] [  ] [  ] [  ] [  ] [  ]                     $$   ".
           05 line 07 col 01 value "   $$                                                                      $$   ".
           05 line 08 col 01 value "   $$                         Numeros da Loteria:                          $$   ".
           05 line 09 col 01 value "   $$               ________________________________________               $$   ".
           05 line 10 col 01 value "   $$               [01][02][03][04][05][06][07][08][09][10]               $$   ".
           05 line 11 col 01 value "   $$               [11][12][13][14][15][16][17][18][19][20]               $$   ".
           05 line 12 col 01 value "   $$               [21][22][23][24][25][26][27][28][29][30]               $$   ".
           05 line 13 col 01 value "   $$               [31][32][33][34][35][36][37][38][39][40]               $$   ".
           05 line 14 col 01 value "   $$               [41][42][43][44][45][46][47][48][49][50]               $$   ".
           05 line 15 col 01 value "   $$               [51][52][53][54][55][56][57][58][59][60]               $$   ".
           05 line 16 col 01 value "   $$                                                                      $$   ".
           05 line 17 col 01 value "   $$                   Deseja Confirmar? [ ]Sim  [ ]Nao                   $$   ".
           05 line 18 col 01 value "   $$                                                                      $$   ".
           05 line 19 col 01 value "   $$                                                                      $$   ".
           05 line 20 col 01 value "   $$    [___________________________________________________________]     $$   ".
           05 line 21 col 01 value "   $$                                                                      $$   ".
           05 line 22 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".


           05 sc-op-6-num-1        line 06  col 27 pic 9(02)
           using ws-num-1          foreground-color 15.

           05 sc-op-6-num-2        line 06  col 32 pic 9(02)
           using ws-num-2          foreground-color 15.

           05 sc-op-6-num-3        line 06  col 37 pic 9(02)
           using ws-num-3          foreground-color 15.

           05 sc-op-6-num-4        line 06  col 42 pic 9(02)
           using ws-num-4          foreground-color 15.

           05 sc-op-6-num-5        line 06  col 47 pic 9(02)
           using ws-num-5          foreground-color 15.

           05 sc-op-6-num-6        line 06  col 52 pic 9(02)
           using ws-num-6          foreground-color 15.

           05 sc-confima-s         line 17  col 44 pic x(01)
           using ws-conf-sim       foreground-color 15.

           05 sc-confirma-n        line 17  col 52 pic x(01)
           using ws-conf-nao       foreground-color 15.

           05 sc-msg-erro          line 20  col 15 pic x(50)
           from  ws-msg-erro       foreground-color 15.


       01  sc-tela-aposta-sete-num.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 02 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".
           05 line 03 col 01 value "   $$                                                                      $$   ".
           05 line 04 col 01 value "   $$                Escolha os Sete Numeros da Sua Aposta:                $$   ".
           05 line 05 col 01 value "   $$                                                                      $$   ".
           05 line 06 col 01 value "   $$                  [  ] [  ] [  ] [  ] [  ] [  ] [  ]                  $$   ".
           05 line 07 col 01 value "   $$                                                                      $$   ".
           05 line 08 col 01 value "   $$                         Numeros da Loteria:                          $$   ".
           05 line 09 col 01 value "   $$               ________________________________________               $$   ".
           05 line 10 col 01 value "   $$               [01][02][03][04][05][06][07][08][09][10]               $$   ".
           05 line 11 col 01 value "   $$               [11][12][13][14][15][16][17][18][19][20]               $$   ".
           05 line 12 col 01 value "   $$               [21][22][23][24][25][26][27][28][29][30]               $$   ".
           05 line 13 col 01 value "   $$               [31][32][33][34][35][36][37][38][39][40]               $$   ".
           05 line 14 col 01 value "   $$               [41][42][43][44][45][46][47][48][49][50]               $$   ".
           05 line 15 col 01 value "   $$               [51][52][53][54][55][56][57][58][59][60]               $$   ".
           05 line 16 col 01 value "   $$                                                                      $$   ".
           05 line 17 col 01 value "   $$                   Deseja Confirmar? [ ]Sim  [ ]Nao                   $$   ".
           05 line 18 col 01 value "   $$                                                                      $$   ".
           05 line 19 col 01 value "   $$                                                                      $$   ".
           05 line 20 col 01 value "   $$    [___________________________________________________________]     $$   ".
           05 line 21 col 01 value "   $$                                                                      $$   ".
           05 line 22 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".


           05 sc-op-7-num-1        line 06  col 25 pic 9(02)
           using ws-num-1          foreground-color 15.

           05 sc-op-7-num-2        line 06  col 30 pic 9(02)
           using ws-num-2          foreground-color 15.

           05 sc-op-7-num-3        line 06  col 35 pic 9(02)
           using ws-num-3          foreground-color 15.

           05 sc-op-7-num-4        line 06  col 40 pic 9(02)
           using ws-num-4          foreground-color 15.

           05 sc-op-7-num-5        line 06  col 45 pic 9(02)
           using ws-num-5          foreground-color 15.

           05 sc-op-7-num-6        line 06  col 50 pic 9(02)
           using ws-num-6          foreground-color 15.

           05 sc-op-7-num-7        line 06  col 55 pic 9(02)
           using ws-num-7          foreground-color 15.

           05 sc-confima-s         line 17  col 44 pic x(01)
           using ws-conf-sim       foreground-color 15.

           05 sc-confirma-n        line 17  col 52 pic x(01)
           using ws-conf-nao       foreground-color 15.

           05 sc-msg-erro          line 20  col 15 pic x(50)
           from  ws-msg-erro       foreground-color 15.


       01  sc-tela-aposta-oito-num.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 02 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".
           05 line 03 col 01 value "   $$                                                                      $$   ".
           05 line 04 col 01 value "   $$                Escolha os Oito Numeros da Sua Aposta:                $$   ".
           05 line 05 col 01 value "   $$                                                                      $$   ".
           05 line 06 col 01 value "   $$               [  ] [  ] [  ] [  ] [  ] [  ] [  ] [  ]                $$   ".
           05 line 07 col 01 value "   $$                                                                      $$   ".
           05 line 08 col 01 value "   $$                         Numeros da Loteria:                          $$   ".
           05 line 09 col 01 value "   $$               ________________________________________               $$   ".
           05 line 10 col 01 value "   $$               [01][02][03][04][05][06][07][08][09][10]               $$   ".
           05 line 11 col 01 value "   $$               [11][12][13][14][15][16][17][18][19][20]               $$   ".
           05 line 12 col 01 value "   $$               [21][22][23][24][25][26][27][28][29][30]               $$   ".
           05 line 13 col 01 value "   $$               [31][32][33][34][35][36][37][38][39][40]               $$   ".
           05 line 14 col 01 value "   $$               [41][42][43][44][45][46][47][48][49][50]               $$   ".
           05 line 15 col 01 value "   $$               [51][52][53][54][55][56][57][58][59][60]               $$   ".
           05 line 16 col 01 value "   $$                                                                      $$   ".
           05 line 17 col 01 value "   $$                   Deseja Confirmar? [ ]Sim  [ ]Nao                   $$   ".
           05 line 18 col 01 value "   $$                                                                      $$   ".
           05 line 19 col 01 value "   $$                                                                      $$   ".
           05 line 20 col 01 value "   $$    [___________________________________________________________]     $$   ".
           05 line 21 col 01 value "   $$                                                                      $$   ".
           05 line 22 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".


           05 sc-op-8-num-1        line 06  col 22 pic 9(02)
           using ws-num-1          foreground-color 15.

           05 sc-op-8-num-2        line 06  col 27 pic 9(02)
           using ws-num-2          foreground-color 15.

           05 sc-op-8-num-3        line 06  col 32 pic 9(02)
           using ws-num-3          foreground-color 15.

           05 sc-op-8-num-4        line 06  col 37 pic 9(02)
           using ws-num-4          foreground-color 15.

           05 sc-op-8-num-5        line 06  col 42 pic 9(02)
           using ws-num-5          foreground-color 15.

           05 sc-op-8-num-6        line 06  col 47 pic 9(02)
           using ws-num-6          foreground-color 15.

           05 sc-op-8-num-7        line 06  col 52 pic 9(02)
           using ws-num-7          foreground-color 15.

           05 sc-op-8-num-8        line 06  col 57 pic 9(02)
           using ws-num-8          foreground-color 15.

           05 sc-confima-s         line 17  col 44 pic x(01)
           using ws-conf-sim       foreground-color 15.

           05 sc-confirma-n        line 17  col 52 pic x(01)
           using ws-conf-nao       foreground-color 15.

           05 sc-msg-erro          line 20  col 15 pic x(50)
           from  ws-msg-erro       foreground-color 15.


       01  sc-tela-aposta-nove-num.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 02 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".
           05 line 03 col 01 value "   $$                                                                      $$   ".
           05 line 04 col 01 value "   $$                Escolha os Nove Numeros da Sua Aposta:                $$   ".
           05 line 05 col 01 value "   $$                                                                      $$   ".
           05 line 06 col 01 value "   $$             [  ] [  ] [  ] [  ] [  ] [  ] [  ] [  ] [  ]             $$   ".
           05 line 07 col 01 value "   $$                                                                      $$   ".
           05 line 08 col 01 value "   $$                         Numeros da Loteria:                          $$   ".
           05 line 09 col 01 value "   $$               ________________________________________               $$   ".
           05 line 10 col 01 value "   $$               [01][02][03][04][05][06][07][08][09][10]               $$   ".
           05 line 11 col 01 value "   $$               [11][12][13][14][15][16][17][18][19][20]               $$   ".
           05 line 12 col 01 value "   $$               [21][22][23][24][25][26][27][28][29][30]               $$   ".
           05 line 13 col 01 value "   $$               [31][32][33][34][35][36][37][38][39][40]               $$   ".
           05 line 14 col 01 value "   $$               [41][42][43][44][45][46][47][48][49][50]               $$   ".
           05 line 15 col 01 value "   $$               [51][52][53][54][55][56][57][58][59][60]               $$   ".
           05 line 16 col 01 value "   $$                                                                      $$   ".
           05 line 17 col 01 value "   $$                   Deseja Confirmar? [ ]Sim  [ ]Nao                   $$   ".
           05 line 18 col 01 value "   $$                                                                      $$   ".
           05 line 19 col 01 value "   $$                                                                      $$   ".
           05 line 20 col 01 value "   $$    [___________________________________________________________]     $$   ".
           05 line 21 col 01 value "   $$                                                                      $$   ".
           05 line 22 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".


           05 sc-op-9-num-1        line 06  col 20 pic 9(02)
           using ws-num-1          foreground-color 15.

           05 sc-op-9-num-2        line 06  col 25 pic 9(02)
           using ws-num-2          foreground-color 15.

           05 sc-op-9-num-3        line 06  col 30 pic 9(02)
           using ws-num-3          foreground-color 15.

           05 sc-op-9-num-4        line 06  col 35 pic 9(02)
           using ws-num-4          foreground-color 15.

           05 sc-op-9-num-5        line 06  col 40 pic 9(02)
           using ws-num-5          foreground-color 15.

           05 sc-op-9-num-6        line 06  col 45 pic 9(02)
           using ws-num-6          foreground-color 15.

           05 sc-op-9-num-7        line 06  col 50 pic 9(02)
           using ws-num-7          foreground-color 15.

           05 sc-op-9-num-8        line 06  col 55 pic 9(02)
           using ws-num-8          foreground-color 15.

           05 sc-op-9-num-9        line 06  col 60 pic 9(02)
           using ws-num-9          foreground-color 15.

           05 sc-confima-s         line 17  col 44 pic x(01)
           using ws-conf-sim       foreground-color 15.

           05 sc-confirma-n        line 17  col 52 pic x(01)
           using ws-conf-nao       foreground-color 15.

           05 sc-msg-erro          line 20  col 15 pic x(50)
           from  ws-msg-erro       foreground-color 15.


       01  sc-tela-aposta-dez-num.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 02 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".
           05 line 03 col 01 value "   $$                                                                      $$   ".
           05 line 04 col 01 value "   $$                Escolha os Dez Numeros da Sua Aposta:                 $$   ".
           05 line 05 col 01 value "   $$                                                                      $$   ".
           05 line 06 col 01 value "   $$          [  ] [  ] [  ] [  ] [  ] [  ] [  ] [  ] [  ] [  ]           $$   ".
           05 line 07 col 01 value "   $$                                                                      $$   ".
           05 line 08 col 01 value "   $$                         Numeros da Loteria:                          $$   ".
           05 line 09 col 01 value "   $$               ________________________________________               $$   ".
           05 line 10 col 01 value "   $$               [01][02][03][04][05][06][07][08][09][10]               $$   ".
           05 line 11 col 01 value "   $$               [11][12][13][14][15][16][17][18][19][20]               $$   ".
           05 line 12 col 01 value "   $$               [21][22][23][24][25][26][27][28][29][30]               $$   ".
           05 line 13 col 01 value "   $$               [31][32][33][34][35][36][37][38][39][40]               $$   ".
           05 line 14 col 01 value "   $$               [41][42][43][44][45][46][47][48][49][50]               $$   ".
           05 line 15 col 01 value "   $$               [51][52][53][54][55][56][57][58][59][60]               $$   ".
           05 line 16 col 01 value "   $$                                                                      $$   ".
           05 line 17 col 01 value "   $$                   Deseja Confirmar? [ ]Sim  [ ]Nao                   $$   ".
           05 line 18 col 01 value "   $$                                                                      $$   ".
           05 line 19 col 01 value "   $$                                                                      $$   ".
           05 line 20 col 01 value "   $$    [___________________________________________________________]     $$   ".
           05 line 21 col 01 value "   $$                                                                      $$   ".
           05 line 22 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".


           05 sc-op-10-num-1        line 06  col 17 pic 9(02)
           using ws-num-1          foreground-color 15.

           05 sc-op-10-num-2        line 06  col 22 pic 9(02)
           using ws-num-2          foreground-color 15.

           05 sc-op-10-num-3        line 06  col 27 pic 9(02)
           using ws-num-3          foreground-color 15.

           05 sc-op-10-num-4        line 06  col 32 pic 9(02)
           using ws-num-4          foreground-color 15.

           05 sc-op-10-num-5        line 06  col 37 pic 9(02)
           using ws-num-5          foreground-color 15.

           05 sc-op-10-num-6        line 06  col 42 pic 9(02)
           using ws-num-6          foreground-color 15.

           05 sc-op-10-num-7        line 06  col 47 pic 9(02)
           using ws-num-7          foreground-color 15.

           05 sc-op-10-num-8        line 06  col 52 pic 9(02)
           using ws-num-8          foreground-color 15.

           05 sc-op-10-num-9        line 06  col 57 pic 9(02)
           using ws-num-9          foreground-color 15.

           05 sc-op-10-num-10       line 06  col 62 pic 9(02)
           using ws-num-10         foreground-color 15.

           05 sc-confima-s         line 17  col 44 pic x(01)
           using ws-conf-sim       foreground-color 15.

           05 sc-confirma-n        line 17  col 52 pic x(01)
           using ws-conf-nao       foreground-color 15.

           05 sc-msg-erro          line 20  col 15 pic x(50)
           from  ws-msg-erro       foreground-color 15.

       01  sc-tela-resultado.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                    [ ]Sair     ".
           05 line 02 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".
           05 line 03 col 01 value "   $$                                                                      $$   ".
           05 line 04 col 01 value "   $$                         Resultado do Sorteio                         $$   ".
           05 line 05 col 01 value "   $$                                                                      $$   ".
           05 line 06 col 01 value "   $$                                                                      $$   ".
           05 line 07 col 01 value "   $$                          Numeros sorteados:                          $$   ".
           05 line 08 col 01 value "   $$                                                                      $$   ".
           05 line 09 col 01 value "   $$                    [  ] [  ] [  ] [  ] [  ] [  ]                     $$   ".
           05 line 10 col 01 value "   $$                                                                      $$   ".
           05 line 11 col 01 value "   $$                                                                      $$   ".
           05 line 12 col 01 value "   $$              Voce Apostou    Numeros. O Valor Pago Foi               $$   ".
           05 line 13 col 01 value "   $$              de R$       . A Quantidade de Sorteios                  $$   ".
           05 line 14 col 01 value "   $$              Realizados Ate o Acerto Foi de           .              $$   ".
           05 line 15 col 01 value "   $$                                                                      $$   ".
           05 line 16 col 01 value "   $$              Tempo Gasto Ate o Acerto:                               $$   ".
           05 line 17 col 01 value "   $$                                                                      $$   ".
           05 line 18 col 01 value "   $$                                                                      $$   ".
           05 line 19 col 01 value "   $$    [___________________________________________________________]     $$   ".
           05 line 20 col 01 value "   $$                                                                      $$   ".
           05 line 21 col 01 value "   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   ".

           05 sc-sair              line 01  col 70 pic x(01)
           using ws-fim-programa   foreground-color 12.

           05 sc-num-sort-1         line 09  col 27 pic 9(02)
           from  ws-sort-1         foreground-color 15.

           05 sc-num-sort-2        line 09  col 32 pic 9(02)
           from  ws-sort-2         foreground-color 15.

           05 sc-num-sort-3         line 09  col 37 pic 9(02)
           from  ws-sort-3         foreground-color 15.

           05 sc-num-sort-4         line 09  col 42 pic 9(02)
           from  ws-sort-4         foreground-color 15.

           05 sc-num-sort-5         line 09  col 47 pic 9(02)
           from  ws-sort-5         foreground-color 15.

           05 sc-num-sort-6         line 09  col 52 pic 9(02)
           from  ws-sort-6         foreground-color 15.

           05 sc-qtd-aposta         line 12  col 33 pic 9(02)
           from  ws-selecionado    foreground-color 15.

           05 sc-valor-pago         line 13  col 26 pic zz9,99
           from  ws-valor          foreground-color 15.

           05 sc-contagem           line 14  col 51 pic 9(10)
           from  ws-contagem       foreground-color 15.

           05 sc-tempo-gasto        line 16  col 46 pic x(08)
           from  ws-tempo-gasto    foreground-color 15.

           05 sc-msg-erro          line 19  col 15 pic x(50)
           from  ws-msg-erro       foreground-color 15.

      *>Declaração do corpo do programa
       Procedure Division.

           perform inicializa.
           perform procedimento.
           perform finaliza.

       inicializa section.


           .
       inicializa-exit.
           exit.

       *>======================================================================
       *>  Procedimento Inicial
       *>======================================================================

       procedimento section.

           perform until ws-sair

               move spaces to ws-seis              *> Inicializando váriaveis de tela
               move spaces to ws-sete
               move spaces to ws-oito
               move spaces to ws-nove
               move spaces to ws-dez
               move zero   to ws-selecionado
               move zero   to ws-valor
               move spaces to ws-conf-sim
               move spaces to ws-conf-nao
               move spaces to ws-msg-erro
               move zero   to ws-contagem

               display sc-tela-inicio              *> Entrada de quatidade de
               accept  sc-tela-inicio              *> números para apostar

               if ws-seis = "X"
               or ws-seis = "x" then               *> Caso o usuario queira apostar 6 numeros
                   perform until ws-conf-nao = "X"
                              or ws-conf-nao = "x"
                              or ws-contagem <> 0

                       move spaces to ws-conf-sim
                       move spaces to ws-conf-nao

                       if ws-conf-nao = spaces then   *> Mover valor e quantidade de numeros da aposta
                           move 06     to ws-selecionado
                           move 004,50 to ws-valor

                           display sc-tela-inicio     *> Apresentar valor e solicitar que o
                           accept  sc-tela-inicio     *> usuario confirme

                           if ws-conf-sim = "X"
                                       or = "x" then
                               perform aposta-seis-num   *> Desvio para a seção de aposta de 6 números
                               move spaces to ws-msg-erro
                           end-if
                       end-if
                   end-perform
               end-if

               if ws-sete = "X"
               or ws-sete = "x" then               *> Caso o usuario queira apostar 7 numeros
                   perform until ws-conf-nao = "X"
                              or ws-conf-nao = "x"
                              or ws-contagem <> 0

                       move spaces to ws-conf-sim
                       move spaces to ws-conf-nao

                       if ws-conf-nao = spaces then   *> Mover valor e quantidade de numeros da aposta
                           move 07     to ws-selecionado
                           move 031,50 to ws-valor

                           display sc-tela-inicio     *> Apresentar valor e solicitar que o
                           accept  sc-tela-inicio     *> usuario confirme

                           if ws-conf-sim = "X"
                                       or = "x" then
                               perform aposta-sete-num   *> Desvio para a seção de aposta de 7 números
                               move spaces to ws-msg-erro
                           end-if
                       end-if
                   end-perform
               end-if

               if ws-oito = "X"
               or ws-oito = "x" then               *> Caso o usuario queira apostar 8 numeros
                   perform until ws-conf-nao = "X"
                              or ws-conf-nao = "x"
                              or ws-contagem <> 0

                       move spaces to ws-conf-sim
                       move spaces to ws-conf-nao

                       if ws-conf-nao = spaces then   *> Mover valor e quantidade de numeros da aposta
                           move 08     to ws-selecionado
                           move 126,00 to ws-valor

                           display sc-tela-inicio     *> Apresentar valor e solicitar que o
                           accept  sc-tela-inicio     *> usuario confirme

                           if ws-conf-sim = "X"
                                       or = "x" then
                               perform aposta-oito-num   *> Desvio para a seção de aposta de 8 números
                               move spaces to ws-msg-erro
                           end-if
                       end-if
                   end-perform
               end-if

               if ws-nove = "X"
               or ws-nove = "x" then               *> Caso o usuario queira apostar 9 numeros
                   perform until ws-conf-nao = "X"
                              or ws-conf-nao = "x"
                              or ws-contagem <> 0

                       move spaces to ws-conf-sim
                       move spaces to ws-conf-nao

                       if ws-conf-nao = spaces then   *> Mover valor e quantidade de numeros da aposta
                           move 09     to ws-selecionado
                           move 378,00 to ws-valor

                           display sc-tela-inicio     *> Apresentar valor e solicitar que o
                           accept  sc-tela-inicio     *> usuario confirme

                           if ws-conf-sim = "X"
                                       or = "x" then
                               perform aposta-nove-num   *> Desvio para a seção de aposta de 9 números
                               move spaces to ws-msg-erro
                           end-if
                       end-if
                   end-perform
               end-if

               if ws-dez  = "X"
               or ws-dez  = "x" then               *> Caso o usuario queira apostar 10 numeros
                   perform until ws-conf-nao = "X"
                              or ws-conf-nao = "x"
                              or ws-contagem <> 0

                       move spaces to ws-conf-sim
                       move spaces to ws-conf-nao

                       if ws-conf-nao = spaces then   *> Mover valor e quantidade de numeros da aposta
                           move 10     to ws-selecionado
                           move 945,00 to ws-valor

                           display sc-tela-inicio     *> Apresentar valor e solicitar que o
                           accept  sc-tela-inicio     *> usuario confirme

                           if ws-conf-sim = "X"
                                       or = "x" then
                               perform aposta-dez-num    *> Desvio para a seção de aposta de 10 números
                               move spaces to ws-msg-erro
                           end-if
                       end-if
                   end-perform
               end-if

               if ws-contagem <> 0 then            *> Caso o sorteio já tenha ocorrido, mostrar os resultados
                   display sc-tela-resultado
                   accept  sc-tela-resultado
                   set ws-continua to true
               end-if

               move spaces to ws-msg-erro

           end-perform

           .
       procedimento-exit.
           exit.

       *>======================================================================
       *>  Procedimento para aposta de 6 numeros
       *>======================================================================

       aposta-seis-num section.

           set ws-nao-ok to true
           move spaces to ws-conf-sim
           move spaces to ws-conf-nao

           perform until ws-tudo-ok                *> Faça ate que todos os numeros estejam corretos
                      or ws-conf-nao = "X"         *> ou o usuario solicite nao confirmar
                      or ws-conf-nao = "x"

               display sc-tela-aposta-seis-num
               accept  sc-tela-aposta-seis-num

               move spaces to ws-msg-erro

               if ws-num-1 = 00                    *> Testar numeros para valida-los
               or ws-num-2 = 00
               or ws-num-3 = 00
               or ws-num-4 = 00
               or ws-num-5 = 00
               or ws-num-6 = 00
               or ws-num-1 = ws-num-2
               or ws-num-1 = ws-num-3
               or ws-num-1 = ws-num-4
               or ws-num-1 = ws-num-5
               or ws-num-1 = ws-num-6
               or ws-num-2 = ws-num-3
               or ws-num-2 = ws-num-4
               or ws-num-2 = ws-num-5
               or ws-num-2 = ws-num-6
               or ws-num-3 = ws-num-4
               or ws-num-3 = ws-num-5
               or ws-num-3 = ws-num-6
               or ws-num-4 = ws-num-5
               or ws-num-4 = ws-num-6
               or ws-num-5 = ws-num-6
               or ws-num-1 > 60
               or ws-num-2 > 60
               or ws-num-3 > 60
               or ws-num-4 > 60
               or ws-num-5 > 60
               or ws-num-6 > 60       then

                   move "Atencao, Numeros Invalidos ou Repetidos!" to ws-msg-erro
                   set ws-nao-ok  to true
               else
                   set ws-tudo-ok to true
               end-if

               if ws-tudo-ok then                  *> Quando os numeros estiverem todos corretos

                   call "programa2" using ws-sorteio,   *> Chamar o programa para fazer o sorteio
                                          ws-aposta,
                                          ws-dados-aposta
               end-if

           end-perform

           .
       aposta-seis-num-exit.
           exit.

       *>======================================================================
       *>  Procedimento para aposta de 7 numeros
       *>======================================================================

       aposta-sete-num section.

           set ws-nao-ok to true

           perform until ws-tudo-ok                *> Faça ate que todos os numeros estejam corretos
                      or ws-conf-nao = "X"         *> ou o usuario solicite nao confirmar
                      or ws-conf-nao = "x"

               move spaces to ws-conf-sim
               move spaces to ws-conf-nao


               display sc-tela-aposta-sete-num
               accept  sc-tela-aposta-sete-num

               move spaces to ws-msg-erro

               if ws-num-1 = 00                    *> Testar numeros para valida-los
               or ws-num-2 = 00
               or ws-num-3 = 00
               or ws-num-4 = 00
               or ws-num-5 = 00
               or ws-num-6 = 00
               or ws-num-7 = 00
               or ws-num-1 = ws-num-2
               or ws-num-1 = ws-num-3
               or ws-num-1 = ws-num-4
               or ws-num-1 = ws-num-5
               or ws-num-1 = ws-num-6
               or ws-num-1 = ws-num-7
               or ws-num-2 = ws-num-3
               or ws-num-2 = ws-num-4
               or ws-num-2 = ws-num-5
               or ws-num-2 = ws-num-6
               or ws-num-2 = ws-num-7
               or ws-num-3 = ws-num-4
               or ws-num-3 = ws-num-5
               or ws-num-3 = ws-num-6
               or ws-num-3 = ws-num-7
               or ws-num-4 = ws-num-5
               or ws-num-4 = ws-num-6
               or ws-num-4 = ws-num-7
               or ws-num-5 = ws-num-6
               or ws-num-5 = ws-num-7
               or ws-num-6 = ws-num-7
               or ws-num-1 > 60
               or ws-num-2 > 60
               or ws-num-3 > 60
               or ws-num-4 > 60
               or ws-num-5 > 60
               or ws-num-6 > 60
               or ws-num-7 > 60       then

                   move "Atencao, Numeros Invalidos ou Repetidos!" to ws-msg-erro
                   set ws-nao-ok  to true
               else
                   set ws-tudo-ok to true
               end-if

               if ws-tudo-ok then                  *> Quando os numeros estiverem todos corretos

                   call "programa2" using ws-sorteio,   *> Chamar o programa para fazer o sorteio
                                          ws-aposta,
                                          ws-dados-aposta
               end-if

           end-perform

           .
       aposta-sete-num-exit.
           exit.

       *>======================================================================
       *>  Procedimento para aposta de 8 numeros
       *>======================================================================

       aposta-oito-num section.

           set ws-nao-ok to true

           perform until ws-tudo-ok                *> Faça ate que todos os numeros estejam corretos
                      or ws-conf-nao = "X"         *> ou o usuario solicite nao confirmar
                      or ws-conf-nao = "x"

               move spaces to ws-conf-sim
               move spaces to ws-conf-nao

               display sc-tela-aposta-oito-num
               accept  sc-tela-aposta-oito-num

               move spaces to ws-msg-erro

               if ws-num-1 = 00                    *> Testar numeros para valida-los
               or ws-num-2 = 00
               or ws-num-3 = 00
               or ws-num-4 = 00
               or ws-num-5 = 00
               or ws-num-6 = 00
               or ws-num-7 = 00
               or ws-num-8 = 00
               or ws-num-1 = ws-num-2
               or ws-num-1 = ws-num-3
               or ws-num-1 = ws-num-4
               or ws-num-1 = ws-num-5
               or ws-num-1 = ws-num-6
               or ws-num-1 = ws-num-7
               or ws-num-1 = ws-num-8
               or ws-num-2 = ws-num-3
               or ws-num-2 = ws-num-4
               or ws-num-2 = ws-num-5
               or ws-num-2 = ws-num-6
               or ws-num-2 = ws-num-7
               or ws-num-2 = ws-num-8
               or ws-num-3 = ws-num-4
               or ws-num-3 = ws-num-5
               or ws-num-3 = ws-num-6
               or ws-num-3 = ws-num-7
               or ws-num-3 = ws-num-8
               or ws-num-4 = ws-num-5
               or ws-num-4 = ws-num-6
               or ws-num-4 = ws-num-8
               or ws-num-4 = ws-num-7
               or ws-num-5 = ws-num-6
               or ws-num-5 = ws-num-7
               or ws-num-5 = ws-num-8
               or ws-num-6 = ws-num-7
               or ws-num-6 = ws-num-8
               or ws-num-7 = ws-num-8
               or ws-num-1 > 60
               or ws-num-2 > 60
               or ws-num-3 > 60
               or ws-num-4 > 60
               or ws-num-5 > 60
               or ws-num-6 > 60
               or ws-num-7 > 60
               or ws-num-8 > 60        then

                   move "Atencao, Numeros Invalidos ou Repetidos!" to ws-msg-erro
                   set ws-nao-ok  to true
               else
                   set ws-tudo-ok to true
               end-if

               if ws-tudo-ok then                  *> Quando os numeros estiverem todos corretos

                   call "programa2" using ws-sorteio,   *> Chamar o programa para fazer o sorteio
                                          ws-aposta,
                                          ws-dados-aposta
               end-if

           end-perform

           .
       aposta-oito-num-exit.
           exit.

       *>======================================================================
       *>  Procedimento para aposta de 9 numeros
       *>======================================================================

       aposta-nove-num section.

           set ws-nao-ok to true

           perform until ws-tudo-ok                *> Faça ate que todos os numeros estejam corretos
                      or ws-conf-nao = "X"         *> ou o usuario solicite nao confirmar
                      or ws-conf-nao = "x"

               move spaces to ws-conf-sim
               move spaces to ws-conf-nao

               display sc-tela-aposta-nove-num
               accept  sc-tela-aposta-nove-num

               move spaces to ws-msg-erro

               if ws-num-1 = 00                    *> Testar numeros para valida-los
               or ws-num-2 = 00
               or ws-num-3 = 00
               or ws-num-4 = 00
               or ws-num-5 = 00
               or ws-num-6 = 00
               or ws-num-7 = 00
               or ws-num-8 = 00
               or ws-num-9 = 00
               or ws-num-1 = ws-num-2
               or ws-num-1 = ws-num-3
               or ws-num-1 = ws-num-4
               or ws-num-1 = ws-num-5
               or ws-num-1 = ws-num-6
               or ws-num-1 = ws-num-7
               or ws-num-1 = ws-num-8
               or ws-num-1 = ws-num-9
               or ws-num-2 = ws-num-3
               or ws-num-2 = ws-num-4
               or ws-num-2 = ws-num-5
               or ws-num-2 = ws-num-6
               or ws-num-2 = ws-num-7
               or ws-num-2 = ws-num-8
               or ws-num-2 = ws-num-9
               or ws-num-3 = ws-num-4
               or ws-num-3 = ws-num-5
               or ws-num-3 = ws-num-6
               or ws-num-3 = ws-num-7
               or ws-num-3 = ws-num-8
               or ws-num-3 = ws-num-9
               or ws-num-4 = ws-num-5
               or ws-num-4 = ws-num-6
               or ws-num-4 = ws-num-7
               or ws-num-4 = ws-num-8
               or ws-num-4 = ws-num-9
               or ws-num-5 = ws-num-6
               or ws-num-5 = ws-num-7
               or ws-num-5 = ws-num-8
               or ws-num-5 = ws-num-9
               or ws-num-6 = ws-num-7
               or ws-num-6 = ws-num-8
               or ws-num-6 = ws-num-9
               or ws-num-7 = ws-num-8
               or ws-num-7 = ws-num-9
               or ws-num-8 = ws-num-9
               or ws-num-1 > 60
               or ws-num-2 > 60
               or ws-num-3 > 60
               or ws-num-4 > 60
               or ws-num-5 > 60
               or ws-num-6 > 60
               or ws-num-7 > 60
               or ws-num-8 > 60
               or ws-num-9 > 60        then

                   move "Atencao, Numeros Invalidos ou Repetidos!" to ws-msg-erro
                   set ws-nao-ok  to true
               else
                   set ws-tudo-ok to true
               end-if

               if ws-tudo-ok then                  *> Quando os numeros estiverem todos corretos

                   call "programa2" using ws-sorteio,   *> Chamar o programa para fazer o sorteio
                                          ws-aposta,
                                          ws-dados-aposta
               end-if

           end-perform

           .
       aposta-nove-num-exit.
           exit.

       *>======================================================================
       *>  Procedimento para aposta de 10 numeros
       *>======================================================================

       aposta-dez-num section.

           set ws-nao-ok to true

           perform until ws-tudo-ok                *> Faça ate que todos os numeros estejam corretos
                      or ws-conf-nao = "X"         *> ou o usuario solicite nao confirmar
                      or ws-conf-nao = "x"

               move spaces to ws-conf-sim
               move spaces to ws-conf-nao

               display sc-tela-aposta-dez-num
               accept  sc-tela-aposta-dez-num

               move spaces to ws-msg-erro

               if ws-num-1 = 00                    *> Testar numeros para valida-los
               or ws-num-2 = 00
               or ws-num-3 = 00
               or ws-num-4 = 00
               or ws-num-5 = 00
               or ws-num-6 = 00
               or ws-num-7 = 00
               or ws-num-8 = 00
               or ws-num-9 = 00
               or ws-num-10 = 00
               or ws-num-1 = ws-num-2
               or ws-num-1 = ws-num-3
               or ws-num-1 = ws-num-4
               or ws-num-1 = ws-num-5
               or ws-num-1 = ws-num-6
               or ws-num-1 = ws-num-7
               or ws-num-1 = ws-num-8
               or ws-num-1 = ws-num-9
               or ws-num-1 = ws-num-10
               or ws-num-2 = ws-num-3
               or ws-num-2 = ws-num-4
               or ws-num-2 = ws-num-5
               or ws-num-2 = ws-num-6
               or ws-num-2 = ws-num-7
               or ws-num-2 = ws-num-8
               or ws-num-2 = ws-num-9
               or ws-num-2 = ws-num-10
               or ws-num-3 = ws-num-4
               or ws-num-3 = ws-num-5
               or ws-num-3 = ws-num-6
               or ws-num-3 = ws-num-7
               or ws-num-3 = ws-num-8
               or ws-num-3 = ws-num-9
               or ws-num-3 = ws-num-10
               or ws-num-4 = ws-num-5
               or ws-num-4 = ws-num-6
               or ws-num-4 = ws-num-7
               or ws-num-4 = ws-num-8
               or ws-num-4 = ws-num-9
               or ws-num-4 = ws-num-10
               or ws-num-5 = ws-num-6
               or ws-num-5 = ws-num-7
               or ws-num-5 = ws-num-8
               or ws-num-5 = ws-num-9
               or ws-num-5 = ws-num-10
               or ws-num-6 = ws-num-7
               or ws-num-6 = ws-num-8
               or ws-num-6 = ws-num-9
               or ws-num-6 = ws-num-10
               or ws-num-7 = ws-num-8
               or ws-num-7 = ws-num-9
               or ws-num-7 = ws-num-10
               or ws-num-8 = ws-num-9
               or ws-num-8 = ws-num-10
               or ws-num-9 = ws-num-10
               or ws-num-1 > 60
               or ws-num-2 > 60
               or ws-num-3 > 60
               or ws-num-4 > 60
               or ws-num-5 > 60
               or ws-num-6 > 60
               or ws-num-7 > 60
               or ws-num-8 > 60
               or ws-num-9 > 60
               or ws-num-10 > 60 then

                   move "Atencao, Numeros Invalidos ou Repetidos!" to ws-msg-erro
                   set ws-nao-ok  to true
               else
                   set ws-tudo-ok to true
               end-if

               if ws-tudo-ok then                  *> Quando os numeros estiverem todos corretos

                   call "programa2" using ws-sorteio,   *> Chamar o programa para fazer o sorteio
                                          ws-aposta,
                                          ws-dados-aposta
               end-if

           end-perform

           .
       aposta-dez-num-exit.
           exit.

       finaliza section.

           Stop Run.

           .
       finaliza-exit.
           exit.








