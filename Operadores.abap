*&---------------------------------------------------------------------*
*& Report  YCURSO_OPERADORES
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ycurso_operadores.

DATA: num1    TYPE i VALUE 20,
      num2    TYPE i VALUE 30,
      result1 TYPE i,
      data1   TYPE d VALUE '19960104',
      data2   TYPE d VALUE '20170427',
      result2 TYPE d,
      result3 TYPE d,
      result4 TYPE d,
      hora1   TYPE t VALUE '111500',
      hora2   TYPE t VALUE '124500',
      result5 TYPE t,
      result6 TYPE t,
      umtamanho type String VALUE 'string length'.


result1 = num1 + num2.
result2 = data1 + num1.
result3 = data2 + num2.
result4 = data1 + data2.
result5 = hora1 + num1 + num2 + 10.
result6 = hora1 + hora2.

data1 = '20170401'.
data2 = data1(6) && '01'.

WRITE: |result1: { result1 }|,
      / |result2: { result2 }|,
      / |result3: { result3 }|,
      / |result4: { result4 }|,
      / |result5: { result5 }|,
      / |result6: { result6 }|,
      / umtamanho(10),
      / umtamanho(13),
      / |data2: { data2 }|.

WRITE:  |sy-subrc { sy-subrc }|,
      / |sy-mandt { sy-mandt }|,
      / |sy-sysid { sy-sysid }|,
      / |sy-mandt { sy-mandt }|,
      / |sy-opsys { sy-opsys }|,
      / |sy-uname { sy-uname }|,
      / |sy-abcde { sy-abcde }|,
      / |sy-datum { sy-datum }|,
      / |sy-uzeit { sy-uzeit }|.