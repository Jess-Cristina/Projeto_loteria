      $set sourceformat"free"

      *>Divisão de identificação do programa
       Identification Division.
       Program-id. "Programa2". *> Projeto loteria
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

       01  ws-h-inicio.
           05  ws-hora-inicio                      pic 9(02).
           05  ws-min-inicio                       pic 9(02).
           05  ws-seg-inicio                       pic 9(02).

       01  ws-h-termino.
           05  ws-hora-termino                     pic 9(02).
           05  ws-min-termino                      pic 9(02).
           05  ws-seg-termino                      pic 9(02).

       01  ws-relogio.
           05  ws-hora-rel                         pic 9(02).
           05  ws-min-rel                          pic 9(02).
           05  ws-seg-rel                          pic 9(02).
           05  ws-mil-seg                          pic 9(02).

       77  ws-semente                              pic 9(08).

       77  ws-semente-2                            pic 9(08).

       77  ws-semente-3                            pic 9(08).

       77  ws-semente-4                            pic 9(08).

       77  ws-num-random                           pic 9(01)v9(08).

       77  ws-num-sort                             pic 9(02) value 0.

       77  ws-qtd-acerto                           pic 9(01) value 0.

       77  ws-aux-1                                pic 9(06).

       77  ws-aux-2                                pic 9(06).

       77  ws-aux-3                                pic 9(06).

      *>----Variaveis para comunicação entre programas
       Linkage Section.

       01  lk-sorteio.
           05  lk-sort-1                           pic 9(02).
           05  filler                              pic x(03) value "   ".
           05  lk-sort-2                           pic 9(02).
           05  filler                              pic x(03) value "   ".
           05  lk-sort-3                           pic 9(02).
           05  filler                              pic x(03) value "   ".
           05  lk-sort-4                           pic 9(02).
           05  filler                              pic x(03) value "   ".
           05  lk-sort-5                           pic 9(02).
           05  filler                              pic x(03) value "   ".
           05  lk-sort-6                           pic 9(02).

       01  lk-aposta.
           05  lk-num-1                            pic 9(02).
           05  lk-num-2                            pic 9(02).
           05  lk-num-3                            pic 9(02).
           05  lk-num-4                            pic 9(02).
           05  lk-num-5                            pic 9(02).
           05  lk-num-6                            pic 9(02).
           05  lk-num-7                            pic 9(02).
           05  lk-num-8                            pic 9(02).
           05  lk-num-9                            pic 9(02).
           05  lk-num-10                           pic 9(02).

       01  lk-dados-aposta.
           05  lk-qtd-num.
               10  lk-seis                         pic x(01).
               10  lk-sete                         pic x(01).
               10  lk-oito                         pic x(01).
               10  lk-nove                         pic x(01).
               10  lk-dez                          pic x(01).
           05  lk-valor                            pic zz9,99.
           05  lk-selecionado                      pic 9(02).
           05  lk-confirma.
               10  lk-conf-sim                     pic x(01).
               10  lk-conf-nao                     pic x(01).
           05  lk-confere                          pic x(01).
               88  lk-tudo-ok                      value "s".
               88  lk-nao-ok                       value "n".
           05  lk-msg-erro                         pic x(50).
           05  lk-tempo.
               10  lk-hora                         pic 9(02).
               10  lk-min                          pic 9(02).
               10  lk-seg                          pic 9(02).
           05  lk-tempo-gasto.
               10  lk-hora-g                       pic 9(02).
               10  filler                          pic x(01) value":".
               10  lk-min-g                        pic 9(02).
               10  filler                          pic x(01) value":".
               10  lk-seg-g                        pic 9(02).
           05  lk-contagem                         pic 9(10).

      *>----Declaração de tela
       Screen Section.



      *>Declaração do corpo do programa
       Procedure Division using lk-sorteio,
                                lk-aposta,
                                lk-dados-aposta.

           perform inicializa.
           perform procedimento.
           perform finaliza.

       inicializa section.

           accept ws-h-inicio from time

           .
       inicializa-exit.
           exit.

       procedimento section.

           evaluate lk-selecionado        *> Escolher seção referente a quantidade de números jogados
               when = 06
                   perform sorteio-06
               when = 07
                   perform sorteio-07
               when = 08
                   perform sorteio-08
               when = 09
                   perform sorteio-09
               when = 10
                   perform sorteio-10
           end-evaluate

           perform calcula-tampo-gasto             *> Ao final, deviar para a seção de calculo de tempo gasto

           .
       procedimento-exit.
           exit.

       *>======================================================================
       *>  Sorteio de 10 Numeros
       *>======================================================================

       sorteio-06 section.

           move zero to lk-contagem
           display erase

           perform until ws-qtd-acerto = 6         *> Rodar até atingir os 6 acertos
               move zero to ws-qtd-acerto

               perform until ws-num-sort <> lk-sort-6

                   perform sorteio-num             *> Sortear numero 1

               end-perform

               move ws-num-sort to lk-sort-1

               perform until ws-num-sort <> lk-sort-1

                   perform sorteio-num             *> Sortear numero 2

               end-perform

               move ws-num-sort to lk-sort-2


               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2

                   perform sorteio-num             *> Sortear numero 3

               end-perform

               move ws-num-sort to lk-sort-3

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3

                   perform sorteio-num             *> Sortear numero 4

               end-perform

               move ws-num-sort to lk-sort-4

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3
                         and ws-num-sort <> lk-sort-4

                   perform sorteio-num             *> Sortear numero 5

               end-perform

               move ws-num-sort to lk-sort-5

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3
                         and ws-num-sort <> lk-sort-4
                         and ws-num-sort <> lk-sort-5

                   perform sorteio-num             *> Sortear numero 6

               end-perform

               move ws-num-sort to lk-sort-6

       *>======================================================================
       *>  Testar Quantos Numeros Foram Acertados
       *>======================================================================

               if lk-sort-1 = lk-num-1
               or lk-sort-1 = lk-num-2
               or lk-sort-1 = lk-num-3
               or lk-sort-1 = lk-num-4
               or lk-sort-1 = lk-num-5
               or lk-sort-1 = lk-num-6 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-2 = lk-num-1
               or lk-sort-2 = lk-num-2
               or lk-sort-2 = lk-num-3
               or lk-sort-2 = lk-num-4
               or lk-sort-2 = lk-num-5
               or lk-sort-2 = lk-num-6 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-3 = lk-num-1
               or lk-sort-3 = lk-num-2
               or lk-sort-3 = lk-num-3
               or lk-sort-3 = lk-num-4
               or lk-sort-3 = lk-num-5
               or lk-sort-3 = lk-num-6 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-4 = lk-num-1
               or lk-sort-4 = lk-num-2
               or lk-sort-4 = lk-num-3
               or lk-sort-4 = lk-num-4
               or lk-sort-4 = lk-num-5
               or lk-sort-4 = lk-num-6 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-5 = lk-num-1
               or lk-sort-5 = lk-num-2
               or lk-sort-5 = lk-num-3
               or lk-sort-5 = lk-num-4
               or lk-sort-5 = lk-num-5
               or lk-sort-5 = lk-num-6 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-6 = lk-num-1
               or lk-sort-6 = lk-num-2
               or lk-sort-6 = lk-num-3
               or lk-sort-6 = lk-num-4
               or lk-sort-6 = lk-num-5
               or lk-sort-6 = lk-num-6 then

                   add 1 to ws-qtd-acerto

               end-if


               add  1 to lk-contagem
               display lk-sorteio
               display lk-contagem

           end-perform

           .
       sorteio-06-exit.
           exit.

       *>======================================================================
       *>  Sorteio de 7 Numeros
       *>======================================================================

       sorteio-07 section.

           move zero to lk-contagem
           display erase

           perform until ws-qtd-acerto >= 6        *> Rodar até atingir os 6 acertos
               move zero to ws-qtd-acerto

               perform until ws-num-sort <> lk-sort-6

                   perform sorteio-num             *> Sortear numero 1

               end-perform

               move ws-num-sort to lk-sort-1

               perform until ws-num-sort <> lk-sort-1

                   perform sorteio-num             *> Sortear numero 2

               end-perform

               move ws-num-sort to lk-sort-2


               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2

                   perform sorteio-num             *> Sortear numero 3

               end-perform

               move ws-num-sort to lk-sort-3

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3

                   perform sorteio-num             *> Sortear numero 4

               end-perform

               move ws-num-sort to lk-sort-4

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3
                         and ws-num-sort <> lk-sort-4

                   perform sorteio-num             *> Sortear numero 5

               end-perform

               move ws-num-sort to lk-sort-5

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3
                         and ws-num-sort <> lk-sort-4
                         and ws-num-sort <> lk-sort-5

                   perform sorteio-num             *> Sortear numero 6

               end-perform

               move ws-num-sort to lk-sort-6

       *>======================================================================
       *>  Testar Quantos Numeros Foram Acertados
       *>======================================================================

               if lk-sort-1 = lk-num-1
               or lk-sort-1 = lk-num-2
               or lk-sort-1 = lk-num-3
               or lk-sort-1 = lk-num-4
               or lk-sort-1 = lk-num-5
               or lk-sort-1 = lk-num-6
               or lk-sort-1 = lk-num-7 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-2 = lk-num-1
               or lk-sort-2 = lk-num-2
               or lk-sort-2 = lk-num-3
               or lk-sort-2 = lk-num-4
               or lk-sort-2 = lk-num-5
               or lk-sort-2 = lk-num-6
               or lk-sort-2 = lk-num-7 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-3 = lk-num-1
               or lk-sort-3 = lk-num-2
               or lk-sort-3 = lk-num-3
               or lk-sort-3 = lk-num-4
               or lk-sort-3 = lk-num-5
               or lk-sort-3 = lk-num-6
               or lk-sort-3 = lk-num-7 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-4 = lk-num-1
               or lk-sort-4 = lk-num-2
               or lk-sort-4 = lk-num-3
               or lk-sort-4 = lk-num-4
               or lk-sort-4 = lk-num-5
               or lk-sort-4 = lk-num-6
               or lk-sort-4 = lk-num-7 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-5 = lk-num-1
               or lk-sort-5 = lk-num-2
               or lk-sort-5 = lk-num-3
               or lk-sort-5 = lk-num-4
               or lk-sort-5 = lk-num-5
               or lk-sort-5 = lk-num-6
               or lk-sort-5 = lk-num-7 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-6 = lk-num-1
               or lk-sort-6 = lk-num-2
               or lk-sort-6 = lk-num-3
               or lk-sort-6 = lk-num-4
               or lk-sort-6 = lk-num-5
               or lk-sort-6 = lk-num-6
               or lk-sort-6 = lk-num-7 then

                   add 1 to ws-qtd-acerto

               end-if


               add  1 to lk-contagem
               display lk-sorteio
               display lk-contagem

           end-perform

           .
       sorteio-07-exit.
           exit.

       *>======================================================================
       *>  Sorteio de 8 Numeros
       *>======================================================================

       sorteio-08 section.

           move zero to lk-contagem                *> Rodar até atingir os 6 acertos
           display erase

           perform until ws-qtd-acerto >= 6
               move zero to ws-qtd-acerto

               perform until ws-num-sort <> lk-sort-6

                   perform sorteio-num             *> Sortear numero 1

               end-perform

               move ws-num-sort to lk-sort-1

               perform until ws-num-sort <> lk-sort-1

                   perform sorteio-num             *> Sortear numero 2

               end-perform

               move ws-num-sort to lk-sort-2


               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2

                   perform sorteio-num             *> Sortear numero 3

               end-perform

               move ws-num-sort to lk-sort-3

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3

                   perform sorteio-num             *> Sortear numero 4

               end-perform

               move ws-num-sort to lk-sort-4

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3
                         and ws-num-sort <> lk-sort-4

                   perform sorteio-num             *> Sortear numero 5

               end-perform

               move ws-num-sort to lk-sort-5

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3
                         and ws-num-sort <> lk-sort-4
                         and ws-num-sort <> lk-sort-5

                   perform sorteio-num             *> Sortear numero 6

               end-perform

               move ws-num-sort to lk-sort-6

       *>======================================================================
       *>  Testar Quantos Numeros Foram Acertados
       *>======================================================================

               if lk-sort-1 = lk-num-1
               or lk-sort-1 = lk-num-2
               or lk-sort-1 = lk-num-3
               or lk-sort-1 = lk-num-4
               or lk-sort-1 = lk-num-5
               or lk-sort-1 = lk-num-6
               or lk-sort-1 = lk-num-7
               or lk-sort-1 = lk-num-8 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-2 = lk-num-1
               or lk-sort-2 = lk-num-2
               or lk-sort-2 = lk-num-3
               or lk-sort-2 = lk-num-4
               or lk-sort-2 = lk-num-5
               or lk-sort-2 = lk-num-6
               or lk-sort-2 = lk-num-7
               or lk-sort-2 = lk-num-8 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-3 = lk-num-1
               or lk-sort-3 = lk-num-2
               or lk-sort-3 = lk-num-3
               or lk-sort-3 = lk-num-4
               or lk-sort-3 = lk-num-5
               or lk-sort-3 = lk-num-6
               or lk-sort-3 = lk-num-7
               or lk-sort-3 = lk-num-8 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-4 = lk-num-1
               or lk-sort-4 = lk-num-2
               or lk-sort-4 = lk-num-3
               or lk-sort-4 = lk-num-4
               or lk-sort-4 = lk-num-5
               or lk-sort-4 = lk-num-6
               or lk-sort-4 = lk-num-7
               or lk-sort-4 = lk-num-8 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-5 = lk-num-1
               or lk-sort-5 = lk-num-2
               or lk-sort-5 = lk-num-3
               or lk-sort-5 = lk-num-4
               or lk-sort-5 = lk-num-5
               or lk-sort-5 = lk-num-6
               or lk-sort-5 = lk-num-7
               or lk-sort-5 = lk-num-8 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-6 = lk-num-1
               or lk-sort-6 = lk-num-2
               or lk-sort-6 = lk-num-3
               or lk-sort-6 = lk-num-4
               or lk-sort-6 = lk-num-5
               or lk-sort-6 = lk-num-6
               or lk-sort-6 = lk-num-7
               or lk-sort-6 = lk-num-8 then

                   add 1 to ws-qtd-acerto

               end-if


               add  1 to lk-contagem
               display lk-sorteio
               display lk-contagem

           end-perform

           accept lk-selecionado

           .
       sorteio-08-exit.
           exit.

       *>======================================================================
       *>  Sorteio de 9 Numeros
       *>======================================================================

       sorteio-09 section.

           move zero to lk-contagem
           display erase

           perform until ws-qtd-acerto >= 6        *> Rodar até atingir os 6 acertos
               move zero to ws-qtd-acerto

               perform until ws-num-sort <> lk-sort-6

                   perform sorteio-num             *> Sortear numero 1

               end-perform

               move ws-num-sort to lk-sort-1

               perform until ws-num-sort <> lk-sort-1

                   perform sorteio-num             *> Sortear numero 2

               end-perform

               move ws-num-sort to lk-sort-2


               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2

                   perform sorteio-num             *> Sortear numero 3

               end-perform

               move ws-num-sort to lk-sort-3

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3

                   perform sorteio-num             *> Sortear numero 4

               end-perform

               move ws-num-sort to lk-sort-4

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3
                         and ws-num-sort <> lk-sort-4

                   perform sorteio-num             *> Sortear numero 5

               end-perform

               move ws-num-sort to lk-sort-5

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3
                         and ws-num-sort <> lk-sort-4
                         and ws-num-sort <> lk-sort-5

                   perform sorteio-num             *> Sortear numero 6

               end-perform

               move ws-num-sort to lk-sort-6

       *>======================================================================
       *>  Testar Quantos Numeros Foram Acertados
       *>======================================================================

               if lk-sort-1 = lk-num-1
               or lk-sort-1 = lk-num-2
               or lk-sort-1 = lk-num-3
               or lk-sort-1 = lk-num-4
               or lk-sort-1 = lk-num-5
               or lk-sort-1 = lk-num-6
               or lk-sort-1 = lk-num-7
               or lk-sort-1 = lk-num-8
               or lk-sort-1 = lk-num-9 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-2 = lk-num-1
               or lk-sort-2 = lk-num-2
               or lk-sort-2 = lk-num-3
               or lk-sort-2 = lk-num-4
               or lk-sort-2 = lk-num-5
               or lk-sort-2 = lk-num-6
               or lk-sort-2 = lk-num-7
               or lk-sort-2 = lk-num-8
               or lk-sort-2 = lk-num-9 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-3 = lk-num-1
               or lk-sort-3 = lk-num-2
               or lk-sort-3 = lk-num-3
               or lk-sort-3 = lk-num-4
               or lk-sort-3 = lk-num-5
               or lk-sort-3 = lk-num-6
               or lk-sort-3 = lk-num-7
               or lk-sort-3 = lk-num-8
               or lk-sort-3 = lk-num-9 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-4 = lk-num-1
               or lk-sort-4 = lk-num-2
               or lk-sort-4 = lk-num-3
               or lk-sort-4 = lk-num-4
               or lk-sort-4 = lk-num-5
               or lk-sort-4 = lk-num-6
               or lk-sort-4 = lk-num-7
               or lk-sort-4 = lk-num-8
               or lk-sort-4 = lk-num-9 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-5 = lk-num-1
               or lk-sort-5 = lk-num-2
               or lk-sort-5 = lk-num-3
               or lk-sort-5 = lk-num-4
               or lk-sort-5 = lk-num-5
               or lk-sort-5 = lk-num-6
               or lk-sort-5 = lk-num-7
               or lk-sort-5 = lk-num-8
               or lk-sort-5 = lk-num-9 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-6 = lk-num-1
               or lk-sort-6 = lk-num-2
               or lk-sort-6 = lk-num-3
               or lk-sort-6 = lk-num-4
               or lk-sort-6 = lk-num-5
               or lk-sort-6 = lk-num-6
               or lk-sort-6 = lk-num-7
               or lk-sort-6 = lk-num-8
               or lk-sort-6 = lk-num-9 then

                   add 1 to ws-qtd-acerto

               end-if


               add  1 to lk-contagem
               display lk-sorteio
               display lk-contagem

           end-perform

           .
       sorteio-09-exit.
           exit.

       *>======================================================================
       *>  Sorteio de 10 Numeros
       *>======================================================================

       sorteio-10 section.

           move zero to lk-contagem
           display erase

           perform until ws-qtd-acerto >= 6        *> Rodar até atingir os 6 acertos
               move zero to ws-qtd-acerto

               perform until ws-num-sort <> lk-sort-6

                   perform sorteio-num             *> Sortear numero 1

               end-perform

               move ws-num-sort to lk-sort-1

               perform until ws-num-sort <> lk-sort-1

                   perform sorteio-num             *> Sortear numero 2

               end-perform

               move ws-num-sort to lk-sort-2


               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2

                   perform sorteio-num             *> Sortear numero 3

               end-perform

               move ws-num-sort to lk-sort-3

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3

                   perform sorteio-num             *> Sortear numero 4

               end-perform

               move ws-num-sort to lk-sort-4

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3
                         and ws-num-sort <> lk-sort-4

                   perform sorteio-num             *> Sortear numero 5

               end-perform

               move ws-num-sort to lk-sort-5

               perform until ws-num-sort <> lk-sort-1
                         and ws-num-sort <> lk-sort-2
                         and ws-num-sort <> lk-sort-3
                         and ws-num-sort <> lk-sort-4
                         and ws-num-sort <> lk-sort-5

                   perform sorteio-num             *> Sortear numero 6

               end-perform

               move ws-num-sort to lk-sort-6

       *>======================================================================
       *>  Testar Quantos Numeros Foram Acertados
       *>======================================================================

               if lk-sort-1 = lk-num-1
               or lk-sort-1 = lk-num-2
               or lk-sort-1 = lk-num-3
               or lk-sort-1 = lk-num-4
               or lk-sort-1 = lk-num-5
               or lk-sort-1 = lk-num-6
               or lk-sort-1 = lk-num-7
               or lk-sort-1 = lk-num-8
               or lk-sort-1 = lk-num-9
               or lk-sort-1 = lk-num-10 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-2 = lk-num-1
               or lk-sort-2 = lk-num-2
               or lk-sort-2 = lk-num-3
               or lk-sort-2 = lk-num-4
               or lk-sort-2 = lk-num-5
               or lk-sort-2 = lk-num-6
               or lk-sort-2 = lk-num-7
               or lk-sort-2 = lk-num-8
               or lk-sort-2 = lk-num-9
               or lk-sort-2 = lk-num-10 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-3 = lk-num-1
               or lk-sort-3 = lk-num-2
               or lk-sort-3 = lk-num-3
               or lk-sort-3 = lk-num-4
               or lk-sort-3 = lk-num-5
               or lk-sort-3 = lk-num-6
               or lk-sort-3 = lk-num-7
               or lk-sort-3 = lk-num-8
               or lk-sort-3 = lk-num-9
               or lk-sort-3 = lk-num-10 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-4 = lk-num-1
               or lk-sort-4 = lk-num-2
               or lk-sort-4 = lk-num-3
               or lk-sort-4 = lk-num-4
               or lk-sort-4 = lk-num-5
               or lk-sort-4 = lk-num-6
               or lk-sort-4 = lk-num-7
               or lk-sort-4 = lk-num-8
               or lk-sort-4 = lk-num-9
               or lk-sort-4 = lk-num-10 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-5 = lk-num-1
               or lk-sort-5 = lk-num-2
               or lk-sort-5 = lk-num-3
               or lk-sort-5 = lk-num-4
               or lk-sort-5 = lk-num-5
               or lk-sort-5 = lk-num-6
               or lk-sort-5 = lk-num-7
               or lk-sort-5 = lk-num-8
               or lk-sort-5 = lk-num-9
               or lk-sort-5 = lk-num-10 then

                   add 1 to ws-qtd-acerto

               end-if

               if lk-sort-6 = lk-num-1
               or lk-sort-6 = lk-num-2
               or lk-sort-6 = lk-num-3
               or lk-sort-6 = lk-num-4
               or lk-sort-6 = lk-num-5
               or lk-sort-6 = lk-num-6
               or lk-sort-6 = lk-num-7
               or lk-sort-6 = lk-num-8
               or lk-sort-6 = lk-num-9
               or lk-sort-6 = lk-num-10 then

                   add 1 to ws-qtd-acerto

               end-if


               add  1 to lk-contagem
               display lk-sorteio
               display lk-contagem

           end-perform

           .
       sorteio-10-exit.
           exit.

       *>======================================================================
       *>  Sortear Numeros
       *>======================================================================

       sorteio-num section.

           move zero to ws-num-sort

           perform until ws-num-sort > 00          *> Sortear ate que o numero seja maior do que 0

               accept  ws-relogio from time
               move    ws-relogio to ws-semente-2
               accept  ws-relogio from time
               move    ws-relogio to ws-semente-3

               multiply ws-semente-2 by ws-semente-3 giving ws-semente
               multiply ws-semente   by 5682         giving ws-semente-4
               multiply ws-semente-4 by 9247         giving ws-semente

               compute ws-num-random = function random(ws-semente)

               multiply ws-num-random by 60 giving ws-num-sort

           end-perform


           .
       sorteio-num-exit.
           exit.

       *>======================================================================
       *>  Calcular Tempo Gasto no Sorteio
       *>======================================================================

       calcula-tampo-gasto section.

           accept ws-h-termino from time

           move ws-h-inicio  to ws-aux-2
           move ws-h-termino to ws-aux-3

           compute ws-aux-1 = ws-aux-3 - ws-aux-2

           move ws-aux-1 to lk-tempo
           move lk-hora  to lk-hora-g
           move lk-min   to lk-min-g
           move lk-seg   to lk-seg-g

           .
       calcula-tampo-gasto-exit.
           exit.

       finaliza section.

           exit program

           .
       finaliza-exit.
           exit.








