*&---------------------------------------------------------------------*
*& Report  YCURSO_TABELAINTERNA_DANIEL
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_tabelainterna_daniel.
* ESTRUTURA
TYPES: BEGIN OF ty_pessoa,
         nome  TYPE string,
         idade TYPE i,
       END OF ty_pessoa.

DATA: pai   TYPE ty_pessoa, mae TYPE ty_pessoa, filho TYPE ty_pessoa.

pai-nome = 'josé'.
pai-idade = 50.

mae-nome = 'ana'.
mae-idade = '48'.

* WORKAREA
DATA: BEGIN OF wa_familia,
        sobrenome   TYPE string,
        qtd_membros TYPE i,
        pai         TYPE ty_pessoa, " não imprime um struct dentro de outro
        mae         TYPE ty_pessoa,
      END OF wa_familia.

wa_familia-sobrenome = 'silva'.
wa_familia-qtd_membros = 3.
wa_familia-pai = pai.
wa_familia-mae = mae.
*data == var and types == type


cl_demo_output=>write( pai ).
cl_demo_output=>write( mae ).
cl_demo_output=>write( wa_familia ).


DATA:mais_velho TYPE ty_pessoa.
PERFORM verif_fa USING wa_familia CHANGING mais_velho.
cl_demo_output=>write( mais_velho ).

cl_demo_output=>display( ).

FORM verif_fa USING fam LIKE wa_familia CHANGING older.
  older = cond ty_pessoa( when fam-pai-idade > fam-mae-idade then fam-pai else fam-mae ).
ENDFORM.