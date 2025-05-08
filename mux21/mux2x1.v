module mux2x1 (a, b, c, select);
  input b, c, select;
  output reg a;

  always @(select or b or c) begin
    if (select) a=b;
    else        a=c;
  end
endmodule