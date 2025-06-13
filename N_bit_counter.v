`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 17:56:27
// Design Name: 
// Module Name: N_bit_counter
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


module N_bit_counter#(parameter N=4)(input clk,reset,mode,output reg [N-1:0]count);
always @(posedge clk or posedge reset)
begin
if(reset)
count<=0;
else if(mode)
count<=count+1;
else
count<=count-1;
end
endmodule

module Testbench;
parameter N=4;
reg clock,rst,switch;
wire [N-1:0]counter;
N_bit_counter m1(.clk(clock),.count(counter),.reset(rst),.mode(switch));
initial begin
clock=0;
forever #5 clock=~clock;
end
initial begin
switch=1;
rst=1;
#10 rst=0;
#50 switch=0;
#100;
$finish;
end
always @(counter)
$display("clk=%d mode=%d reset=%d count=%d",clock,switch,rst,counter);
endmodule 
