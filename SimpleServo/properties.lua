table.insert(props, {
  Name = "Debug Print",
  Type = "enum",
  Choices = {"None", "Tx/Rx", "Tx", "Rx", "Function Calls", "All"},
  Value = "None"
})

table.insert(props, { -- for integer property types
    Name = "Number of Servos",
    Type = "integer",
    Min = 1,        -- Minimum Value
    Max = 10,       -- Maximum Value
    Value = 1,      -- Default Value
})