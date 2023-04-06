module tb_seq_mult;
    reg clk = 0;
    wire [3:0] res;
    reg [1:0] in1 = 2, in2 = 3;

    seq_mult mySeqMult(in1, in2, clk, res);

    always #5 clk = ~clk;

    reg [31:0] cnt = 0;

    always @(posedge clk) begin
        cnt <= cnt + 1;
    end

    always @(posedge clk) begin
        if (cnt >= 0 && cnt <= 1) begin
            in1 <= 2;
            in2 <= 3;
        end
        else begin
            in1 <= 0;
            in2 <= 0;
        end

        $display($time, "] RES: %d", res);
        $display($time, "] IN1: %d, IN2: %d", in1, in2);

        if (cnt == 15) $finish;
    end
endmodule