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

## Elaborated Design
<img width="1564" height="665" alt="Screenshot 2026-10-28 004645" src="https://github.com/user-attachments/assets/b29ca000-b7b2-4413-b503-f9472ada57c1" />

## Waveform and it's explaination
<img width="1564" height="665" alt="Screenshot 2026-10-28 004645" src="https://github.com/user-attachments/assets/7f94886e-c69f-44f7-86d1-6ea6c3fa4d64" />

(I have directly use test bench lines where for the better understanding of the waveforms)

* A = 4'h3; B = 4'hA; S = 3'b000; this means at zero second, simulation initialized with the value of A = 0011(in binary), B= 1010(in binary) and S = 000(that means addition operation), so the expected output will be Y = 1010 + 0011 = 1101 = D(13).
  #5 means delay of 5ns, so the first output is visible for the first 5ns. After that 2nd line executes.   
* #5 S= 3'd1; Here S = 001, that means subtraction operation, Y = 1010 - 0011 = 0111 = 7
* #5 S = 3'b010; Here S = 010, that means AND operation, Y = 1010 AND 0011 = 0010 = 2 (here the bitwise logical operations are performed)
* #5 S = 3'b011; Here S = 011 (OR operation), Y = 1010 OR 0011 = 1011 = B(11)
* #5 S = 3'b100; Here S = 100 (XOR operation), Y = 1010 XOR 0011 = 1001 = 9
* #5 A = 4'h9; S = 3'b101; Here A is updated and become 9(1001) and also (left shifting of A by 1 operation has been performed) Y = 1001 << 1 = 0010 = 2
* #5 B = 4'h7; S = 3'b101; Here B is updated to 7(0111) as it is left shift operation of A, so the output will remain unchanged.
* #5 S= 3'b110; Here S = 110(right shifting of A by 1 bit) Y = 1001 >> 1 = 0100 = 4
* #5 S = 3'b111; Here S = 111(not of A) Y = ~(1001) = 0110 = 6
* #5 S=3'b000; S = 3'b1x1; At S = 000, the value of S was momentarily stable. However, the next assignment changed S to 1x1. Therefore, the final value of S was 1x1, which did not match any specific case and resulted in the default condition being executed. Hence, the output Y was 0.

* #10 $finish; it means after 10ns simulation is finished.

## Limitations

* The output is limited to 4 bits, so arithmetic carry-out is not separately exposed.
* Shift operations always shift A by one bit.
* The current testbench uses selected input combinations and is not an exhaustive verification suite.
