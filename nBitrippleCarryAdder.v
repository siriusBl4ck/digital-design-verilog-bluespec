module FullAdder(input a,b,cin, output cout,s);
    assign cout = a&b|b&cin|cin&a;
    assign s = a^b^cin;
endmodule

module adder100( 
    input [n-1:0] a, b,
    input cin,
    output cout,
    output [n-1:0] sum );
    parameter n = 100;
    wire [n-1:0] c2;
    assign cout = c2[n-1];
    FullAdder FA(a[0],b[0],cin,c2[0],sum[0]);
    genvar p;
    generate
        for(p = 1;p<n;p=p+1) begin:fa
            FullAdder FA(a[p],b[p],c2[p-1],c2[p],sum[p]);
        end
    endgenerate
endmodule