module cla(
    input [3:0] a,
    input [3:0] b,
    input ci,
    output [3:0] s,
    output co
);
    wire P0, P1, P2, P3;
    wire G0, G1, G2, G3;
    wire C0, C1, C2, C3;

    P p0(a[0], b[0], P0);
    P p1(a[1], b[1], P1);
    P p2(a[2], b[2], P2);
    P p3(a[3], b[3], P3);

    G g0(a[0], b[0], G0);
    G g1(a[1], b[1], G1);
    G g2(a[2], b[2], G2);
    G g3(a[3], b[3], G3);

    assign C0 = G0 | (P0 & ci);
    assign C1 = G1 | (P1 & (G0 | (P0 & ci)));
    assign C2 = G2 | (P2 & (G1 | (P1 & (G0 | (P0 & ci)))));
    assign C3 = G3 | (P3 & (G2 | (P2 & (G1 | (P1 & (G0 | (P0 & ci)))))));
    assign co = C3;

    HA ha1(a[0], b[0], ci, s[0]);
    HA ha1(a[1], b[1], C0, s[1]);
    HA ha1(a[2], b[2], C1, s[2]);
    HA ha1(a[3], b[3], C2, s[3]);
endmodule

module P(
    input a,
    input b,
    output Pi
);
    assign Pi = a ^ b;
endmodule

module G(
    input a,
    input b,
    output Gi
);
    assign Gi = a & b;
endmodule

module HA(
    input a,
    input b,
    input c_in,
    output s
);
    assign s = a ^ b ^ c_in;
endmodule