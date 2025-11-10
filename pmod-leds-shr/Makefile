file=pmod-led
pcf =pmod-led.pcf

build:
	yosys -p "synth_ice40 -top pmodled -json $(file).json" $(file).v 
	nextpnr-ice40 --lp1k --package cm36 --json $(file).json --pcf $(pcf) --asc $(file).asc
	icepack $(file).asc $(file).bin 

clean: 
	rm $(file).bin $(file).asc $(file).json $(file).blif