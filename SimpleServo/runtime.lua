x=0
y=0


json = require("rapidjson")
require("LuaXML")
--[[
gsSVGHeader = <svg width=\"%s\" height=\"%s\" viewbox=\"%s\" xmlns=\"%s\" version=\"%s\">
gsSVGFooter = </svg>
gsSVGCircle = "<circle cx=\"%s\" cy=\"%s\" r=\"%s\" fill=\"%s\" stroke=\"%s\" stroke-width=\"%s\" />"
gsSVGRect = "<rect x=\"%s\" y=\"%s\" width=\"%s\" height=\"%s\" fill=\"%s\" stroke=\"%s\" stroke-width=\"%s\" />"
gsSVGEllipse = "<ellipse transform=\"translate(%s) rotate(%s)\" rx=\"%s\" ry=\"%s\" fill=\"%s\" stroke=\"%s\" stroke-width=\"%s\" />"
gsSVGLine = "<line x1=\"%s\" y1=\"%s\" x2=\"%s\" y2=\"%s\" stroke= \"%s\" stroke-width=\"%s\" />
gsSVGPolyline = "<polyline fill=\"%s\ stroke=\"%s\ stroke-width=\"%s\ points=\"%s\ />
gsSVGPolygon = "<polygon fill=\"%s\ stroke=\"%s\ stroke-width=\"%s\ points=\"%s\ />
gsSVGText = "<text x=\"%s\" y=\"%s\" font-family=\"%s\" font-size=\"%s\" fill=\"%s\" > %s </text>"]]--
 
gsSVGFooter = "</svg>"

--Function to re-map a number from one range to another
function map(value, fromLow, fromHigh, toLow, toHigh)
  value = value * ((toHigh - toLow) / (fromHigh - fromLow)) + toLow
  return value
end


--Calc Angle on Radius
function CalcAngleForSVG(lsAngle,lsRadius)
lsAngle = math.rad(lsAngle)
local x1 = math.cos(lsAngle)*lsRadius + 200
local y1 = math.sin(lsAngle)*lsRadius + 200
--print(math.floor(x1),math.floor(y1))
return math.floor(x1),math.floor(y1)
end
 
--Generate SVG Header
function GenSVGHeader(lsWid, lsHght, lsViewBox) 
  return(string.format("<svg width=\"%s\" height=\"%s\" viewbox=\"%s\" xmlns=\"%s\" version=\"%s\">",lsWid, lsHght, lsViewBox,"http://www.w3.org/2000/svg","1.1"))
end
 
--Generate SVG Circle
function GenCircleSVG(lsXVal, lsYVal, lsRadius, lsFillColor, lsStrokeColor,lsStrokeWidth)
  return(string.format("<circle cx=\"%s\" cy=\"%s\" r=\"%s\" fill=\"%s\" stroke=\"%s\" stroke-width=\"%s\" />",lsXVal, lsYVal, lsRadius, lsFillColor, lsStrokeColor,lsStrokeWidth))
end
 
 
--Generate SVG Line
function GenLineSVG(lsXStart,lsYStart,lsXEnd,lsYEnd,lsStrokeColor,lsStrokeWidth)
  return(string.format("<line x1=\"%s\" y1=\"%s\" x2=\"%s\" y2=\"%s\" stroke=\"%s\" stroke-width=\"%s\" />",lsXStart,lsYStart,lsXEnd,lsYEnd,lsStrokeColor,lsStrokeWidth))
end
 
 
--Generate SVG Text
function GenTextSVG(lsXVal,lsYVal,lsFontSize,lsColor,lsText)
return(string.format("<text x=\"%s\" y=\"%s\" font-family=\"%s\" font-size=\"%s\" fill=\"%s\" > %s </text>",lsXVal,lsYVal,"Roboto",lsFontSize,lsColor,lsText))
end


function generateSingleSVGFormat()
local x,y = CalcAngleForSVG(Controls["svgx"].String + 180,"150")
local x2,y2 = CalcAngleForSVG(Controls["svgx"].String + 270,"15")
local x3,y3 = CalcAngleForSVG(Controls["svgx"].String + 90,"15")
local x4,y4 = CalcAngleForSVG(Controls["svgx"].String + 180,"70")
local x5,y5 = CalcAngleForSVG(Controls["svgx"].String + 180,"110")
lsSVG = string.format(GenSVGHeader("400", "400", "0 0 400 400")..GenCircleSVG("200","200","30","Black","Black","0")..GenLineSVG(x,y,x2,y2,"Black","25")..GenLineSVG(x,y,x3,y3,"Black","25")..GenCircleSVG(x,y,"8.5","White","Black","7.5")..GenCircleSVG("200","200","10","White","Black","0")..GenCircleSVG(x4,y4,"5","White","Black","0")..GenCircleSVG(x5,y5,"5","White","Black","0")..GenTextSVG(168,290,"40","Red",Controls["svgx"].String.."*")..gsSVGFooter)
SVGXML = xml.eval(lsSVG)
return(SVGXML)  
end

