import mypackage::*;

class scoreboard;

	mailbox #(transaction) mon2scb;
	transaction trans;

	function new(mailbox #(transaction) mon2scb);
		this.mon2scb=mon2scb;
	endfunction

	task main();
		logic [8:0] result;
		logic [8:0] tmp;
		logic carry;
		string message;
		string op;
		logic [3:0] array [32];
		foreach (array[i]) begin array[i]=5; end
		repeat(1920)
			begin
				mon2scb.get(trans);
				tmp=trans.A+trans.B;
				carry=tmp[8];
				case(trans.ALU_Sel)
					4'b0000: result=trans.A + trans.B; // Addition  
          				4'b0001: result=trans.A - trans.B;//Subtraction
          				4'b0010: result=trans.A *trans.B;// Multiplication
          				4'b0011: result=trans.A / trans.B;// Division
          				4'b0100: result=trans.A<<1;// Logical shift left
          				4'b0101: result=trans.A>>1;// Logical shift right
          				4'b0110: result={trans.A[6:0],trans.A[7]};// Rotate left
          				4'b0111: result = {trans.A[0],trans.A[7:1]};// Rotate right
          				4'b1000: result =trans.A & trans.B; // Logical and
          				4'b1001: result =trans.A | trans.B;//  Logical or
          				4'b1010: result =trans.A^trans.B; //  Logical xor 
          				4'b1011: result =~(trans.A | trans.B); //  Logical nor
          				4'b1100: result =~(trans.A & trans.B);// Logical nand 
          				4'b1101: result =~(trans.A ^ trans.B);// Logical xnor
          				4'b1110: result =(trans.A>trans.B)?8'd1:8'd0;// Greater comparison
          				4'b1111: result =(trans.A==trans.B)?8'd1:8'd0; // Equal comparison
					default:result=trans.A + trans.B; // Addition  
				endcase
				
				//message = ((result[7:0] ===trans.ALU_Out)&& (trans.CarryOut===carry))? "Passed":"Failed";
				//$display("Expected result is %0b, Expected Carry is %0b ",result[7:0], carry);
				//trans.display({"Scoreboard: ",message});
				
    				case(trans.ALU_Sel)
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
				
				if ((result[7:0] ===trans.ALU_Out)&& (trans.CarryOut===carry))
					begin
						trans.cg.sample();
					end
				else
					begin
						
						if(!(array[15+trans.ALU_Sel] === (trans.ALU_Sel)))
							begin
								trans.display({"The " , op," Operation does not work properly; Example"});
								if ((trans.ALU_Sel inside {[0:3]}) || (trans.ALU_Sel inside {[14:15]} ))
									$display("Expected Result: %0d, Expected Carry: %0d" , result[7:0],carry);
								else
									$display("Expected Result: %0b, Expected Carry: %0d", result[7:0],carry);
								$display("----------------------------------------------------------");
								array[15+trans.ALU_Sel] = trans.ALU_Sel;
							end
					end
				
				
			end
	endtask
endclass


