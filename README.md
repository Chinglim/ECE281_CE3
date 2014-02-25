ECE281_CE3
==========

State Machine---Advanced Elevator Controller

Readme for Moore and Mealy Elevator Controller


Moore Elevator Controller

As seen from the Moore Simulation picture, the simutaltion of the Moore Elevator Control is correct.as the designation of the floor matches to the input value into the test bench. Taking an example for the test bench code of 3rd storey, when either of the 2 sets of inputs (up_down=1 , stop=0 and up_down=1, stop =1), the Moore simulation,'floor'variable shows 0011 which means the 3rd storey. 

Even for the part of going back dwon from 4th storey to 1st storey, the simulation also shows the anticipated decrease in level with each clk period.

Therefore, in conclusion, the simulation is correct for the Moore Elevator Control.


Mealy Elevator Controller
The Mealy simulation is kindly of similar to the Moore Simulation. 
