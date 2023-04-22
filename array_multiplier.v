`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2023 22:30:20
// Design Name: 
// Module Name: array_multiplier
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


module array_multiplier(A,B,Z);
input[7:0]A,B;  
output [15:0]Z; 
wire  p[7:0][7:0];
wire[54:0]C;
wire[42:1]S;

genvar g; 
generate
 for(g = 0; g<8; g=g+1) begin
  
 and a0(p[g][0],A[g],B[0]);
 and a1(p[g][1],A[g],B[1]);
 and a2(p[g][2],A[g],B[2]);
 and a3(p[g][3],A[g],B[3]);
 and a4(p[g][4],A[g],B[4]);
 and a5(p[g][5],A[g],B[5]);
 and a6(p[g][6],A[g],B[6]);
 and a7(p[g][7],A[g],B[7]);
 end
endgenerate
xor XOR(Z[0],1'b0,p[0][0]);

//row0
ha h0(p[0][1],p[1][0],C[0],Z[1]);
ha h1(p[1][1],p[2][0],C[1],S[1]);
ha h2(p[2][1],p[3][0],C[2],S[2]);
ha h3(p[3][1],p[4][0],C[3],S[3]);
ha h4(p[4][1],p[5][0],C[4],S[4]);
ha h5(p[5][1],p[6][0],C[5],S[5]);
ha h6(p[6][1],p[7][0],C[6],S[6]);

//row1
adder_1_bit fa0(S[1],p[0][2],C[0],C[7],Z[2]);
adder_1_bit fa1(S[2],p[1][2],C[1],C[8],S[7]);
adder_1_bit fa2(S[3],p[2][2],C[2],C[9],S[8]);
adder_1_bit fa3(S[4],p[3][2],C[3],C[10],S[9]);
adder_1_bit fa4(S[5],p[4][2],C[4],C[11],S[10]);
adder_1_bit fa5(S[6],p[5][2],C[5],C[12],S[11]);
adder_1_bit fa6(p[7][1],p[6][2],C[6],C[13],S[12]);

//row2
adder_1_bit fa7(S[7],p[0][3],C[7],C[14],Z[3]);
adder_1_bit fa8(S[8],p[1][3],C[8],C[15],S[13]);
adder_1_bit fa9(S[9],p[2][3],C[9],C[16],S[14]);
adder_1_bit fa10(S[10],p[3][3],C[10],C[17],S[15]);
adder_1_bit fa11(S[11],p[4][3],C[11],C[18],S[16]);
adder_1_bit fa12(S[12],p[5][3],C[12],C[19],S[17]);
adder_1_bit fa13(p[7][2],p[6][3],C[13],C[20],S[18]);

//row3
adder_1_bit fa14(S[13],p[0][4],C[14],C[21],Z[4]);
adder_1_bit fa15(S[14],p[1][4],C[15],C[22],S[19]);
adder_1_bit fa16(S[15],p[2][4],C[16],C[23],S[20]);
adder_1_bit fa17(S[16],p[3][4],C[17],C[24],S[21]);
adder_1_bit fa18(S[17],p[4][4],C[18],C[25],S[22]);
adder_1_bit fa19(S[18],p[5][4],C[19],C[26],S[23]);
adder_1_bit fa20(p[7][3],p[6][4],C[20],C[27],S[24]);

//row4
adder_1_bit fa21(S[19],p[0][5],C[21],C[28],Z[5]);
adder_1_bit fa22(S[20],p[1][5],C[22],C[29],S[25]);
adder_1_bit fa23(S[21],p[2][5],C[23],C[30],S[26]);
adder_1_bit fa24(S[22],p[3][5],C[24],C[31],S[27]);
adder_1_bit fa25(S[23],p[4][5],C[25],C[32],S[28]);
adder_1_bit fa26(S[24],p[5][5],C[26],C[33],S[29]);
adder_1_bit fa27(p[7][4],p[6][5],C[27],C[34],S[30]);

//row5
adder_1_bit fa28(S[25],p[0][6],C[28],C[35],Z[6]);
adder_1_bit fa29(S[26],p[1][6],C[29],C[36],S[31]);
adder_1_bit fa30(S[27],p[2][6],C[30],C[37],S[32]);
adder_1_bit fa31(S[28],p[3][6],C[31],C[38],S[33]);
adder_1_bit fa32(S[29],p[4][6],C[32],C[39],S[34]);
adder_1_bit fa33(S[30],p[5][6],C[33],C[40],S[35]);
adder_1_bit fa34(p[7][5],p[6][6],C[34],C[41],S[36]);

//row6
adder_1_bit fa35(S[31],p[0][7],C[35],C[42],Z[7]);
adder_1_bit fa36(S[32],p[1][7],C[36],C[43],S[37]);
adder_1_bit fa38(S[33],p[2][7],C[37],C[44],S[38]);
adder_1_bit fa39(S[34],p[3][7],C[38],C[45],S[39]);
adder_1_bit fa40(S[35],p[4][7],C[39],C[46],S[40]);
adder_1_bit fa41(S[36],p[5][7],C[40],C[47],S[41]);
adder_1_bit fa42(p[7][6],p[6][7],C[41],C[48],S[42]);

//row7
ha h7(S[37],C[42],C[49],Z[8]);
adder_1_bit fa43(S[38],C[43],C[49],C[50],Z[9]);
adder_1_bit fa44(S[39],C[44],C[50],C[51],Z[10]);
adder_1_bit fa45(S[40],C[45],C[51],C[52],Z[11]);
adder_1_bit fa46(S[41],C[46],C[52],C[53],Z[12]);
adder_1_bit fa47(S[42],C[47],C[53],C[54],Z[13]);
adder_1_bit fa48(p[7][7],C[48],C[54],Z[15],Z[14]);

endmodule
