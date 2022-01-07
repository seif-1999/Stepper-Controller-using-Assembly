
# Stepper-Driver-using-Assembly


## Table of contents

- [Quick start](#Quick-start)
- [Project Description](#Project-Description)
- [Used hardware components](#Used-hardware-components)
- [Used software tools](#Used-software-tools)
- [Programing languages used](#Programing-languages-used)
- [Components discription](#Components-discription)
- [Team members](#Team-members)

## Quick start

- in order to run the [circuit](https://github.com/seif-1999/Stepper-Controller-using-Assembly) you have to install at least proteus version 7. 
- Clone the repo: `git clone https://github.com/seif-1999/Stepper-Controller-using-Assembly.git`


## Project Description:
- Stepper motor is a brushless DC motor that divides the full rotation angle of 360° into a number of equal steps.
- The motor is rotated by applying a certain sequence of control signals. 
- The speed of rotation can be changed by changing the rate at which the control signals are applied.
- The rotation angle can be controlled by a potentiometer.
- Various stepper motors with different step angles and torque ratings are available in the market.
- A microcontroller can be used to apply different control signals to the motor to make it rotate according to the needed  application.
- This project shows how to create a stepper motor controller using AVR microcontroller and program it using assembly.






## Used hardware components:
- Bipolar / Unipolar Stepper Motor (200 steps, 1.8 degree/step)
- Atmega32 microcontroller (AVR Architecture)
- Potentiometer
- ULN2003A (driver)
- 5V boost converter
- 3.7V Li-ion battery
- 2-pin DIP switch
- 8 MHz crystal oscillator
- Miscellaneous connectors
## Used software tools:
- Atmel Studio 7.0 (Microchip Studio)
- Altium designer (CAD for PCB design)
- Proteus 7.7

## Programing languages used:
- Assembly (AVR instruction set)


## Components discription
### Stepper motor
<img src="STEPPER MOTOR.png" align="right" >
<div style="display:inline-block; ">
  <span style="width:74%;float:left; display:inline-block;">
<p>
  - DC motor that move in discrete steps giving the illusion of rotation </br>
  - It divides the complete rotation into number of steps ,Each stepper motor will have fixed step angle</br>
  - This motor is drived by ULN2003A (Darlington array)</br>
  - Stepper motors are basically two types :Unipolar & bipolar
  <ul>
    <li><h5>unipolar :- </h5> Has 5 or 6 wires ,this happens by tying each 2 coils from one end 
then there are 2 common wires as shown  , unipolar can be used as bipolar 
as we did in the project. </li>
  <li><h5>Bipolar :- </h5> Has only 4 wires comming out from two coils ,there is no common wires , it can't be used as unipolar </li>
  </ul>
</p>
  </span>
  
</div>

  <hr>
  
 ### Atmega32 microcontroller (AVR Architecture)
<img src="atmega32_datasheet (1).jpg" align="right" >
<div style="display:inline-block; ">
  <span style="width:74%;float:left; display:inline-block;">
<p>
  
 - ATmega32 is a powerful microcontroller because of its in system self programmable flash on a monolithic chip.
 - Provides a high flexible and cost effective solution to many embedded control applications.
  
  #### CPU

- 8-bit AVR
- Number of Pins: 40
- Operating Voltage (V): +4.5 to +5.5 V (+5.5V being absolute maximum)
- Number of I/O pins: 32
- Communication Interfaces: 
      * JTAG Interface(24,25,26,27 PINS)[Can be used for programming this controller] 
      * Master/Slave SPI Serial Interface(5,6,7,8 PINS) [Can be used for programming this controller]
      * Programmable Serial USART(14,15 PINS) [Can be used for programming this controller]
      * Two-wire Serial Interface(22,23 PINS)[Can be used to connect peripheral devices like sensors and LCDs]
- ADC Module: 8 channels , 10-bit resolution ADC
- Timer Module: Two 8-bit counters, One 16-bit counter [Total three]
- Analog Comparators: 1
- DAC Module: Nil
- PWM channels: 4
- External Oscillator: 0-8MHz for ATMEGA32L / 0-16MHz for ATMEGA32
- Internal Oscillato: 0-8MHz  Calibrated Internal Oscillator
- Program Memory Type: Flash
- Program Memory (KB): 32Kbytes[10000 write/erase cycles]
- Max CPU Speed (MIPS): 16 MIPS
- RAM Bytes: 2KBytes
- Data EEPROM: 1024 Bytes
- Watchdog Timer: Programmable Watchdog Timer with Separate On-chip  Oscillator
- Power Save Modes: Six Modes[Idle, ADC Noise Reduction, Power-save, Power-down, Standby and Extended Standby]
- Operating Temperature : -55°C to +125°C(+125 being absolute maximum, -55 being absolute m
#### In this project we used
    - ADMUX, ADCSRA registers to control and conifgure ADC.
    - PORTC, DDRC registers to control the stepper motor.
    - PORTB, DDRB, PINB to receive input from DIP switch inorder to control the operation mode.  
  <ul>
</p>

  </span>
  
</div>
### Potentiometer
In this way we control the position of Motor (rotation angle) by changing the position of the potentiometer, a range between 0-5V (0-255) can be obtained through the potentiometer by using ADC converter to convert the analog value (0-5V) of the potentiometer to digital value (0-255) and the result is mapped to position (step 0-200), the target position will be subtracted from motor current position to determine the direction and number of stepps to move, and the reminder of target position divided by 4 will be used to determine the appropriate step sequence.

</br>

### ULN2003A (driver)
<img src="images/ULN2003A.jpg" align="right" >
<div style="display:inline-block; ">
  <span style="width:74%;float:left; display:inline-block;">
<p>

  
  <ul>
    <li>
  
  </li>
</ul>
</p>
  </span>
  
</div>

  <hr>
  ### 5V boost converter
<img src="    " align="right" >
<div style="display:inline-block; ">
  <span style="width:74%;float:left; display:inline-block;">
<p>

  
  <ul>
    <li> 
  
  </li>
  </ul>
</p>
  </span>
  
</div>

  <hr>
  
  ### Li-ion battery

<img src="    " align="right" >
<div style="display:inline-block; ">
  <span style="width:74%;float:left; display:inline-block;">
<p>

  
  <ul>
    <li>
  
  </li>
  </ul>
</p>
  </span>
  
</div>

  <hr>
  
  ### 2-pin DIP switch
<img src="    " align="right" >
<div style="display:inline-block; ">
  <span style="width:74%;float:left; display:inline-block;">
<p>

  
  <ul>
    <li>
  
  </li>
  </ul>
</p>
  </span>
  
</div>

  <hr>
  
  ### 8 MHz crystal oscillator
<img src="    " align="right" >
<div style="display:inline-block; ">
  <span style="width:74%;float:left; display:inline-block;">
<p>

  
  <ul>
    <li>
  
  </li>
  </ul>
</p>
  </span>
  
</div>

  <hr>
  ### Miscellaneous connectors
<img src="    " align="right" >
<div style="display:inline-block; ">
  <span style="width:74%;float:left; display:inline-block;">
<p>

  
  <ul>
    <li> 
  
  </li>
  </ul>
</p>
  </span>
  
</div>

  <hr>
  

 ## Controlling the motor's speed

In our circuit we can control the speed of the motor by two different ways, the first way was through change (half / full) cycle switch and the second way was through change the potentiometer slider place and we can use the two ways in same time. the two ways have different techniques to change speed which :

- **(half / full) cycle switch :** change the speed of the motor only in two modes the full cycle and the half cycle mode , and it can be achieved by making two arrays of steps and by using one of them with the stepper motor it will step corresponding to the selected array and the array selected according to the (half / full) cycle switch.
 ```
STEPS  DB        00000011B,              ; Full Step Mode Array
                 00000110B, 
                 00001100B, 
                 00001001B   

HSTEPS DB        00000001B,      	       ; Half Step Mode Array
                 00000011B, 
                 00000010B, 
                 00000110B, 
                 00000100B, 
                 00001100B, 
                 00001000B,
                 00001001B
 ``` 


## Team members
- [Seif El-Din Ehab](https://github.com/seif-1999)
- [Amina Farouk](https://github.com/aminafarouk1)
- [Rowan Mohamed Naguib](https://github.com/rowannaguib)
- [Ahmed Mohamed Sayed Tolba](https://github.com/ahmedtolba06)
- [Seif-Eldin Ragab](https://github.com/Seifeldin5)
 
