interface intf;
	logic [7:0] A,B;
	logic [3:0] ALU_Sel;
	logic [7:0] ALU_Out;
	logic CarryOut;
	logic clk;

	initial clk<=0;
	always #10 clk=~clk;

endinterface

