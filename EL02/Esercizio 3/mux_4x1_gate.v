module mux_4x1_gate (x0,x1,x2,x3,s0,s1,y);
    input x0,x1,x2,x3,s0,s1;
    output y;

    wire s0n, s1n;
    wire y0, y1, y2, y3;

    not(s0n, s0);
    not(s1n, s1);

    and(y0, s0n, s1n, x0);
    and(y1, s0n, s1, x1);
    and(y2, s0, s1n, x2);
    and(y3, s0, s1, x3);

    or(y,y0,y1,y2,y3);
endmodule