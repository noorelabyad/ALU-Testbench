import mypackage::*;
class monitor;
	mailbox #(transaction) mon2scb;
	virtual intf vif;
	transaction trans;

	function new (virtual intf vif, mailbox #(transaction) mon2scb);
		this.vif=vif;
		this.mon2scb=mon2scb;
	endfunction

	task main();
		
		repeat(1920)
			begin
				trans=new();
				@(posedge vif.clk);
				#3
				trans.A=vif.A;
				trans.B=vif.B;
				trans.ALU_Sel=vif.ALU_Sel;
				trans.ALU_Out=vif.ALU_Out;
				trans.CarryOut=vif.CarryOut;
				//trans.display("Monitor");
				mon2scb.put(trans);
			end
			
	endtask
endclass
				

