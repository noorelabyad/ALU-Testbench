import mypackage::*;
class driver;
	mailbox #(transaction) gen2driv;
	virtual intf vif;
	transaction trans;

	function new (virtual intf vif, mailbox #(transaction) gen2driv);
		this.vif=vif;
		this.gen2driv=gen2driv;
	endfunction

	task main();
		repeat(1920)
			begin
				
				gen2driv.get(trans);
				@(posedge vif.clk);
				vif.A<=trans.A;
				vif.B<=trans.B;
				vif.ALU_Sel<=trans.ALU_Sel;
				//trans.display("Driver");
				trans.ALU_Out=vif.ALU_Out;
				trans.CarryOut=vif.CarryOut;
			end
	endtask
endclass
				
