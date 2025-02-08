\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
    m4_define_hier(['M4_ROWS'], 8)
    m4_define_hier(['M4_COLS'], 8)
   |processing_element
      @1
         /M4_ROWS_HIER
            /M4_COLS_HIER
         //m4_rand($rows, M4_ROWS_INDEX_MAX, 0);
         //m4_rand($columns, M4_COLS_INDEX_MAX, 0);
   |processing_element
      @1
         /rows_num
            |processing_element/rows_num$x_out = $x_in;
            $w_out = $w_in;
            /columns_num
               
               $acc[15:0] = $acc + $w_in*$x_in;
               //$x_out = $x_in;
               //$w_out = $w_in;
                 
   //$reset = *reset;
   
   //...
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
