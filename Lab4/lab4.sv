`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2020 11:32:51 AM
// Design Name: 
// Module Name: transpose_form_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module transpose_form_1
#
(
    M = 4                       // Parameter, overridden by testbench
)
(
    input integer coeffs[0:M],  // Input array of filter coefficients
    
    input integer din,          // Data in, one data point per clock cycle
    output integer dout,        // Data out, one data point per clock cycle
    
    input clk,
    input reset
);

integer din_delayed[0:M-1];     // delay line
integer prods[0:M];             // products of coeffs and delayed data
integer sums[0:M-1];            // sum terms

// Instantiate the delay line
z_minus_1 u_dm0( .din(din),            .dout(din_delayed[0]), .clk(clk), .reset(reset) );
z_minus_1 u_dm1( .din(din_delayed[0]), .dout(din_delayed[1]), .clk(clk), .reset(reset) );
z_minus_1 u_dm2( .din(din_delayed[1]), .dout(din_delayed[2]), .clk(clk), .reset(reset) );
z_minus_1 u_dm3( .din(din_delayed[2]), .dout(din_delayed[3]), .clk(clk), .reset(reset) );

// Instantiate the gain blocks
prod u_prod0(   .din(din),              .coeff(coeffs[0]), .dout(prods[0]) );
prod u_prod1(   .din(din_delayed[0]),   .coeff(coeffs[1]), .dout(prods[1]) );
prod u_prod2(   .din(din_delayed[1]),   .coeff(coeffs[2]), .dout(prods[2]) );
prod u_prod3(   .din(din_delayed[2]),   .coeff(coeffs[3]), .dout(prods[3]) );
prod u_prodNM1( .din(din_delayed[M-1]), .coeff(coeffs[M]), .dout(prods[M]) );

// Instantiate the summing junctions
sum u_sum1( .x(prods[0]),   .y(sums[1]),  .z(sums[0]) );
sum u_sum2( .x(prods[1]),   .y(sums[2]),  .z(sums[1]) );
sum u_sum3( .x(prods[2]),   .y(sums[3]),  .z(sums[2]) );
sum u_sum4( .x(prods[M-1]), .y(prods[M]), .z(sums[M-1]) );

// Last sum is the output signal
assign dout = sums[0];

endmodule