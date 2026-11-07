module ram_tb;

    logic clk;
    logic we;
    logic [3:0] addr;
    logic [7:0] data_in;
    logic [7:0] data_out;

    // DUT instantiation
    ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        // Test Case 1: Write data
        we = 1;
        addr = 4'd0;
        data_in = 8'hAA;
        #10;

        // Test Case 2: Write another location
        addr = 4'd1;
        data_in = 8'h55;
        #10;

        // Test Case 3: Read first location
        we = 0;
        addr = 4'd0;
        #10;
        $display("Address 0: Data = %h", data_out);

        // Test Case 4: Read second location
        addr = 4'd1;
        #10;
        $display("Address 1: Data = %h", data_out);

        // Test Case 5: Read unwritten location
        addr = 4'd2;
        #10;
        $display("Address 2: Data = %h", data_out);

        $finish;
    end

endmodule