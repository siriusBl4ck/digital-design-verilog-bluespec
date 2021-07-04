module tb;
// Do this in your test bench

	initial
	begin
    	$dumpfile("test.vcd");
    	$dumpvars(0,tb);
	end

	reg [3:0] a,b;
	wire [7:0] res;
	wire cout;

	Wallace w(a,b,res, cout);

	initial
		begin
		$monitor($time,"%d * %d = %d (+8*%d)",a,b,res, cout);
		a = 5;
		b = 7;

		#100 $finish;
		end
endmodule