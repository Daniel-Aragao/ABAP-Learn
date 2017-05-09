*&---------------------------------------------------------------------*
*& Report  YCURSO_CLASSE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_classe.

PARAMETERS: num1 TYPE int4,
            num2 TYPE int4.

DATA: lr_obj TYPE REF TO ycurso_calculadoradaniel,
      ma     TYPE int4,
      me     TYPE int4.

*lr_obj = NEW #( ).
CREATE OBJECT lr_obj.
*exporting
*value1 = '25'.

lr_obj->num1 = num1.
lr_obj->set_num2( num2 ).
cl_demo_output=>write( |NUM1 : { lr_obj->num1 } | ).
cl_demo_output=>write( |NUM2 : { lr_obj->get_num2( ) } | ).

lr_obj->somar( ).
lr_obj->comparar( EXPORTING n1 = num1 n2 = num2 IMPORTING maior = ma menor = me ).

cl_demo_output=>write( lr_obj->num1 ).
cl_demo_output=>write( |Maior : { ma } | ).
cl_demo_output=>write( |Menor : { me } | ).
cl_demo_output=>display( ).