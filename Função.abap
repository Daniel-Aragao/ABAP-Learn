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

FUNCTION Y_CURSO_FUNCTION_DANIEL3.
*"----------------------------------------------------------------------
*"*"Interface local:
*"  IMPORTING
*"     REFERENCE(I_DATA) TYPE  DATE
*"     REFERENCE(I_DIAS) TYPE  I
*"  EXPORTING
*"     REFERENCE(E_VENCIMENTO) TYPE  DATE
*"----------------------------------------------------------------------

E_VENCIMENTO = I_DATA + I_DIAS.


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
      data TYPE date.

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
    i_data       = '19960104'
    i_dias       = 40
  IMPORTING
    e_vencimento = data.


cl_demo_output=>write( len ).
cl_demo_output=>write( data ).

cl_demo_output=>display(  ).