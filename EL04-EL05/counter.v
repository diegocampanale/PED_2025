// module counter(clk, rst, clr, count, eq0, eq8);
//     input clk, rst, clr; 
//     output reg [3:0] count; 
//     output wire eq0, eq8;
//     initial begin
//         $dumpfile("counter.vcd");  
//         $dumpvars(0, dut);          // traccia tutti i segnali del modulo 'dut'
//     end

//     // always @(posedge clk or posedge rst) begin
//     //     if (rst) begin
//     //         count <= 4'b0000; // Reset del contatore a zero
//     //     end else begin
//     //         count <= count + 1; // Incremento del contatore
//     //     end
//     // end

//     always @(posedge clk or posedge rst) begin
//         if (rst) begin
//             count <= 4'b0000; // Reset del contatore a zero
//         end else if (clr) begin
//             count <= 4'b0000; // Cancellazione del contatore a zero
//         end else begin
//             count <= count + 1; // Incremento del contatore
//         end
//     end
// endmodule

module counter(
    output reg [3:0] cnt,
    output wire eq0,
    output wire eq8,
    input wire clk, rst, clr, inc
    );

    initial begin
        $dumpfile("counter.vcd");  // nome del file di output
        $dumpvars(0, dut);          // traccia tutti i segnali del modulo 'dut'
    end

    // TODO: Implementare contatore con:
    // - Reset asincrono e clear sincrono
    // - Incremento sincrono
    // - eq0 = 1 se (cnt == 0), eq8 = 1 se (cnt == 8)

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;
        end else if (clr) begin
            cnt <= 0;
        end else if (inc) begin
            cnt <= (cnt + 1) % 9;
        end
    end
    assign eq0 = (cnt == 0);
    assign eq8 = (cnt == 8);


endmodule