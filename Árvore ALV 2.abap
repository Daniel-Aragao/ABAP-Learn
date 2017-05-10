*&---------------------------------------------------------------------*
*& Report  YCURSO_TESTE27
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

report ycurso_teste28.

data: gt_outtab type table of ycontato.
data: gr_table type ref to cl_salv_table.

select * from ycontato into corresponding fields of table @gt_outtab.

*... Create Instance
cl_salv_table=>factory( importing r_salv_table = gr_table
                        changing  t_table      = gt_outtab ).

**
data:  gr_columns type ref to cl_salv_columns_table,
       gr_column  type ref to cl_salv_column_table.

gr_columns = gr_table->get_columns( ).
gr_columns->set_optimize( abap_true ).

gr_column ?= gr_columns->get_column( 'MANDT' ).
gr_column->set_visible( abap_false ).

gr_column ?= gr_columns->get_column( 'NOME' ).
gr_column->set_long_text('Vendor Name' ).
gr_column->set_short_text( 'V.Name' ).
gr_column->set_medium_text('Vendor Name' ).

gr_column ?= gr_columns->get_column( 'TELEFONE' ).
data: ls_color     type lvc_s_colo.
ls_color-col = 5 .
gr_column->set_color( ls_color ).


*... Display Table
gr_table->display( ).