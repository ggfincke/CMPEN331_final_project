# CMPEN 331 Final Project: MIPS Processor Implementation

## Overview
This project implements a single-cycle MIPS processor in Verilog HDL as the final project for **CMPEN 331: Computer Organization and Design**. The processor supports a subset of MIPS instructions and demonstrates fundamental concepts of computer architecture including instruction fetch, decode, execute, memory access, and writeback stages.

## Project Team
- **Garrett Fincke**
- **Avanish Grampurohit**

## Grade: 100% ✅

## Project Structure

### Core Components
- **`main.v`** - Top-level module that connects all processor components
- **`ALU.v`** - Arithmetic Logic Unit performing arithmetic and logical operations
- **`controlUnit.v`** - Control unit that generates control signals for instruction execution
- **`regfile.v`** - Register file containing 32 general-purpose registers
- **`instructionMemory.v`** - Memory module storing program instructions
- **`dataMemory.v`** - Memory module for data storage and retrieval
- **`programCounter.v`** - Program counter register

### Supporting Components
- **`pcAdder.v`** - Adder for incrementing program counter
- **`targetPCAdder.v`** - Adder for branch target calculation
- **`programCounterMux.v`** - Multiplexer for selecting next PC value
- **`bMux.v`** - B-input multiplexer for ALU
- **`immeMux.v`** - Immediate value multiplexer
- **`dataMemMux.v`** - Data memory output multiplexer
- **`rdrtMux.v`** - Register destination multiplexer
- **`jalMUX.v`** - Jump and link multiplexer
- **`addrShift.v`** - Address shifter for jump instructions
- **`immeShift.v`** - Immediate value shifter
- **`shift.v`** - General-purpose shifter

## Features

### Supported Instructions
The processor implements a subset of MIPS instructions including:
- **Arithmetic Instructions**: ADD, SUB, etc.
- **Logical Instructions**: AND, OR, XOR, etc.
- **Memory Instructions**: LW (Load Word), SW (Store Word)
- **Branch Instructions**: BEQ (Branch if Equal), BNE (Branch if Not Equal)
- **Jump Instructions**: J (Jump), JAL (Jump and Link)
- **Immediate Instructions**: ADDI, ANDI, ORI, etc.

### Architecture Details
- **Single-cycle implementation**: Each instruction completes in one clock cycle
- **32-bit architecture**: Supports 32-bit instructions and data
- **Harvard architecture**: Separate instruction and data memories
- **32 general-purpose registers**: Standard MIPS register file

## Tools Used
- **Xilinx Vivado 2022.2** - FPGA development environment
- **Verilog HDL** - Hardware description language
- **Target Device**: Xilinx Zynq-7000 (xc7z010clg400-1)

## Project Files
- **`FinalProject.xpr`** - Vivado project file
- **`FinalProject.srcs/`** - Source files directory
- **`FinalProject.runs/`** - Synthesis and implementation runs
- **`FinalProject.sim/`** - Simulation files
- **`FinalProject.cache/`** - Compiled simulation libraries

## How to Run
1. Open Vivado 2022.2 or later
2. Open the project file `FinalProject.xpr`
3. Run synthesis to check for any errors
4. Run implementation to generate the bitstream
5. Use the simulator to test the processor functionality

## Implementation Highlights
- **Modular Design**: Each component is implemented as a separate Verilog module for clarity and reusability
- **Comprehensive Control Unit**: Handles all instruction types with appropriate control signal generation
- **Efficient Datapath**: Well-structured datapath with minimal critical path delay
- **Thorough Testing**: All components and instruction types thoroughly tested

## Academic Achievement
This project received a perfect score of **100%** and demonstrates a deep understanding of:
- Computer architecture principles
- Digital design methodologies
- Verilog HDL programming
- FPGA implementation techniques
- MIPS instruction set architecture

## Course Information
- **Course**: CMPEN 331 - Computer Organization and Design
- **Institution**: Pennsylvania State University
- **Completion Date**: Spring 2023

---

*This project showcases the fundamental concepts of computer architecture and digital design, providing hands-on experience with processor implementation using modern FPGA tools.* 