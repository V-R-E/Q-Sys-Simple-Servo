local CurrentPage = PageNames[props["page_index"].Value]
if CurrentPage == "Servo Control" then
  table.insert(graphics,{
    Type = "GroupBox",
    Text = "Environment Data",
    Fill = {0,0,255,10},
    StrokeWidth = 1,
    Radius = 8,
    Position = {5,5},
    Size = {450,104},
    HTextAlign = "Left"
  })
  -- Button to display SVG image
  layout["svgImage"] = {
    PrettyName = "Servo Horn SVG",
    Style = "Button",
    Position = {30,30},
    Size = {150,150},
    Color = {0,0,0}
  }
  -- Knob to adjust the servo
  layout["svgx"] = {
    PrettyName = "Servo Angle",
    Style = "Fader",
    Position = {550,10},
    Size = {50,500},
    Color = {0,0,0}
  }


-------------------------Servo Calibration--------------------------------------

elseif CurrentPage == "Servo Calibration" then
  if props["Number of Servos"].Value == 1 then
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {0,0,255,10},
      StrokeWidth = 1,
      Radius = 8,
      Position = {5,5},
      Size = {250,400},
      HTextAlign = "Left"
    })
    -- Button to send servo to left limit position
    layout["LeftLimitServo"] = {
      PrettyName = "Left Limit Servo",
      Style = "Button",
      Position = {30,10},
      Size = {50,16},
      Color = {0,0,0}
    }
    -- Button to center servo position
    layout["CenterServo"] = {
      PrettyName = "Center Servo",
      Style = "Button",
      Position = {105,10},
      Size = {50,16},
      Color = {0,0,0}
    }
    -- Button to send servo to right limit position
    layout["RightLimitServo"] = {
      PrettyName = "Right Limit Servo",
      Style = "Button",
      Position = {180,10},
      Size = {50,16},
      Color = {0,0,0}
    }

  else
    for i=0, props["Number of Servos"].Value do
      -- Buttons to send servos to left limit position
      layout["LeftLimitServo "..i] = {
        PrettyName = "Left Limit Servo " .. i,
        Style = "Button",
        Position = {30,42*i},
        Size = {50,16},
        Color = {0,0,0}
      }
      -- Buttons to center servos positions
      layout["CenterServo "..i] = {
        PrettyName = "Center Servo " .. i,
        Style = "Button",
        Position = {105,42*i},
        Size = {50,16},
        Color = {0,0,0}
      }
      -- Buttons to send servos to right limit position
      layout["RightLimitServo "..i] = {
        PrettyName = "Right Limit Servo " .. i,
        Style = "Button",
        Position = {180,42*i},
        Size = {50,16},
        Color = {0,0,0}
      }
    end
  end




-------------------------Setup--------------------------------------

elseif CurrentPage == "Setup" then
  if props["Number of Servos"].Value == 1 then
    -- Knob to adjust left limit value
    layout["SetLeftLimit"] = {
      --PrettyName = "Left Limit Servo",
      Style = "Knob",
      Position = {30,10},
      Size = {50,16},
      Color = {0,0,0}
    }
    -- Knob to adjust right limit value
    layout["SetRightLimit"] = {
      --PrettyName = "Right Limit Servo",
      Style = "Knob",
      Position = {180,10},
      Size = {50,16},
      Color = {0,0,0}
    }

  else
    for i=0, props["Number of Servos"].Value do
      -- Knobs to adjust left limit values
      layout["SetLeftLimit "..i] = {
        --PrettyName = "Left Limit Servo " .. i,
        Style = "Knob",
        Position = {30,42*i},
        Size = {50,16},
        Color = {0,0,0}
      }
      -- Knobs to adjust right limit values
      layout["SetRightLimit "..i] = {
        --PrettyName = "Right Limit Servo " .. i,
        Style = "Knob",
        Position = {180,42*i},
        Size = {50,16},
        Color = {0,0,0}
      }
    end
  end

  table.insert(graphics,{
    Type = "GroupBox",
    Text = "Control",
    Fill = {200,200,200},
    StrokeWidth = 1,
    Position = {5,5},
    Size = {200,100}
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Say Hello:",
    Position = {10,42},
    Size = {90,16},
    FontSize = 14,
    HTextAlign = "Right"
  })
  layout["SendButton"] = {
    PrettyName = "Buttons~Send The Command",
    Style = "Button",
    Position = {105,42},
    Size = {50,16},
    Color = {0,0,0}
  }
  -------------------------Hidden Controls--------------------------------------
  -- Knob to set PWM Frequency
  layout["PWMfrequency"] = {
    PrettyName = "PWM Frequency",
    Position = {0,0},
    Size = {0,0}
  }
  -- Knob to set PWM Duty Cycle
  layout["PWMduty"] = {
    PrettyName = "PWM Duty Cycle",
    Position = {0,0},
    Size = {0,0}
  }
end
