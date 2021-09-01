package alu;

(* synthesize *)
module mkTest(Empty);
    Alu_ifc myAlu <- mkAlu;
    
    rule rl_go;
        myAlu.put_command(12, 2, 3);
    endrule

    rule rl_finish;
        let z = myAlu.get_result();
        let y = myAlu.checkErr();
        $display($time);
        $display("Result = %d", z);
    endrule
endmodule: mkTest

interface Alu_ifc;
    method Action put_command(int x, int y, Bit#(2) opnum);
    method int get_result();
    method Bit#(1) checkErr();
endinterface

(* synthesize *)
module mkAlu(Alu_ifc);
    Reg#(int) res <- mkReg(0);
    Reg#(int) a <- mkReg(0);
    Reg#(int) b <- mkReg(0);
    Reg#(Bit#(2)) opcode <- mkReg(0);
    Reg#(Bit#(1)) err <- mkReg(0);
    Reg#(Bool) rdy <- mkReg(True);

    rule rl_compute(!rdy);
        if (opcode==0) res <= a + b;
        else if (opcode==1) res <= a - b;
        else if (opcode==2) res <= a * b;
        else if (opcode==3 && b != 0) res <= a / b;
        else err <= 1;

        rdy <= True;
    endrule

    method Action put_command(int x, int y, Bit#(2) opnum) if (rdy);
        a <= x;
        b <= y;
        opcode <= opnum;
        rdy <= False;
    endmethod

    method int get_result() if (rdy);
        return res;
    endmethod

    method Bit#(1) checkErr() if (rdy);
        return err;
    endmethod
endmodule: mkAlu

endpackage: alu