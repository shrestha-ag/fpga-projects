module top(input CLK, output LED);
    reg [26:0] counter;
    assign LED = counter[26];
    initial begin
        counter = 0;
    end
    always@(posedge CLK)
    begin
        counter <= counter + 1;
    end
endmodule

