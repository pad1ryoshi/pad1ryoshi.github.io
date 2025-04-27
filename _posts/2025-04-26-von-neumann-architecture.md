---
layout: post
title: "von Neumann Architecture: takenotes"
date: 2025-04-27
categories: blog
author: pad1ryoshi
tags: [architecture]
---

John von Neumann was one of the greatest geniuses to have ever lived on earth and, together with Alan Turing, is considered the father of computing.

## von Neumann Architecture

The von Neumann computer architecture is characterized by the possibility for a digital machine to store its programs in the same memory space as the data, thus being able to manipulate these programs. This design is still used in most computers produced today.

![von Neumann architecture image](/assets/images/blog/architecture/arch-von-neumann-1.png)


## Central Processing Unit (CPU)

The CPU is the computer's brain, responsible for interpreting and executing program instructions stored in unified memory. The CPU contains the ALU, CU and a variety of registers.

**Arithmetic and Logic Unit**: is the part of the CPU where arithmetic (add, subtract etc) and logic (AND, OR, NOT etc) operations are carried out.

**Central Unit**: responsible for managing computer operations/instructions. Coordinates how data moves around the CPU and  decodes the instructions fetched from memory.

**Registers**: high speed storage areas in the CPU. Before the data can be processed, it needs to pass through the registers.

    - Memory Address Register (MAR): holds the memory location of data that needs to be accessed.
    - Memory Data Register (MDR): holds data that is being transferred to or from memory
    - Accumulator (AC): where intermediate arithmetic and logic results are stored
    - Program Counter (PC): contains the address of the next instruction to be executed
    - Current Instruction Register (CIR): contains the current instruction during processing

## Memory Unit

The Memory Unit is used to store both data and instructions that the CPU needs to execute. It is a crucial part of the computer system that allows for the storage and retrieval of information.

**RAM (Random Access Memory)**: volatile memory used for temporary storage of data and program instructions.

**ROM (Read-Only Memory)**: non-volatile memory that stores essential instructions and data required for the computer to boot up.

## Input and Output

Simple, input devices allow users to provide data to the computer while output devices display the results of the computer's processing.

Input -> keyboard |
Output -> monitor

## Buses

Buses are the means by which data is transmitted from one parte of a computer to another, connecting all major internal components to the CPU and memory.

    - Address Bus: carries the address of data (but not the data) between the processor and memory;
    - Data Bus: carries data between the processor, the memory unit and the input/output devices;
    - Control Bus: carries control signals/commands from the CPU in order to control and coordinate all the activities within the computer.

![von Neumann architecture buses](/assets/images/blog/architecture/buses-von-neumann.png)

## Flow :3

Input → UC ↔ Memory ↔ ULA → Ouput

## The Von Neumann bottleneck

The Von Neumann bottleneck refers to a limitation in traditional computing architectures where the speed of data transfer between memory and the CPU becomes bottleneck, hindering perfomance. 

This occurs because Von Neumann architecture, both data and instructions are stored in the same memory and fetched through a shared bus, creating a data transfer bottleneck.

## Resources

[Fabio Akita](https://www.youtube.com/watch?v=G4MvFT8TGII)

[geeksforgeeks](https://www.geeksforgeeks.org/computer-organization-von-neumann-architecture/)

[digikey](https://www.digikey.com.br/pt/maker/blogs/2024/von-neumann-architecture)

[computerscience gcse](https://www.computerscience.gcse.guru/theory/von-neumann-architecture)

[bbc uk](https://www.bbc.co.uk/bitesize/guides/zhppfcw/revision/2)