module mux2x1_tb;
  reg s, a1, a0;
  wire q;

  mux2x1 mux(.select(s), .b(a1), .c(a0), .a(q));

  initial begin
    $dumpfile("mux2x1_tb.vcd");
    $dumpvars(0, mux2x1_tb);
    //$monitor("[%0tns] s=%b, a1=%b, a0=%b, q=%b", $time, s, a1, a0, q);
    s = 1'b0; a1 = 1'b0; a0 = 1'b0;
    #10
    s = 1'b0; a1 = 1'b0; a0 = 1'b1;
    #10
    s = 1'b0; a1 = 1'b1; a0 = 1'b0;
    #10
    s = 1'b0; a1 = 1'b1; a0 = 1'b1;

    #10
    s = 1'b1; a1 = 1'b0; a0 = 1'b0;
    #10
    s = 1'b1; a1 = 1'b0; a0 = 1'b1;
    #10
    s = 1'b1; a1 = 1'b1; a0 = 1'b0;
    #10
    s = 1'b1; a1 = 1'b1; a0 = 1'b1;
  end

endmodule