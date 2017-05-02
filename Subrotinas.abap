*&---------------------------------------------------------------------*
*& Report  YCURSO_MODULARIZACAO
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_modularizacao.

FORM somar USING VALUE(p_um) TYPE i VALUE(p_dois) TYPE i CHANGING p_texto TYPE string.
  p_texto = |Numero { p_um + p_dois }|.
ENDFORM.

FORM mostrar_data_hora USING VALUE(u_texto) TYPE string.
  cl_demo_output=>write( u_texto ).
  cl_demo_output=>write( sy-uzeit ).
  cl_demo_output=>write( sy-datum ).
*  cl_demo_output=>display( ).
ENDFORM.

FORM criar_dados USING VALUE(u_texto) TYPE string CHANGING c_retorno TYPE string.
  c_retorno = |Texto: { u_texto } [{ sy-uzeit }]|.
ENDFORM.

FORM multiplicar USING VALUE(p_num1) TYPE i VALUE(p_num2) TYPE i CHANGING p_texto TYPE string.
  p_texto = |Numero { p_num1 * p_num2 }|.
ENDFORM.

FORM qual_maior USING VALUE(p_num1) TYPE i VALUE(p_num2) TYPE i CHANGING p_texto TYPE string.
  IF p_num1 > p_num2.
    p_texto = |{ p_num1 } e maior que { p_num2 }|.
  ELSEIF p_num2 > p_num1.
    p_texto = |{ p_num2 } e maior que { p_num1 }|.
  ENDIF.
ENDFORM.

FORM qual_maior_cond USING VALUE(p_num1) TYPE i VALUE(p_num2) TYPE i CHANGING p_texto TYPE string.
  p_texto = COND string( WHEN p_num1 > p_num2 THEN |{ p_num1 } e maior que { p_num2 }| WHEN p_num1 < p_num2 THEN |{ p_num2 } e maior que { p_num1 }| ELSE |{ p_num1 } e igual a { p_num2 }| ).
ENDFORM.

PARAMETERS: num1 TYPE i,
            num2 TYPE i.

START-OF-SELECTION.
  DATA: lv_texto        TYPE string VALUE 'Um texto mais sensato',
        lv_textoretorno TYPE string.

  PERFORM mostrar_data_hora USING 'Um texto muito louco'.
  PERFORM criar_dados USING  lv_texto CHANGING lv_textoretorno.

  cl_demo_output=>write( lv_textoretorno ).

  PERFORM somar USING num1 num2 CHANGING lv_textoretorno.
  cl_demo_output=>write( lv_textoretorno ).

  PERFORM multiplicar USING num1 num2 CHANGING lv_textoretorno.
  cl_demo_output=>write( lv_textoretorno ).

  PERFORM qual_maior USING num1 num2 CHANGING lv_textoretorno.
  cl_demo_output=>write( lv_textoretorno ).

  PERFORM qual_maior_cond USING num1 num2 CHANGING lv_textoretorno.
  cl_demo_output=>write( lv_textoretorno ).

  cl_demo_output=>display(  ).