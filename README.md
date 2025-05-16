# RTL_CHALLENGE :-

# .SV Files :- These represents the testbench files.

# CLOCK Genration Method :
1) PLL (PHASED LOCKED LOOP ).
2) MMCM (Mixed-Mode Clock Manager).
3) PDM (Pulse Density Modulation).
   
# 1. PLL (Phase-Locked Loop) :
➤ A PLL is a feedback-based control system that generates an output clock signal whose phase is aligned (locked) to the phase of a 
   reference input clock.

➤ Key Features:
   Frequency synthesis (multiply/divide input frequency).
   Jitter reduction.
   Phase alignment.
   Clock deskewing.

➤ Use in FPGAs:
   In Xilinx FPGAs (e.g., in Vivado), PLLs are used to:
      Generate internal clocks at higher or lower frequencies than the input clock.
      Reduce jitter and improve clock signal quality.
      Align clock domains.

# 2 MMCM (Mixed-Mode Clock Manager)
An MMCM is a more advanced version of a PLL available in Xilinx FPGAs. It includes all the features of a PLL plus more powerful clock management features.

➤ Key Features:
Frequency multiplication/division.
Fine-phase shifting (in ps resolution).
Duty cycle correction.
Clock phase alignment.
Spread spectrum support (in some devices).

➤ Use Case:
Use MMCM when you need precise control of phase, multiple clock outputs with different frequencies/phases, or duty-cycle correction.

# 3. PDM (Pulse Density Modulation)
➤  PDM is a modulation technique where the relative density of pulses represents the analog signal's amplitude. It’s commonly used in 
    audio applications, such as digital microphones.

➤ How It Works:
    Uses a stream of single-bit values (0 or 1)
    
    High density of 1s = higher amplitude.
    
    Low density of 1s = lower amplitude.


➤ Use Case:
   PDM is typically not used for clock generation (unlike PLL/MMCM). It is used for encoding analog signals into digital form using a 
   1-bit stream—commonly in voice and audio processing.

# If you're working in Vivado or targeting a specific FPGA use case (e.g., clock generation, synchronization, or audio capture), let me know and I can tailor an example or recommendation.









