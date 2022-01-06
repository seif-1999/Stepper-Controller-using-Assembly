# Stepper-Driver-using-Assembly

## Table of contents

- [Quick start](#Quick-start)
- [Code Flow](#Code-Flow)
- [Used Devices](#Used-Devices)
- [Components discription](#Components-discription)
- [Controlling the motor's speed](#Controlling-the-motors-speed)
- [DISPLAY function](#DISPLAY-function)
- [GETSPEED function](#GETSPEED-function)
- [GETDSPLYD function](#GETDSPLYD-function)
- [Circuit Diagram](#Circuit-Diagram)
- [Features](#Features)
- [Team members](#Team-members)

## Quick start

- in order to run the [circuit](https://github.com/Rowan-Naguib/8086_steppermotor_assembly/blob/main/stepper%20motor_project.pdsprj) you have to install at least proteus vertion 7 . 
- Clone the repo: `git clone https://github.com/Rowan-Naguib/8086_steppermotor_assembly.git`


## Project Description:
-Stepper motor is a brushless DC motor that divides the full rotation angle of 360° into a number of equal steps.
-The motor is rotated by applying a certain sequence of control signals. 
-The speed of rotation can be changed by changing the rate at which the control signals are applied.
-Various stepper motors with different step angles and torque ratings are available in the market.
-A microcontroller can be used to apply different control signals to the motor to make it rotate according to the need of the application.

stepper motor with ATmega32 and AVR assembly.
This project shows how to create astepper motor controller and program it using assembly.

## Used hardware components:
- L293D Dual H-bridge IC
- Nema17 Stepper Motor
- Atmega32 microcontroller (AVR Architecture)
- 3.7V Li-ion battery
- 5V boost conveter

## Used software tools:
- Atmel Studio 8.0 (Microchip Studio)
- Altium designer (CAD for PCB design)

## Programing languages used:
- Assembly (AVR instruction set)
- C


## Components discription
### Stepper motor
<img src="images/components/STEPPER%20MOTOR.PNG" align="right" >
<div style="display:inline-block; ">
  <span style="width:74%;float:left; display:inline-block;">
<p>
  - DC motor that move in discrete steps giving the illusion of rotation </br>
  - It devides the complete rotation into number of steps ,Each stepper motor will have fixed step      angle</br>
  - this motor is drived by L293D Motor Driver</br>
  -stepper motor are basically two types :Unipolar & bipolar
  <ul>
    <li><h5>unipolar :- </h5> has 5 or 6 wires ,this happens by tying each 2 coils from one end 
then there are 2 common wires as shown  , unipolar can be used as bipolar 
as we did in the project. </li>
  <li><h5>Bipolar :- </h5> has only 4 wires comming out from two coils ,there is no common wires , it can't be used as unipolar </li>
  </ul>
</p>
  </span>
  
</div>

  <hr>
  
 ## Controlling the motor's speed

In our circuit we can control the speed of the motor by two different ways, the first way was through change (half / full) cycle switch and the second way was through change the potentiometer slider place and we can use the two ways in same time. the two ways have different techniques to change speed which :

- **(half / full) cycle switch :** change the speed of the motor only in two modes the full cycle and the half cycle mode , and it can be achieved by making two arrays of steps and by using one of them with the stepper motor it will step corresponding to the selected array and the array selected according to the (half / full) cycle switch.
 ```
STEPS  DB       00000011B,              ; Full Step Mode Array
                 00000110B, 
                 00001100B, 
                 00001001B   

HSTEPS DB       00000001B,      	; Half Step Mode Array
                 00000011B, 
                 00000010B, 
                 00000110B, 
                 00000100B, 
                 00001100B, 
                 00001000B,
                 00001001B
 ``` 
- **the Potentiometer Slider :** in this way we control the speed by really different technique as we change the value of delay between the steps sent to the motor , there are 11 values we can obtained through the Potentiometer by using ADC converter to convert the analog value of the potentiometer to digital value we can use and obtain delay value from it , the range of the delay value (06FFH - 185CH).

-  By using the both way in same time we can obtain 22  mode for the motor's speed by different values of delay.

</br>


## Team members
- [Seif Ehab](https://github.com/seif-1999)
- [Amina Farouk](https://github.com/aminafarouk1)
- [Rowan Mohamed Naguib](https://github.com/rowannaguib)
- [Ahmed Mohamed Sayed](https://github.com/ahmedtolba06)
- [Seif El-din Ragab](https://github.com/Seifeldin5)

