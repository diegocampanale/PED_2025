module mod4_checker(in_1, in_2, rst, clk, out_o);
    input in_1, in_2; // Input del modulo
    input rst, clk; // Segnali di reset e clock
    output reg out_o; // Dichiarazione di output come reg

    localparam S0 = 1'b0;
    localparam S1 = 1'b1;

    reg state, next_state;
    
    initial begin
        $dumpfile("waveform.vcd");  // nome del file di output
        $dumpvars(0, dut);          // traccia tutti i segnali del modulo 'dut'
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0; // Reset dello stato
        end else begin
            state <= next_state; // Aggiornamento dello stato
        end
    end

    always @(*) begin
        case (state)
            S0: begin
                case ({in_1,in_2}) 
                    2'b00: begin next_state=S0; out_o=1; end
                    2'b01, 2'b10: begin next_state=S1; out_o=0; end
                    2'b11: begin next_state=S0; out_o=0; end
                endcase
            end 
            S1: begin
                 case ({in_1,in_2})
                    2'b00: begin next_state=S0; out_o=0; end
                    2'b01, 2'b10: begin next_state=S1; out_o=0; end
                    2'b11: begin next_state=S0; out_o=1; end
                 endcase
            end
            default: begin
                next_state = S0;
                out_o = 0;
            end
        endcase
    end
endmodule
