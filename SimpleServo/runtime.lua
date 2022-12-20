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
 
--Calc Angle on Radius
function CalcAngleForSVG(lsAngle,lsRadius)
lsAngle = math.rad(lsAngle)
local x1 = math.cos(lsAngle)*lsRadius + 200
local y1 = math.sin(lsAngle)*lsRadius + 200
print(math.floor(x1),math.floor(y1))
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
 
--Assemble String Together and Convert to XML
function generateSVGFormat()
local x,y = CalcAngleForSVG(Controls["svgx"].String + 180,"150")
local x2,y2 = CalcAngleForSVG(Controls["svgx"].String + 270,"15")
local x3,y3 = CalcAngleForSVG(Controls["svgx"].String + 90,"15")
local x4,y4 = CalcAngleForSVG(Controls["svgx"].String + 180,"70")
local x5,y5 = CalcAngleForSVG(Controls["svgx"].String + 180,"110")
lsSVG = string.format(GenSVGHeader("400", "400", "0 0 400 400")..GenCircleSVG("200","200","30","Black","Black","0")..GenLineSVG(x,y,x2,y2,"Black","25")..GenLineSVG(x,y,x3,y3,"Black","25")..GenCircleSVG(x,y,"8.5","White","Black","7.5")..GenCircleSVG("200","200","10","White","Black","0")..GenCircleSVG(x4,y4,"5","White","Black","0")..GenCircleSVG(x5,y5,"5","White","Black","0")..GenTextSVG(168,290,"40","Red",Controls["svgx"].String.."*")..gsSVGFooter)
SVGXML = xml.eval(lsSVG)
return(SVGXML)  
end
 
--Function to Generate Image and assign to .lengend on Button
function generate()
  local luaSVG = generateSVGFormat()
  
  legend = {
    DrawChrome = false,
    IconData = Crypto.Base64Encode(tostring(luaSVG))
  }
  print("Raw String:"..tostring(luaSVG))
  Controls.svgImage.Legend = json.encode(legend)
end
 
generate()
 
--Slider for testing
Controls["svgx"].EventHandler = function()
generate()
end
 