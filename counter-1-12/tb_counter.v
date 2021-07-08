module tb;
    initial begin
    	$dumpfile("test.vcd");
    	$dumpvars(0,tb);
	end

    reg clk, load, reset;
    reg [3:0] d;
    reg [31:0] cnt;
    wire [3:0] q;

    always #5 clk <= ~clk;
    always @(posedge clk) begin
        $display("%d| %d| %d", $time, q, cnt);
        cnt <= cnt + 1;
        
        if (cnt == 10) load <= 1'b1;
        else load <= 1'b0;
    end

    counter c(clk, 1'b1, reset, load, d, q);

    initial begin
        cnt <= 0;
        reset <= 1'b0;
        clk <= 1'b0;
        load <= 1'b0;
        d <= 4'b1001;

        #500 $finish;
    end
endmodule