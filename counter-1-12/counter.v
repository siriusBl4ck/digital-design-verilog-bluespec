module counter(
    input clk,
    input enable,
    input reset,
    input load,
    input [3:0] d,
    output reg [3:0] q
);
    initial q = 4'b0001;
    always @(posedge clk) begin
        //$display("%d", q);
        casex({enable, reset, load})
            3'b0xx: ; //nothing
            3'b11x: q <= 4'b0001;
            3'b101: q <= d;
            3'b100: if (q < 12) q <= q + 4'b0001; else q <= 4'b0001;
        endcase
        /*
        if (enable == 1) begin
            if (reset == 1) begin
                q <= 4'b0001;
            end
            else begin
                if (load == 1) q <= d;
                else if (q < 12) q <= q + 1;
                else q <= 4'b0001;
            end
        end
        */
    end
endmodule
