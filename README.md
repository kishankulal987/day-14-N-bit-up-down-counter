# N-bit Counter in Verilog

## Overview

In this project, I implemented a parameterized N-bit counter in Verilog using behavioral modeling. My goal was to create a circuit that can either increment or decrement an N-bit counter based on a mode signal, with an asynchronous reset to clear the count. For example, with a 4-bit counter (N=4), if mode=1 and count=0101 (5), it increments to 0110 (6), and if mode=0, it decrements to 0100 (4) on the next clock edge. I designed the counter with clock, reset, and mode inputs, and wrote a testbench to verify its functionality by testing both up and down counting modes. I confirmed the design works as expected through simulation.

Module: N_bit_counter





What I Did: I designed a parameterized N-bit counter that can operate as an up-counter or down-counter.



Parameters:





N: Number of bits for the counter (default: 4).



Inputs:





clk: Clock signal (positive edge-triggered).



reset: Asynchronous reset (active-high) to clear the counter.



mode: Mode signal (1 for up-counting, 0 for down-counting).



Outputs:





count[N-1:0]: N-bit counter output (0 to 2^N - 1).



How It Works:





On the rising edge of clk or reset, if reset=1, I set count=0 (asynchronous reset).



If reset=0:





If mode=1, I increment count by 1 (count <= count + 1).



If mode=0, I decrement count by 1 (count <= count - 1).



For example, if count=0011 (3), reset=0, and mode=1, then count=0100 (4) after the clock edge; if mode=0, then count=0010 (2).



Note: The counter wraps around due to unsigned arithmetic (e.g., from 0 to 15 or 15 to 0 for N=4).



Style: Behavioral modeling with an always @(posedge clk or posedge reset) block.

Testbench: Testbench





What I Did: I created a testbench to verify the 4-bit counter (N=4).



How It Works:





I defined clock, rst, and switch (mode) as inputs, and counter[3:0] as the output.



I generated a clock with a 10ns period (forever #5 clock=~clock).



I applied the following sequence:





switch=1 (up-count mode), rst=1 for 10ns (resets counter to 0).



rst=0, switch=1 for 50ns (up-counts for 5 clock cycles).



switch=0 for 100ns (down-counts for 10 clock cycles).



I used $display triggered by changes in counter to print clk, mode, reset, and counter.



Time Scale: I set 1ns / 1ps for precise simulation timing.



Purpose: The testbench verifies the counter resets, counts up, and counts down based on the mode signal.

Files





N_bit_counter.v: Verilog module for the N-bit counter.



Testbench.v: Testbench for simulation (configured for N=4).


### Simulation Waveform

Below is the simulation waveform, showing inputs clk, reset, mode, and output count[3:0] over time.


![Screenshot 2025-06-13 180617](https://github.com/user-attachments/assets/071a795f-8850-42a1-a0f0-7b6530f32f81)


### Console Output

Below is the console output from my testbench simulation.

![Screenshot 2025-06-13 180821](https://github.com/user-attachments/assets/13400103-49c4-41de-b58a-db0d1b9ce413)






clk=0 mode=1 reset=1 count=0000



clk=0 mode=1 reset=0 count=0000



clk=1 mode=1 reset=0 count=0001



clk=0 mode=1 reset=0 count=0010



clk=1 mode=1 reset=0 count=0011



clk=0 mode=1 reset=0 count=0100



clk=1 mode=1 reset=0 count=0101



clk=0 mode=0 reset=0 count=0100



clk=1 mode=0 reset=0 count=0011



clk=0 mode=0 reset=0 count=0010



clk=1 mode=0 reset=0 count=0001



clk=0 mode=0 reset=0 count=0000



clk=1 mode=0 reset=0 count=1111



... (continues decrementing for 10 clock cycles)
