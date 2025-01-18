
module processing_element #(parameter vector_size = 8) (input [(vector_size-1) : 0] x_in, y_in,  output [(vector_size-1):0] x_out , y_out);
  
  reg [(vector_size - 1) : 0] weight_matrix;
  assign x_out = x_in ; //passing data to the next processing element
  
  //compute the partial sum
  
   assign y_out = weight_matrix * x_in + y_in;
  
endmodule
