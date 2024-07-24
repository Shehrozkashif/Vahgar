package singlecycle
import chisel3._
import chisel3.util._
class controlunitmod extends Module{
val io = IO(new Bundle{
val instruction = Input(UInt(32.W))
val func3_7 = Output(UInt(3.W))
val en_imem = Output(Bool())  // imem enable
val en_reg = Output(Bool()) // reg enable
val rd = Output(UInt(5.W))
val rs2 = Output(UInt(5.W))
val rs1 = Output(UInt(5.W))
val imm = Output(UInt(12.W))
} )
// val op = io.instruction(6,0)
io.en_imem := 0.B
io.en_reg := 0.B
when(io.instruction(6,0) === 51.U  || io.instruction(6,0) === 19.U)
{
    io.en_reg := 1.B
}
 io.func3_7 := Cat(io.instruction(30),io.instruction(14,12))
 io.rd := io.instruction(11,7) 
 io.rs1 := io.instruction(19,15)
 io.rs2 := io.instruction(24,20)
 io.imm := io.instruction(31,20)
// data mmeory wenable and renable 

  }

