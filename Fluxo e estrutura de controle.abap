*&---------------------------------------------------------------------*
*& Report  YCURSO_FLUXO_REPORT
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_fluxo_report.

TABLES : kna1.

SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
PARAMETERS: p_letra TYPE c,
            p_nome  TYPE string,
            p_data  TYPE d OBLIGATORY,
*            p_data  TYPE kna1-kunnr OBLIGATORY,
            p_ativo AS CHECKBOX.
SELECTION-SCREEN: END OF BLOCK b1.

SELECTION-SCREEN: BEGIN OF BLOCK b2 WITH FRAME TITLE text-002.
PARAMETERS: p_homem  RADIOBUTTON GROUP sexo,
            p_mulher RADIOBUTTON GROUP sexo,
            p_outros RADIOBUTTON GROUP sexo.
SELECTION-SCREEN: END OF BLOCK b2.

SELECTION-SCREEN: BEGIN OF BLOCK b3 WITH FRAME TITLE text-003.
DATA: lv_cidade TYPE string,
      wa_syst   TYPE syst.

SELECT-OPTIONS: s_cida FOR (lv_cidade) NO INTERVALS,
                s_sid  FOR sy-sysid NO-EXTENSION.
*                s_data FOR kna1-kunnr NO INTERVALS NO-EXTENSION.

SELECTION-SCREEN: END OF BLOCK b3.

INITIALIZATION.
*  cl_demo_output=>display('initialization').

LOAD-OF-PROGRAM.
*  cl_demo_output=>display('load').

AT SELECTION-SCREEN.
*  cl_demo_output=>display('select').
*  MESSAGE 'testando warning' TYPE 'W'.
*  MESSAGE 'testando warning' TYPE 'W' DISPLAY LIKE 'I'.

AT SELECTION-SCREEN OUTPUT.
*  cl_demo_output=>display('output').

START-OF-SELECTION.
*  cl_demo_output=>write( p_nome ).
*  cl_demo_output=>write( p_data ).
*  cl_demo_output=>write( p_homem ).
*  cl_demo_output=>write( p_mulher ).
*  cl_demo_output=>write( s_cida ).
*  cl_demo_output=>display( ).

  DATA: lv_bool TYPE abap_bool.
  lv_bool = p_ativo.

  cl_demo_output=>write( lv_bool ).

  IF lv_bool = abap_true.
    cl_demo_output=>write('Ativo').
  ELSE.
    cl_demo_output=>write('Not Ativo').
  ENDIF.

  IF p_data BETWEEN '19960103' AND '19960105'.
    cl_demo_output=>write('Between').
  ELSE.
    cl_demo_output=>write('Not Between').
  ENDIF.

  IF p_nome IS  INITIAL .
    cl_demo_output=>write('IS INITIAL').
  ELSE.
    cl_demo_output=>write('Not INITIAL').
  ENDIF.

  cl_demo_output=>display( ).