function generateMultiSVGFormat(servoNum)
  local x,y = CalcAngleForSVG(Controls['svgx'][servoNum].String + 180,"150")
  local x2,y2 = CalcAngleForSVG(Controls['svgx'][servoNum].String + 270,"15")
  local x3,y3 = CalcAngleForSVG(Controls['svgx'][servoNum].String + 90,"15")
  local x4,y4 = CalcAngleForSVG(Controls['svgx'][servoNum].String + 180,"70")
  local x5,y5 = CalcAngleForSVG(Controls['svgx'][servoNum].String + 180,"110")
  lsSVG = string.format(GenSVGHeader("400", "400", "0 0 400 400")..GenCircleSVG("200","200","30","Black","Black","0")..GenLineSVG(x,y,x2,y2,"Black","25")..GenLineSVG(x,y,x3,y3,"Black","25")..GenCircleSVG(x,y,"8.5","White","Black","7.5")..GenCircleSVG("200","200","10","White","Black","0")..GenCircleSVG(x4,y4,"5","White","Black","0")..GenCircleSVG(x5,y5,"5","White","Black","0")..GenTextSVG(168,290,"40","Red",Controls['svgx'][servoNum].String.."*")..gsSVGFooter)
  SVGXML = xml.eval(lsSVG)
  return(SVGXML)  
end

------------ Single Servo ------------
if Properties["Number of Servos"].Value == 1 then
  --Set the default power on position first time through script
  Controls["svgx"].Value = Controls["Default Position"].Value
else
  ------------ Multiple Servos ------------
  for i=1, Properties["Number of Servos"].Value do
    --Set the default power on position first time through script
  Controls['svgx'][i].Value = Controls['Default Position'][i].Value
  end
end
 
--Function to Generate Image and assign to .lengend on Button
function generate()
  ------------ Single Servo ------------
  if Properties["Number of Servos"].Value == 1 then
    local luaSVG = generateSingleSVGFormat()
  
    legend = {
      DrawChrome = false,
      IconData = Crypto.Base64Encode(tostring(luaSVG))
    }
    --print("Raw String:"..tostring(luaSVG))
    Controls.svgImage.Legend = json.encode(legend)
    
    Controls["PWM Duty"].Value = map(Controls["svgx"].Value,"0","180",Controls["ZeroCal"].Value,Controls["OneEightyCal"].Value)
    --print(map(Controls["svgx"].Value,"0","180","0.05","0.1"))
  else
    ------------ Multiple Servos ------------
    for i=1, Properties["Number of Servos"].Value do
      local luaSVG = generateMultiSVGFormat(i)
    
      legend = {
        DrawChrome = false,
        IconData = Crypto.Base64Encode(tostring(luaSVG))
      }
      --print("Raw String:"..tostring(luaSVG))
      Controls['svgImage'][i].Legend = json.encode(legend)
      
      Controls['PWM Duty'][i].Value = map(Controls['svgx'][i].Value,"0","180",Controls['ZeroCal'][i].Value,Controls['OneEightyCal'][i].Value)
      --print(map(Controls["svgx"].Value,"0","180","0.05","0.1"))
    end
  end
end

generate()

--Function to sweep servo position
function SweepServo()
    y = y + 1
    if y > (Controls.Period.Value * 1000) then 
      y=0
      --print("time")
    elseif y <= (Controls.Period.Value * 500) then 
      x = x + ((Controls["right"].Value - Controls["left"].Value) / (Controls.Period.Value*500))
    elseif y > (Controls.Period.Value * 500) then 
      x = x - ((Controls["right"].Value - Controls["left"].Value) / (Controls.Period.Value*500))
    end
    --x = x + ((Controls["right"].Value - Controls["left"].Value) / (Controls.Period.Value*100))
    --[[
    if x < Controls["left"].Value then 
      x = Controls["left"].Value
    elseif x > Controls["right"].Value then 
      x=Controls["right"].Value
    end
    ]]
    --print((Controls["right"].Value - Controls["left"].Value) / (Controls.Period.Value*15))
    --print((Controls["right"].Value - Controls["left"].Value))
    --print(((Controls.Period.Value*30)))
    --print(x)
    Controls["svgx"].Value = x + Controls["left"].Value
    generate()
end

