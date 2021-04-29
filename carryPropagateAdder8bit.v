module star(
    input [1:0] a,
    input [1:0] b,
    output [1:0] c
);
    assign c[0] = (b[0] & a[0]) | b[1];
    assign c[1] = (b[0] & a[1]) | b[1];
endmodule

module fa(
    input a,
    input b,
    input cin,
    output s
);
    assign s = a ^ b ^ cin;
endmodule

module cla(
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output cout
);
    wire [17:0] s1, s2, s3, s4, s5;
    
    assign s1[1:0] = 2'b00;
    assign s1[3:2] = ({2{(a[0] ^ b[0])}} & 2'b01) | ({2{(a[0] & b[0])}} & 2'b11) | ({2{(~a[0] & ~b[0])}} & 2'b00);
    assign s1[5:4] = ({2{(a[1] ^ b[1])}} & 2'b01) | ({2{(a[1] & b[1])}} & 2'b11) | ({2{(~a[1] & ~b[1])}} & 2'b00);
    assign s1[7:6] = ({2{(a[2] ^ b[2])}} & 2'b01) | ({2{(a[2] & b[2])}} & 2'b11) | ({2{(~a[2] & ~b[2])}} & 2'b00);
    assign s1[9:8] = ({2{(a[3] ^ b[3])}} & 2'b01) | ({2{(a[3] & b[3])}} & 2'b11) | ({2{(~a[3] & ~b[3])}} & 2'b00);
    assign s1[11:10] = ({2{(a[4] ^ b[4])}} & 2'b01) | ({2{(a[4] & b[4])}} & 2'b11) | ({2{(~a[4] & ~b[4])}} & 2'b00);
    assign s1[13:12] = ({2{(a[5] ^ b[5])}} & 2'b01) | ({2{(a[5] & b[5])}} & 2'b11) | ({2{(~a[5] & ~b[5])}} & 2'b00);
    assign s1[15:14] = ({2{(a[6] ^ b[6])}} & 2'b01) | ({2{(a[6] & b[6])}} & 2'b11) | ({2{(~a[6] & ~b[6])}} & 2'b00);
    assign s1[17:16] = ({2{(a[7] ^ b[7])}} & 2'b01) | ({2{(a[7] & b[7])}} & 2'b11) | ({2{(~a[7] & ~b[7])}} & 2'b00);

    assign s2[1:0] = s1[1:0];
    star op1_1(s1[1:0], s1[3:2], s2[3:2]);
    star op2_1(s1[3:2], s1[5:4], s2[5:4]);
    star op3_1(s1[5:4], s1[7:6], s2[7:6]);
    star op4_1(s1[7:6], s1[9:8], s2[9:8]);
    star op5_1(s1[9:8], s1[11:10], s2[11:10]);
    star op6_1(s1[11:10], s1[13:12], s2[13:12]);
    star op7_1(s1[13:12], s1[15:14], s2[15:14]);
    star op8_1(s1[15:14], s1[17:16], s2[17:16]);

    assign s3[3:0] = s2[3:0];
    star op2_2(s2[1:0], s2[5:4], s3[5:4]);
    star op3_2(s2[3:2], s2[7:6], s3[7:6]);
    star op4_2(s2[5:4], s2[9:8], s3[9:8]);
    star op5_2(s2[7:6], s2[11:10], s3[11:10]);
    star op6_2(s2[9:8], s2[13:12], s3[13:12]);
    star op7_2(s2[11:10], s2[15:14], s3[15:14]);
    star op8_2(s2[13:12], s2[17:16], s3[17:16]);

    assign s4[7:0] = s3[7:0];
    star op4_3(s3[1:0], s3[9:8], s4[9:8]);
    star op5_3(s3[3:2], s3[11:10], s4[11:10]);
    star op6_3(s3[5:4], s3[13:12], s4[13:12]);
    star op7_3(s3[7:6], s3[15:14], s4[15:14]);
    star op8_3(s3[9:8], s3[17:16], s4[17:16]);

    assign s5[15:0] = s4[15:0];
    star op8_4(s3[1:0], s3[17:16], s4[17:16]);

    genvar p;
    generate
    for (p=0; p<8;p=p+1) begin:fa
        fa f(a[p], b[p], s5[2*p], s[p]);
    end
    endgenerate

    assign cout = s5[17];
    
endmodule