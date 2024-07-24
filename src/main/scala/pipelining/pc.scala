package singlecycle
import chisel3._
import chisel3.util._
class pcmod extends Module{
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
  val count = RegInit(0.U(32.W) ) 

when(io.jump){
count := count + io.imm
}
.otherwise{
count := count  + 4.U
}
when(count === max){
count :=0.U
}
when(io.jump2 ){

count := count + io.imm

}
when(io.jump3 ){
count :=   io.rs1data + io.imm
}

io.out := count

}