// opcodes.sv
//-----------------------------------------------------
// 4 opcodes: NOP, ADD, MULI, LOADI
// opcodes are 2 bits long
// required 1-bit ALU code in the lowest 1 bits (LOADI uses adder, NOP set ALu function MULI)
//-----------------------------------------------------

// NOP
`define NOP  2'b00

// ADD  %d %s     ; %d = %d + rs
`define ADD  2'b01

// MULI  %d %s imm ; %d = %s * imm
`define MULI  2'b10

// LOADI %d %s imm ; %d = %s + imm
`define LOADI 2'b11