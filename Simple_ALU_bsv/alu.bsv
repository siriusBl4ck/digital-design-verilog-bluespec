package alu;

typedef int MyType;

(* synthesize *)
module mkTest(Empty);
    Alu_ifc myAlu <- mkAlu;
    
    rule rl_go;
        myAlu.put_command(12, 2, 0);
    endrule

    rule rl_finish;
        let z = myAlu.get_result();
        let y = myAlu.checkErr();
        $display($time);
        $display("Result = %d", z);
    endrule
endmodule: mkTest

interface Alu_ifc;
    method Action put_command(MyType x, MyType y, Bit#(2) opnum);
    method MyType get_result();
    method Bit#(1) checkErr();
endinterface

//(0- return A+B, 1-return A-B, 2 B-A, 3 A&B)

(* synthesize *)
module mkAlu(Alu_ifc);
    Reg#(MyType) res <- mkReg(0);
    Reg#(MyType) a <- mkReg(0);
    Reg#(MyType) b <- mkReg(0);
    Reg#(Bit#(2)) opcode <- mkReg(0);
    Reg#(Bit#(1)) err <- mkReg(0);
    Reg#(Bool) rdy <- mkReg(True);

    rule rl_compute(!rdy);
        if (opcode==0) res <= a + b;
        else if (opcode==1) res <= a - b;
        else if (opcode==2) res <= b - a;
        else if (opcode==3 && b != 0) res <= a & b;
        else err <= 1;

        rdy <= True;
    endrule

    method Action put_command(MyType x, MyType y, Bit#(2) opnum) if (rdy);
        a <= x;
        b <= y;
        opcode <= opnum;
        rdy <= False;
    endmethod

    method MyType get_result() if (rdy);
        return res;
    endmethod

    method Bit#(1) checkErr() if (rdy);
        return err;
    endmethod
endmodule: mkAlu

endpackage: alu