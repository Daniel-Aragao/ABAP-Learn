*&---------------------------------------------------------------------*
*& Report  YCURSO_VARIAVEIS2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_variaveis2.

TYPES: ty_nome   TYPE c LENGTH 40,
       ty_codigo TYPE n LENGTH 7,
       ty_idade  TYPE i,
       ty_data   TYPE d,
       ty_email  TYPE c LENGTH 50.

DATA nome_cliente TYPE ty_nome.

DATA: cod_material    TYPE ty_codigo VALUE '1420408',
      cod_servico     TYPE ty_codigo VALUE '5754',
      email_cliente   TYPE ty_email VALUE 'danielfilhoce@gmail.com',
      date_nascimento TYPE ty_data VALUE '19960104',
      idade_cliente   TYPE ty_idade VALUE '21'.

CONSTANTS c_pi TYPE c VALUE '3,1416'