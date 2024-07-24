package singlecycle
import chisel3._
class registerfile extends Module{
    var io=IO(new Bundle{
val raddr1 = Input ( UInt (5. W ) ) // rs1 
val raddr2 = Input ( UInt (5. W ) )  // rs2 
val rdata1 = Output ( UInt ( 32 . W ) ) //rs1 output
val rdata2 = Output ( UInt ( 32 . W ) ) //rs2 output
val wen = Input ( Bool () ) // wenable input
val waddr = Input ( UInt (5. W ) )  //rd
val wdata = Input ( UInt ( 32 . W ) ) // rd data

    })
val regs = Reg ( Vec ( 32 , UInt ( 32 . W ) ) )
io . rdata1 := Mux (( io . raddr1 . orR ) , regs ( io . raddr1 ) , 0. U )
io . rdata2 := Mux (( io . raddr2 . orR ) , regs ( io . raddr2 ) , 0. U )
when ( io . wen & io . waddr . orR ) {
    regs ( io . waddr ) := io . wdata
    
}
}
