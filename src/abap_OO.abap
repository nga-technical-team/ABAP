REPORT  ysdnblog_class_static.
PARAMETERS : p_rows TYPE count DEFAULT ‘100’.

*version EUH
*———————————————————————-*
*       CLASS lcl_main DEFINITION
*———————————————————————-*
*
*———————————————————————-*
CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS : get_data  ,
                    display.
  PRIVATE SECTION.
    CLASS-DATA it_mara TYPE mara_tt.
ENDCLASS.                    “lcl_main DEFINITION
*———————————————————————-*
*       CLASS lcl_main IMPLEMENTATION
*———————————————————————-*
*
*———————————————————————-*
CLASS lcl_main IMPLEMENTATION.
  METHOD get_data.
    SELECT * FROM mara INTO TABLE lcl_main=>it_mara  UP TO p_rows ROWS .
  ENDMETHOD.                    “GET_DATA
  METHOD display.
    DATA : lr_table TYPE REF TO cl_salv_table.
    cl_salv_table=>factory(  IMPORTING    r_salv_table   = lr_table
                             CHANGING     t_table        =   lcl_main=>it_mara  )    .
    lr_table->display( ).
  ENDMETHOD.                    “display
ENDCLASS.                    “lcl_main IMPLEMENTATION

START-OF-SELECTION.
