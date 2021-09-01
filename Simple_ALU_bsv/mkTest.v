//
// Generated by Bluespec Compiler (build 26e119fb)
//
// On Wed Sep  1 15:47:40 IST 2021
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkTest(CLK,
	      RST_N);
  input  CLK;
  input  RST_N;

  // ports of submodule myAlu
  wire [31 : 0] myAlu$get_result, myAlu$put_command_x, myAlu$put_command_y;
  wire [1 : 0] myAlu$put_command_opnum;
  wire myAlu$EN_put_command, myAlu$RDY_get_result, myAlu$RDY_put_command;

  // declarations used by system tasks
  // synopsys translate_off
  reg [63 : 0] v__h141;
  // synopsys translate_on

  // submodule myAlu
  mkAlu myAlu(.CLK(CLK),
	      .RST_N(RST_N),
	      .put_command_opnum(myAlu$put_command_opnum),
	      .put_command_x(myAlu$put_command_x),
	      .put_command_y(myAlu$put_command_y),
	      .EN_put_command(myAlu$EN_put_command),
	      .RDY_put_command(myAlu$RDY_put_command),
	      .get_result(myAlu$get_result),
	      .RDY_get_result(myAlu$RDY_get_result),
	      .checkErr(),
	      .RDY_checkErr());

  // submodule myAlu
  assign myAlu$put_command_opnum = 2'd3 ;
  assign myAlu$put_command_x = 32'd12 ;
  assign myAlu$put_command_y = 32'd2 ;
  assign myAlu$EN_put_command = myAlu$RDY_put_command ;

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (myAlu$RDY_get_result)
	begin
	  v__h141 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (myAlu$RDY_get_result) $display(v__h141);
    if (RST_N != `BSV_RESET_VALUE)
      if (myAlu$RDY_get_result)
	$display("Result = %d", $signed(myAlu$get_result));
  end
  // synopsys translate_on
endmodule  // mkTest

