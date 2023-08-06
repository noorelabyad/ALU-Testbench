# ALU-Verification

#### A testbench was created using the verification methodology to rigorously assess the functionality and reliability of an ALU RTL (Register Transfer Level) design. The purpose of this verification process was to identify any existing bugs in the ALU. 
<br>
The ALU takes three inputs:
  <li>A (an 8-bit First Operand) </li> 
  <li>B (an 8-bit Second Operand)</li> 
  <li>ALU_Sel (a 4-bit Selection Line) </li>
<br>
It provides two outputs: 
  <li>ALU_Out (an 8-bit ALU Output)</li> 
  <li>CarryOut (a 1-bit Carry-Out Flag)</li> 
<br>

#### During the verification process, *three bugs* were discovered in the ALU. These bugs pertained to the Addition, Logical AND, and Logical XNOR operations, and they were effectively detected and documented using the testbench as shown in the following output: 

<br>
<br>

![Screenshot 2023-08-06 163727](https://github.com/noorelabyad/ALU-Testbench/assets/114947825/cbb662ed-ae30-4084-a3cc-327ef0c94cb9)

<br>

#### In order to analyze the coverage of the verification, an HTML coverage report was generated, and a detailed coverage report was also compiled using the "coverage report -detail" command. These reports provide valuable insights into the extent of verification achieved and the completeness of the testing process.

<br>

### The HTML Coverage Report
<br>
<br>

![Screenshot 2023-08-06 163945](https://github.com/noorelabyad/ALU-Testbench/assets/114947825/ca4673db-2b9d-4a2b-a099-ac6d6d9fbb9d)

<br>
<br>

### The Coverage Report Details

<br>
<br>

![Screenshot 2023-08-06 163645](https://github.com/noorelabyad/ALU-Testbench/assets/114947825/4228c2f1-bbcf-4425-9bfc-12553f558155)

<br>

![Screenshot 2023-08-06 163814](https://github.com/noorelabyad/ALU-Testbench/assets/114947825/7e7a4783-451a-4d28-8cde-3b6e3a459338)
