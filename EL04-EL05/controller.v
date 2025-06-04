module controller(
    output wire [3:0] sel,
    output wire selb, clr, inc, valy,
    input wire clk, rst, eq0, eq8,
    input wire [...:...] cnt
    );
    initial begin
        $dumpfile("controller.vcd");  // nome del file di output
        $dumpvars(0, dut);            // traccia tutti i segnali del modulo 'dut'
    end

    // TODO: Implementare FSM a 3 stati:
    // S0 (00): Reset/Clear - genera clr=1
    // S1 (01): Processing - genera inc=1, sel=cnt, selb=eq0
    // S2 (11): Valid output - genera valy=1

    reg [1:0] state, next_state;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 2'b00; // Stato iniziale S0
        end else begin
            state <= next_state; // Aggiorna lo stato
        end
    end
    always @(*) begin
        case (state)
            2'b00: begin // S0: Reset/Clear
                clr = 1;
                inc = 0;
                sel = 4'b0000;
                selb = 1; // Non selezionato
                valy = 0;
                next_state = eq8 ? 2'b01 : 2'b00; // Passa a S1 se eq8
            end
            2'b01: begin // S1: Processing
                clr = 0;
                inc = 1;
                sel = cnt; // Seleziona il contatore
                selb = eq0; // Seleziona se eq0
                valy = 0;
                next_state = (eq0 || eq8) ? 2'b11 : 2'b01; // Passa a S2 se eq0 o eq8
            end
            2'b11: begin // S2: Valid output
                clr = 0;
                inc = 0;
                sel = cnt; // Mantiene il contatore
                selb = eq0; // Mantiene la selezione se eq0
                valy = 1; // Genera valid output
                next_state = 2'b00; // Torna a S0 dopo l'output valido
            end
            default: begin // Stato di sicurezza
                clr = 1;
                inc = 0;
                sel = 4'b0000;
                selb = 1;
                valy = 0;
                next_state = 2'b00; // Torna a S0 in caso di errore
            end
        endcase
    end
endmodule