package practice
import chisel3._
import chisel3.util._

class tx extends  Module{
  val io=IO(new Bundle{
     val valid = RegInit(0.U(1.W) ) 
      val tx = RegInit(0.U(1.W) ) 
    val data = Input(UInt(32.W))
     val ready = RegInit(0.U(1.W) ) 
    val ideal = Input(Bool())
    } ) 
 val state = RegInit(0.U(1.W))
when(io.ideal===1.B){
     io.tx := 0.B
 io.ready := 0.B
io.valid := 0.B
io.data := 0.B 
}


when(io.tx===1.B && io.ready===1.B && io.valid===1.B ){
 io.ready := 1.B
io.valid := 1.B
io.data := 1.B 
}


when(io.tx===1.B && io.ready===1.B){
 io.ready := 1.B
io.valid := 1.B
io.data := 1.B 
}

}


class kx  extends  Module{
  val io = IO(new Bundle{

    val v = Input(UInt(32.W))
    val r = Input(UInt(32.W))
    val dat = Input(UInt(32.W))
    val output = Output(UInt(32.W))
    } ) 

}
class main extends Module{
 val io = IO(new Bundle{
  val output = Output(UInt(1.W))

    
    } )
 val obj1 =  new tx
  val obj2 =  new kx

when(obj1. io.tx===0.B && obj1.io.ready===1.B && obj1.io.valid===1.B){
 obj1.io.ready := 1.B
 obj1.io.valid := 1.B
obj1.io.data := 1.B 
}

obj2.io.dat:= obj1.io.data
obj2.io.v:= obj1.io.valid
obj1.io.ready:= obj2.io.r



}