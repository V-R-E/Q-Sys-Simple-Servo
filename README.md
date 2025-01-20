# Simple-Servo
Simple-Servo by Victor R. Ellis

This is a Q-Sys plugin to easily control PWM hobby servo motors through native Q-Sys PWM GPIO pins.

## Overview
The Simple Servo plugin is designed to make contol of PWM hobby servo motors super simple. By utilizing the built in PWM capible GPIO pins on Q-Sys peripherials such as network amplifiers, you can easily connect PWM hobby servos without the need of extra hardware or special 3rd party servo controllers. Simply connect the PWM Frequency and PWM Duty Cycle pin(s) of the plugin to the corresponding pins of the network amplifier GPIO component and you're done. The plugin can suport up to 5 servo motors, each with their own custom calibration settings and default power on positions found on the servo setup page.

## Properties
- Number of Servos
  - *Selects the number of servos the plugin will control up to 5 servos*

## Control Pin Definitions
- 0°…180° Hot Key (Trigger Button to quickly set the servo postion)
  - ***Read Only*** [Trigger]
- Disable (Disables the plugin)
  - ***Read Only*** [1,0]
- PWM Duty Cycle (Output to control the servo PWM pin duty cycle)
  - ***Write Only*** [0-15]
- PWM Frequency (Output to set the GPIO PWM frequency)
  - ***Write Only*** [50]
- Servo Angle (Slider for setting the servo angle)
  - ***Read Only*** [0-180]

## HARDWARE

- PWM Servo Motor

- 5v Power Supply
 
## SETUP
![SimpleServo](https://github.com/user-attachments/assets/2feef951-e731-4a7c-9d53-33b0015d6060)



Connect the Servo GND pin to the power supply GND and Q-Sys GPIO GND pin

Connect the Servo 5v pin to the power supply 5v output

Connect the Servo Signal pin to the Q-Sys PWM GPIO pin

![Servo WiringV2](https://github.com/user-attachments/assets/8d04f42e-875f-450d-8e06-a66e9effd5c4)

While the above wiring will typically work for short distances between the servo and Q-Sys equipment it is heavily recomended to use a [signal booster](https://www.servocity.com/signal-boosting-servo-extension-3-pos-tjc8-mh-fc-to-fh-mc-300mm-length/?showHidden=true) if running long distances or stability issues may occur.

![3116-1718-0300__72365__04156](https://github.com/user-attachments/assets/00386235-ff52-47d1-9a02-aacc061a330e)

Alternatively you can use products like the [4 Channel Servo Extension via CAT6](https://www.servocity.com/4-channel-servo-extension-via-cat6/) to connect multiple servos at long distances with a standard ethernet cable.

![3802-2745-4527-REV1-Ang5__52365__94767](https://github.com/user-attachments/assets/52cd8f4f-afdf-4cbb-a7e1-38b168daedc5)
