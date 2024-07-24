package singlecycle
import chisel3._
import chisel3.util._
object opimm {
  val I = 19.U
  val l = 3.U
  val S = 35.U
  val B = 99.U
  val U = 55.U  // hex = 0x37
  val aui_type = 23.U(32.W) // Change "h17" to 23.U
  // val J = 99.U(32.W)
  val jal = 111.U(32.W) // Assign a unique opcode for JAL
  val jalr = 103.U(32.W) // Assign a unique opcode for JALR
}
import opimm._
class immgenr extends Module {
  val io = IO(new Bundle {
    
    val instruction = Input(UInt(32.W))
    val imm = Output(UInt(32.W))
  })
 
  io.imm := 0.U
  val opcode = io.instruction(6, 0)
  switch(opcode) {
    is(I) {
      io.imm := Cat(Fill(20, io.instruction(31)), io.instruction(31, 20))
    }
     is(l) {
      io.imm := Cat(Fill(20, io.instruction(31)), io.instruction(31, 20))
    }
    is(S) {
      io.imm := Cat(Fill(20, io.instruction(31)), io.instruction(31, 25), io.instruction(11, 7))
    }
    is(B) {
      io.imm := Cat(Fill(19, io.instruction(31)), io.instruction(31), io.instruction(7), io.instruction(30, 25),io.instruction(11, 8),0.U)
    }
    is(U) {
      // io.imm := Cat(Fill(20, io.instruction(31)), io.instruction(31, 12))
      io.imm := Cat(io.instruction(31,12), Fill(12, 0.U))
    }
    is(aui_type) {
      io.imm := Cat(io.instruction(31,12), Fill(12, 0.U))
    }
    // is(J) {
    //   io.imm := Cat(Fill(20, io.instruction(31)), io.instruction(31), io.instruction(30, 21), io.instruction(20), io.instruction(19, 12))
    // }
    is(jal) {
      io.imm := Cat(Fill(11, io.instruction(31)), io.instruction(31), io.instruction(19, 12), io.instruction(20), io.instruction(30, 21), 0.U)
    }
     is(jalr) {
      // io.imm := Cat(Fill(20, io.instruction(31)), io.instruction(31), io.instruction(30, 21), io.instruction(20), io.instruction(19, 12))
      io.imm := Cat(Fill(20, io.instruction(31)), io.instruction(31, 20))
    }
  }
}
