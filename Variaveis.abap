*&---------------------------------------------------------------------*
*& Report  YCURSO_VARIAVEIS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_variaveis.

* calcula soma
DATA: var1 TYPE i.
var1 = 2 + 2.
WRITE:/ 'Soma: ', var1. "Soma: 4


"_________________________________

DATA(var2) = 2 + 2.
WRITE:/ 'soma: ', var2.
WRITE:/ 'soma: ' & '4'.
cl_demo_output=>write('Soma').
cl_demo_output=>display( ). "Abre pop-up com oq está no buffer (método write) e exibe.
cl_demo_output=>display( var2 ). "Inclui o valor da variável e o nome dela também é exibido
*No caso são exibidas duas popups começando pela a primeira e ao fechar a segunda aparece
DATA(num) = '1234.11'.
WRITE num.

* Como declarar o tamanho de um tipo C ou N ?
*CTRL + < COMENTA E CTRL + > DESCOMENTA

*tipos
* numerico I F P
* texto    C N
*Data      D
*Hora      T

DATA: varint TYPE i VALUE 123,
      varf   TYPE f VALUE '10.5',
      varp   TYPE p VALUE '5.8',
      varc   TYPE c LENGTH 5 VALUE 'Mais que 5 caracteres',
      varc2  TYPE c LENGTH 6 VALUE 'Daniel',
      varn   TYPE n LENGTH 5 VALUE '57',
      vard   TYPE d VALUE '19960104', " AAAAMMDD 04/01/1996
      vart   TYPE t VALUE '042000', " HHMiSS
      hora   TYPE tims,
      varstring type string value 'oi sou uma string'.
hora = sy-uzeit.

cl_demo_output=>write( varf ).
cl_demo_output=>write( varp ).
cl_demo_output=>write( varc ).
cl_demo_output=>write( varc2 ).
cl_demo_output=>write( varn ).
cl_demo_output=>write( vard ).
cl_demo_output=>write( vart ).
cl_demo_output=>write( hora ).
cl_demo_output=>write( varstring ).
cl_demo_output=>display( ).