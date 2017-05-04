*&---------------------------------------------------------------------*
*& Report  YCURSO_TABELAINTERNA_DANIEL3
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_tabelainterna_daniel3.

TYPES: BEGIN OF ty_pessoa,
         nome TYPE string,
         qtd  TYPE i,
       END OF ty_pessoa,
       BEGIN OF ty_pessoa_data,
         nome TYPE string,
         data TYPE d,
         qtd  TYPE i,
       END OF ty_pessoa_data.

DATA: ti_dividas      TYPE STANDARD TABLE OF ty_pessoa,
      ti_dividas_data TYPE STANDARD TABLE OF ty_pessoa_data,
      l_divida1       TYPE ty_pessoa,
      l_divida2       TYPE ty_pessoa,
      l_divida3       TYPE ty_pessoa,
      l_divida_data1  TYPE ty_pessoa_data,
      l_divida_data2  TYPE ty_pessoa_data,
      l_divida_data3  TYPE ty_pessoa_data.


FORM inserir_divida USING nome TYPE string qtd TYPE i CHANGING divida TYPE ty_pessoa.
  divida-nome = nome.
  divida-qtd = qtd.
  INSERT divida INTO TABLE ti_dividas.
ENDFORM.

FORM inserir_divida_data USING nome TYPE string qtd TYPE i data TYPE d CHANGING divida TYPE ty_pessoa_data.
  divida-nome = nome.
  divida-qtd = qtd.
  divida-data = data.
  COLLECT divida INTO ti_dividas_data.
ENDFORM.


START-OF-SELECTION.
  PERFORM inserir_divida USING 'Daniel' 44 CHANGING l_divida1.
  PERFORM inserir_divida USING 'Bruno' 14 CHANGING l_divida2.
  PERFORM inserir_divida USING 'Daniel' 56 CHANGING l_divida3.

  PERFORM inserir_divida_data USING 'Daniel' 44 '19960104' CHANGING l_divida_data1.
  PERFORM inserir_divida_data USING 'Bruno' 14 '19960104' CHANGING l_divida_data2.
  PERFORM inserir_divida_data USING 'Daniel' 56 '19960104' CHANGING l_divida_data3.

  cl_demo_output=>write( ti_dividas ).
  cl_demo_output=>write( ti_dividas_data ).

  cl_demo_output=>display( ).