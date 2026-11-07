module ram (
    input  logic       clk,
    input  logic       we,
    input  logic [3:0] addr,
    input  logic [7:0] data_in,
    output logic [7:0] data_out
);

    // Memory declaration: 16 locations, 8 bits each
    logic [7:0] mem [0:15];

    // Write operation
    always_ff @(posedge clk) begin
        if (we)
            mem[addr] <= data_in;
    end

    // Read operation
    always_comb begin
        data_out = mem[addr];
    end

endmodule