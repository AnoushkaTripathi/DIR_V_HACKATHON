`include "processing_element.v"

module systolic_array #(parameter int num_rows = 8, parameter int num_cols = 8) (input clk, reset, [((8 * num_cols)-1):0] input_stream, output [((8 * num_cols)-1):0] output_stream);
  
  wire [(8 * num_cols) - 1 :0] y_stream_in;  
  wire [(8*num_cols)-1:0] y_stream_out[num_rows-1:0];
  wire [(8*num_cols)-1:0] x_stream_out[num_rows-1:0];
  
  generate
    for(genvar i_0 = 0; i_0 < num_cols ; i_0 ++) begin
      processing_element pe(. clk(clk), .reset(reset), .x_in(input_stream[((8 * i_0) + 7) :  (i_0 * 8)]), .y_in(y_stream_in[(8*i_0+7) : (8*i_0)]), .x_out(x_stream_out[0][(8*i_0+7) : (8*i_0)]), .y_out(y_stream_out[0][(8*i_0+7) : (8*i_0)]));
    end
  endgenerate
  
  generate
    for(genvar i = 1 ; i < num_rows; i++) begin
      for(genvar j = 1; j < num_cols; j++) begin
        processing_element pe(.clk(clk), .reset(reset), .x_in(x_stream_out[j-1][((8 * j) + 7) :  (j * 8)]), .y_in(y_stream_out[j-1][(8*j+7) : (8*j)]), .x_out(x_stream_out[j-1][(8*j+7) : (8*j)]), .y_out(y_stream_out[j-1][(8*j+7) : (8*j)]));
      end
    end
  endgenerate
  
  assign output_stream = y_stream_out[num_rows-1]; //assign final row value to output
endmodule
