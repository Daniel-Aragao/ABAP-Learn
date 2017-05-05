*&---------------------------------------------------------------------*
*& Report  YCURSO_TABELAINTERNA_DANIEL3
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_tabelainterna_daniel3.

*TYPES: BEGIN OF ty_pessoa,
*         nome TYPE string,
*         qtd  TYPE i,
*       END OF ty_pessoa,
*       BEGIN OF ty_pessoa_data,
*         nome TYPE string,
*         data TYPE d,
*         qtd  TYPE i,
*       END OF ty_pessoa_data.
*
*DATA: ti_dividas      TYPE STANDARD TABLE OF ty_pessoa,
*      ti_dividas_data TYPE STANDARD TABLE OF ty_pessoa_data,
*      l_divida1       TYPE ty_pessoa,
*      l_divida2       TYPE ty_pessoa,
*      l_divida3       TYPE ty_pessoa,
*      l_divida_data1  TYPE ty_pessoa_data,
*      l_divida_data2  TYPE ty_pessoa_data,
*      l_divida_data3  TYPE ty_pessoa_data.
*
*
*FORM inserir_divida USING nome TYPE string qtd TYPE i CHANGING divida TYPE ty_pessoa.
*  divida-nome = nome.
*  divida-qtd = qtd.
*  INSERT divida INTO TABLE ti_dividas.
*ENDFORM.
*
*FORM inserir_divida_data USING nome TYPE string qtd TYPE i data TYPE d CHANGING divida TYPE ty_pessoa_data.
*  divida-nome = nome.
*  divida-qtd = qtd.
*  divida-data = data.
*  COLLECT divida INTO ti_dividas_data.
*ENDFORM.


START-OF-SELECTION.
*  PERFORM inserir_divida USING 'Daniel' 44 CHANGING l_divida1.
*  PERFORM inserir_divida USING 'Bruno' 14 CHANGING l_divida2.
*  PERFORM inserir_divida USING 'Daniel' 56 CHANGING l_divida3.
*
*  PERFORM inserir_divida_data USING 'Daniel' 44 '19960104' CHANGING l_divida_data1.
*  PERFORM inserir_divida_data USING 'Bruno' 14 '19960104' CHANGING l_divida_data2.
*  PERFORM inserir_divida_data USING 'Daniel' 56 '19960104' CHANGING l_divida_data3.
*
*  cl_demo_output=>write( ti_dividas ).
*  cl_demo_output=>write( ti_dividas_data ).

  PARAMETERS: search   TYPE string LOWER CASE,
              name     RADIOBUTTON GROUP noca,
              category RADIOBUTTON GROUP noca.

  TYPES: BEGIN OF ty_filmes,
           nome      TYPE string,
           categoria TYPE string,
         END OF ty_filmes.

  DATA: filme1    TYPE ty_filmes,
        filme2    TYPE ty_filmes,
        filme3    TYPE ty_filmes,
        filme4    TYPE ty_filmes,
        filme_it  TYPE ty_filmes,
        it_filmes TYPE STANDARD TABLE OF ty_filmes,
        it_result TYPE STANDARD TABLE OF ty_filmes.


*  filme1-nome = 'Iron Man'.
*  filme1-categoria = 'Action'.
*  filme2-nome = 'Me before you'.
*  filme2-categoria = 'Romance'.
*  filme3-nome = 'The book of Eli'.
*  filme3-categoria = 'Action'.
*  filme4-nome = 'Resident Evil'.
*  filme4-categoria = 'Thriller and Action'.

  it_filmes = VALUE #( ( nome ='Iron Man' categoria ='Action')
                       ( nome ='Me before you' categoria ='Romance')
                       ( nome ='The book of Eli' categoria ='Action')
                       ( nome ='Resident Evil' categoria ='Thriller and Action') ).

  INSERT filme1 INTO TABLE it_filmes.
  INSERT filme2 INTO TABLE it_filmes.
  INSERT filme3 INTO TABLE it_filmes.
  INSERT filme4 INTO TABLE it_filmes.

  cl_demo_output=>write( it_filmes ).

  LOOP AT it_filmes INTO filme_it. " where categoria = search
    IF name = abap_true.
      CHECK filme_it-nome CP search. " if is not true continue
      APPEND filme_it TO it_result.
    ELSEIF category = abap_true.
      CHECK filme_it-categoria = search.
      APPEND filme_it TO it_result.
    ENDIF.
  ENDLOOP.

  cl_demo_output=>write( it_result ).

*  LINE_EXISTS

  IF lines( it_result ) = 0.
    cl_demo_output=>write( 'Nothing found' ).
  ENDIF.

  cl_demo_output=>write( |Lines: { lines( it_result ) }| ).
*  cl_demo_output=>write( |Line Exists: { line_exists( it_result[ 1 ] ) }| ).
  cl_demo_output=>write( |Line Index: { line_index( it_result[ nome = 'Iron Man' ] ) }| ).

  cl_demo_output=>display( ).