--Function to sweep servo position
function SweepMultiServo(servoNum)
  if Controls['Sweep'][servoNum].Value == 1 then
    y = y + 1
    if y > (Controls['Period'][servoNum].Value * 1000) then 
      y=0
      --print("time")
    elseif y <= (Controls['Period'][servoNum].Value * 500) then 
      x = x + ((Controls['right'][servoNum].Value - Controls['left'][servoNum].Value) / (Controls['Period'][servoNum].Value*500))
    elseif y > (Controls['Period'][servoNum].Value * 500) then 
      x = x - ((Controls['right'][servoNum].Value - Controls['left'][servoNum].Value) / (Controls['Period'][servoNum].Value*500))
    end
    --x = x + ((Controls["right"].Value - Controls["left"].Value) / (Controls.Period.Value*100))
    --[[
    if x < Controls["left"].Value then 
      x = Controls["left"].Value
    elseif x > Controls["right"].Value then 
      x=Controls["right"].Value
    end
    ]]
    --print((Controls["right"].Value - Controls["left"].Value) / (Controls.Period.Value*15))
    --print((Controls["right"].Value - Controls["left"].Value))
    --print(((Controls.Period.Value*30)))
    --print(x)
    Controls['svgx'][servoNum].Value = x + Controls['left'][servoNum].Value
    generate()
  else
   --Do nothing 
  end
end

timer0 = Timer.New()
timer0.EventHandler = SweepServo --Calculates new servo Position




 
 
------------ Single Servo ------------
if Properties["Number of Servos"].Value == 1 then

  --Slider for controlling the servo angle
  Controls["svgx"].EventHandler = function()
  generate()
  end
   
  --Hot key for 0*
  Controls["Zero"].EventHandler = function()
  Controls["svgx"].Value = 0
  generate()
  end
  
  --Hot key for 45*
  Controls["FortyFive"].EventHandler = function()
  Controls["svgx"].Value = 45
  generate()
  end
  
  --Hot key for 90*
  Controls["Ninty"].EventHandler = function()
  Controls["svgx"].Value = 90
  generate()
  end
  
  --Hot key for 135*
  Controls["OneThirtyFive"].EventHandler = function()
  Controls["svgx"].Value = 135
  generate()
  end
  
  --Hot key for 180*
  Controls["OneEighty"].EventHandler = function()
  Controls["svgx"].Value = 180
  generate()
  end
  
  --Knob for fine adjusting 0* point
  Controls["ZeroCal"].EventHandler = function()
  Controls["svgx"].Value = 0
  generate()
  end
  
  --Knob for fine adjusting 180* point
  Controls["OneEightyCal"].EventHandler = function()
  Controls["svgx"].Value = 180
  generate()
  end
  
  --Knob for setting the sweep period
  Controls.Period.EventHandler= function()
    timer0:Stop()
    x=0
    y=0
    --timer0:Start(Controls.Period.Value/1000)
    --timer0:Start(0.030)
  end 
  
  --Button to enable the sweep function
  Controls["Sweep"].EventHandler = function()
    if Controls.Sweep.Boolean then 
      x=0
      y=0
      --timer0:Start(Controls.Period.Value/1000)
      timer0:Start(0.001)
    else 
      timer0:Stop()
    end 
  end
else
  ------------ Multiple Servos ------------
  for i=1, Properties["Number of Servos"].Value do

    --Slider for controlling the servo angle
    Controls['svgx'][i].EventHandler = function()
    generate()
    end
    
    --Hot key for 0*
    Controls['Zero'][i].EventHandler = function()
    Controls['svgx'][i].Value = 0
    generate()
    end
    
    --Hot key for 45*
    Controls['FortyFive'][i].EventHandler = function()
    Controls['svgx'][i].Value = 45
    generate()
    end
    
    --Hot key for 90*
    Controls['Ninty'][i].EventHandler = function()
    Controls['svgx'][i].Value = 90
    generate()
    end
    
    --Hot key for 135*
    Controls['OneThirtyFive'][i].EventHandler = function()
    Controls['svgx'][i].Value = 135
    generate()
    end
    
    --Hot key for 180*
    Controls['OneEighty'][i].EventHandler = function()
    Controls['svgx'][i].Value = 180
    generate()
    end
    
    --Knob for fine adjusting 0* point
    Controls['ZeroCal'][i].EventHandler = function()
    Controls['svgx'][i].Value = 0
    generate()
    end
    
    --Knob for fine adjusting 180* point
    Controls['OneEightyCal'][i].EventHandler = function()
    Controls['svgx'][i].Value = 180
    generate()
    end
    
    --Knob for setting the sweep period
    Controls['Period'][i].EventHandler= function()
      --timerSwap(i,0)  -- Stop the timer
      x=0
      y=0
      --timer0:Start(Controls.Period.Value/1000)
      --timer0:Start(0.030)
    end 
    
    --Button to enable the sweep function
    Controls['Sweep'][i].EventHandler = function()
      if Controls['Sweep'][i].Boolean then 
        x=0
        y=0
        --timer0:Start(Controls.Period.Value/1000)
        --timerSwap(i,1) -- Start the timer
      else 
        --timerSwap(i,0) -- Stop the timer
      end 
    end
  end
end

