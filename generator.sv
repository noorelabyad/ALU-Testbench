import mypackage::*;

class generator;
	transaction trans;
	mailbox #(transaction) gen2driv;

	function new (mailbox #(transaction) gen2driv);
		this.gen2driv=gen2driv;
	endfunction

	task main();
		for (int i=0;i<16;i++)
		begin
			for(int j=0;j<120;j++)
				begin
					trans=new();
					trans.ALU_Sel=i;
					if (j inside {[0:13]}) 
						begin
							trans.A_lower_B_middle.constraint_mode(0); 
							trans.A_lower_B_upper.constraint_mode(0);
							trans.A_middle_B_lower.constraint_mode(0);
							trans.A_middle_B_middle.constraint_mode(0);
							trans.A_middle_B_upper.constraint_mode(0); 
							trans.A_upper_B_lower.constraint_mode(0);
							trans.A_upper_B_middle.constraint_mode(0);
							trans.A_upper_B_upper.constraint_mode(0);
						end
					if (j inside {[14:26]}) 
						begin
							trans.A_lower_B_lower.constraint_mode(0); 
							trans.A_lower_B_upper.constraint_mode(0);
							trans.A_middle_B_lower.constraint_mode(0);
							trans.A_middle_B_middle.constraint_mode(0);
							trans.A_middle_B_upper.constraint_mode(0); 
							trans.A_upper_B_lower.constraint_mode(0);
							trans.A_upper_B_middle.constraint_mode(0);
							trans.A_upper_B_upper.constraint_mode(0);
						end
					if (j inside {[27:39]}) 
						begin
							trans.A_lower_B_lower.constraint_mode(0); 
							trans.A_lower_B_middle.constraint_mode(0);
							trans.A_middle_B_lower.constraint_mode(0);
							trans.A_middle_B_middle.constraint_mode(0);
							trans.A_middle_B_upper.constraint_mode(0); 
							trans.A_upper_B_lower.constraint_mode(0);
							trans.A_upper_B_middle.constraint_mode(0);
							trans.A_upper_B_upper.constraint_mode(0);
						end
					if (j inside {[40:52]}) 
						begin
							trans.A_lower_B_lower.constraint_mode(0); 
							trans.A_lower_B_middle.constraint_mode(0);
							trans.A_lower_B_upper.constraint_mode(0);
							trans.A_middle_B_middle.constraint_mode(0);
							trans.A_middle_B_upper.constraint_mode(0); 
							trans.A_upper_B_lower.constraint_mode(0);
							trans.A_upper_B_middle.constraint_mode(0);
							trans.A_upper_B_upper.constraint_mode(0);
						end
					if (j inside {[53:66]}) 
						begin
							trans.A_lower_B_lower.constraint_mode(0); 
							trans.A_lower_B_middle.constraint_mode(0);
							trans.A_lower_B_upper.constraint_mode(0);
							trans.A_middle_B_lower.constraint_mode(0);
							trans.A_middle_B_upper.constraint_mode(0);
							trans.A_upper_B_lower.constraint_mode(0);
							trans.A_upper_B_middle.constraint_mode(0);
							trans.A_upper_B_upper.constraint_mode(0);
						end
					if (j inside {[67:79]}) 
						begin
							trans.A_lower_B_lower.constraint_mode(0); 
							trans.A_lower_B_middle.constraint_mode(0);
							trans.A_lower_B_upper.constraint_mode(0);
							trans.A_middle_B_lower.constraint_mode(0);
							trans.A_middle_B_middle.constraint_mode(0); 
							trans.A_upper_B_lower.constraint_mode(0);
							trans.A_upper_B_middle.constraint_mode(0);
							trans.A_upper_B_upper.constraint_mode(0);
						end
					if (j inside {[80:92]}) 
						begin
							trans.A_lower_B_lower.constraint_mode(0); 
							trans.A_lower_B_middle.constraint_mode(0);
							trans.A_lower_B_upper.constraint_mode(0);
							trans.A_middle_B_lower.constraint_mode(0);
							trans.A_middle_B_middle.constraint_mode(0); 
							trans.A_middle_B_upper.constraint_mode(0);
							trans.A_upper_B_middle.constraint_mode(0);
							trans.A_upper_B_upper.constraint_mode(0);
						end
					if (j inside {[93:105]}) 
						begin
							trans.A_lower_B_lower.constraint_mode(0); 
							trans.A_lower_B_middle.constraint_mode(0);
							trans.A_lower_B_upper.constraint_mode(0);
							trans.A_middle_B_lower.constraint_mode(0);
							trans.A_middle_B_middle.constraint_mode(0); 
							trans.A_middle_B_upper.constraint_mode(0);
							trans.A_upper_B_lower.constraint_mode(0);
							trans.A_upper_B_upper.constraint_mode(0);
						end
					if (j inside {[106:119]}) 
						begin
							trans.A_lower_B_lower.constraint_mode(0); 
							trans.A_lower_B_middle.constraint_mode(0);
							trans.A_lower_B_upper.constraint_mode(0);
							trans.A_middle_B_lower.constraint_mode(0);
							trans.A_middle_B_middle.constraint_mode(0); 
							trans.A_middle_B_upper.constraint_mode(0);
							trans.A_upper_B_lower.constraint_mode(0);
							trans.A_upper_B_middle.constraint_mode(0);
						end
					void'(trans.randomize());
					//trans.display("Generator");
					gen2driv.put(trans);
				end
		end
	endtask

	
endclass