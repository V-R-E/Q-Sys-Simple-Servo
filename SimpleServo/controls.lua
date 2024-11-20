-------------------------Servo Control--------------------------------------
-- Button to display SVG image
table.insert(ctrls, {
  Name = "svgImage",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = props["Number of Servos"].Value,
  UserPin = false,
  PinStyle = "None"
})
-- Button to enable the sweep function
table.insert(ctrls, {
  Name = "Sweep",
  ControlType = "Button",
  ButtonType = "Toggle",
  Count = props["Number of Servos"].Value,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Refresh"
})
-- Knob for setting left sweep angle
table.insert(ctrls, {
  Name = "left",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Min = 0,
  Max = 180,
  Count = props["Number of Servos"].Value,
  UserPin = false,
  PinStyle = "None"
})
-- Knob for setting right sweep angle
table.insert(ctrls, {
  Name = "right",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Min = 0,
  Max = 180,
  Count = props["Number of Servos"].Value,
  UserPin = false,
  PinStyle = "None"
})
-- Knob for setting the sweep period
table.insert(ctrls, {
  Name = "Period",
  ControlType = "Knob",
  ControlUnit = "Float",
  Min = 0,
  Max = 60,
  Count = props["Number of Servos"].Value,
  UserPin = false,
  PinStyle = "None"
})
-- Button Hot key for 0*
table.insert(ctrls, {
  Name = "Zero",
  ControlType = "Button",
  ButtonType = "Trigger",
  Count = props["Number of Servos"].Value,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Left"
})
-- Button Hot key for 45*
table.insert(ctrls, {
  Name = "FortyFive",
  ControlType = "Button",
  ButtonType = "Trigger",
  Count = props["Number of Servos"].Value,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Left-Up"
})
-- Button Hot key for 90*
table.insert(ctrls, {
  Name = "Ninty",
  ControlType = "Button",
  ButtonType = "Trigger",
  Count = props["Number of Servos"].Value,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Up"
})
-- Button Hot key for 135*
table.insert(ctrls, {
  Name = "OneThirtyFive",
  ControlType = "Button",
  ButtonType = "Trigger",
  Count = props["Number of Servos"].Value,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Right-Up"
})
-- Button Hot key for 180*
table.insert(ctrls, {
  Name = "OneEighty",
  ControlType = "Button",
  ButtonType = "Trigger",
  Count = props["Number of Servos"].Value,
  UserPin = true,
  PinStyle = "Input",
  Icon = "Arrow Right"
})
-- Knob to adjust servo angle
table.insert(ctrls, {
  Name = "svgx",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Min = 0,
  Max = 180,
  Count = props["Number of Servos"].Value,
  UserPin = true,
  PinStyle = "Both"
})


-------------------------Servo Setup--------------------------------------
-- Knob for fine adjusting 0* point
table.insert(ctrls, {
  Name = "ZeroCal",
  ControlType = "Knob",
  ControlUnit = "Float",
  Min = 0,
  Max = 7.5,
  Count = props["Number of Servos"].Value,
  UserPin = false,
  PinStyle = "None"
})
-- Knob for fine adjusting 180* point
table.insert(ctrls, {
  Name = "OneEightyCal",
  ControlType = "Knob",
  ControlUnit = "Float",
  Min = 7.5,
  Max = 15,
  Count = props["Number of Servos"].Value,
  UserPin = false,
  PinStyle = "None"
})
-- Knob to set default servo angle on power up
table.insert(ctrls, {
  Name = "Default Position",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Min = 0,
  Max = 180,
  Count = props["Number of Servos"].Value,
  UserPin = false,
  PinStyle = "None"
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
  Name = "PWM Frequency",
  ControlType = "Knob",
  ControlUnit = "Float",
  Min = 5,
  Max = 1000,
  Count = 1,
  PinStyle = "Output",
  UserPin = true
})
-- PWM Duty
table.insert(ctrls, {
  Name = "PWM Duty",
  ControlType = "Knob",
  ControlUnit = "Float",
  Min = 0,
  Max = 100,
  Count = props["Number of Servos"].Value,
  PinStyle = "Output",
  UserPin = false
})