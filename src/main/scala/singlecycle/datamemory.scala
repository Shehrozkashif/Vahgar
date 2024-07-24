package singlecycle
import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
class datamemory extends Module {
  val io = IO(new Bundle {
  val out = Output( Vec(4, UInt(8.W)) )
  val addr = Input(UInt(8.W)) // Changed the address width to 8 bits
  val rd_enable = Input(Bool())
  val wr_enable = Input(Bool())
  val mask = Input ( Vec (4 , Bool () ) )
    val dataIn = Input( Vec(4, UInt(8.W)) )
  })
  io.out(0) := 0.U
  io.out(1) := 0.U
  io.out(2) := 0.U
  io.out(3) := 0.U
  

  val memory = Mem(256, Vec(4,UInt(8.W)) )

  // memory write operation
  when(io.wr_enable) {
    memory.write(io.addr,  io.dataIn, io.mask )
  }
  when(io.rd_enable) {
    io.out := memory.read(io.addr)
    // io.out := memory.read(io.addr, io.rd_enable)
  val dataIn = Input(Vec(4,UInt(8.W)))
  } 
}