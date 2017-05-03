FUNCTION y_curso_function_daniel.
*"----------------------------------------------------------------------
*"*"Interface local:
*"  IMPORTING
*"     REFERENCE(I_TEXTO) TYPE  STRING
*"----------------------------------------------------------------------

 cl_demo_output=>write( i_texto ).


ENDFUNCTION.

FUNCTION Y_CURSO_FUNCTION_DANIEL2.
*"----------------------------------------------------------------------
*"*"Interface local:
*"  IMPORTING
*"     REFERENCE(I_TEXTO) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(TEXTO_LEN) TYPE  I
*"----------------------------------------------------------------------


TEXTO_LEN = strlen( I_TEXTO ).


ENDFUNCTION.

FUNCTION y_curso_function_daniel3.
*"----------------------------------------------------------------------
*"*"Interface local:
*"  IMPORTING
*"     REFERENCE(I_DIAS) TYPE  I
*"     REFERENCE(I_DAT) TYPE  D
*"  EXPORTING
*"     REFERENCE(E_VENCIMENTO) TYPE  D
*"----------------------------------------------------------------------

  e_vencimento = i_dat + i_dias.

  IF e_vencimento < sy-datum.
    e_vencimento = sy-datum.
  ENDIF.

ENDFUNCTION.

*&---------------------------------------------------------------------*
*& Report  YCURSO_EXECFUNC
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_execfunc.

DATA: len  TYPE i,
      data TYPE d.

CALL FUNCTION 'Y_CURSO_FUNCTION_DANIEL'
  EXPORTING
    i_texto = |Programa: \n{ sy-cprog }|.

CALL FUNCTION 'Y_CURSO_FUNCTION_DANIEL2'
  EXPORTING
    i_texto   = 'Daniel'
  IMPORTING
    texto_len = len.

CALL FUNCTION 'Y_CURSO_FUNCTION_DANIEL3'
  EXPORTING
    i_dias             = 40
    i_dat             = '040517'
 IMPORTING
   E_VENCIMENTO       = data
          .



cl_demo_output=>write( len ).
cl_demo_output=>write( data ).

cl_demo_output=>display(  ).