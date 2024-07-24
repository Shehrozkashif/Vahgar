package singlecycle
import chisel3._
// import chisel3.stage.ChiselStage
import chisel3.util._
class topmod extends Module {
  val io = IO(new Bundle {
val output= Output(UInt(32.W))
  })
val alumod = Module(new alumod)
val cumod = Module(new controlunitmod)
val inmmod = Module(new Imemmod)
val pcmod = Module(new pcmod)
val regfmod = Module(new registerfilemod)
val immg = Module(new immgenrmod)
val dmmod=Module(new datamemorymod)

dmmod.io.dataIn(0) := 0.U
dmmod.io.dataIn(1) := 0.U
dmmod.io.dataIn(2) := 0.U
dmmod.io.dataIn(3) := 0.U

dmmod.io.mask(0) := 0.B
dmmod.io.mask(1) := 0.B
dmmod.io.mask(2) := 0.B
dmmod.io.mask(3) := 0.B

inmmod.io.data_in:= 0.U    // default value of data memory
dmmod.io.wr_enable:=false.B
dmmod.io.addr:=0.U
dmmod.io.rd_enable:=false.B
io.output:=0.U
pcmod.io.jump := 0.B
pcmod.io.jump2 := 0.B
pcmod.io.jump3 := 0.B
pcmod.io.imm := 0.U    // default value for immediate in pc

inmmod.io.enable := cumod.io.en_imem
inmmod.io.address:= pcmod.io.out
cumod.io.instruction := inmmod.io.out
immg.io.instruction := inmmod.io.out
regfmod.io.raddr1 := cumod.io.rs1
regfmod.io.raddr2 := cumod.io.rs2
regfmod.io.waddr := cumod.io.rd
alumod.io.op := cumod.io.func3_7
pcmod.io.rs1data := regfmod.io.rdata1

alumod.io.A := regfmod.io.rdata1
alumod.io.B := 0.U

regfmod.io.wen := cumod.io.en_reg
when(cumod.io.instruction(6,0) === "h33".U ){ // R type 
// alumod.io.A := regfmod.io.rdata1
alumod.io.B := regfmod.io.rdata2
}
.elsewhen(cumod.io.instruction(6,0) === "h13".U){  // I type
alumod.io.B := immg.io.imm
}

dmmod.io.wr_enable := 0.B
// address calculation for store type
when(cumod.io.instruction(6,0) === "h23".U ){
  alumod.io.op:= 0.U
  alumod.io.A := regfmod.io.rdata1
  alumod.io.B := immg.io.imm
  dmmod.io.wr_enable := 1.B

  dmmod.io.addr := alumod.io.out(9,2)

  val masksel = alumod.io.out(1,0)

  when(cumod.io.instruction(14,12) === 0.U){  // Store Bytes
    // dmmod.io.dataIn := regfmod.io.rdata2(7,0)
    when(masksel === 0.U)
      {        
        dmmod.io.mask(0) := 1.B
        dmmod.io.mask(1) := 0.B
        dmmod.io.mask(2) := 0.B
        dmmod.io.mask(3) := 0.B

        dmmod.io.dataIn(0) := regfmod.io.rdata2(7,0)
        dmmod.io.dataIn(1) := 0.U
        dmmod.io.dataIn(2) := 0.U
        dmmod.io.dataIn(3) := 0.U

      }
      .elsewhen(masksel === 1.U)
      {        
        dmmod.io.mask(0) := 0.B
        dmmod.io.mask(1) := 1.B
        dmmod.io.mask(2) := 0.B
        dmmod.io.mask(3) := 0.B

        dmmod.io.dataIn(0) := 0.U
        dmmod.io.dataIn(1) := regfmod.io.rdata2(7,0)
        dmmod.io.dataIn(2) := 0.U
        dmmod.io.dataIn(3) := 0.U

      }
      .elsewhen(masksel === 2.U)
      {        
        dmmod.io.mask(0) := 0.B
        dmmod.io.mask(1) := 0.B
        dmmod.io.mask(2) := 1.B
        dmmod.io.mask(3) := 0.B

        dmmod.io.dataIn(0) := 0.U
        dmmod.io.dataIn(1) := 0.U
        dmmod.io.dataIn(2) := regfmod.io.rdata2(7,0)
        dmmod.io.dataIn(3) := 0.U

      }
      .elsewhen(masksel === 3.U)
      {        
        dmmod.io.mask(0) := 0.B
        dmmod.io.mask(1) := 0.B
        dmmod.io.mask(2) := 0.B
        dmmod.io.mask(3) := 1.B

        dmmod.io.dataIn(0) := 0.U
        dmmod.io.dataIn(1) := 0.U
        dmmod.io.dataIn(2) := 0.U
        dmmod.io.dataIn(3) := regfmod.io.rdata2(7,0)

      }
      

  }.elsewhen(cumod.io.instruction(14,12) === 1.U){ // store halfword
    // dmmod.io.dataIn := regfmod.io.rdata2(15,0)
  when(masksel === 0.U)
      {        
        dmmod.io.mask(0) := 1.B
        dmmod.io.mask(1) := 1.B
        dmmod.io.mask(2) := 0.B
        dmmod.io.mask(3) := 0.B

        dmmod.io.dataIn(0) := regfmod.io.rdata2(7,0)
        dmmod.io.dataIn(1) := regfmod.io.rdata2(15,8)
        dmmod.io.dataIn(2) := 0.U
        dmmod.io.dataIn(3) := 0.U

      }

   // dmmod.io.dataIn := regfmod.io.rdata2(15,0)
  when(masksel === 1.U)
      {        
        dmmod.io.mask(0) := 0.B
        dmmod.io.mask(1) := 1.B
        dmmod.io.mask(2) := 1.B
        dmmod.io.mask(3) := 0.B

        dmmod.io.dataIn(0) := 0.U
        dmmod.io.dataIn(1) := regfmod.io.rdata2(7,0)
        dmmod.io.dataIn(2) := regfmod.io.rdata2(15,8)
        dmmod.io.dataIn(3) := 0.U

      }

 when(masksel === 2.U)
      {        
        dmmod.io.mask(0) := 0.B
        dmmod.io.mask(1) := 0.B
        dmmod.io.mask(2) := 1.B
        dmmod.io.mask(3) := 1.B

        dmmod.io.dataIn(0) := 0.U
        dmmod.io.dataIn(1) := 0.U
        dmmod.io.dataIn(2) := regfmod.io.rdata2(7,0)
        dmmod.io.dataIn(3) := regfmod.io.rdata2(15,8)

      }

       when(masksel === 3.U)
      {        
        dmmod.io.mask(0) := 1.B
        dmmod.io.mask(1) := 0.B
        dmmod.io.mask(2) := 0.B
        dmmod.io.mask(3) := 1.B

        dmmod.io.dataIn(0) := regfmod.io.rdata2(15,8)
        dmmod.io.dataIn(1) := 0.U
        dmmod.io.dataIn(2) := 0.U
        dmmod.io.dataIn(3) := regfmod.io.rdata2(7,0)

      }

  }.elsewhen(cumod.io.instruction(14,12) === 2.U){  // store word 
    // dmmod.io.dataIn := regfmod.io.rdata2

      
        dmmod.io.mask(0) := 1.B
        dmmod.io.mask(1) := 1.B
        dmmod.io.mask(2) := 1.B
        dmmod.io.mask(3) := 1.B

        dmmod.io.dataIn(0) := regfmod.io.rdata2(7,0)
        dmmod.io.dataIn(1) := regfmod.io.rdata2(15,8)
        dmmod.io.dataIn(2) := regfmod.io.rdata2(23,16)
        dmmod.io.dataIn(3) := regfmod.io.rdata2(31,24)

      


  }
  
}

regfmod.io.wdata :=  alumod.io.out
io.output := regfmod.io.wdata // expecting for load and store
 
// load type
when(cumod.io.instruction(6,0) === "h3".U ){
  alumod.io.op:= 0.U

  alumod.io.A := regfmod.io.rdata1
  alumod.io.B := immg.io.imm

  dmmod.io.addr := alumod.io.out(9,2)
  dmmod.io.rd_enable := 1.B
      val masksel = alumod.io.out(1,0)
  // Calculating load address
    when(cumod.io.instruction(14,12) === "b000".U ){ // load byte
      // regfmod.io.waddr := dmmod.io.out(7,0)

    when(masksel=== 0.U){
      regfmod.io.wdata := Cat( Fill(24, dmmod.io.out(0)(7)) ,dmmod.io.out(0) )
    }.elsewhen(masksel === 1.U){
      regfmod.io.wdata := Cat( Fill(24, dmmod.io.out(1)(7)) ,dmmod.io.out(1) )
    }.elsewhen(masksel === 2.U){
      regfmod.io.wdata := Cat( Fill(24, dmmod.io.out(2)(7)) ,dmmod.io.out(2) )
    }.elsewhen(masksel === 3.U){
      regfmod.io.wdata := Cat( Fill(24, dmmod.io.out(3)(7)) ,dmmod.io.out(3) )
    }

    }.elsewhen(cumod.io.instruction(14,12) === "b001".U ){ // load half
            
       when(masksel=== 0.U){
      regfmod.io.wdata := Cat( Fill(16, dmmod.io.out(1)(7)), dmmod.io.out(1), dmmod.io.out(0) )
    }.elsewhen(masksel === 1.U){
      regfmod.io.wdata := Cat( Fill(16, dmmod.io.out(2)(7)), dmmod.io.out(2), dmmod.io.out(1) )
    }.elsewhen(masksel === 2.U){
      regfmod.io.wdata := Cat( Fill(16, dmmod.io.out(3)(7)), dmmod.io.out(3), dmmod.io.out(2) )
    }.elsewhen(masksel === 3.U){
      regfmod.io.wdata := Cat( Fill(16, dmmod.io.out(0)(7)), dmmod.io.out(0) ,dmmod.io.out(3) )
    }



    }.elsewhen(cumod.io.instruction(14,12) === "b010".U ){ // load word
      regfmod.io.wdata := Cat(dmmod.io.out(3),dmmod.io.out(2),dmmod.io.out(1),dmmod.io.out(0))


    }.elsewhen(cumod.io.instruction(14,12) === "b100".U ){ // load byte un
      
      when(masksel=== 0.U){
      regfmod.io.wdata := Cat( Fill(24, dmmod.io.out(0)(7)) ,dmmod.io.out(0) )
    }.elsewhen(masksel === 1.U){
      regfmod.io.wdata := Cat( Fill(24, dmmod.io.out(1)(7)) ,dmmod.io.out(1) )
    }.elsewhen(masksel === 2.U){
      regfmod.io.wdata := Cat( Fill(24, dmmod.io.out(2)(7)) ,dmmod.io.out(2) )
    }.elsewhen(masksel === 3.U){
      regfmod.io.wdata := Cat( Fill(24, dmmod.io.out(3)(7)) ,dmmod.io.out(3) )
    }


    }.elsewhen(cumod.io.instruction(14,12) === "b101".U ){ // load half
      
      when(masksel=== 0.U){
      regfmod.io.wdata := Cat( Fill(16, dmmod.io.out(1)(7)), dmmod.io.out(1), dmmod.io.out(0) )
    }.elsewhen(masksel === 1.U){
      regfmod.io.wdata := Cat( Fill(16, dmmod.io.out(2)(7)), dmmod.io.out(2), dmmod.io.out(1) )
    }.elsewhen(masksel === 2.U){
      regfmod.io.wdata := Cat( Fill(16, dmmod.io.out(3)(7)), dmmod.io.out(3), dmmod.io.out(2) )
    }.elsewhen(masksel === 3.U){
      regfmod.io.wdata := Cat( Fill(16, dmmod.io.out(0)(7)), dmmod.io.out(0) ,dmmod.io.out(3) )
    }

    }

}

// branch type instruction 
when(cumod.io.instruction(6, 0) === 99.U) {
    pcmod.io.imm := immg.io.imm
    when(cumod.io.instruction(14, 12) === 0.U) { // beq
      when(regfmod.io.rdata1 === regfmod.io.rdata2) {
        pcmod.io.jump := true.B
      }
    }.elsewhen(cumod.io.instruction(14, 12) === 1.U) { // bne
      when(regfmod.io.rdata1 =/= regfmod.io.rdata2) {
        pcmod.io.jump := true.B
      }
    }.elsewhen(cumod.io.instruction(14, 12) === 2.U) { // blt
      when(regfmod.io.rdata1 < regfmod.io.rdata2) {
        pcmod.io.jump := true.B
      }
    }.elsewhen(cumod.io.instruction(14, 12) === 3.U) { // bge
      when(regfmod.io.rdata1 >= regfmod.io.rdata2) {
        pcmod.io.jump := true.B
      }
    }.elsewhen(cumod.io.instruction(14, 12) === 4.U) { // bltu
      when(regfmod.io.rdata1.asUInt < regfmod.io.rdata2.asUInt()) {
        pcmod.io.jump := true.B
      }
    }.elsewhen(cumod.io.instruction(14, 12) === 5.U) { // bgeu
      when(regfmod.io.rdata1.asUInt >= regfmod.io.rdata2.asUInt()) {
        pcmod.io.jump := true.B
      }
    }

  }
// uuper immeidate type code

when(cumod.io.instruction(6,0) === "h37".U ){ // U type lui
regfmod.io.wdata := immg.io.imm
}
when(cumod.io.instruction(6,0) === "h17".U ){ // U type auipc
regfmod.io.wdata :=   pcmod.io.out + immg.io.imm
// val temp = Cat(immg.io.imm, Fill(12 ,0.U) )
// regfmod.io.wdata := temp + pcmod.io.out
io.output := regfmod.io.wdata
}
when(cumod.io.instruction(6,0) === "h6f".U){   //jal
  pcmod.io.jump2 := 1.B
  regfmod.io.wdata :=   pcmod.io.out + 4.U
  pcmod.io.imm := immg.io.imm
}

when(cumod.io.instruction(6,0) === "h67".U){   //jalr
  pcmod.io.jump3 := 1.B
  regfmod.io.wdata :=   pcmod.io.out + 4.U
  pcmod.io.imm := immg.io.imm
}

}