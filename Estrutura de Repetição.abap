*&---------------------------------------------------------------------*
*& Report  YCURSO_REPETICAO
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_repeticao.
*
*PARAMETERS: nmax     TYPE i,
*            nchars   TYPE i,
*            strstart TYPE string.
*
*DATA: n         TYPE i,
*      contdo    TYPE i VALUE 0,
*      contwhile TYPE i VALUE 0,
*      strlist  TYPE string.
*
*SELECT-OPTIONS s_numero FOR (n).
*
*START-OF-SELECTION.
*
*  DO nmax TIMES.
*    IF sy-index IN s_numero.
*      strlist = strlist && ' ' && sy-index.
*    ENDIF.
*  ENDDO.
*  cl_demo_output=>display( strlist ).
*
*  WHILE strlen( strstart ) < nchars.
*    CONCATENATE strstart strstart INTO strstart.
*    ADD 1 TO contdo.
*  ENDWHILE.
*
*  cl_demo_output=>write( 'Número de caracteres: ' && contdo ). "Número de repetições x
*  cl_demo_output=>display('Resultado string: ' && strstart )."Resultado string y


DATA: lv_list TYPE i.
PARAMETERS: p_max TYPE i.
SELECT-OPTIONS s_lista FOR (lv_list).

DO p_max TIMES.
  IF sy-index IN s_lista.
    cl_demo_output=>write( sy-index ).
  ENDIF.
ENDDO.
cl_demo_output=>display( ).


*DO 5 TIMES.
*  cl_demo_output=>write('DO 5. ENDDO.').
*ENDDO.
*cl_demo_output=>display( ).
*
**_______________________________________________________________________
*
*DATA cont TYPE i VALUE 0.
*DATA concat TYPE string.
*
*WHILE cont < 10.
*  concat = |WHILE [{ cont }] < 10 ENDWHIL. INTO concat|.
*
*  cl_demo_output=>write( concat ).
*  add 1 to cont.
*ENDWHILE.
*
*cl_demo_output=>display( ).