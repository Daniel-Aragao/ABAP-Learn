*&---------------------------------------------------------------------*
*& Report  YCURSO_TESTE27
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

report ycurso_teste27.
tables: ycontato.

types: begin of ty_saida,
          nome type ycontato-nome,
          telefone type ycontato-telefone,
       end of ty_saida.

data: it_saida type table of ty_saida,
      it_contato type table of ycontato.
data: gr_alv type ref to cl_salv_table.

select-options s_nome for ycontato-nome.

select * from ycontato into corresponding fields of table @it_contato
  where nome in @s_nome.

it_saida = value #( for wa in it_contato ( nome = wa-nome telefone = wa-telefone ) ).

start-of-selection.

  data: gr_functions type ref to cl_salv_functions.

*... Create Instance
  cl_salv_table=>factory( importing r_salv_table = gr_alv
                          changing  t_table      = it_saida ).
*                         changing  t_table      = it_contato ).

  gr_functions = gr_alv->get_functions( ).
  gr_functions->set_all( abap_true ).



*... Display Table
*cl_demo_output=>display( it_contato ).
gr_alv->display( ).