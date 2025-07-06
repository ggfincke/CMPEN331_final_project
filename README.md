# CMPEN 331 Class Project Showcase

This repository contains the final project completed for **CMPEN 331: Computer Organization and Design** at Penn State (Spring 2023). This project implements a complete single-cycle MIPS processor in Verilog HDL, demonstrating mastery of computer architecture fundamentals from instruction fetch to writeback stages. 

**Grade Achieved: 100%**

**Project Team:** Garrett Fincke & Avanish Grampurohit

---

## 🏗️ MIPS Processor Implementation
📁 [`FinalProject`](./FinalProject)  
Complete single-cycle MIPS processor supporting a comprehensive subset of MIPS instructions.

**Key Features:**
- Single-cycle implementation with 32-bit architecture
- Harvard architecture with separate instruction and data memories
- 32 general-purpose registers with standard MIPS register file
- Comprehensive instruction set support (arithmetic, logical, memory, branch, jump)
- Modular design with separate Verilog modules for each component

---

## 🔧 Core Components

### 🧠 **Processing Units**
- **`main.v`** - Top-level module connecting all processor components
- **`ALU.v`** - Arithmetic Logic Unit for arithmetic and logical operations
- **`controlUnit.v`** - Control unit generating control signals for instruction execution
- **`regfile.v`** - 32-register general-purpose register file

### 💾 **Memory Systems**
- **`instructionMemory.v`** - Program instruction storage
- **`dataMemory.v`** - Data storage and retrieval
- **`programCounter.v`** - Program counter register

### 🔀 **Supporting Components**
- **`pcAdder.v`** - Program counter incrementer
- **`targetPCAdder.v`** - Branch target calculator
- **`programCounterMux.v`** - Next PC value selector
- **`bMux.v`**, **`immeMux.v`**, **`dataMemMux.v`** - Various multiplexers
- **`addrShift.v`**, **`immeShift.v`**, **`shift.v`** - Address and data shifters

---

## 📋 Supported Instructions

**Arithmetic Instructions:** ADD, SUB, etc.  
**Logical Instructions:** AND, OR, XOR, etc.  
**Memory Instructions:** LW (Load Word), SW (Store Word)  
**Branch Instructions:** BEQ (Branch if Equal), BNE (Branch if Not Equal)  
**Jump Instructions:** J (Jump), JAL (Jump and Link)  
**Immediate Instructions:** ADDI, ANDI, ORI, etc.

---

## 🛠️ Tools & Implementation

**Development Environment:**
- **Xilinx Vivado 2022.2** - FPGA development environment
- **Verilog HDL** - Hardware description language
- **Target Device:** Xilinx Zynq-7000 (xc7z010clg400-1)

**Implementation Highlights:**
- Modular design for clarity and reusability
- Comprehensive control unit handling all instruction types
- Efficient datapath with minimal critical path delay
- Thorough testing of all components and instruction types

---

## 💻 Setup

To open and run the project:
```bash
# Open Vivado 2022.2 or later
# Open the project file
FinalProject.xpr

# Run synthesis
# Run implementation
# Use simulator for testing
```

**Project Structure:**
- **`FinalProject.xpr`** - Vivado project file
- **`FinalProject.srcs/`** - Source files directory
- **`FinalProject.runs/`** - Synthesis and implementation runs
- **`FinalProject.sim/`** - Simulation files

---

## 📚 Course Info
CMPEN 331 — Computer Organization and Design  
**Institution:** Pennsylvania State University  
**Completion Date:** Spring 2023  
**Grade Achieved:** 100%

---

*This project showcases fundamental computer architecture concepts and digital design principles, providing hands-on experience with processor implementation using modern FPGA development tools.* 