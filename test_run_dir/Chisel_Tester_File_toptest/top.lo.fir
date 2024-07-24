circuit top :
  module alu :
    input clock : Clock
    input reset : UInt<1>
    input io_A : UInt<32>
    input io_B : UInt<32>
    input io_op : UInt<4>
    output io_out : UInt<32>

    node shiftamount = bits(io_B, 4, 0) @[alu.scala 28:25]
    node _T = eq(UInt<4>("h0"), io_op) @[Conditional.scala 37:30]
    node _io_out_T = add(io_A, io_B) @[alu.scala 32:22]
    node _io_out_T_1 = tail(_io_out_T, 1) @[alu.scala 32:22]
    node _T_1 = eq(UInt<4>("h8"), io_op) @[Conditional.scala 37:30]
    node _io_out_T_2 = sub(io_A, io_B) @[alu.scala 35:22]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[alu.scala 35:22]
    node _T_2 = eq(UInt<4>("h7"), io_op) @[Conditional.scala 37:30]
    node _io_out_T_4 = and(io_A, io_B) @[alu.scala 38:22]
    node _T_3 = eq(UInt<4>("h6"), io_op) @[Conditional.scala 37:30]
    node _io_out_T_5 = or(io_A, io_B) @[alu.scala 41:22]
    node _T_4 = eq(UInt<4>("h4"), io_op) @[Conditional.scala 37:30]
    node _io_out_T_6 = xor(io_A, io_B) @[alu.scala 44:22]
    node _T_5 = eq(UInt<4>("h2"), io_op) @[Conditional.scala 37:30]
    node _T_6 = lt(io_A, io_B) @[alu.scala 47:18]
    node _GEN_0 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[alu.scala 47:26 alu.scala 48:16 alu.scala 29:10]
    node _T_7 = eq(UInt<4>("h1"), io_op) @[Conditional.scala 37:30]
    node _io_out_T_7 = dshl(io_A, shiftamount) @[alu.scala 52:22]
    node _T_8 = eq(UInt<4>("h3"), io_op) @[Conditional.scala 37:30]
    node _T_9 = lt(io_A, io_B) @[alu.scala 58:18]
    node _GEN_1 = mux(_T_9, UInt<1>("h1"), UInt<1>("h0")) @[alu.scala 58:25 alu.scala 59:16 alu.scala 29:10]
    node _T_10 = eq(UInt<4>("h5"), io_op) @[Conditional.scala 37:30]
    node _io_out_T_8 = dshr(io_A, shiftamount) @[alu.scala 66:22]
    node _T_11 = eq(UInt<4>("hd"), io_op) @[Conditional.scala 37:30]
    node _io_out_T_9 = asSInt(io_A) @[alu.scala 69:17]
    node _io_out_T_10 = dshr(_io_out_T_9, shiftamount) @[alu.scala 69:23]
    node _io_out_T_11 = asUInt(_io_out_T_10) @[alu.scala 69:38]
    node _GEN_2 = mux(_T_11, _io_out_T_11, UInt<1>("h0")) @[Conditional.scala 39:67 alu.scala 69:9 alu.scala 29:10]
    node _GEN_3 = mux(_T_10, _io_out_T_8, _GEN_2) @[Conditional.scala 39:67 alu.scala 66:15]
    node _GEN_4 = mux(_T_8, _GEN_1, _GEN_3) @[Conditional.scala 39:67]
    node _GEN_5 = mux(_T_7, _io_out_T_7, _GEN_4) @[Conditional.scala 39:67 alu.scala 52:14]
    node _GEN_6 = mux(_T_5, _GEN_0, _GEN_5) @[Conditional.scala 39:67]
    node _GEN_7 = mux(_T_4, _io_out_T_6, _GEN_6) @[Conditional.scala 39:67 alu.scala 44:14]
    node _GEN_8 = mux(_T_3, _io_out_T_5, _GEN_7) @[Conditional.scala 39:67 alu.scala 41:14]
    node _GEN_9 = mux(_T_2, _io_out_T_4, _GEN_8) @[Conditional.scala 39:67 alu.scala 38:14]
    node _GEN_10 = mux(_T_1, _io_out_T_3, _GEN_9) @[Conditional.scala 39:67 alu.scala 35:14]
    node _GEN_11 = mux(_T, _io_out_T_1, _GEN_10) @[Conditional.scala 40:58 alu.scala 32:14]
    io_out <= bits(_GEN_11, 31, 0)

  module controlunit :
    input clock : Clock
    input reset : UInt<1>
    input io_instruction : UInt<32>
    output io_func3_7 : UInt<3>
    output io_en_imem : UInt<1>
    output io_en_reg : UInt<1>
    output io_rd : UInt<5>
    output io_rs2 : UInt<5>
    output io_rs1 : UInt<5>
    output io_imm : UInt<12>

    node _T = bits(io_instruction, 6, 0) @[controlunit.scala 20:20]
    node _T_1 = eq(_T, UInt<6>("h33")) @[controlunit.scala 20:26]
    node io_func3_7_hi = bits(io_instruction, 30, 30) @[controlunit.scala 22:35]
    node io_func3_7_lo = bits(io_instruction, 14, 12) @[controlunit.scala 22:54]
    node _io_func3_7_T = cat(io_func3_7_hi, io_func3_7_lo) @[Cat.scala 30:58]
    node _T_2 = bits(io_instruction, 6, 0) @[controlunit.scala 24:26]
    node _T_3 = eq(_T_2, UInt<5>("h13")) @[controlunit.scala 24:32]
    node _io_func3_7_T_1 = bits(io_instruction, 14, 12) @[controlunit.scala 26:33]
    node _T_4 = bits(io_instruction, 14, 12) @[controlunit.scala 27:24]
    node _T_5 = eq(_T_4, UInt<3>("h5")) @[controlunit.scala 27:33]
    node io_func3_7_hi_1 = bits(io_instruction, 30, 30) @[controlunit.scala 29:39]
    node io_func3_7_lo_1 = bits(io_instruction, 14, 12) @[controlunit.scala 29:58]
    node _io_func3_7_T_2 = cat(io_func3_7_hi_1, io_func3_7_lo_1) @[Cat.scala 30:58]
    node _GEN_0 = mux(_T_5, _io_func3_7_T_2, _io_func3_7_T_1) @[controlunit.scala 28:5 controlunit.scala 29:18 controlunit.scala 26:16]
    node _T_6 = bits(io_instruction, 6, 0) @[controlunit.scala 32:26]
    node _T_7 = eq(_T_6, UInt<2>("h3")) @[controlunit.scala 32:32]
    node _io_func3_7_T_3 = bits(io_instruction, 14, 12) @[controlunit.scala 34:33]
    node _T_8 = bits(io_instruction, 6, 0) @[controlunit.scala 36:26]
    node _T_9 = eq(_T_8, UInt<6>("h23")) @[controlunit.scala 36:32]
    node _io_func3_7_T_4 = bits(io_instruction, 14, 12) @[controlunit.scala 38:33]
    node _T_10 = bits(io_instruction, 6, 0) @[controlunit.scala 40:26]
    node _T_11 = eq(_T_10, UInt<7>("h6f")) @[controlunit.scala 40:32]
    node _GEN_1 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[controlunit.scala 40:44 controlunit.scala 41:13 controlunit.scala 17:11]
    node _GEN_2 = mux(_T_9, _io_func3_7_T_4, UInt<1>("h0")) @[controlunit.scala 37:1 controlunit.scala 38:16 controlunit.scala 18:12]
    node _GEN_3 = mux(_T_9, UInt<1>("h0"), _GEN_1) @[controlunit.scala 37:1 controlunit.scala 39:15]
    node _GEN_4 = mux(_T_7, _io_func3_7_T_3, _GEN_2) @[controlunit.scala 33:1 controlunit.scala 34:16]
    node _GEN_5 = mux(_T_7, UInt<1>("h1"), _GEN_3) @[controlunit.scala 33:1 controlunit.scala 35:15]
    node _GEN_6 = mux(_T_3, _GEN_0, _GEN_4) @[controlunit.scala 25:1]
    node _GEN_7 = mux(_T_3, UInt<1>("h1"), _GEN_5) @[controlunit.scala 25:1 controlunit.scala 31:15]
    node _GEN_8 = mux(_T_1, _io_func3_7_T, _GEN_6) @[controlunit.scala 21:1 controlunit.scala 22:14]
    node _GEN_9 = mux(_T_1, UInt<1>("h1"), _GEN_7) @[controlunit.scala 21:1 controlunit.scala 23:13]
    node _io_rd_T = bits(io_instruction, 11, 7) @[controlunit.scala 44:25]
    node _io_rs1_T = bits(io_instruction, 19, 15) @[controlunit.scala 45:26]
    node _io_rs2_T = bits(io_instruction, 24, 20) @[controlunit.scala 46:26]
    node _io_imm_T = bits(io_instruction, 31, 20) @[controlunit.scala 47:26]
    io_func3_7 <= bits(_GEN_8, 2, 0)
    io_en_imem <= UInt<1>("h0") @[controlunit.scala 16:12]
    io_en_reg <= _GEN_9
    io_rd <= _io_rd_T @[controlunit.scala 44:8]
    io_rs2 <= _io_rs2_T @[controlunit.scala 46:9]
    io_rs1 <= _io_rs1_T @[controlunit.scala 45:9]
    io_imm <= _io_imm_T @[controlunit.scala 47:9]

  module Imem :
    input clock : Clock
    input reset : UInt<1>
    input io_data_in : UInt<32>
    input io_enable : UInt<1>
    input io_address : UInt<32>
    output io_out : UInt<32>

    mem memory : @[Imem.scala 13:17]
      data-type => UInt<32>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_out_MPORT
      writer => MPORT
      read-under-write => undefined
    node _T = shr(io_address, 2) @[Imem.scala 18:26]
    node _T_1 = bits(_T, 7, 0)
    node _GEN_0 = validif(io_enable, _T_1) @[Imem.scala 17:20]
    node _GEN_1 = validif(io_enable, clock) @[Imem.scala 17:20]
    node _GEN_2 = mux(io_enable, UInt<1>("h1"), UInt<1>("h0")) @[Imem.scala 17:20 Imem.scala 13:17]
    node _GEN_3 = validif(io_enable, UInt<1>("h1")) @[Imem.scala 17:20]
    node _GEN_4 = validif(io_enable, io_data_in) @[Imem.scala 17:20]
    node _io_out_T = shr(io_address, 2) @[Imem.scala 20:35]
    node _io_out_T_1 = bits(_io_out_T, 7, 0) @[Imem.scala 20:22]
    io_out <= memory.io_out_MPORT.data @[Imem.scala 20:8]
    memory.io_out_MPORT.addr <= _io_out_T_1 @[Imem.scala 20:22]
    memory.io_out_MPORT.en <= UInt<1>("h1") @[Imem.scala 20:22]
    memory.io_out_MPORT.clk <= clock @[Imem.scala 20:22]
    memory.MPORT.addr <= _GEN_0
    memory.MPORT.en <= _GEN_2
    memory.MPORT.clk <= _GEN_1
    memory.MPORT.data <= _GEN_4
    memory.MPORT.mask <= _GEN_3

  module pc :
    input clock : Clock
    input reset : UInt<1>
    input io_imm : UInt<32>
    output io_out : UInt<32>
    input io_jump : UInt<1>
    input io_jump2 : UInt<1>
    input io_jump3 : UInt<1>
    input io_rs1data : UInt<32>

    reg pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc) @[pc.scala 18:19]
    node _pc_T = add(pc, UInt<3>("h4")) @[pc.scala 24:11]
    node _pc_T_1 = tail(_pc_T, 1) @[pc.scala 24:11]
    node _GEN_0 = mux(io_jump, io_imm, _pc_T_1) @[pc.scala 20:14 pc.scala 21:4 pc.scala 24:4]
    node _T = eq(pc, UInt<11>("h400")) @[pc.scala 26:9]
    node _GEN_1 = mux(_T, UInt<1>("h0"), _GEN_0) @[pc.scala 26:17 pc.scala 27:4]
    node _GEN_2 = mux(io_jump2, io_imm, _GEN_1) @[pc.scala 29:16 pc.scala 31:4]
    node _GEN_3 = mux(io_jump3, io_imm, _GEN_2) @[pc.scala 34:16 pc.scala 35:4]
    io_out <= pc @[pc.scala 38:8]
    pc <= mux(reset, UInt<32>("h0"), _GEN_3) @[pc.scala 18:19 pc.scala 18:19]

  module registerfile :
    input clock : Clock
    input reset : UInt<1>
    input io_raddr1 : UInt<5>
    input io_raddr2 : UInt<5>
    output io_rdata1 : UInt<32>
    output io_rdata2 : UInt<32>
    input io_wen : UInt<1>
    input io_waddr : UInt<5>
    input io_wdata : UInt<32>

    reg regs_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_0) @[registerfile.scala 14:16]
    reg regs_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_1) @[registerfile.scala 14:16]
    reg regs_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_2) @[registerfile.scala 14:16]
    reg regs_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_3) @[registerfile.scala 14:16]
    reg regs_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_4) @[registerfile.scala 14:16]
    reg regs_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_5) @[registerfile.scala 14:16]
    reg regs_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_6) @[registerfile.scala 14:16]
    reg regs_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_7) @[registerfile.scala 14:16]
    reg regs_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_8) @[registerfile.scala 14:16]
    reg regs_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_9) @[registerfile.scala 14:16]
    reg regs_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_10) @[registerfile.scala 14:16]
    reg regs_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_11) @[registerfile.scala 14:16]
    reg regs_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_12) @[registerfile.scala 14:16]
    reg regs_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_13) @[registerfile.scala 14:16]
    reg regs_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_14) @[registerfile.scala 14:16]
    reg regs_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_15) @[registerfile.scala 14:16]
    reg regs_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_16) @[registerfile.scala 14:16]
    reg regs_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_17) @[registerfile.scala 14:16]
    reg regs_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_18) @[registerfile.scala 14:16]
    reg regs_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_19) @[registerfile.scala 14:16]
    reg regs_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_20) @[registerfile.scala 14:16]
    reg regs_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_21) @[registerfile.scala 14:16]
    reg regs_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_22) @[registerfile.scala 14:16]
    reg regs_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_23) @[registerfile.scala 14:16]
    reg regs_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_24) @[registerfile.scala 14:16]
    reg regs_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_25) @[registerfile.scala 14:16]
    reg regs_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_26) @[registerfile.scala 14:16]
    reg regs_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_27) @[registerfile.scala 14:16]
    reg regs_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_28) @[registerfile.scala 14:16]
    reg regs_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_29) @[registerfile.scala 14:16]
    reg regs_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_30) @[registerfile.scala 14:16]
    reg regs_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_31) @[registerfile.scala 14:16]
    node _io_rdata1_T = orr(io_raddr1) @[registerfile.scala 15:37]
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_raddr1), regs_0) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_raddr1), regs_1, _GEN_0) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_raddr1), regs_2, _GEN_1) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_raddr1), regs_3, _GEN_2) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_raddr1), regs_4, _GEN_3) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_raddr1), regs_5, _GEN_4) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_raddr1), regs_6, _GEN_5) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_raddr1), regs_7, _GEN_6) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_raddr1), regs_8, _GEN_7) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_raddr1), regs_9, _GEN_8) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_raddr1), regs_10, _GEN_9) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_raddr1), regs_11, _GEN_10) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_raddr1), regs_12, _GEN_11) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_raddr1), regs_13, _GEN_12) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_raddr1), regs_14, _GEN_13) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_raddr1), regs_15, _GEN_14) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_raddr1), regs_16, _GEN_15) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_raddr1), regs_17, _GEN_16) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_raddr1), regs_18, _GEN_17) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_raddr1), regs_19, _GEN_18) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_raddr1), regs_20, _GEN_19) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_raddr1), regs_21, _GEN_20) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_raddr1), regs_22, _GEN_21) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_raddr1), regs_23, _GEN_22) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_raddr1), regs_24, _GEN_23) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_raddr1), regs_25, _GEN_24) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_raddr1), regs_26, _GEN_25) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_raddr1), regs_27, _GEN_26) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_raddr1), regs_28, _GEN_27) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_raddr1), regs_29, _GEN_28) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_raddr1), regs_30, _GEN_29) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_raddr1), regs_31, _GEN_30) @[registerfile.scala 15:20 registerfile.scala 15:20]
    node _regs_io_raddr1 = _GEN_31 @[registerfile.scala 15:20]
    node _io_rdata1_T_1 = mux(_io_rdata1_T, _regs_io_raddr1, UInt<1>("h0")) @[registerfile.scala 15:20]
    node _io_rdata2_T = orr(io_raddr2) @[registerfile.scala 16:37]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_raddr2), regs_0) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_raddr2), regs_1, _GEN_32) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_raddr2), regs_2, _GEN_33) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_raddr2), regs_3, _GEN_34) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_raddr2), regs_4, _GEN_35) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_raddr2), regs_5, _GEN_36) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_raddr2), regs_6, _GEN_37) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_raddr2), regs_7, _GEN_38) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_raddr2), regs_8, _GEN_39) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_raddr2), regs_9, _GEN_40) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_raddr2), regs_10, _GEN_41) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_raddr2), regs_11, _GEN_42) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_raddr2), regs_12, _GEN_43) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_raddr2), regs_13, _GEN_44) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_raddr2), regs_14, _GEN_45) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_raddr2), regs_15, _GEN_46) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_48 = mux(eq(UInt<5>("h10"), io_raddr2), regs_16, _GEN_47) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_49 = mux(eq(UInt<5>("h11"), io_raddr2), regs_17, _GEN_48) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_50 = mux(eq(UInt<5>("h12"), io_raddr2), regs_18, _GEN_49) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_51 = mux(eq(UInt<5>("h13"), io_raddr2), regs_19, _GEN_50) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_52 = mux(eq(UInt<5>("h14"), io_raddr2), regs_20, _GEN_51) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_53 = mux(eq(UInt<5>("h15"), io_raddr2), regs_21, _GEN_52) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_54 = mux(eq(UInt<5>("h16"), io_raddr2), regs_22, _GEN_53) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_55 = mux(eq(UInt<5>("h17"), io_raddr2), regs_23, _GEN_54) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_56 = mux(eq(UInt<5>("h18"), io_raddr2), regs_24, _GEN_55) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_57 = mux(eq(UInt<5>("h19"), io_raddr2), regs_25, _GEN_56) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_58 = mux(eq(UInt<5>("h1a"), io_raddr2), regs_26, _GEN_57) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_59 = mux(eq(UInt<5>("h1b"), io_raddr2), regs_27, _GEN_58) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_60 = mux(eq(UInt<5>("h1c"), io_raddr2), regs_28, _GEN_59) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_61 = mux(eq(UInt<5>("h1d"), io_raddr2), regs_29, _GEN_60) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_62 = mux(eq(UInt<5>("h1e"), io_raddr2), regs_30, _GEN_61) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _GEN_63 = mux(eq(UInt<5>("h1f"), io_raddr2), regs_31, _GEN_62) @[registerfile.scala 16:20 registerfile.scala 16:20]
    node _regs_io_raddr2 = _GEN_63 @[registerfile.scala 16:20]
    node _io_rdata2_T_1 = mux(_io_rdata2_T, _regs_io_raddr2, UInt<1>("h0")) @[registerfile.scala 16:20]
    node _T = orr(io_waddr) @[registerfile.scala 17:32]
    node _T_1 = and(io_wen, _T) @[registerfile.scala 17:17]
    node _regs_io_waddr = io_wdata @[registerfile.scala 18:25 registerfile.scala 18:25]
    node _GEN_64 = mux(eq(UInt<1>("h0"), io_waddr), _regs_io_waddr, regs_0) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_waddr), _regs_io_waddr, regs_1) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_waddr), _regs_io_waddr, regs_2) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_waddr), _regs_io_waddr, regs_3) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_waddr), _regs_io_waddr, regs_4) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_waddr), _regs_io_waddr, regs_5) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_waddr), _regs_io_waddr, regs_6) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_waddr), _regs_io_waddr, regs_7) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_waddr), _regs_io_waddr, regs_8) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_waddr), _regs_io_waddr, regs_9) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_waddr), _regs_io_waddr, regs_10) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_waddr), _regs_io_waddr, regs_11) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_waddr), _regs_io_waddr, regs_12) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_waddr), _regs_io_waddr, regs_13) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_waddr), _regs_io_waddr, regs_14) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_waddr), _regs_io_waddr, regs_15) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_waddr), _regs_io_waddr, regs_16) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_waddr), _regs_io_waddr, regs_17) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_waddr), _regs_io_waddr, regs_18) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_waddr), _regs_io_waddr, regs_19) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_waddr), _regs_io_waddr, regs_20) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_waddr), _regs_io_waddr, regs_21) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_waddr), _regs_io_waddr, regs_22) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_waddr), _regs_io_waddr, regs_23) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_waddr), _regs_io_waddr, regs_24) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_waddr), _regs_io_waddr, regs_25) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_waddr), _regs_io_waddr, regs_26) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_waddr), _regs_io_waddr, regs_27) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_waddr), _regs_io_waddr, regs_28) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_waddr), _regs_io_waddr, regs_29) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_waddr), _regs_io_waddr, regs_30) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_waddr), _regs_io_waddr, regs_31) @[registerfile.scala 18:25 registerfile.scala 18:25 registerfile.scala 14:16]
    node _GEN_96 = mux(_T_1, _GEN_64, regs_0) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_97 = mux(_T_1, _GEN_65, regs_1) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_98 = mux(_T_1, _GEN_66, regs_2) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_99 = mux(_T_1, _GEN_67, regs_3) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_100 = mux(_T_1, _GEN_68, regs_4) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_101 = mux(_T_1, _GEN_69, regs_5) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_102 = mux(_T_1, _GEN_70, regs_6) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_103 = mux(_T_1, _GEN_71, regs_7) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_104 = mux(_T_1, _GEN_72, regs_8) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_105 = mux(_T_1, _GEN_73, regs_9) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_106 = mux(_T_1, _GEN_74, regs_10) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_107 = mux(_T_1, _GEN_75, regs_11) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_108 = mux(_T_1, _GEN_76, regs_12) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_109 = mux(_T_1, _GEN_77, regs_13) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_110 = mux(_T_1, _GEN_78, regs_14) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_111 = mux(_T_1, _GEN_79, regs_15) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_112 = mux(_T_1, _GEN_80, regs_16) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_113 = mux(_T_1, _GEN_81, regs_17) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_114 = mux(_T_1, _GEN_82, regs_18) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_115 = mux(_T_1, _GEN_83, regs_19) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_116 = mux(_T_1, _GEN_84, regs_20) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_117 = mux(_T_1, _GEN_85, regs_21) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_118 = mux(_T_1, _GEN_86, regs_22) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_119 = mux(_T_1, _GEN_87, regs_23) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_120 = mux(_T_1, _GEN_88, regs_24) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_121 = mux(_T_1, _GEN_89, regs_25) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_122 = mux(_T_1, _GEN_90, regs_26) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_123 = mux(_T_1, _GEN_91, regs_27) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_124 = mux(_T_1, _GEN_92, regs_28) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_125 = mux(_T_1, _GEN_93, regs_29) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_126 = mux(_T_1, _GEN_94, regs_30) @[registerfile.scala 17:38 registerfile.scala 14:16]
    node _GEN_127 = mux(_T_1, _GEN_95, regs_31) @[registerfile.scala 17:38 registerfile.scala 14:16]
    io_rdata1 <= _io_rdata1_T_1 @[registerfile.scala 15:13]
    io_rdata2 <= _io_rdata2_T_1 @[registerfile.scala 16:13]
    regs_0 <= _GEN_96
    regs_1 <= _GEN_97
    regs_2 <= _GEN_98
    regs_3 <= _GEN_99
    regs_4 <= _GEN_100
    regs_5 <= _GEN_101
    regs_6 <= _GEN_102
    regs_7 <= _GEN_103
    regs_8 <= _GEN_104
    regs_9 <= _GEN_105
    regs_10 <= _GEN_106
    regs_11 <= _GEN_107
    regs_12 <= _GEN_108
    regs_13 <= _GEN_109
    regs_14 <= _GEN_110
    regs_15 <= _GEN_111
    regs_16 <= _GEN_112
    regs_17 <= _GEN_113
    regs_18 <= _GEN_114
    regs_19 <= _GEN_115
    regs_20 <= _GEN_116
    regs_21 <= _GEN_117
    regs_22 <= _GEN_118
    regs_23 <= _GEN_119
    regs_24 <= _GEN_120
    regs_25 <= _GEN_121
    regs_26 <= _GEN_122
    regs_27 <= _GEN_123
    regs_28 <= _GEN_124
    regs_29 <= _GEN_125
    regs_30 <= _GEN_126
    regs_31 <= _GEN_127

  module immgenr :
    input clock : Clock
    input reset : UInt<1>
    input io_instruction : UInt<32>
    output io_imm : UInt<32>

    node opcode = bits(io_instruction, 6, 0) @[immgenr.scala 24:30]
    node _T = eq(UInt<5>("h13"), opcode) @[Conditional.scala 37:30]
    node _io_imm_T = bits(io_instruction, 31, 31) @[immgenr.scala 27:44]
    node _io_imm_T_1 = bits(_io_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi = mux(_io_imm_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_imm_lo = bits(io_instruction, 31, 20) @[immgenr.scala 27:65]
    node _io_imm_T_2 = cat(io_imm_hi, io_imm_lo) @[Cat.scala 30:58]
    node _T_1 = eq(UInt<2>("h3"), opcode) @[Conditional.scala 37:30]
    node _io_imm_T_3 = bits(io_instruction, 31, 31) @[immgenr.scala 30:44]
    node _io_imm_T_4 = bits(_io_imm_T_3, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi_1 = mux(_io_imm_T_4, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_imm_lo_1 = bits(io_instruction, 31, 20) @[immgenr.scala 30:65]
    node _io_imm_T_5 = cat(io_imm_hi_1, io_imm_lo_1) @[Cat.scala 30:58]
    node _T_2 = eq(UInt<6>("h23"), opcode) @[Conditional.scala 37:30]
    node _io_imm_T_6 = bits(io_instruction, 31, 31) @[immgenr.scala 33:44]
    node _io_imm_T_7 = bits(_io_imm_T_6, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi_hi = mux(_io_imm_T_7, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_imm_hi_lo = bits(io_instruction, 31, 25) @[immgenr.scala 33:65]
    node io_imm_lo_2 = bits(io_instruction, 11, 7) @[immgenr.scala 33:89]
    node io_imm_hi_2 = cat(io_imm_hi_hi, io_imm_hi_lo) @[Cat.scala 30:58]
    node _io_imm_T_8 = cat(io_imm_hi_2, io_imm_lo_2) @[Cat.scala 30:58]
    node _T_3 = eq(UInt<7>("h63"), opcode) @[Conditional.scala 37:30]
    node _io_imm_T_9 = bits(io_instruction, 31, 31) @[immgenr.scala 36:44]
    node _io_imm_T_10 = bits(_io_imm_T_9, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi_hi_hi = mux(_io_imm_T_10, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_imm_hi_hi_lo = bits(io_instruction, 31, 31) @[immgenr.scala 36:65]
    node io_imm_hi_lo_1 = bits(io_instruction, 7, 7) @[immgenr.scala 36:85]
    node io_imm_lo_hi_hi = bits(io_instruction, 30, 25) @[immgenr.scala 36:104]
    node io_imm_lo_hi_lo = bits(io_instruction, 11, 8) @[immgenr.scala 36:127]
    node io_imm_lo_hi = cat(io_imm_lo_hi_hi, io_imm_lo_hi_lo) @[Cat.scala 30:58]
    node io_imm_lo_3 = cat(io_imm_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_imm_hi_hi_1 = cat(io_imm_hi_hi_hi, io_imm_hi_hi_lo) @[Cat.scala 30:58]
    node io_imm_hi_3 = cat(io_imm_hi_hi_1, io_imm_hi_lo_1) @[Cat.scala 30:58]
    node _io_imm_T_11 = cat(io_imm_hi_3, io_imm_lo_3) @[Cat.scala 30:58]
    node _T_4 = eq(UInt<6>("h37"), opcode) @[Conditional.scala 37:30]
    node io_imm_hi_4 = bits(io_instruction, 31, 12) @[immgenr.scala 40:35]
    node io_imm_lo_4 = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node _io_imm_T_12 = cat(io_imm_hi_4, io_imm_lo_4) @[Cat.scala 30:58]
    node _T_5 = eq(UInt<32>("h17"), opcode) @[Conditional.scala 37:30]
    node io_imm_hi_5 = bits(io_instruction, 31, 12) @[immgenr.scala 43:35]
    node io_imm_lo_5 = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node _io_imm_T_13 = cat(io_imm_hi_5, io_imm_lo_5) @[Cat.scala 30:58]
    node _T_6 = eq(UInt<32>("h6f"), opcode) @[Conditional.scala 37:30]
    node _io_imm_T_14 = bits(io_instruction, 31, 31) @[immgenr.scala 49:44]
    node _io_imm_T_15 = bits(_io_imm_T_14, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi_hi_hi_1 = mux(_io_imm_T_15, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_imm_hi_hi_lo_1 = bits(io_instruction, 31, 31) @[immgenr.scala 49:65]
    node io_imm_hi_lo_2 = bits(io_instruction, 19, 12) @[immgenr.scala 49:85]
    node io_imm_lo_hi_hi_1 = bits(io_instruction, 20, 20) @[immgenr.scala 49:109]
    node io_imm_lo_hi_lo_1 = bits(io_instruction, 30, 21) @[immgenr.scala 49:129]
    node io_imm_lo_hi_1 = cat(io_imm_lo_hi_hi_1, io_imm_lo_hi_lo_1) @[Cat.scala 30:58]
    node io_imm_lo_6 = cat(io_imm_lo_hi_1, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_imm_hi_hi_2 = cat(io_imm_hi_hi_hi_1, io_imm_hi_hi_lo_1) @[Cat.scala 30:58]
    node io_imm_hi_6 = cat(io_imm_hi_hi_2, io_imm_hi_lo_2) @[Cat.scala 30:58]
    node _io_imm_T_16 = cat(io_imm_hi_6, io_imm_lo_6) @[Cat.scala 30:58]
    node _T_7 = eq(UInt<32>("h67"), opcode) @[Conditional.scala 37:30]
    node _io_imm_T_17 = bits(io_instruction, 31, 31) @[immgenr.scala 53:44]
    node _io_imm_T_18 = bits(_io_imm_T_17, 0, 0) @[Bitwise.scala 72:15]
    node io_imm_hi_7 = mux(_io_imm_T_18, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_imm_lo_7 = bits(io_instruction, 31, 20) @[immgenr.scala 53:65]
    node _io_imm_T_19 = cat(io_imm_hi_7, io_imm_lo_7) @[Cat.scala 30:58]
    node _GEN_0 = mux(_T_7, _io_imm_T_19, UInt<1>("h0")) @[Conditional.scala 39:67 immgenr.scala 53:14 immgenr.scala 23:10]
    node _GEN_1 = mux(_T_6, _io_imm_T_16, _GEN_0) @[Conditional.scala 39:67 immgenr.scala 49:14]
    node _GEN_2 = mux(_T_5, _io_imm_T_13, _GEN_1) @[Conditional.scala 39:67 immgenr.scala 43:14]
    node _GEN_3 = mux(_T_4, _io_imm_T_12, _GEN_2) @[Conditional.scala 39:67 immgenr.scala 40:14]
    node _GEN_4 = mux(_T_3, _io_imm_T_11, _GEN_3) @[Conditional.scala 39:67 immgenr.scala 36:14]
    node _GEN_5 = mux(_T_2, _io_imm_T_8, _GEN_4) @[Conditional.scala 39:67 immgenr.scala 33:14]
    node _GEN_6 = mux(_T_1, _io_imm_T_5, _GEN_5) @[Conditional.scala 39:67 immgenr.scala 30:14]
    node _GEN_7 = mux(_T, _io_imm_T_2, _GEN_6) @[Conditional.scala 40:58 immgenr.scala 27:14]
    io_imm <= _GEN_7

  module datamemory :
    input clock : Clock
    input reset : UInt<1>
    output io_out_0 : UInt<8>
    output io_out_1 : UInt<8>
    output io_out_2 : UInt<8>
    output io_out_3 : UInt<8>
    input io_addr : UInt<8>
    input io_rd_enable : UInt<1>
    input io_wr_enable : UInt<1>
    input io_mask_0 : UInt<1>
    input io_mask_1 : UInt<1>
    input io_mask_2 : UInt<1>
    input io_mask_3 : UInt<1>
    input io_dataIn_0 : UInt<8>
    input io_dataIn_1 : UInt<8>
    input io_dataIn_2 : UInt<8>
    input io_dataIn_3 : UInt<8>

    mem memory_0 : @[datamemory.scala 20:19]
      data-type => UInt<8>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      writer => MPORT
      read-under-write => undefined
    mem memory_1 : @[datamemory.scala 20:19]
      data-type => UInt<8>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      writer => MPORT
      read-under-write => undefined
    mem memory_2 : @[datamemory.scala 20:19]
      data-type => UInt<8>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      writer => MPORT
      read-under-write => undefined
    mem memory_3 : @[datamemory.scala 20:19]
      data-type => UInt<8>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(io_mask_0, io_dataIn_0)
    node _GEN_1 = mux(io_mask_0, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_2 = validif(io_mask_1, io_dataIn_1)
    node _GEN_3 = mux(io_mask_1, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_4 = validif(io_mask_2, io_dataIn_2)
    node _GEN_5 = mux(io_mask_2, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_6 = validif(io_mask_3, io_dataIn_3)
    node _GEN_7 = mux(io_mask_3, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_8 = validif(io_wr_enable, io_addr) @[datamemory.scala 23:22]
    node _GEN_9 = validif(io_wr_enable, clock) @[datamemory.scala 23:22]
    node _GEN_10 = mux(io_wr_enable, UInt<1>("h1"), UInt<1>("h0")) @[datamemory.scala 23:22 datamemory.scala 20:19]
    node _GEN_11 = validif(io_wr_enable, _GEN_1) @[datamemory.scala 23:22]
    node _GEN_12 = validif(io_wr_enable, _GEN_3) @[datamemory.scala 23:22]
    node _GEN_13 = validif(io_wr_enable, _GEN_5) @[datamemory.scala 23:22]
    node _GEN_14 = validif(io_wr_enable, _GEN_7) @[datamemory.scala 23:22]
    node _GEN_15 = validif(io_wr_enable, _GEN_0) @[datamemory.scala 23:22]
    node _GEN_16 = validif(io_wr_enable, _GEN_2) @[datamemory.scala 23:22]
    node _GEN_17 = validif(io_wr_enable, _GEN_4) @[datamemory.scala 23:22]
    node _GEN_18 = validif(io_wr_enable, _GEN_6) @[datamemory.scala 23:22]
    node _GEN_19 = validif(io_rd_enable, io_addr) @[datamemory.scala 26:22 datamemory.scala 27:26]
    node _GEN_20 = validif(io_rd_enable, clock) @[datamemory.scala 26:22 datamemory.scala 27:26]
    node _GEN_21 = mux(io_rd_enable, UInt<1>("h1"), UInt<1>("h0")) @[datamemory.scala 26:22 datamemory.scala 27:26 datamemory.scala 20:19]
    node _GEN_22 = mux(io_rd_enable, memory_0.MPORT_1.data, UInt<1>("h0")) @[datamemory.scala 26:22 datamemory.scala 27:12 datamemory.scala 14:13]
    node _GEN_23 = mux(io_rd_enable, memory_1.MPORT_1.data, UInt<1>("h0")) @[datamemory.scala 26:22 datamemory.scala 27:12 datamemory.scala 15:13]
    node _GEN_24 = mux(io_rd_enable, memory_2.MPORT_1.data, UInt<1>("h0")) @[datamemory.scala 26:22 datamemory.scala 27:12 datamemory.scala 16:13]
    node _GEN_25 = mux(io_rd_enable, memory_3.MPORT_1.data, UInt<1>("h0")) @[datamemory.scala 26:22 datamemory.scala 27:12 datamemory.scala 17:13]
    io_out_0 <= _GEN_22
    io_out_1 <= _GEN_23
    io_out_2 <= _GEN_24
    io_out_3 <= _GEN_25
    memory_0.MPORT_1.addr <= _GEN_19
    memory_1.MPORT_1.addr <= _GEN_19
    memory_2.MPORT_1.addr <= _GEN_19
    memory_3.MPORT_1.addr <= _GEN_19
    memory_0.MPORT_1.en <= _GEN_21
    memory_1.MPORT_1.en <= _GEN_21
    memory_2.MPORT_1.en <= _GEN_21
    memory_3.MPORT_1.en <= _GEN_21
    memory_0.MPORT_1.clk <= _GEN_20
    memory_1.MPORT_1.clk <= _GEN_20
    memory_2.MPORT_1.clk <= _GEN_20
    memory_3.MPORT_1.clk <= _GEN_20
    memory_0.MPORT.addr <= _GEN_8
    memory_1.MPORT.addr <= _GEN_8
    memory_2.MPORT.addr <= _GEN_8
    memory_3.MPORT.addr <= _GEN_8
    memory_0.MPORT.en <= _GEN_10
    memory_1.MPORT.en <= _GEN_10
    memory_2.MPORT.en <= _GEN_10
    memory_3.MPORT.en <= _GEN_10
    memory_0.MPORT.clk <= _GEN_9
    memory_1.MPORT.clk <= _GEN_9
    memory_2.MPORT.clk <= _GEN_9
    memory_3.MPORT.clk <= _GEN_9
    memory_0.MPORT.data <= _GEN_15
    memory_1.MPORT.data <= _GEN_16
    memory_2.MPORT.data <= _GEN_17
    memory_3.MPORT.data <= _GEN_18
    memory_0.MPORT.mask <= _GEN_11
    memory_1.MPORT.mask <= _GEN_12
    memory_2.MPORT.mask <= _GEN_13
    memory_3.MPORT.mask <= _GEN_14

  module top :
    input clock : Clock
    input reset : UInt<1>
    output io_output : UInt<32>

    inst alumod of alu @[top.scala 9:20]
    inst cumod of controlunit @[top.scala 10:19]
    inst inmmod of Imem @[top.scala 11:20]
    inst pcmod of pc @[top.scala 12:19]
    inst regfmod of registerfile @[top.scala 13:21]
    inst immg of immgenr @[top.scala 14:18]
    inst dmmod of datamemory @[top.scala 15:17]
    node _T = bits(cumod.io_instruction, 6, 0) @[top.scala 51:26]
    node _T_1 = eq(_T, UInt<6>("h33")) @[top.scala 51:32]
    node _T_2 = bits(cumod.io_instruction, 6, 0) @[top.scala 55:31]
    node _T_3 = eq(_T_2, UInt<5>("h13")) @[top.scala 55:37]
    node _GEN_0 = mux(_T_3, immg.io_imm, regfmod.io_rdata2) @[top.scala 55:49 top.scala 56:13 top.scala 48:13]
    node _GEN_1 = mux(_T_1, regfmod.io_rdata2, _GEN_0) @[top.scala 51:45 top.scala 53:13]
    node _T_4 = bits(cumod.io_instruction, 6, 0) @[top.scala 61:26]
    node _T_5 = eq(_T_4, UInt<6>("h23")) @[top.scala 61:32]
    node _dmmod_io_addr_T = bits(alumod.io_out, 9, 2) @[top.scala 67:33]
    node masksel = bits(alumod.io_out, 1, 0) @[top.scala 69:30]
    node _T_6 = bits(cumod.io_instruction, 14, 12) @[top.scala 71:28]
    node _T_7 = eq(_T_6, UInt<1>("h0")) @[top.scala 71:36]
    node _T_8 = eq(masksel, UInt<1>("h0")) @[top.scala 73:18]
    node _dmmod_io_dataIn_0_T = bits(regfmod.io_rdata2, 7, 0) @[top.scala 80:48]
    node _T_9 = eq(masksel, UInt<1>("h1")) @[top.scala 86:25]
    node _dmmod_io_dataIn_1_T = bits(regfmod.io_rdata2, 7, 0) @[top.scala 94:48]
    node _T_10 = eq(masksel, UInt<2>("h2")) @[top.scala 99:25]
    node _dmmod_io_dataIn_2_T = bits(regfmod.io_rdata2, 7, 0) @[top.scala 108:48]
    node _T_11 = eq(masksel, UInt<2>("h3")) @[top.scala 112:25]
    node _dmmod_io_dataIn_3_T = bits(regfmod.io_rdata2, 7, 0) @[top.scala 122:48]
    node _GEN_2 = mux(_T_11, UInt<1>("h0"), UInt<1>("h0")) @[top.scala 113:7 top.scala 114:26 top.scala 22:18]
    node _GEN_3 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 113:7 top.scala 117:26 top.scala 25:18]
    node _GEN_4 = mux(_T_11, _dmmod_io_dataIn_3_T, UInt<1>("h0")) @[top.scala 113:7 top.scala 122:28 top.scala 20:20]
    node _GEN_5 = mux(_T_10, UInt<1>("h0"), _GEN_2) @[top.scala 100:7 top.scala 101:26]
    node _GEN_6 = mux(_T_10, UInt<1>("h1"), _GEN_2) @[top.scala 100:7 top.scala 103:26]
    node _GEN_7 = mux(_T_10, UInt<1>("h0"), _GEN_3) @[top.scala 100:7 top.scala 104:26]
    node _GEN_8 = mux(_T_10, _dmmod_io_dataIn_2_T, UInt<1>("h0")) @[top.scala 100:7 top.scala 108:28 top.scala 19:20]
    node _GEN_9 = mux(_T_10, UInt<1>("h0"), _GEN_4) @[top.scala 100:7 top.scala 20:20]
    node _GEN_10 = mux(_T_9, UInt<1>("h0"), _GEN_5) @[top.scala 87:7 top.scala 88:26]
    node _GEN_11 = mux(_T_9, UInt<1>("h1"), _GEN_5) @[top.scala 87:7 top.scala 89:26]
    node _GEN_12 = mux(_T_9, UInt<1>("h0"), _GEN_6) @[top.scala 87:7 top.scala 90:26]
    node _GEN_13 = mux(_T_9, UInt<1>("h0"), _GEN_7) @[top.scala 87:7 top.scala 91:26]
    node _GEN_14 = mux(_T_9, _dmmod_io_dataIn_1_T, UInt<1>("h0")) @[top.scala 87:7 top.scala 94:28 top.scala 18:20]
    node _GEN_15 = mux(_T_9, UInt<1>("h0"), _GEN_8) @[top.scala 87:7 top.scala 19:20]
    node _GEN_16 = mux(_T_9, UInt<1>("h0"), _GEN_9) @[top.scala 87:7 top.scala 20:20]
    node _GEN_17 = mux(_T_8, UInt<1>("h1"), _GEN_10) @[top.scala 74:7 top.scala 75:26]
    node _GEN_18 = mux(_T_8, UInt<1>("h0"), _GEN_11) @[top.scala 74:7 top.scala 76:26]
    node _GEN_19 = mux(_T_8, UInt<1>("h0"), _GEN_12) @[top.scala 74:7 top.scala 77:26]
    node _GEN_20 = mux(_T_8, UInt<1>("h0"), _GEN_13) @[top.scala 74:7 top.scala 78:26]
    node _GEN_21 = mux(_T_8, _dmmod_io_dataIn_0_T, UInt<1>("h0")) @[top.scala 74:7 top.scala 80:28 top.scala 17:20]
    node _GEN_22 = mux(_T_8, UInt<1>("h0"), _GEN_14) @[top.scala 74:7 top.scala 18:20]
    node _GEN_23 = mux(_T_8, UInt<1>("h0"), _GEN_15) @[top.scala 74:7 top.scala 19:20]
    node _GEN_24 = mux(_T_8, UInt<1>("h0"), _GEN_16) @[top.scala 74:7 top.scala 20:20]
    node _T_12 = bits(cumod.io_instruction, 14, 12) @[top.scala 127:34]
    node _T_13 = eq(_T_12, UInt<1>("h1")) @[top.scala 127:42]
    node _T_14 = eq(masksel, UInt<1>("h0")) @[top.scala 129:16]
    node _dmmod_io_dataIn_0_T_1 = bits(regfmod.io_rdata2, 7, 0) @[top.scala 136:48]
    node _dmmod_io_dataIn_1_T_1 = bits(regfmod.io_rdata2, 15, 8) @[top.scala 137:48]
    node _GEN_25 = mux(_T_14, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 130:7 top.scala 131:26 top.scala 22:18]
    node _GEN_26 = mux(_T_14, UInt<1>("h0"), UInt<1>("h0")) @[top.scala 130:7 top.scala 133:26 top.scala 24:18]
    node _GEN_27 = mux(_T_14, _dmmod_io_dataIn_0_T_1, UInt<1>("h0")) @[top.scala 130:7 top.scala 136:28 top.scala 17:20]
    node _GEN_28 = mux(_T_14, _dmmod_io_dataIn_1_T_1, UInt<1>("h0")) @[top.scala 130:7 top.scala 137:28 top.scala 18:20]
    node _T_15 = eq(masksel, UInt<1>("h1")) @[top.scala 144:16]
    node _dmmod_io_dataIn_1_T_2 = bits(regfmod.io_rdata2, 7, 0) @[top.scala 152:48]
    node _dmmod_io_dataIn_2_T_1 = bits(regfmod.io_rdata2, 15, 8) @[top.scala 153:48]
    node _GEN_29 = mux(_T_15, UInt<1>("h0"), _GEN_25) @[top.scala 145:7 top.scala 146:26]
    node _GEN_30 = mux(_T_15, UInt<1>("h1"), _GEN_25) @[top.scala 145:7 top.scala 147:26]
    node _GEN_31 = mux(_T_15, UInt<1>("h1"), _GEN_26) @[top.scala 145:7 top.scala 148:26]
    node _GEN_32 = mux(_T_15, UInt<1>("h0"), _GEN_26) @[top.scala 145:7 top.scala 149:26]
    node _GEN_33 = mux(_T_15, _dmmod_io_dataIn_1_T_2, _GEN_28) @[top.scala 145:7 top.scala 152:28]
    node _GEN_34 = mux(_T_15, _dmmod_io_dataIn_2_T_1, UInt<1>("h0")) @[top.scala 145:7 top.scala 153:28 top.scala 19:20]
    node _T_16 = eq(masksel, UInt<2>("h2")) @[top.scala 158:15]
    node _dmmod_io_dataIn_2_T_2 = bits(regfmod.io_rdata2, 7, 0) @[top.scala 167:48]
    node _dmmod_io_dataIn_3_T_1 = bits(regfmod.io_rdata2, 15, 8) @[top.scala 168:48]
    node _GEN_35 = mux(_T_16, UInt<1>("h0"), _GEN_29) @[top.scala 159:7 top.scala 160:26]
    node _GEN_36 = mux(_T_16, UInt<1>("h0"), _GEN_30) @[top.scala 159:7 top.scala 161:26]
    node _GEN_37 = mux(_T_16, UInt<1>("h1"), _GEN_31) @[top.scala 159:7 top.scala 162:26]
    node _GEN_38 = mux(_T_16, UInt<1>("h1"), _GEN_32) @[top.scala 159:7 top.scala 163:26]
    node _GEN_39 = mux(_T_16, _dmmod_io_dataIn_2_T_2, _GEN_34) @[top.scala 159:7 top.scala 167:28]
    node _GEN_40 = mux(_T_16, _dmmod_io_dataIn_3_T_1, UInt<1>("h0")) @[top.scala 159:7 top.scala 168:28 top.scala 20:20]
    node _T_17 = eq(masksel, UInt<2>("h3")) @[top.scala 172:21]
    node _dmmod_io_dataIn_0_T_2 = bits(regfmod.io_rdata2, 15, 8) @[top.scala 179:48]
    node _dmmod_io_dataIn_3_T_2 = bits(regfmod.io_rdata2, 7, 0) @[top.scala 182:48]
    node _GEN_41 = mux(_T_17, UInt<1>("h1"), _GEN_35) @[top.scala 173:7 top.scala 174:26]
    node _GEN_42 = mux(_T_17, UInt<1>("h0"), _GEN_36) @[top.scala 173:7 top.scala 175:26]
    node _GEN_43 = mux(_T_17, UInt<1>("h0"), _GEN_37) @[top.scala 173:7 top.scala 176:26]
    node _GEN_44 = mux(_T_17, UInt<1>("h1"), _GEN_38) @[top.scala 173:7 top.scala 177:26]
    node _GEN_45 = mux(_T_17, _dmmod_io_dataIn_0_T_2, _GEN_27) @[top.scala 173:7 top.scala 179:28]
    node _GEN_46 = mux(_T_17, _dmmod_io_dataIn_3_T_2, _GEN_40) @[top.scala 173:7 top.scala 182:28]
    node _T_18 = bits(cumod.io_instruction, 14, 12) @[top.scala 186:34]
    node _T_19 = eq(_T_18, UInt<2>("h2")) @[top.scala 186:42]
    node _dmmod_io_dataIn_0_T_3 = bits(regfmod.io_rdata2, 7, 0) @[top.scala 195:48]
    node _dmmod_io_dataIn_1_T_3 = bits(regfmod.io_rdata2, 15, 8) @[top.scala 196:48]
    node _dmmod_io_dataIn_2_T_3 = bits(regfmod.io_rdata2, 23, 16) @[top.scala 197:48]
    node _dmmod_io_dataIn_3_T_3 = bits(regfmod.io_rdata2, 31, 24) @[top.scala 198:48]
    node _GEN_47 = mux(_T_19, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 186:50 top.scala 190:26 top.scala 22:18]
    node _GEN_48 = mux(_T_19, _dmmod_io_dataIn_0_T_3, UInt<1>("h0")) @[top.scala 186:50 top.scala 195:28 top.scala 17:20]
    node _GEN_49 = mux(_T_19, _dmmod_io_dataIn_1_T_3, UInt<1>("h0")) @[top.scala 186:50 top.scala 196:28 top.scala 18:20]
    node _GEN_50 = mux(_T_19, _dmmod_io_dataIn_2_T_3, UInt<1>("h0")) @[top.scala 186:50 top.scala 197:28 top.scala 19:20]
    node _GEN_51 = mux(_T_19, _dmmod_io_dataIn_3_T_3, UInt<1>("h0")) @[top.scala 186:50 top.scala 198:28 top.scala 20:20]
    node _GEN_52 = mux(_T_13, _GEN_41, _GEN_47) @[top.scala 127:50]
    node _GEN_53 = mux(_T_13, _GEN_42, _GEN_47) @[top.scala 127:50]
    node _GEN_54 = mux(_T_13, _GEN_43, _GEN_47) @[top.scala 127:50]
    node _GEN_55 = mux(_T_13, _GEN_44, _GEN_47) @[top.scala 127:50]
    node _GEN_56 = mux(_T_13, _GEN_45, _GEN_48) @[top.scala 127:50]
    node _GEN_57 = mux(_T_13, _GEN_33, _GEN_49) @[top.scala 127:50]
    node _GEN_58 = mux(_T_13, _GEN_39, _GEN_50) @[top.scala 127:50]
    node _GEN_59 = mux(_T_13, _GEN_46, _GEN_51) @[top.scala 127:50]
    node _GEN_60 = mux(_T_7, _GEN_17, _GEN_52) @[top.scala 71:44]
    node _GEN_61 = mux(_T_7, _GEN_18, _GEN_53) @[top.scala 71:44]
    node _GEN_62 = mux(_T_7, _GEN_19, _GEN_54) @[top.scala 71:44]
    node _GEN_63 = mux(_T_7, _GEN_20, _GEN_55) @[top.scala 71:44]
    node _GEN_64 = mux(_T_7, _GEN_21, _GEN_56) @[top.scala 71:44]
    node _GEN_65 = mux(_T_7, _GEN_22, _GEN_57) @[top.scala 71:44]
    node _GEN_66 = mux(_T_7, _GEN_23, _GEN_58) @[top.scala 71:44]
    node _GEN_67 = mux(_T_7, _GEN_24, _GEN_59) @[top.scala 71:44]
    node _GEN_68 = mux(_T_5, UInt<1>("h0"), cumod.io_func3_7) @[top.scala 61:45 top.scala 62:15 top.scala 44:14]
    node _GEN_69 = mux(_T_5, regfmod.io_rdata1, regfmod.io_rdata1) @[top.scala 61:45 top.scala 63:15 top.scala 47:13]
    node _GEN_70 = mux(_T_5, immg.io_imm, _GEN_1) @[top.scala 61:45 top.scala 64:15]
    node _GEN_71 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 61:45 top.scala 65:22 top.scala 59:20]
    node _GEN_72 = mux(_T_5, _dmmod_io_addr_T, UInt<1>("h0")) @[top.scala 61:45 top.scala 67:17 top.scala 29:14]
    node _GEN_73 = mux(_T_5, _GEN_60, UInt<1>("h0")) @[top.scala 61:45 top.scala 22:18]
    node _GEN_74 = mux(_T_5, _GEN_61, UInt<1>("h0")) @[top.scala 61:45 top.scala 23:18]
    node _GEN_75 = mux(_T_5, _GEN_62, UInt<1>("h0")) @[top.scala 61:45 top.scala 24:18]
    node _GEN_76 = mux(_T_5, _GEN_63, UInt<1>("h0")) @[top.scala 61:45 top.scala 25:18]
    node _GEN_77 = mux(_T_5, _GEN_64, UInt<1>("h0")) @[top.scala 61:45 top.scala 17:20]
    node _GEN_78 = mux(_T_5, _GEN_65, UInt<1>("h0")) @[top.scala 61:45 top.scala 18:20]
    node _GEN_79 = mux(_T_5, _GEN_66, UInt<1>("h0")) @[top.scala 61:45 top.scala 19:20]
    node _GEN_80 = mux(_T_5, _GEN_67, UInt<1>("h0")) @[top.scala 61:45 top.scala 20:20]
    node _T_20 = bits(cumod.io_instruction, 6, 0) @[top.scala 209:26]
    node _T_21 = eq(_T_20, UInt<2>("h3")) @[top.scala 209:32]
    node _dmmod_io_addr_T_1 = bits(alumod.io_out, 9, 2) @[top.scala 215:33]
    node masksel_1 = bits(alumod.io_out, 1, 0) @[top.scala 217:34]
    node _T_22 = bits(cumod.io_instruction, 14, 12) @[top.scala 219:30]
    node _T_23 = eq(_T_22, UInt<1>("h0")) @[top.scala 219:38]
    node _T_24 = eq(masksel_1, UInt<1>("h0")) @[top.scala 222:17]
    node _regfmod_io_wdata_T = bits(dmmod.io_out_0, 7, 7) @[top.scala 223:56]
    node _regfmod_io_wdata_T_1 = bits(_regfmod_io_wdata_T, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi = mux(_regfmod_io_wdata_T_1, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _regfmod_io_wdata_T_2 = cat(regfmod_io_wdata_hi, dmmod.io_out_0) @[Cat.scala 30:58]
    node _T_25 = eq(masksel_1, UInt<1>("h1")) @[top.scala 224:24]
    node _regfmod_io_wdata_T_3 = bits(dmmod.io_out_1, 7, 7) @[top.scala 225:56]
    node _regfmod_io_wdata_T_4 = bits(_regfmod_io_wdata_T_3, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_1 = mux(_regfmod_io_wdata_T_4, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _regfmod_io_wdata_T_5 = cat(regfmod_io_wdata_hi_1, dmmod.io_out_1) @[Cat.scala 30:58]
    node _T_26 = eq(masksel_1, UInt<2>("h2")) @[top.scala 226:24]
    node _regfmod_io_wdata_T_6 = bits(dmmod.io_out_2, 7, 7) @[top.scala 227:56]
    node _regfmod_io_wdata_T_7 = bits(_regfmod_io_wdata_T_6, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_2 = mux(_regfmod_io_wdata_T_7, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _regfmod_io_wdata_T_8 = cat(regfmod_io_wdata_hi_2, dmmod.io_out_2) @[Cat.scala 30:58]
    node _T_27 = eq(masksel_1, UInt<2>("h3")) @[top.scala 228:24]
    node _regfmod_io_wdata_T_9 = bits(dmmod.io_out_3, 7, 7) @[top.scala 229:56]
    node _regfmod_io_wdata_T_10 = bits(_regfmod_io_wdata_T_9, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_3 = mux(_regfmod_io_wdata_T_10, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _regfmod_io_wdata_T_11 = cat(regfmod_io_wdata_hi_3, dmmod.io_out_3) @[Cat.scala 30:58]
    node _GEN_81 = mux(_T_27, _regfmod_io_wdata_T_11, alumod.io_out) @[top.scala 228:32 top.scala 229:24 top.scala 205:18]
    node _GEN_82 = mux(_T_26, _regfmod_io_wdata_T_8, _GEN_81) @[top.scala 226:32 top.scala 227:24]
    node _GEN_83 = mux(_T_25, _regfmod_io_wdata_T_5, _GEN_82) @[top.scala 224:32 top.scala 225:24]
    node _GEN_84 = mux(_T_24, _regfmod_io_wdata_T_2, _GEN_83) @[top.scala 222:25 top.scala 223:24]
    node _T_28 = bits(cumod.io_instruction, 14, 12) @[top.scala 232:36]
    node _T_29 = eq(_T_28, UInt<1>("h1")) @[top.scala 232:44]
    node _T_30 = eq(masksel_1, UInt<1>("h0")) @[top.scala 234:20]
    node _regfmod_io_wdata_T_12 = bits(dmmod.io_out_1, 7, 7) @[top.scala 235:56]
    node _regfmod_io_wdata_T_13 = bits(_regfmod_io_wdata_T_12, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_hi = mux(_regfmod_io_wdata_T_13, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node regfmod_io_wdata_hi_4 = cat(regfmod_io_wdata_hi_hi, dmmod.io_out_1) @[Cat.scala 30:58]
    node _regfmod_io_wdata_T_14 = cat(regfmod_io_wdata_hi_4, dmmod.io_out_0) @[Cat.scala 30:58]
    node _T_31 = eq(masksel_1, UInt<1>("h1")) @[top.scala 236:24]
    node _regfmod_io_wdata_T_15 = bits(dmmod.io_out_2, 7, 7) @[top.scala 237:56]
    node _regfmod_io_wdata_T_16 = bits(_regfmod_io_wdata_T_15, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_hi_1 = mux(_regfmod_io_wdata_T_16, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node regfmod_io_wdata_hi_5 = cat(regfmod_io_wdata_hi_hi_1, dmmod.io_out_2) @[Cat.scala 30:58]
    node _regfmod_io_wdata_T_17 = cat(regfmod_io_wdata_hi_5, dmmod.io_out_1) @[Cat.scala 30:58]
    node _T_32 = eq(masksel_1, UInt<2>("h2")) @[top.scala 238:24]
    node _regfmod_io_wdata_T_18 = bits(dmmod.io_out_3, 7, 7) @[top.scala 239:56]
    node _regfmod_io_wdata_T_19 = bits(_regfmod_io_wdata_T_18, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_hi_2 = mux(_regfmod_io_wdata_T_19, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node regfmod_io_wdata_hi_6 = cat(regfmod_io_wdata_hi_hi_2, dmmod.io_out_3) @[Cat.scala 30:58]
    node _regfmod_io_wdata_T_20 = cat(regfmod_io_wdata_hi_6, dmmod.io_out_2) @[Cat.scala 30:58]
    node _T_33 = eq(masksel_1, UInt<2>("h3")) @[top.scala 240:24]
    node _regfmod_io_wdata_T_21 = bits(dmmod.io_out_0, 7, 7) @[top.scala 241:56]
    node _regfmod_io_wdata_T_22 = bits(_regfmod_io_wdata_T_21, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_hi_3 = mux(_regfmod_io_wdata_T_22, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node regfmod_io_wdata_hi_7 = cat(regfmod_io_wdata_hi_hi_3, dmmod.io_out_0) @[Cat.scala 30:58]
    node _regfmod_io_wdata_T_23 = cat(regfmod_io_wdata_hi_7, dmmod.io_out_3) @[Cat.scala 30:58]
    node _GEN_85 = mux(_T_33, _regfmod_io_wdata_T_23, alumod.io_out) @[top.scala 240:32 top.scala 241:24 top.scala 205:18]
    node _GEN_86 = mux(_T_32, _regfmod_io_wdata_T_20, _GEN_85) @[top.scala 238:32 top.scala 239:24]
    node _GEN_87 = mux(_T_31, _regfmod_io_wdata_T_17, _GEN_86) @[top.scala 236:32 top.scala 237:24]
    node _GEN_88 = mux(_T_30, _regfmod_io_wdata_T_14, _GEN_87) @[top.scala 234:28 top.scala 235:24]
    node _T_34 = bits(cumod.io_instruction, 14, 12) @[top.scala 246:36]
    node _T_35 = eq(_T_34, UInt<2>("h2")) @[top.scala 246:44]
    node regfmod_io_wdata_lo = cat(dmmod.io_out_1, dmmod.io_out_0) @[Cat.scala 30:58]
    node regfmod_io_wdata_hi_8 = cat(dmmod.io_out_3, dmmod.io_out_2) @[Cat.scala 30:58]
    node _regfmod_io_wdata_T_24 = cat(regfmod_io_wdata_hi_8, regfmod_io_wdata_lo) @[Cat.scala 30:58]
    node _T_36 = bits(cumod.io_instruction, 14, 12) @[top.scala 250:36]
    node _T_37 = eq(_T_36, UInt<3>("h4")) @[top.scala 250:44]
    node _T_38 = eq(masksel_1, UInt<1>("h0")) @[top.scala 252:19]
    node _regfmod_io_wdata_T_25 = bits(dmmod.io_out_0, 7, 7) @[top.scala 253:56]
    node _regfmod_io_wdata_T_26 = bits(_regfmod_io_wdata_T_25, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_9 = mux(_regfmod_io_wdata_T_26, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _regfmod_io_wdata_T_27 = cat(regfmod_io_wdata_hi_9, dmmod.io_out_0) @[Cat.scala 30:58]
    node _T_39 = eq(masksel_1, UInt<1>("h1")) @[top.scala 254:24]
    node _regfmod_io_wdata_T_28 = bits(dmmod.io_out_1, 7, 7) @[top.scala 255:56]
    node _regfmod_io_wdata_T_29 = bits(_regfmod_io_wdata_T_28, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_10 = mux(_regfmod_io_wdata_T_29, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _regfmod_io_wdata_T_30 = cat(regfmod_io_wdata_hi_10, dmmod.io_out_1) @[Cat.scala 30:58]
    node _T_40 = eq(masksel_1, UInt<2>("h2")) @[top.scala 256:24]
    node _regfmod_io_wdata_T_31 = bits(dmmod.io_out_2, 7, 7) @[top.scala 257:56]
    node _regfmod_io_wdata_T_32 = bits(_regfmod_io_wdata_T_31, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_11 = mux(_regfmod_io_wdata_T_32, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _regfmod_io_wdata_T_33 = cat(regfmod_io_wdata_hi_11, dmmod.io_out_2) @[Cat.scala 30:58]
    node _T_41 = eq(masksel_1, UInt<2>("h3")) @[top.scala 258:24]
    node _regfmod_io_wdata_T_34 = bits(dmmod.io_out_3, 7, 7) @[top.scala 259:56]
    node _regfmod_io_wdata_T_35 = bits(_regfmod_io_wdata_T_34, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_12 = mux(_regfmod_io_wdata_T_35, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _regfmod_io_wdata_T_36 = cat(regfmod_io_wdata_hi_12, dmmod.io_out_3) @[Cat.scala 30:58]
    node _GEN_89 = mux(_T_41, _regfmod_io_wdata_T_36, alumod.io_out) @[top.scala 258:32 top.scala 259:24 top.scala 205:18]
    node _GEN_90 = mux(_T_40, _regfmod_io_wdata_T_33, _GEN_89) @[top.scala 256:32 top.scala 257:24]
    node _GEN_91 = mux(_T_39, _regfmod_io_wdata_T_30, _GEN_90) @[top.scala 254:32 top.scala 255:24]
    node _GEN_92 = mux(_T_38, _regfmod_io_wdata_T_27, _GEN_91) @[top.scala 252:27 top.scala 253:24]
    node _T_42 = bits(cumod.io_instruction, 14, 12) @[top.scala 263:36]
    node _T_43 = eq(_T_42, UInt<3>("h5")) @[top.scala 263:44]
    node _T_44 = eq(masksel_1, UInt<1>("h0")) @[top.scala 265:19]
    node _regfmod_io_wdata_T_37 = bits(dmmod.io_out_1, 7, 7) @[top.scala 266:56]
    node _regfmod_io_wdata_T_38 = bits(_regfmod_io_wdata_T_37, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_hi_4 = mux(_regfmod_io_wdata_T_38, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node regfmod_io_wdata_hi_13 = cat(regfmod_io_wdata_hi_hi_4, dmmod.io_out_1) @[Cat.scala 30:58]
    node _regfmod_io_wdata_T_39 = cat(regfmod_io_wdata_hi_13, dmmod.io_out_0) @[Cat.scala 30:58]
    node _T_45 = eq(masksel_1, UInt<1>("h1")) @[top.scala 267:24]
    node _regfmod_io_wdata_T_40 = bits(dmmod.io_out_2, 7, 7) @[top.scala 268:56]
    node _regfmod_io_wdata_T_41 = bits(_regfmod_io_wdata_T_40, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_hi_5 = mux(_regfmod_io_wdata_T_41, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node regfmod_io_wdata_hi_14 = cat(regfmod_io_wdata_hi_hi_5, dmmod.io_out_2) @[Cat.scala 30:58]
    node _regfmod_io_wdata_T_42 = cat(regfmod_io_wdata_hi_14, dmmod.io_out_1) @[Cat.scala 30:58]
    node _T_46 = eq(masksel_1, UInt<2>("h2")) @[top.scala 269:24]
    node _regfmod_io_wdata_T_43 = bits(dmmod.io_out_3, 7, 7) @[top.scala 270:56]
    node _regfmod_io_wdata_T_44 = bits(_regfmod_io_wdata_T_43, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_hi_6 = mux(_regfmod_io_wdata_T_44, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node regfmod_io_wdata_hi_15 = cat(regfmod_io_wdata_hi_hi_6, dmmod.io_out_3) @[Cat.scala 30:58]
    node _regfmod_io_wdata_T_45 = cat(regfmod_io_wdata_hi_15, dmmod.io_out_2) @[Cat.scala 30:58]
    node _T_47 = eq(masksel_1, UInt<2>("h3")) @[top.scala 271:24]
    node _regfmod_io_wdata_T_46 = bits(dmmod.io_out_0, 7, 7) @[top.scala 272:56]
    node _regfmod_io_wdata_T_47 = bits(_regfmod_io_wdata_T_46, 0, 0) @[Bitwise.scala 72:15]
    node regfmod_io_wdata_hi_hi_7 = mux(_regfmod_io_wdata_T_47, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node regfmod_io_wdata_hi_16 = cat(regfmod_io_wdata_hi_hi_7, dmmod.io_out_0) @[Cat.scala 30:58]
    node _regfmod_io_wdata_T_48 = cat(regfmod_io_wdata_hi_16, dmmod.io_out_3) @[Cat.scala 30:58]
    node _GEN_93 = mux(_T_47, _regfmod_io_wdata_T_48, alumod.io_out) @[top.scala 271:32 top.scala 272:24 top.scala 205:18]
    node _GEN_94 = mux(_T_46, _regfmod_io_wdata_T_45, _GEN_93) @[top.scala 269:32 top.scala 270:24]
    node _GEN_95 = mux(_T_45, _regfmod_io_wdata_T_42, _GEN_94) @[top.scala 267:32 top.scala 268:24]
    node _GEN_96 = mux(_T_44, _regfmod_io_wdata_T_39, _GEN_95) @[top.scala 265:27 top.scala 266:24]
    node _GEN_97 = mux(_T_43, _GEN_96, alumod.io_out) @[top.scala 263:58 top.scala 205:18]
    node _GEN_98 = mux(_T_37, _GEN_92, _GEN_97) @[top.scala 250:58]
    node _GEN_99 = mux(_T_35, _regfmod_io_wdata_T_24, _GEN_98) @[top.scala 246:58 top.scala 247:24]
    node _GEN_100 = mux(_T_29, _GEN_88, _GEN_99) @[top.scala 232:58]
    node _GEN_101 = mux(_T_23, _GEN_84, _GEN_100) @[top.scala 219:52]
    node _GEN_102 = mux(_T_21, UInt<1>("h0"), _GEN_68) @[top.scala 209:44 top.scala 210:15]
    node _GEN_103 = mux(_T_21, regfmod.io_rdata1, _GEN_69) @[top.scala 209:44 top.scala 212:15]
    node _GEN_104 = mux(_T_21, immg.io_imm, _GEN_70) @[top.scala 209:44 top.scala 213:15]
    node _GEN_105 = mux(_T_21, _dmmod_io_addr_T_1, _GEN_72) @[top.scala 209:44 top.scala 215:17]
    node _GEN_106 = mux(_T_21, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 209:44 top.scala 216:22 top.scala 30:19]
    node _GEN_107 = mux(_T_21, _GEN_101, alumod.io_out) @[top.scala 209:44 top.scala 205:18]
    node _T_48 = bits(cumod.io_instruction, 6, 0) @[top.scala 281:26]
    node _T_49 = eq(_T_48, UInt<7>("h63")) @[top.scala 281:33]
    node _dmmod_io_addr_T_2 = bits(alumod.io_out, 9, 2) @[top.scala 287:33]
    node _T_50 = bits(cumod.io_instruction, 14, 12) @[top.scala 290:30]
    node _T_51 = eq(_T_50, UInt<1>("h0")) @[top.scala 290:39]
    node _T_52 = eq(regfmod.io_rdata1, regfmod.io_rdata2) @[top.scala 291:30]
    node _GEN_108 = mux(_T_52, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 291:53 top.scala 292:23 top.scala 32:15]
    node _T_53 = bits(cumod.io_instruction, 14, 12) @[top.scala 294:36]
    node _T_54 = eq(_T_53, UInt<1>("h1")) @[top.scala 294:45]
    node _T_55 = neq(regfmod.io_rdata1, regfmod.io_rdata2) @[top.scala 295:30]
    node _GEN_109 = mux(_T_55, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 295:53 top.scala 296:23 top.scala 32:15]
    node _T_56 = bits(cumod.io_instruction, 14, 12) @[top.scala 298:36]
    node _T_57 = eq(_T_56, UInt<2>("h2")) @[top.scala 298:45]
    node _T_58 = lt(regfmod.io_rdata1, regfmod.io_rdata2) @[top.scala 299:30]
    node _GEN_110 = mux(_T_58, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 299:51 top.scala 300:23 top.scala 32:15]
    node _T_59 = bits(cumod.io_instruction, 14, 12) @[top.scala 302:36]
    node _T_60 = eq(_T_59, UInt<2>("h3")) @[top.scala 302:45]
    node _T_61 = geq(regfmod.io_rdata1, regfmod.io_rdata2) @[top.scala 303:30]
    node _GEN_111 = mux(_T_61, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 303:52 top.scala 304:23 top.scala 32:15]
    node _T_62 = bits(cumod.io_instruction, 14, 12) @[top.scala 306:36]
    node _T_63 = eq(_T_62, UInt<3>("h4")) @[top.scala 306:45]
    node _T_64 = lt(regfmod.io_rdata1, regfmod.io_rdata2) @[top.scala 307:37]
    node _GEN_112 = mux(_T_64, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 307:67 top.scala 308:23 top.scala 32:15]
    node _T_65 = bits(cumod.io_instruction, 14, 12) @[top.scala 310:36]
    node _T_66 = eq(_T_65, UInt<3>("h5")) @[top.scala 310:45]
    node _T_67 = geq(regfmod.io_rdata1, regfmod.io_rdata2) @[top.scala 311:37]
    node _GEN_113 = mux(_T_67, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 311:68 top.scala 312:23 top.scala 32:15]
    node _GEN_114 = mux(_T_66, _GEN_113, UInt<1>("h0")) @[top.scala 310:54 top.scala 32:15]
    node _GEN_115 = mux(_T_63, _GEN_112, _GEN_114) @[top.scala 306:54]
    node _GEN_116 = mux(_T_60, _GEN_111, _GEN_115) @[top.scala 302:54]
    node _GEN_117 = mux(_T_57, _GEN_110, _GEN_116) @[top.scala 298:54]
    node _GEN_118 = mux(_T_54, _GEN_109, _GEN_117) @[top.scala 294:54]
    node _GEN_119 = mux(_T_51, _GEN_108, _GEN_118) @[top.scala 290:48]
    node _GEN_120 = mux(_T_49, UInt<1>("h0"), _GEN_102) @[top.scala 281:43 top.scala 282:15]
    node _GEN_121 = mux(_T_49, pcmod.io_out, _GEN_103) @[top.scala 281:43 top.scala 283:15]
    node _GEN_122 = mux(_T_49, immg.io_imm, _GEN_104) @[top.scala 281:43 top.scala 284:15]
    node _GEN_123 = mux(_T_49, UInt<1>("h1"), _GEN_71) @[top.scala 281:43 top.scala 285:22]
    node _GEN_124 = mux(_T_49, _dmmod_io_addr_T_2, _GEN_105) @[top.scala 281:43 top.scala 287:17]
    node _GEN_125 = mux(_T_49, alumod.io_out, UInt<1>("h0")) @[top.scala 281:43 top.scala 289:18 top.scala 35:14]
    node _GEN_126 = mux(_T_49, _GEN_119, UInt<1>("h0")) @[top.scala 281:43 top.scala 32:15]
    node _T_68 = bits(cumod.io_instruction, 6, 0) @[top.scala 319:26]
    node _T_69 = eq(_T_68, UInt<6>("h37")) @[top.scala 319:32]
    node _GEN_127 = mux(_T_69, immg.io_imm, _GEN_107) @[top.scala 319:45 top.scala 320:18]
    node _T_70 = bits(cumod.io_instruction, 6, 0) @[top.scala 322:26]
    node _T_71 = eq(_T_70, UInt<5>("h17")) @[top.scala 322:32]
    node _GEN_128 = mux(_T_71, UInt<1>("h0"), _GEN_120) @[top.scala 322:45 top.scala 323:13]
    node _GEN_129 = mux(_T_71, pcmod.io_out, _GEN_121) @[top.scala 322:45 top.scala 324:15]
    node _GEN_130 = mux(_T_71, immg.io_imm, _GEN_122) @[top.scala 322:45 top.scala 325:15]
    node _GEN_131 = mux(_T_71, UInt<1>("h1"), _GEN_123) @[top.scala 322:45 top.scala 326:22]
    node _GEN_132 = mux(_T_71, alumod.io_out, _GEN_127) @[top.scala 322:45 top.scala 327:18]
    node _GEN_133 = mux(_T_71, regfmod.io_wdata, regfmod.io_wdata) @[top.scala 322:45 top.scala 330:11 top.scala 206:11]
    node _T_72 = bits(cumod.io_instruction, 6, 0) @[top.scala 332:26]
    node _T_73 = eq(_T_72, UInt<7>("h6f")) @[top.scala 332:32]
    node _regfmod_io_wdata_T_49 = add(pcmod.io_out, UInt<3>("h4")) @[top.scala 340:38]
    node _regfmod_io_wdata_T_50 = tail(_regfmod_io_wdata_T_49, 1) @[top.scala 340:38]
    node _GEN_134 = mux(_T_73, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 332:44 top.scala 333:18 top.scala 33:16]
    node _GEN_135 = mux(_T_73, UInt<1>("h0"), _GEN_128) @[top.scala 332:44 top.scala 335:15]
    node _GEN_136 = mux(_T_73, pcmod.io_out, _GEN_129) @[top.scala 332:44 top.scala 336:15]
    node _GEN_137 = mux(_T_73, immg.io_imm, _GEN_130) @[top.scala 332:44 top.scala 337:15]
    node _GEN_138 = mux(_T_73, UInt<1>("h1"), _GEN_131) @[top.scala 332:44 top.scala 338:22]
    node _GEN_139 = mux(_T_73, _regfmod_io_wdata_T_50, _GEN_132) @[top.scala 332:44 top.scala 340:20]
    node _GEN_140 = mux(_T_73, alumod.io_out, _GEN_125) @[top.scala 332:44 top.scala 341:16]
    node _T_74 = bits(cumod.io_instruction, 6, 0) @[top.scala 343:26]
    node _T_75 = eq(_T_74, UInt<7>("h67")) @[top.scala 343:32]
    node _regfmod_io_wdata_T_51 = add(pcmod.io_out, UInt<3>("h4")) @[top.scala 351:38]
    node _regfmod_io_wdata_T_52 = tail(_regfmod_io_wdata_T_51, 1) @[top.scala 351:38]
    node _GEN_141 = mux(_T_75, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 343:44 top.scala 344:18 top.scala 34:16]
    node _GEN_142 = mux(_T_75, UInt<1>("h0"), _GEN_135) @[top.scala 343:44 top.scala 346:15]
    node _GEN_143 = mux(_T_75, regfmod.io_rdata1, _GEN_136) @[top.scala 343:44 top.scala 347:13]
    node _GEN_144 = mux(_T_75, immg.io_imm, _GEN_137) @[top.scala 343:44 top.scala 348:15]
    node _GEN_145 = mux(_T_75, UInt<1>("h1"), _GEN_138) @[top.scala 343:44 top.scala 349:22]
    node _GEN_146 = mux(_T_75, _regfmod_io_wdata_T_52, _GEN_139) @[top.scala 343:44 top.scala 351:20]
    node _GEN_147 = mux(_T_75, alumod.io_out, _GEN_140) @[top.scala 343:44 top.scala 352:16]
    io_output <= regfmod.io_wdata @[top.scala 355:11]
    alumod.clock <= clock
    alumod.reset <= reset
    alumod.io_A <= _GEN_143
    alumod.io_B <= _GEN_144
    alumod.io_op <= _GEN_142
    cumod.clock <= clock
    cumod.reset <= reset
    cumod.io_instruction <= inmmod.io_out @[top.scala 39:22]
    inmmod.clock <= clock
    inmmod.reset <= reset
    inmmod.io_data_in <= UInt<1>("h0") @[top.scala 27:18]
    inmmod.io_enable <= cumod.io_en_imem @[top.scala 37:18]
    inmmod.io_address <= pcmod.io_out @[top.scala 38:18]
    pcmod.clock <= clock
    pcmod.reset <= reset
    pcmod.io_imm <= _GEN_147
    pcmod.io_jump <= _GEN_126
    pcmod.io_jump2 <= _GEN_134
    pcmod.io_jump3 <= _GEN_141
    pcmod.io_rs1data <= regfmod.io_rdata1 @[top.scala 45:18]
    regfmod.clock <= clock
    regfmod.reset <= reset
    regfmod.io_raddr1 <= cumod.io_rs1 @[top.scala 41:19]
    regfmod.io_raddr2 <= cumod.io_rs2 @[top.scala 42:19]
    regfmod.io_wen <= cumod.io_en_reg @[top.scala 50:16]
    regfmod.io_waddr <= cumod.io_rd @[top.scala 43:18]
    regfmod.io_wdata <= _GEN_146
    immg.clock <= clock
    immg.reset <= reset
    immg.io_instruction <= inmmod.io_out @[top.scala 40:21]
    dmmod.clock <= clock
    dmmod.reset <= reset
    dmmod.io_addr <= _GEN_124
    dmmod.io_rd_enable <= _GEN_106
    dmmod.io_wr_enable <= _GEN_145
    dmmod.io_mask_0 <= _GEN_73
    dmmod.io_mask_1 <= _GEN_74
    dmmod.io_mask_2 <= _GEN_75
    dmmod.io_mask_3 <= _GEN_76
    dmmod.io_dataIn_0 <= _GEN_77
    dmmod.io_dataIn_1 <= _GEN_78
    dmmod.io_dataIn_2 <= _GEN_79
    dmmod.io_dataIn_3 <= _GEN_80
