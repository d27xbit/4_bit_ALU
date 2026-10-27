# 4_bit_ALU

## Overview

This project implements a 4-bit Arithmetic Logic Unit (ALU) using Verilog HDL. This ALU performs addition, subtraction, bitwise logical operation(e.g., AND, OR, XOR, NOT), and shift operations based on a 3-bit select input.

## Features

* 4-bit input operands (A and B)
* 3-bit operation selection input (S)
* 4-bit output (Y)
* Combinational logic design
* Testbench for functional simulation

## Supported Operations

| Select (S) | Operation   | Description |
| :--------: | ----------- | ----------- |
|    `000`   | Addition    | A + B       |
|    `001`   | Subtraction | A - B       |
|    `010`   | Bitwise AND | A & B       |
|    `011`   | Bitwise OR  | A | B       |
|    `100`   | Bitwise XOR | A ^ B       |
|    `101`   | Left Shift  | A << 1      |
|    `110`   | Right Shift | A >> 1      |
|    `111`   | Bitwise NOT | ~A          |

## Project Structure

```text
4-bit-ALU-Verilog/
├── rtl/
│   └── alu.v
├── alu_tb.v
└── README.md
```

## Tool Used
* *Design Synthesis and Simulation:* AMD Xilinx Vivado

## How It Works

The ALU receives two 4-bit operands, A and B, and a 3-bit select signal, S. Depending on S, the ALU performs the corresponding operation and provides the result through the 4-bit output Y.

The design uses an `always @(*)` block and a `case` statement to implement combinational logic. It also use default case for avoiding latch generation, for the default cases output will automatically becomes zero.

## Verification

The testbench (`alu_tb.v`) applies input values and changes the select signal to exercise the ALU operations. Simulation can be performed in Vivado to inspect the output waveform and verify functionality.

## Limitations

* The output is limited to 4 bits, so arithmetic carry-out is not separately exposed.
* Shift operations always shift A by one bit.
* The current testbench uses selected input combinations and is not an exhaustive verification suite.
