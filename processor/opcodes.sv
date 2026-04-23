// opcodes.sv
//-----------------------------------------------------
// 4 opcodes: NOP, ADD, MUL, LOAD
// opcodes are 2 bits long
// required 1-bit ALU code in the lowest 1 bits (LOAD uses adder, NOP set ALu function IMUL)
//-----------------------------------------------------

// NOP
`define NOP  2'b00

// ADD  rd rs     ; rd = rd + rs
`define ADD  2'b01

// MUL  rd rs imm ; rd = rs * imm
`define MUL  2'b10

// LOAD rd rs imm ; rd = rs + imm
`define LOAD 2'b11