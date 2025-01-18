
module processing_element #(parameter vector_size = 8) (input clk, reset, [(vector_size-1) : 0] x_in, y_in,  output reg [(vector_size-1):0] x_out , y_out);
  
  reg [(vector_size - 1) : 0] weight_matrix = 1;
  
  //compute the partial sum
  always @(posedge clk or negedge reset) begin
    if(!reset) begin
    	{x_out, y_out} <= 0;
    end
    else begin
    	x_out <= x_in;
    	y_out <= weight_matrix * x_in + y_in;
    end
  end
  
endmodule
