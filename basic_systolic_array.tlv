\m5_TLV_version 1d: tl-x.org
\m5

\SV
   
\TLV
   $reset = *reset;
  
   |level
      /num_rows[7:0]
         /num_cols[7:0]
            @1
               $weights[7:0] = 1;
               $accumulate = ($weigths * $x_in) + $y_in;
               
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
