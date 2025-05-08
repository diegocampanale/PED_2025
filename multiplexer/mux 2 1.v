module  multiplexer_2_1 (
    input a , b , select ,
    output y
    );
    assign y = select ? b : a ;
endmodule