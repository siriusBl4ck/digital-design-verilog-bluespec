module tb;
// Do this in your test bench

	initial
	begin
    	$dumpfile("test.vcd");
    	$dumpvars(0,tb);
	end
 
	parameter N = 100;

	reg [N-1:0] a,b;
	wire [N-1:0] s;
	wire cout;

	adder100 CarryLookahead(a,b,1'b0,cout, s);

	initial
		begin
		$monitor($time,"%d + %d = %d (+8*%d)",a,b,s, cout);
		a = 10;
		b = 12;

		#100 $finish;
		end
endmodule