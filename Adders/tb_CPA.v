module tb;
// Do this in your test bench

	initial
	begin
    	$dumpfile("test.vcd");
    	$dumpvars(0,tb);
	end
 
	parameter N = 8;

	reg [N-1:0] a,b;
	wire [N-1:0] s;
	wire cout;

	cla CarryLookahead(a,b,s,cout);

	initial
		begin
		$monitor($time,"%d + %d = %d (+8*%d)",a,b,s,cout);
		a = 50;
		b = 10;

		#100 $finish;
		end
endmodule