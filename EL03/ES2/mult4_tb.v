module mult4_tb;
    // Segnali per il DUT (device under test)
    reg clk;
    reg rst;
    reg in_1, in_2;
    wire out_o;

    // Istanzia il modulo mod4_checker
    mod4_checker dut (
        .clk(clk),
        .rst(rst),
        .in_1(in_1),
        .in_2(in_2),
        .out_o(out_o)
    );

    // Generatore di clock: periodo 10 unità di tempo
    initial clk = 0;
    always #5 clk = ~clk;

    // Procedura di test
    initial begin
        // Inizializzazioni
        rst = 1; in_1 = 0; in_2 = 0;
        #12;    // attiva reset per 12 unità di tempo
        rst = 0;

        // Sequenza di test: esempio con bit per in_1 e in_2
        // Nota: ogni assegnazione dura un ciclo di clock (10 unità)

        // in_1 = 100100, in_2 = 100010
        apply_bits(1,1); // primo bit (MSB)
        apply_bits(0,0);
        apply_bits(0,0);
        apply_bits(1,0);
        apply_bits(0,1);
        apply_bits(0,0);

        // Fine simulazione dopo un po'
        #20;
        $finish;


    end

    // Task per applicare i bit e mostrare output
    task apply_bits;
        input b1;
        input b2;
    begin
        @(negedge clk);
        in_1 = b1;
        in_2 = b2;
        @(posedge clk);
        $display("Time %0t | in_1=%b in_2=%b | out_o=%b", $time, in_1, in_2, out_o);
    end
    endtask

endmodule