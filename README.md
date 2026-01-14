# MIPS Single-Cycle Processor

A 32-bit single-cycle MIPS processor implemented in Verilog HDL. Supports R-type, I-type, and J-type instructions with a modular datapath design.

**Course:** CMPEN 331 - Computer Organization and Design
**Institution:** Penn State
**Term:** Spring 2023
**Team:** Garrett Fincke & Avanish Grampurohit
**Grade:** 100%

---

## Architecture

The processor uses a Harvard architecture with separate instruction and data memories. All instructions execute in a single clock cycle.

```
┌─────────────────────────────────────────────────────────────────┐
│                          DATAPATH                                │
│                                                                  │
│  ┌────┐    ┌────┐    ┌────────┐    ┌─────┐    ┌──────────┐      │
│  │ PC │───>│ IM │───>│ RegFile│───>│ ALU │───>│ Data Mem │      │
│  └────┘    └────┘    └────────┘    └─────┘    └──────────┘      │
│     ^                                              │              │
│     └──────────────────────────────────────────────┘              │
│                    (via PC Mux)                                  │
└─────────────────────────────────────────────────────────────────┘
```

## Supported Instructions

| Type | Instructions |
|------|-------------|
| R-Type | `add`, `sub`, `and`, `or`, `xor`, `sll`, `srl`, `sra`, `jr` |
| I-Type | `addi`, `andi`, `ori`, `xori`, `lui`, `lw`, `sw`, `beq`, `bne` |
| J-Type | `j`, `jal` |

## Module Overview

### Core Components

| Module | Description |
|--------|-------------|
| `main.v` | Top-level module wiring all components together |
| `controlUnit.v` | Decodes opcodes and generates control signals |
| `ALU.v` | Performs arithmetic and logical operations |
| `regfile.v` | 32 general-purpose registers |

### Memory

| Module | Description |
|--------|-------------|
| `instructionMemory.v` | Stores program instructions |
| `dataMemory.v` | Read/write data storage |
| `programCounter.v` | Holds current instruction address |

### Datapath Components

| Module | Description |
|--------|-------------|
| `pcAdder.v` | Increments PC by 4 |
| `targetPCAdder.v` | Calculates branch target address |
| `programCounterMux.v` | Selects next PC (sequential, branch, jump, jr) |
| `bMux.v` | Selects ALU B input (register or immediate) |
| `immeMux.v` | Sign/zero extends 16-bit immediate to 32-bit |
| `dataMemMux.v` | Selects writeback data (ALU result or memory) |
| `rdrtMux.v` | Selects destination register (rd or rt) |
| `jalMUX.v` | Handles JAL return address writeback |

### Shifters

| Module | Description |
|--------|-------------|
| `shift.v` | Shift amount for SLL/SRL/SRA |
| `immeShift.v` | Left-shift immediate for branch offset |
| `addrShift.v` | Left-shift jump address |

## Control Signals

| Signal | Purpose |
|--------|---------|
| `wreg` | Enable register write |
| `wmem` | Enable memory write |
| `m2reg` | Select memory output for writeback |
| `aluimm` | Use immediate as ALU input |
| `regrt` | Select rt as destination register |
| `sext` | Sign-extend immediate |
| `pcsrc` | Next PC source (00=PC+4, 01=branch, 10=jr, 11=jump) |
| `aluc` | ALU operation select |
| `shift` | Use shift amount as ALU A input |
| `jal` | JAL instruction flag |

## Setup

### Requirements

- Xilinx Vivado 2022.2+
- Target: Xilinx Zynq-7000 (xc7z010clg400-1)

### Running the Project

1. Open `FinalProject.xpr` in Vivado
2. Run Synthesis
3. Run Simulation with `testbench.v`

## Project Structure

```
CMPEN331_final_project/
├── FinalProject.xpr              # Vivado project file
├── FinalProject.srcs/
│   ├── sources_1/new/            # Verilog source files
│   │   ├── main.v
│   │   ├── controlUnit.v
│   │   ├── ALU.v
│   │   ├── regfile.v
│   │   ├── instructionMemory.v
│   │   ├── dataMemory.v
│   │   └── ...
│   └── sim_1/new/
│       └── testbench.v           # Simulation testbench
├── FinalProject.runs/            # Synthesis/implementation results
└── FinalProject.sim/             # Simulation outputs
```
