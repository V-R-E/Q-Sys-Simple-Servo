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
![Q-Sys Setup](https://github.com/V-R-E/Q-Sys-Simple-Servo/blob/main/Photos/SimpleServo.png)



Connect the Servo GND pin to the power supply GND and Q-Sys GPIO GND pin

Connect the Servo 5v pin to the power supply 5v output

Connect the Servo Signal pin to the Q-Sys PWM GPIO pin

![Servo Wiring](https://github.com/V-R-E/Q-Sys-Simple-Servo/blob/main/Photos/Wiring.png)

While the above wiring will typically work for short distances between the servo and Q-Sys equipment it is heavily recomended to use a [signal booster](https://www.servocity.com/signal-boosting-servo-extension-3-pos-tjc8-mh-fc-to-fh-mc-300mm-length/?showHidden=true) if running long distances or stability issues may occur.

![Signal Booster](https://github.com/V-R-E/Q-Sys-Simple-Servo/blob/main/Photos/Signal%20Booster.jpg)

Alternatively you can use products like the [4 Channel Servo Extension via CAT6](https://www.servocity.com/4-channel-servo-extension-via-cat6/) to connect multiple servos at long distances with a standard ethernet cable.

![Signal Extension](https://github.com/V-R-E/Q-Sys-Simple-Servo/blob/main/Photos/Signal%20Extender.jpg)
