// Plug PMOD LED on PMOD3 (Full Scale PMOD)

module pmodled(input CLK, output LED, output PMOD1_D4, output PMOD2_D0, output PMOD3_D5, output PMOD4_D1, output PMOD5_D6, output PMOD6_D2, output PMOD7_D7, output PMOD8_D3);
    reg [30:0] counter;
    wire lclk = counter[14];

    initial begin
        PMOD1_D4 =  1'b0;
        PMOD2_D0 =  1'b0;
        PMOD3_D5 =  1'b0;
        PMOD4_D1 =  1'b0;
        PMOD5_D6 =  1'b0;
        PMOD6_D2 =  1'b0;
        PMOD7_D7 =  1'b0;
        PMOD8_D3 =  1'b0;
        LED      =  1'b0;
        counter  = 31'h7FFFFFFF;
    end

    always @(posedge CLK)
    begin
        counter <= counter - 1'b1;
    end

    always @(posedge lclk)
    begin
        PMOD1_D4 <= counter[26];
        PMOD2_D0 <= counter[22];
        PMOD3_D5 <= counter[27];
        PMOD4_D1 <= counter[23];
        PMOD5_D6 <= counter[28];
        PMOD6_D2 <= counter[24];
        PMOD7_D7 <= counter[29];
        PMOD8_D3 <= counter[25];
        LED      <= !LED;
    end
endmodule
