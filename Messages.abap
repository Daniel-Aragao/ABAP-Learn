*&---------------------------------------------------------------------*
*& Report  YCURSO_MESSAGE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_message MESSAGE-ID ymsg01.

*message 'texto ' type 'I'.
*message 'texto ' type 'W'.
*message 'texto ' type 'E'.
*message 'texto ' type 'S'.
*message 'texto ' type 'A'.
*message 'texto ' type 'X'.

MESSAGE i001(ymsg01).

MESSAGE i002 WITH 'daniel' 'henrique'.

MESSAGE ID 'YMSG01' TYPE 'I' NUMBER 001.
MESSAGE ID 'YMSG01' TYPE 'S' NUMBER 002 WITH 'DANIEL' 'HENRIQUE'.