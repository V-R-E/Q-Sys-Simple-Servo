-------------------------Servo Control--------------------------------------
-- Buttons to display SVG image
table.insert(ctrls, {
  Name = "svgImage",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 1,
  UserPin = false,
  PinStyle = "None"
})
-- Knob to adjust servo angle
table.insert(ctrls, {
  Name = "svgx",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Min = 0,
  Max = 180,
  Count = 1,
  PinStyle = "Both",
  UserPin = true
})

-------------------------Servo Calibration--------------------------------------

-- Buttons to set left limit of the servos
table.insert(ctrls, {
  Name = "LeftLimitServo",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = props["Number of Servos"].Value,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Left"
})
-- Buttons to center the servos
table.insert(ctrls, {
  Name = "CenterServo",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = props["Number of Servos"].Value,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Up"
})
-- Buttons to set right limit of the servos
table.insert(ctrls, {
  Name = "RightLimitServo",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = props["Number of Servos"].Value,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Right"
})
-- E-Stops State
table.insert(ctrls, {
  Name = "E-Stop State",
  ControlType = "Button",
  ButtonType = "Toggle",
  Count = props["Number of Servos"].Value,
  UserPin = false,
  --PinStyle = "Input",
  --Icon = "Power"
})


-------------------------Setup--------------------------------------

-- Knob to adjust left limit value
table.insert(ctrls, {
  Name = "SetLeftLimit",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Min = 0,
  Max = 100,
  Count = props["Number of Servos"].Value,
  PinStyle = "None",
  UserPin = false
})
-- Knob to adjust right limit value
table.insert(ctrls, {
  Name = "SetRightLimit",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Min = 0,
  Max = 100,
  Count = props["Number of Servos"].Value,
  PinStyle = "None",
  UserPin = false
})


-------------------------Hidden Controls--------------------------------------
-- PWM Frequency
table.insert(ctrls, {
  Name = "PWMfrequency",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Min = 5,
  Max = 1000,
  Count = 1,
  PinStyle = "Output",
  UserPin = false
})
-- PWM Duty
table.insert(ctrls, {
  Name = "PWMduty",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Min = 0,
  Max = 100,
  Count = 1,
  PinStyle = "Output",
  UserPin = false
})