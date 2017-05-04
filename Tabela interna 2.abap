*&---------------------------------------------------------------------*
*& Report  YCURSO_TABELAINTERNA_DANIEL2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_tabelainterna_daniel2.

TYPES: BEGIN OF ty_contato,
         nome     TYPE string,
         telefone TYPE string,
       END OF ty_contato.

PARAMETERS: nome     TYPE string LOWER CASE,
            telefone TYPE string.

START-OF-SELECTION.
  DATA: contato1  TYPE ty_contato,
        contato2  TYPE ty_contato,
        contato3  TYPE ty_contato,
        it_tabela TYPE STANDARD TABLE OF ty_contato.

  contato2-nome = nome.
  contato2-telefone = telefone.

  contato1-nome = 'Daniel Aragão'.
  contato1-telefone = '(85) 9 97597784'.

  contato3-nome = 'Flavia dAlva'.
  contato3-telefone = '(85) 9 99747582'.

  INSERT contato2 INTO TABLE it_tabela.
  cl_demo_output=>write( it_tabela ).

  INSERT contato1 INTO it_tabela INDEX 1.
  cl_demo_output=>write( it_tabela ).

  APPEND contato3 TO it_tabela.
  cl_demo_output=>write( it_tabela ).

  SORT it_tabela BY nome. " caso a tabela seja standard

  cl_demo_output=>write( it_tabela ).

  cl_demo_output=>display( |length: { lines( it_tabela ) }| ).