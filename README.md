# 8-bit-Parameterized-ALU-Verilog
8-bit Parameterized Arithmetic Logic Unit (ALU) designed, verified, and simulated using Verilog HDL with 16 operations, status flags, and a self-checking testbench.
Overview

This project presents the design, verification, and simulation of an 8-bit Parameterized Arithmetic Logic Unit (ALU) using Verilog HDL. The ALU performs 16 arithmetic, logical, shift, and comparison operations selected through a 4-bit opcode. The design also generates Carry, Zero, Negative, and Overflow status flags. A self-checking testbench was developed to verify the functionality of every operation, and the design was successfully simulated using Xilinx Vivado.

Tools and Technologies Used

Language: Verilog HDL (IEEE 1364)

EDA Tool: Xilinx Vivado ML 2025.2

Target Device: Xilinx Artix-7

Architecture

The ALU accepts two 8-bit operands (A and B) and a 4-bit opcode as inputs. Based on the selected opcode, it performs one of sixteen supported operations and produces an 8-bit result. After each operation, the ALU updates the Carry, Zero, Negative, and Overflow flags, which indicate the status of the computation.

Key Features

The project implements a parameterized and scalable ALU supporting 16 operations, including arithmetic, logical, shift, and comparison functions. It features automatic generation of status flags, a synthesizable RTL implementation, a self-checking testbench for automated verification, and successful simulation using Vivado.

Verification

A self-checking Verilog testbench was created to validate all sixteen ALU operations. The testbench automatically compares the expected and actual outputs and reports the result of each test case. Functional verification was completed through RTL simulation and waveform analysis in Xilinx Vivado, confirming the correct operation of the ALU and its status flags.
<img width="1920" height="1004" alt="Screenshot 2026-07-28 002848" src="https://github.com/user-attachments/assets/bbcf61af-489d-48e4-8a82-ba0c2f9ad032" />

RTL Schematic

The RTL schematic generated in Xilinx Vivado provides a graphical representation of the synthesized hardware. It illustrates the interconnection between the input ports, combinational logic, multiplexing logic controlled by the opcode, flag generation circuitry, and output ports. The schematic verifies that the Verilog code is correctly interpreted into digital hardware and helps analyze the overall architecture of the ALU.
<img width="1900" height="1005" alt="Screenshot 2026-07-28 004810" src="https://github.com/user-attachments/assets/bfcb9271-02bb-4c4a-ad58-5bf02b206292" />
Project summary 
<img width="1582" height="670" alt="Screenshot 2026-07-28 012400" src="https://github.com/user-attachments/assets/52e43afe-5ac9-4452-906d-7994fef961ec" />
