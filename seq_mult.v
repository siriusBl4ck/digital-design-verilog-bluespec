module seq_mult(
    input [1:0] A,
    input [1:0] B,
    input clk,
    output [3:0] mult_res
);
    reg counter = 1'b0;
    reg [3:0] acc = 4'b0;
    wire [3:0] num_to_add = 0;
    wire [3:0] shifter_in = 0;
    wire [3:0] shifter_out = 0;

    assign shifter_out = shifter_in << counter;

    assign num_to_add = shifter_out & {B[counter], B[counter], B[counter], B[counter]};

    assign shifter_in = {2'b0, A};

    assign mult_res = acc;

    always @(posedge clk) begin
        counter <= counter + 1;
    end

    always @(posedge clk) begin
        acc <= acc + num_to_add;
    end

    always @(posedge clk) begin
        $display($time, "] NUM_TO_ADD: %b", num_to_add);
        $display($time, "] SHIFTER_OUT: %b", shifter_out);
        $display($time, "] SHIFTER_IN: %b", shifter_in);
        $display($time, "] MULT_RES: %b", mult_res);
        $display($time, "] CNT: %b", counter);
        $display($time, "] A: %b", A);
        $display($time, "] B: %b", B);
    end
endmodule