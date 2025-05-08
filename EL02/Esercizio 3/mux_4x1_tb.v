`timescale 1ns/1ps

// Definizione testbench
module testbench_mux_4x1 ();

    // input e output
    reg x0, x1, x2, x3; // ingressi del mux
    reg s0, s1; // selettori
    wire y; // uscita del mux

    //Device Under Test (livello gate)
    mux_4x1_gate DUT (
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .s0(s0),
        .s1(s1),
        .y(y)
    );

    // // Device Under Test (livello dataflow)
    // mux_4x1_dataflow DUT (
    //     .x0(x0),
    //     .x1(x1),
    //     .x2(x2),
    //     .x3(x3),
    //     .s0(s0),
    //     .s1(s1),
    //     .y(y)
    // );
    // // Device Under Test (livello comportamentale)
    // mux_4x1_behavioral DUT (
    //     .in_i(in_i),
    //     .sel_i(sel_i),
    //     .out_o(out_o)
    // );

    // Stimoli di test
    initial begin
        $dumpfile("mux_4x1_tb.vcd");
        $dumpvars(0, testbench_mux_4x1);

        // Test 1.0: Selettore 00
        x0 = 0; x1 = 0; x2 = 0; x3 = 0;
        s0 = 0; s1 = 0;
        #20; // Attesa di 20 ns

        // Test 1.1: Selettore 00
        x0 = 1; x1 = 0; x2 = 0; x3 = 0;
        s0 = 0; s1 = 0;
        #20; // Attesa di 20 ns

        // Test 2.0: Selettore 01
        x0 = 0; x1 = 0; x2 = 0; x3 = 0;
        s0 = 0; s1 = 1;
        #20; // Attesa di 20 ns
        // Test 2.1: Selettore 01
        x0 = 0; x1 = 1; x2 = 0; x3 = 0;
        s0 = 0; s1 = 1;
        #20; // Attesa di 20 ns

        // Test 3.0: Selettore 10
        x0 = 0; x1 = 0; x2 = 0; x3 = 0;
        s0 = 1; s1 = 0; 
        #20; // Attesa di 20 ns
        // Test 3.1: Selettore 10
        x0 = 0; x1 = 0; x2 = 1; x3 = 0;
        s0 = 1; s1 = 0;
        #20; // Attesa di 20 ns

        // Test 4.0: Selettore 11
        x0 = 0; x1 = 0; x2 = 0; x3 = 0;
        s0 = 1; s1 = 1;
        #20; // Attesa di 20 ns
        // Test 4.1: Selettore 11
        x0 = 0; x1 = 0; x2 = 0; x3 = 1;
        s0 = 1; s1 = 1;
        #20; // Attesa di 20 ns

        // Fine del test
        $finish;
    end

    initial begin
        $monitor("Time: %0t | x0=%b x1=%b x2=%b x3=%b | s0=%b s1=%b | y=%b", 
                 $time, x0, x1, x2, x3, s0, s1, y);
    end
endmodule