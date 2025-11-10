// Plug PMOD LED on PMOD3 (Full Scale PMOD)

module pmodled(input CLK, output LED, PMOD1_D4, PMOD2_D0, PMOD3_D5, PMOD4_D1, PMOD5_D6, PMOD6_D2, PMOD7_D7, PMOD8_D3);
	reg [31:0] counter;
	reg [7:0] leds;
	reg [7:0] leds_next;
	reg [0:0] direction;
	
	assign PMOD7_D7 = !leds[7];
	assign PMOD5_D6 = !leds[6];
	assign PMOD3_D5 = !leds[5];
	assign PMOD1_D4 = !leds[4];
	assign PMOD8_D3 = !leds[3];
	assign PMOD6_D2 = !leds[2];
	assign PMOD4_D1 = !leds[1];
	assign PMOD2_D0 = !leds[0];
	assign LED  = !counter[23];
	
	initial 
    begin
		counter = 0;
		leds = 1;
		direction = 1;
		leds_next = 1;
	end

	always @ (posedge CLK) 
    begin
		counter <= counter + 1;
		if (counter[10] && !counter[19]) 
        begin
			leds <= leds_next;
		end
		if (counter[19]) 
        begin
			if( direction ) 
            begin
				if (leds == 'b10000000 ) 
                begin
					leds_next <= leds >> 1;
					direction <= 0;
				end 
                else 
                begin
					leds_next <= leds << 1;		
				end
			end 
            else 
            begin
				if (leds == 'b00000001 )
                begin
					leds_next <= leds << 1;
					direction <= 1;
				end 
                else 
                begin
					leds_next <= leds >> 1;		
				end
			end
		end
	end
endmodule