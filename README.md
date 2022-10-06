# MATLAB-Report-on---Parse-the-NASA-thermodynamic-data-file-and-then-calculate-thermodynamic-properti

Objective: - write a code in Matlab to parse the NASA thermodynamic data file and then calculate thermodynamic properties of various gas species. 

Entropy: Entropy, the measure of a system’s thermal energy per unit temperature that is inaccessible for doing useful work. Because work is obtained from ordered molecular motion, the amount of entropy is also a measure of the molecular unordered way, or randomness, of a system. The concept of entropy provides deep insight into the direction of impulsive change for many everyday phenomena.

Enthalpy: Enthalpy, the addition of the internal energy and the product of the pressure and volume of a thermodynamic system. Enthalpy is associate degree energy-like property or state function—it has the scale of energy (and is therefore measured in units of joules or ergs), and its value is shown entirely by the temperature, pressure, and composition of the system and not by its past history.

Specific heat: Specific heat, the ratio of the quantity of heat required to raise the temperature of a body one degree to that is necessary to raise the temperature of the same mass of water one degree. The term is also used in a narrower sense to mean the amount of heat, in calories, required to increase the temperature of 1 gram of a substance by 1 Celsius degree.

Universal gas constant, (symbol R), fundamental physical constant comes in place in the formulation of the general gas law. For an ideal gas (nearly equals to most real gases that are not highly compressed or not near the point of liquefaction), the pressure p times the volume V of the gas divided by its temperature T may be a constant. (R = 8.314)

Molecular weight is a measure of the addition of the atomic weight values of the atoms in a molecule. Molecular weight is employed in chemistry to see the ratio in chemical reactions and equations. Molecular weight is commonly abbreviated by M.W. or MW. Molecular weight is either unitless or expressed in terms of mass units (amu) or Daltons (Da)

\"\"

                Image shows Formulas for entropy, enthalpy & specific heat.

Firstly, we have to read the data from THERMO.dat file by using command fopen(\' \').
After that, we will extract the global and local temperatures of species by using the command fgetl().
Then from the function program, we will extract the molecular weight of each species by calling molecular_weight_calculation.m.
In a function program, we are reading specific species as they are repeating in certain species like [O, H, C, A, R].
In a function code, if data file specimen is having above five species then the if-else loop will read it and calculated the molecular weight for each of them.
Then we are extracting species wise higher & lower temperature coefficients by using str2double command.
Then in the for loop, we are storing equations for entropy, enthalpy & specific heat for both high, mid and low-temperature coefficients. 
By using \'mkdir\' & \'cd:\' command we are creating an individual folder for each species and along there three specific plots of entropy, enthalpy & specific heat Vs. temperature.
Then as per asked we are getting molecular weight in the command window and plots for each species.
