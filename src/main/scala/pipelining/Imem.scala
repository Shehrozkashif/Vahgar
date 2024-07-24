package singlecycle
import chisel3._
import chisel3.util._
// import chisel3.util.experimental.experimentalloadMemoryFromFile
import chisel3.util.experimental.loadMemoryFromFile
class Imemmod extends Module {
val io = IO (new Bundle {
  val data_in= Input(UInt(32.W))
 val enable = Input(Bool())
  val address= Input(UInt(32.W))
  val out= Output(UInt(32.W))
})
val memory = Mem(256, UInt(32.W))

loadMemoryFromFile(memory,"/home/shehroz/Scala-Chisel-Learning-Journey/src/main/scala/singlecycle/inst_file.txt")

when ( io.enable ) {
memory.write( io.address >> 2 , io.data_in  )
}
io.out := memory.read( io.address >> 2)
}

