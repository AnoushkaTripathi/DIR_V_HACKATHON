\m5_TLV_version 1d --inlineGen --bestsv --noline --noDirectiveComments: tl-x.org
\SV
   /*
   Copyright 2025 Redwood EDA, LLC
   
   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
   
   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
   
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
   */
\m5
   use(m5-1.0)

   var(PROG_NAME, my_custom)
   var(ISA, RISCV)
   var(EXT_M, 1)
   var(EXT_E, 0)
   var(EXT_F, 0)
   var(EXT_B, 0)
   var(NUM_CORES, 1)
   var(NUM_VCS, 2)
   var(NUM_PRIOS, 2)
   var(MAX_PACKET_SIZE, 8)
   var(soft_reset, 1'b0)
   var(cpu_blocked, 1'b0)
   var(BRANCH_PRED, two_bit)
   var(EXTRA_REPLAY_BUBBLE, 0)
   var(EXTRA_PRED_TAKEN_BUBBLE, 0)
   var(EXTRA_JUMP_BUBBLE, 0)
   var(EXTRA_BRANCH_BUBBLE, 0)
   var(EXTRA_INDIRECT_JUMP_BUBBLE, 0)
   var(EXTRA_NON_PIPELINED_BUBBLE, 1)
   var(EXTRA_TRAP_BUBBLE, 1)
   var(NEXT_PC_STAGE, 1)
   var(FETCH_STAGE, 1)
   var(DECODE_STAGE, 2)
   var(BRANCH_PRED_STAGE, 2)
   var(REG_RD_STAGE, 2)
   var(EXECUTE_STAGE, 2)
   var(RESULT_STAGE, 2)
   var(REG_WR_STAGE, 3)
   var(MEM_WR_STAGE, 3)
   var(LD_RETURN_ALIGN, 4)
\SV
   // Include WARP-V.
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/warp-v/544d93e160a1e4267a4832611af5f8aa459deae5/warp-v.tlv'])
\m5
   TLV_fn(riscv_my_custom_prog, {
      ~assemble(['
         flatten_row:
          addi	sp,sp,-48
          sw	ra,44(sp)
          sw	s0,40(sp)
          addi	s0,sp,48
          sw	a0,-36(s0)
          sw	a1,-40(s0)
          sw	zero,-20(s0)
         .LBB2:
          sw	zero,-24(s0)
          j	70 <.L2>
             
         .L5:
          sw	zero,-28(s0)
          j	5c <.L3>
             
         .L4:
          lw	a5,-24(s0)
          slli	a5,a5,0x1
          lw	a4,-36(s0)
          add	a2,a4,a5
          lw	a5,-40(s0)
          addi	a3,a5,4
          lw	a5,-20(s0)
          addi	a4,a5,1
          sw	a4,-20(s0)
          lw	a4,-28(s0)
          add	a4,a4,a2
          lb	a4,0(a4)
          add	a5,a5,a3
          sb	a4,0(a5)
          lw	a5,-28(s0)
          addi	a5,a5,1
          sw	a5,-28(s0)
         .L3:
          lw	a4,-28(s0)
          li	a5,1
          bge	a5,a4,20 <.L4>
             
         .LBE3:
          lw	a5,-24(s0)
          addi	a5,a5,1
          sw	a5,-24(s0)
         .L2:
          lw	a4,-24(s0)
          li	a5,1
          bge	a5,a4,1a <.L5>
           
         .LBE2:
          addi x0, x0, x0
          mv	a0,a5
          lw	ra,44(sp)
          lw	s0,40(sp)
          addi	sp,sp,48
          ret
         lowerTensor:
          addi	sp,sp,-48
          sw	ra,44(sp)
          sw	s0,40(sp)
          addi	s0,sp,48
          sw	a0,-36(s0)
          sw	a1,-40(s0)
          sw	a2,-44(s0)
          sw	a3,-48(s0)
          lw	a3,-40(s0)
          addi	a2,a3,-1
          sw	a2,-32(s0)
          mv	a2,a3
          mv	a6,a2
          li	a7,0
          srli	a2,a6,0x1d
          slli	a5,a7,0x3
          add	a5,a5,a2
          slli	a4,a6,0x3
          sw	zero,-20(s0)
         .LBB4:
          sw	zero,-24(s0)
          j	122 <.L7>
           
         .L10:
          sw	zero,-28(s0)
          j	10c <.L8>
            
         .L9:
          mv	a4,a3
          lw	a5,-24(s0)
          mul	a5,a4,a5
          lw	a4,-44(s0)
          add	a2,a4,a5
          lw	a5,-20(s0)
          addi	a4,a5,1
          sw	a4,-20(s0)
          mv	a4,a5
          lw	a5,-48(s0)
          add	a5,a5,a4
          lw	a4,-28(s0)
          add	a4,a4,a2
          lb	a4,0(a4)
          sb	a4,1(a5)
          lw	a5,-28(s0)
          addi	a5,a5,1
          sw	a5,-28(s0)
         .L8:
          lw	a4,-40(s0)
          lw	a5,-28(s0)
          blt	a5,a4,ce <.L9>
             
         .LBE5:
          lw	a5,-24(s0)
          addi	a5,a5,1
          sw	a5,-24(s0)
         .L7:
          lw	a4,-36(s0)
          lw	a5,-24(s0)
          blt	a5,a4,c8 <.L10>
             
         .LBE4:
          addi x0, x0, x0
          mv	a0,a5
          lw	ra,44(sp)
          lw	s0,40(sp)
          addi	sp,sp,48
          ret
         pass_values:
          addi	sp,sp,-48
          sw	ra,44(sp)
          sw	s0,40(sp)
          addi	s0,sp,48
          sw	a0,-36(s0)
          sw	a1,-40(s0)
          sw	a2,-44(s0)
          sw	a3,-48(s0)
         .LBB6:
          lw	a5,-40(s0)
          sw	a5,-20(s0)
          j	182 <.L12>
             
         .L13:
          lw	a5,-20(s0)
          lw	a4,-36(s0)
          add	a4,a4,a5
          lw	a5,-20(s0)
          lw	a3,-48(s0)
          add	a5,a5,a3
          lb	a4,1(a4)
          sb	a4,1(a5)
          lw	a5,-20(s0)
          addi	a5,a5,1
          sw	a5,-20(s0)
         .L12:
          lw	a4,-20(s0)
          lw	a5,-44(s0)
          bge	a5,a4,15c <.L13>
             
         .LBE6:
          addi x0, x0, x0
          mv	a0,a5
          lw	ra,44(sp)
          lw	s0,40(sp)
          addi	sp,sp,48
          ret
         main:
          addi	sp,sp,-160
          sw	ra,156(sp)
          sw	s0,152(sp)
          addi	s0,sp,160
          lui	a5,0x0
             
          lw	a5,0(a5) # 0 <flatten_row>
             
          sw	a5,-20(s0)
          lui	a5,0x0
             
          lw	a5,0(a5) # 0 <flatten_row>
             
          sw	a5,-24(s0)
          lui	a5,0x0
             
          mv	a4,a5
             
          addi	a5,s0,-88
          mv	a3,a4
          li	a4,64
          mv	a2,a4
          mv	a1,a3
          mv	a0,a5
          auipc	ra,0x0
             
          jalr	ra # 1d2 <main+0x38>
          addi	a4,s0,-92
          addi	a5,s0,-24
          mv	a1,a4
          mv	a0,a5
          auipc	ra,0x0
             
          jalr	ra # 1e6 <main+0x4c>
          addi	a4,s0,-156
          addi	a5,s0,-88
          mv	a3,a4
          mv	a2,a5
          li	a1,8
          li	a0,8
          auipc	ra,0x0
             
          jalr	ra # 1fe <main+0x64>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,3
          li	a1,0
          mv	a0,a5
          auipc	ra,0x0
             
          jalr	ra # 216 <main+0x7c>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,7
          li	a1,4
          mv	a0,a5
          auipc	ra,0x0
            
          jalr	ra # 22e <main+0x94>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,11
          li	a1,8
          mv	a0,a5
          auipc	ra,0x0
           
          jalr	ra # 246 <main+0xac>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,15
          li	a1,12
          mv	a0,a5
          auipc	ra,0x0
        
          jalr	ra # 25e <main+0xc4>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,19
          li	a1,16
          mv	a0,a5
          auipc	ra,0x0
             
          jalr	ra # 276 <main+0xdc>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,32
          li	a1,30
          mv	a0,a5
          auipc	ra,0x0
             
          jalr	ra # 290 <main+0xf6>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,35
          li	a1,33
          mv	a0,a5
          auipc	ra,0x0
           
          jalr	ra # 2ac <main+0x112>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,39
          li	a1,36
          mv	a0,a5
          auipc	ra,0x0
            
          jalr	ra # 2c8 <main+0x12e>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,43
          li	a1,40
          mv	a0,a5
          auipc	ra,0x0
             
          jalr	ra # 2e4 <main+0x14a>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,47
          li	a1,44
          mv	a0,a5
          auipc	ra,0x0
             
          jalr	ra # 300 <main+0x166>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,51
          li	a1,48
          mv	a0,a5
          auipc	ra,0x0
             
          jalr	ra # 31c <main+0x182>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,55
          li	a1,52
          mv	a0,a5
          auipc	ra,0x0
            
          jalr	ra # 338 <main+0x19e>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,59
          li	a1,56
          mv	a0,a5
          auipc	ra,0x0
            
          jalr	ra # 354 <main+0x1ba>
          addi	a4,s0,-160
          addi	a5,s0,-156
          mv	a3,a4
          li	a2,63
          li	a1,60
          mv	a0,a5
          auipc	ra,0x0
             
          jalr	ra # 370 <main+0x1d6>
          li	a5,0
          mv	a0,a5
          lw	ra,156(sp)
          lw	s0,152(sp)
          addi	sp,sp,160
          ret
         
      '])
   })
m4+module_def()
\TLV
   m5+warpv_top()
\SV
   endmodule
