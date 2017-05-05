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
            telefone TYPE string,
            index    TYPE sy-tabix OBLIGATORY.

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
  cl_demo_output=>write( 'Sort' ).
  cl_demo_output=>write( it_tabela ).

  MODIFY it_tabela FROM contato2 INDEX index.

  cl_demo_output=>write( 'Modify' ).
  cl_demo_output=>write( it_tabela ).

  READ TABLE it_tabela INTO contato2 WITH KEY telefone = '(85) 9 99747582'.
  DATA(lv_indice) = sy-tabix.

  DELETE it_tabela INDEX 3.

  cl_demo_output=>write( 'Delete' ).

  cl_demo_output=>write( it_tabela ).

  cl_demo_output=>write( 'Read table before delete' ).
  cl_demo_output=>write( contato2 ).
  
  
  cl_demo_output=>write( 'Recolocando o contato com telefone (85) 9 97597784 no local de origem' ).
  cl_demo_output=>write( index ).
  MODIFY it_tabela FROM contato2 INDEX index.
  cl_demo_output=>write( it_tabela ).
  
  cl_demo_output=>write( 'Loop at' ).
  LOOP AT it_tabela INTO contato2.
    cl_demo_output=>write( contato2 ).
  ENDLOOP.

  cl_demo_output=>display( |length: { lines( it_tabela ) }| ).