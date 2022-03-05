# IMPLEMENTATION-OF-HIGH-SPEED-3-BIT-FLASH-TYPE-ADC


- [IMPLEMENTATION-OF-HIGH-SPEED-3-BIT-FLASH-TYPE-ADC](#implementation-of-high-speed-3-bit-flash-type-adc)
- [Abstract](#abstract)
- [Reference Circuit Diagram](#reference-circuit-diagram)
- [Circuit Details](#circuit-details)
- [Resolution of ADC](#resolution-of-adc)
- [Proposed Methodology](#proposed-methodology)
- [EDA Tools Used](#eda-tools-used)
- [Verilog Code](#verilog-code)
- [Makerchip](#makerchip)
- [Creating model of 8:3 Encoder using NgVeri](#creating-model-of-8-3-encoder-using-ngveri)
- [Schematics](#schematics)
- [Netlist](#netlist)
- [Output Waveforms](#output-waveforms)
- [GAW Waveforms](#gaw-waveforms)
- [Author](#author)
- [Acknowledgements](#acknowledgements)
- [References](#references)




# Abstract 
ADC is an integral component of any electronic circuit which converts continuous time continuous amplitude analog signal into continuous time discrete amplitude digital signal. Among all the types of ADCs, flash type or direct conversion ADC is considered as the high speed ADC. This paper describes the circuit implementation & simulation of flash type ADC.

# Reference Circuit Diagram

![image](https://user-images.githubusercontent.com/100372947/156890297-02c81678-0636-4731-8bfc-5aebdf5fd4d8.png)

# Circuit Details

A flash ADC uses linear voltage ladder with comparators at every stage which compares the input voltage with successive reference voltages which gives output in terms of 0 or 1 i.e. in digital form. Comparing with other types of ADC, flash ADC requires only single clock cycle for conversion, hence it is called as high speed ADC among all. At every resistor ladder tap, the voltages are created as 7Vref/8, 6Vref/8 upto 1Vref/8 respectively from top to bottom, connected to inverting terminal of opamp at every stage. These voltages are compared with input analog voltage and output of the opamp will be either Vsat or 0 which is represented as digital 1 & 0 respectively. These signals are provided to a 8:3 priority encoder which converts the digital data in binary format. 

# Resolution of ADC

Resolution is one of the important design constraint of any ADC. It basically indicates the smallest incremental change in input to which output can respond. In the proposed design, we are keeping Vref as 5V, hence resolution of proposed ADC design is calculated by the formula :

                             𝑅𝑒𝑠𝑜𝑙𝑢𝑡𝑖𝑜𝑛 = (𝑅𝑒𝑓𝑒𝑟𝑒𝑛𝑐𝑒 𝑉𝑜𝑙𝑡𝑎𝑔𝑒)/2^n = 5/2^3 = 5/8 = 0.625V
            
Where, n is the number of output binary bits.

# Proposed Methodology 

•	Step 1 : 		Writing Verilog code for 8:3 Priority Encoder & simulating on Makerchip

•	Step 2 : 		Model creation on NgVeri

•	Step 3 :		Schematics creation

•	Step 4 :		Creating Netlist

•	Step 5 :		Setting simulation instance parameters on KicadToNgspice converter

•	Step 6: 		Simulation & Verification of results

# EDA Tools Used

**eSim**

It is an Open Source EDA developed by FOSSEE, IIT Bombay. It is used for electronic circuit simulation. It is made by the combination of two software namely NgSpice and KiCAD. For more details refer:

https://esim.fossee.in/home

**NgSpice**

It is an Open Source Software for Spice Simulations. For more details refer:

http://ngspice.sourceforge.net/docs.html

**Makerchip**

It is an Online Web Browser IDE for Verilog/System-verilog/TL-Verilog Simulation. For more details refer:

https://www.makerchip.com/

**Verilator**

It is a tool which converts Verilog code to C++ objects. For more details refer:

https://www.veripool.org/verilator/


# Verilog Code


          `timescale 1ns / 1ps
          //////////////////////////////////////////////////////////////////////////////////
          // Mixed Signal Design Hacakthon
          //
          // (Organized by FOSSEE IIT Bombay, VSD Corp. Pvt. Ltd., Redwood EDA)
          // 
          // Design Name: 		8:3 Encoder
          // Designer :	 	Akash Arun Ambekar
          // Module Name:    	encoder8_3 
          //
          //////////////////////////////////////////////////////////////////////////////////
          
          module new_encoder8_3(in,out);
            input [7:0] in;
            output reg [2:0] out;

            always @(*)
              begin
                case(in)
                  8'b00000000 : out = 3'b000;
                  8'b00000010 : out = 3'b001;
                  8'b00000110 : out = 3'b010;
                  8'b00001110 : out = 3'b011;
                  8'b00011110 : out = 3'b100;
                  8'b00111110 : out = 3'b101;
                  8'b01111110 : out = 3'b110;
                  8'b11111110 : out = 3'b111;
                  default  : out = 3'b000; 
                endcase
              end
          endmodule


# Makerchip 

        \TLV_version 1d: tl-x.org
        \SV
        /* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/   /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/ /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  

        //Your Verilog/System Verilog Code Starts Here:
        `timescale 1ns / 1ps
        //////////////////////////////////////////////////////////////////////////////////
        // Mixed Signal Design Hacakthon
        //
        // (Organized by FOSSEE IIT Bombay, VSD Corp. Pvt. Ltd.)
        // 
        // Design Name: 		8:3 Encoder
        // Designer :	 		Akash Arun Ambekar
        // Module Name:    	encoder8_3 
        //
        //////////////////////////////////////////////////////////////////////////////////
        module new_encoder8_3(in,out);
          input [7:0] in;
          output reg [2:0] out;

          always @(*)
            begin
              case(in)
                8'b00000000 : out = 3'b000;
                8'b00000010 : out = 3'b001;
                8'b00000110 : out = 3'b010;
                8'b00001110 : out = 3'b011;
                8'b00011110 : out = 3'b100;
                8'b00111110 : out = 3'b101;
                8'b01111110 : out = 3'b110;
                8'b11111110 : out = 3'b111;
                default  : out = 3'b000; 
              endcase
            end
        endmodule


        //Top Module Code Starts here:
          module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
            logic  [7:0] in;//input
            logic  [2:0] out;//output
        //The $random() can be replaced if user wants to assign values
            assign in = 8'b01111110;
            new_encoder8_3 new_encoder8_3(.in(in), .out(out));

        \TLV
        //Add \TLV here if desired                                     
        \SV
        endmodule


Following are the several waveforms for different inputs given to 8:3 encoder & their respective outputs :

![Screenshot (316)](https://user-images.githubusercontent.com/100372947/156891451-8f9dd427-ba19-45d4-acf4-d9920f96ccca.png)

![Screenshot (317)](https://user-images.githubusercontent.com/100372947/156891484-9f8bcad8-b8b5-4aa9-abaf-57394e8d21e9.png)

![Screenshot (318)](https://user-images.githubusercontent.com/100372947/156891517-f22c2be6-a25d-4d1b-8c7c-00a8928b8d48.png)


# Creating model of 8:3 Encoder

![Screenshot (320)](https://user-images.githubusercontent.com/100372947/156892061-bfd0547d-f802-4581-921a-aaa9b1adc482.png)

For insert the digital logic of encoder, we have to create the model of verilog code of 8:3 encoder. This is done by NgVeri.

# Schematics

![Screenshot (314)](https://user-images.githubusercontent.com/100372947/156891689-b32b7929-8eef-4a4c-953d-2a551f1c2a2a.png)

As we can see here, 7 instances of op-amp has been created, every op-amp's non-inverting input is connceted to input voltage so that if input voltage is greater than ladder resp. voltage, that op-amp will set to +VSat. Conversly, every op-amp's inverting input is connected to resp. ladder voltages so that if input voltage is less than ladder resp. voltage, that op-amp will set to -VSat.

![Screenshot (319)](https://user-images.githubusercontent.com/100372947/156891859-7b82f8e2-6925-48c0-b069-f9b597388c75.png)

At next stage, the ADC bridge will convert resp. analog voltages to digital form i.e. 0s & 1s. Further, the model of 8:3 encoder that has been created by NgVeri has instanced which will convert the outputs of resp. op-amp into binary form.


# Netlist

https://github.com/googleboy-sky/IMPLEMENTATION-OF-HIGH-SPEED-3-BIT-FLASH-TYPE-ADC/blob/main/eSimProjectFiles/akash_hackathon_design.net


# Output Waveforms

For output, testing the exhaustive case directly by taking input as 7V. Here, as input voltage is greater than reference voltage (7V > 5V) hence, output will be digital 111.

![Screenshot (322)](https://user-images.githubusercontent.com/100372947/156892208-557637ff-d6f1-407f-a846-2744eeac0761.png)


# GAW Waveforms

![Screenshot (323)](https://user-images.githubusercontent.com/100372947/156892249-a6976042-6c2d-404c-8d74-5b729d32aa19.png)


# Author

Akash Ambekar

Final Year B.Tech. (KIT's CoEK)

KIT's College of Engineering, Kolhapur

Mail : akashambekar6955@gmail.com

# Acknowledgements

1.	Kunal Ghosh (Co-Founder, VLSI System Design Pvt. Ltd.)

2.	FOSSEE, IIT Bombay	

3.	Steve Hoover (Founder, Redwood EDA)
	
4.	Sumanto Kar (eSim Team, FOSSEE, IIT Bombay)

# References

1.	 "Design and Analysis of a Comparator for Flash ADC" by Senthil Sivakumar M, Sowmya Priya M

2.	E. Säll and M. Vesterbacka, “A multiplexer based decoder for flash analog-to-digital converters,” Proc. TENCON 2004, Nov. 21-24, 2004. 

3.	R. JACOB BAKER, ‘CMOS Mixed Signal Circuit Design’
