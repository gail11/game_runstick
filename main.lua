display.setStatusBar(display.HiddenStatusBar)
 
local testRect = display.newRect(0,0,50,50)
testRect:setFillColor(150,0,0);

display.setStatusBar(display.HiddenStatusBar)
local backbackground = display.newImage("images/background.jpg")
backbackground.x = 240
backbackground.y = 160
 
local backgroundfar = display.newImage("images/bgfar1.jpg")
backgroundfar.x = 480
backgroundfar.y = 160

local backgroundnear1 = display.newImage("images/bgnear2.jpg")
backgroundnear1.x = 240
backgroundnear1.y = 160
 
local backgroundnear2 = display.newImage("images/bgnear2.jpg")
backgroundnear2.x = 760
backgroundnear2.y = 160

local function update( event )
updateBackgrounds()
end
 
function updateBackgrounds()
backgroundfar.x = backgroundfar.x - (.25)
 
backgroundnear1.x = backgroundnear1.x - (3)

if(backgroundnear1.x < -239) then
backgroundnear1.x = 760
end
 
backgroundnear2.x = backgroundnear2.x - (3)
if(backgroundnear2.x < -239) then
backgroundnear2.x = 760
end
end
 
timer.performWithDelay(1, update, -1)


local blocks = display.newGroup()
local groundMin = 420
local groundMax = 340
local groundLevel = groundMin

for a = 1, 8, 1 do
isDone = false

local newBlock
print (numGen)
if(numGen == 1 and isDone == false) then
newBlock = display.newImage("images/ground1.jpg")
isDone = true
end
 
if(numGen == 2 and isDone == false) then
newBlock = display.newImage("images/ground2.jpg")
isDone = true
end

newBlock.name = ("block" .. a)
newBlock.id = a
 
newBlock.x = (a * 79) - 79
newBlock.y = groundLevel
blocks:insert(newBlock)
end

function updateBlocks()
for a = 1, blocks.numChildren, 1 do
 
if(a > 1) then
newX = (blocks[a - 1]).x + 79
else
newX = (blocks[8]).x + 79
end
 
if((blocks[a]).x < -40) then
(blocks[a]).x, (blocks[a]).y = newX, groundLevel
else
(blocks[a]):translate(-5, 0)
end
 
end
end

local speed = 5;

function updateBlocks()
for a = 1, blocks.numChildren, 1 do
 
if(a > 1) then
newX = (blocks[a - 1]).x + 79
else
newX = (blocks[8]).x + 79 - speed
end
 
if((blocks[a]).x < -40) then
(blocks[a]).x, (blocks[a]).y = newX, (blocks[a]).y
else
(blocks[a]):translate(speed * -1, 0)
end
 
end
end
 
function updateBackgrounds()
--far background movement
backgroundfar.x = backgroundfar.x - (speed/55)
 
--near background movement
backgroundnear1.x = backgroundnear1.x - (speed/5)
if(backgroundnear1.x < -239) then
backgroundnear1.x = 760
end
 
backgroundnear2.x = backgroundnear2.x - (speed/5)
if(backgroundnear2.x < -239) then
backgroundnear2.x = 760
end
end

speed = speed + .05

