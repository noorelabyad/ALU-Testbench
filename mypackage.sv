
package mypackage;

	class transaction;
		rand logic [7:0] A,B;
		logic [3:0] ALU_Sel;
		logic [7:0] ALU_Out;
		logic CarryOut;
		
		constraint A_lower_B_lower {A inside {[0:84]};B inside {[0:84]};};
		constraint A_lower_B_middle {A inside {[0:84]};B inside {[85:170]};};
		constraint A_lower_B_upper {A inside {[0:84]};B inside {[171:255]};};

		constraint A_middle_B_lower {A inside {[85:170]};B inside {[0:84]};};
		constraint A_middle_B_middle {A inside {[85:170]};B inside {[85:170]};};
		constraint A_middle_B_upper {A inside {[85:170]};B inside {[171:255]};};

		constraint A_upper_B_lower {A inside {[171:255]};B inside {[0:84]};};
		constraint A_upper_B_middle {A inside {[171:255]};B inside {[85:170]};};
		constraint A_upper_B_upper {A inside {[171:255]};B inside {[171:255]};};

		covergroup cg;
			operations : coverpoint ALU_Sel{option.at_least = 120; 
							bins operations [16] = {[0:15]};}
			operand_A: coverpoint A {bins lower ={[0:84]}; 
						bins middle={[85:170]};
						bins upper ={[171:255]};}
			operand_B: coverpoint B {bins lower ={[0:84]}; 
						bins middle={[85:170]};
						bins upper ={[171:255]};}
			operands : cross operand_A,operand_B,operations;
		endgroup
	
		function new ();
			cg = new();
		endfunction
		
		function void display (string name);
			string op;
    			case(ALU_Sel)
        			4'b0000: op= "Addition";
        			4'b0001: op= "Subtraction";
        			4'b0010: op= "Multiplication"; 
        			4'b0011: op= "Division";
        			4'b0100: op= "Logical Shift Left";
        			4'b0101: op= "Logical Shift Right";
        			4'b0110: op= "Rotate Left";
        			4'b0111: op= "Rotate Right";
        			4'b1000: op= "Logical AND"; 
        			4'b1001: op= "Logical OR";
        			4'b1010: op= "Logical XOR"; 
        			4'b1011: op= "Logical NOR";
        			4'b1100: op= "Logical NAND";
        			4'b1101: op= "Logical XNOR";
        			4'b1110: op= "Greater Comparison";
        			4'b1111: op= "Equal Comparison";   
        			default: op=""; 
    			endcase
	
			//$display ("Time: %0t", $time);
			//$display("----------------------------------------------------");

			if ((ALU_Sel inside {[0:3]}) || (ALU_Sel inside {[14:15]} ))
				$display("%s : A=%0d, B=%0d, Operation: %s, Result=%0d, Carry=%0d",name,A,B,op,ALU_Out,CarryOut);
			else
				$display("%s : A=%0b, B=%0b, Operation: %s, Result=%0b, Carry=%0b",name,A,B,op,ALU_Out,CarryOut);
				
				 
		endfunction

	endclass

endpackage

