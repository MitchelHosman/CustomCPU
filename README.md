# Custom 16-bit CPU

A modular 16-bit CPU designed and implemented in Verilog. The processor was developed from individual RTL modules and integrated into a complete datapath and control system. Each major module was verified through simulation and waveform analysis.

## Features

* 16-bit datapath
* Arithmetic Logic Unit (ALU)
* Register file
* Instruction decoder
* Control logic
* Modular RTL design
* Verilog testbenches
* Simulation and waveform analysis

## Architecture

The CPU is organized into several modular components:

* **ALU** - Performs arithmetic and logical operations
* **Register File** - Stores and provides access to processor registers
* **Instruction Decoder** - Interprets instructions and generates control signals
* **Control Logic** - Coordinates the operation of the processor
* **Datapath** - Connects the processor components and manages data flow

## Verification

Individual CPU modules were verified using Verilog testbenches and simulated using Icarus Verilog. GTKWave was used to inspect simulation waveforms, identify functional issues, and verify expected processor behavior.

<img width="900" height="500" alt="image" src="https://github.com/user-attachments/assets/d49a78e8-ed63-4b64-bec8-808276fce698" />

*CPU simulation waveform showing instruction execution, program counter progression, control signals, and ALU results.*

## Tools

* Verilog
* Icarus Verilog
* GTKWave
* Gowin EDA
* Git

## Project Goals

This project was developed to gain practical experience with:

* RTL design
* Digital logic and computer architecture
* Modular hardware design
* Hardware verification and debugging
* Simulation and waveform analysis
