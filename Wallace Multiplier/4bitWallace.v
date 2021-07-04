module Wallace(
    a,
    b,
    res,
    cout
);
    input [3:0] a;
    input [3:0] b;
    output [7:0] res;
    output cout;

    assign m00 = b[0] & a[0];
    assign m01 = b[0] & a[1];
    assign m02 = b[0] & a[2];
    assign m03 = b[0] & a[3];

    assign m10 = b[1] & a[0];
    assign m11 = b[1] & a[1];
    assign m12 = b[1] & a[2];
    assign m13 = b[1] & a[3];

    assign m20 = b[2] & a[0];
    assign m21 = b[2] & a[1];
    assign m22 = b[2] & a[2];
    assign m23 = b[2] & a[3];

    assign m30 = b[3] & a[0];
    assign m31 = b[3] & a[1];
    assign m32 = b[3] & a[2];
    assign m33 = b[3] & a[3];

    assign res[0] = m00;

    //Stage 1
    wire s0_1, c0_1;
    ha1 ha0_1(m01, m10, s0_1, c0_1);
    wire s1_1, c1_1;
    fa1 fa1_1(m02, m11, m20, s1_1, c1_1);
    wire s2_1, c2_1;
    fa1 fa2_1(m03, m12, m21, s2_1, c2_1);
    wire s3_1, c3_1;
    fa1 fa3_1(m13, m22, m31, s3_1, c3_1);
    wire s4_1, c4_1;
    ha1 ha4_1(m23, m32, s4_1, c4_1);

    //Stage 2
    wire s0_2, c0_2;
    ha1 ha0_2(s2_1, c1_1, s0_2, c0_2);
    wire s1_2, c1_2;
    ha1 ha1_2(s3_1, c2_1, s1_2, c1_2);
    wire s2_2, c2_2;
    ha1 ha2_2(s4_1, c3_1, s2_2, c2_2);
    wire s3_2, c3_2;
    ha1 ha3_2(m33, c4_1, s3_2, c3_2);

    assign res[1] = s0_1;
    
    wire [7:0] s;
    wire c;
    cla Bit8Add({{3'b0, s3_2, s2_2, s1_2, s0_2, s1_1}}, {{2'b0, c3_2, c2_2, c1_2, c0_2, m30, c0_1}}, s, c);
    assign res[7:2] = s[5:0];
    assign cout = s[6];
endmodule

module fa1(
    input a,
    input b,
    input cin,
    output s,
    output cout
);
    assign s = a ^ b ^ cin;
    assign cout = a&b | b&cin | cin&a;
endmodule

module ha1(
    input a,
    input b,
    output s,
    output cout
);
    assign s = a ^ b;
    assign cout = a & b;
endmodule