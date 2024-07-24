package singlecycle
import chisel3._
import chisel3.util._
class pc extends Module{
val io = IO(new Bundle{

  val imm = Input(UInt(32.W))
  val out = Output(UInt(32.W))
  val jump = Input(Bool())     // Branch
  val jump2 = Input(Bool())    // Jal
  val jump3 = Input(Bool())  // Jalr
  val rs1data =Input(UInt(32.W))

  } )
  
  io.out :=0.U
  val max =1024.U
  val pc = RegInit(0.U(32.W) ) 

when(io.jump){  // branch
pc :=  io.imm
}
.otherwise{
pc := pc  + 4.U
}
when(pc === max){
pc :=0.U
}
when(io.jump2 ){ //jal

pc :=  io.imm

}
when(io.jump3 ){ // jalr
pc :=  io.imm
}

io.out := pc

}