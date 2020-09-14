module mips_registers(read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk);

	output reg [31:0] read_data_1, read_data_2;
	input [31:0] write_data;
	input [4:0] read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	reg [31:0] registers [31:0];
	
	always @ (*) begin
		if(signal_reg_write == 1'b1 && write_reg !=5'b00000) // eger write sinyali varsa, ve 0 inci register degilse gir.($zero must be 0)
			begin
				$readmemb("registers.mem", registers);			// write-reg e write data yaz.
				registers[write_reg] = write_data;
				$writememb("registers.mem", registers);
			end
		else
			begin
				$readmemb("registers.mem", registers);
				read_data_1 <= registers[read_reg_1];		// read-reg-1,2 deki degerleri oku read-datalara yaz.
				read_data_2 <= registers[read_reg_2];
			end		
	end
	

	
	
	
	
endmodule