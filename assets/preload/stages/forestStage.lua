local catWalk = true
local tankWalk = true
local axeWalk = true

function onSongStart()
   noteTweenX('1', 0, -115, 1.5, 'cubeInOut')
   noteTweenX('2', 1, -115, 1.5, 'cubeInOut')
   noteTweenX('3', 2, -115, 1.5, 'cubeInOut')
   noteTweenX('4', 3, -115, 1.5, 'cubeInOut')  
end
function onCreate()
      makeLuaSprite('bg', 'Background/Forest_bg', -260, 170)
	  addLuaSprite('bg', false)
	  scaleObject('bg', 2, 2)  
	  setProperty('bg.antialiasing', true);
      makeLuaSprite('base', 'Background/Cat_Base', 945, 250)
	  addLuaSprite('base', false)
	  scaleObject('base', 1.9, 1.9)  	  
	  
	  --the Walk|ing| |Cat|s--
	  
	  makeAnimatedLuaSprite('cat', 'Background/WalkingCats/waulterCat', 270, getRandomInt(700,725))
	  addAnimationByPrefix('cat', 'Walk', 'Walk', 8, false)
	  scaleObject('cat', 2.75, 2.75)
	  addLuaSprite('cat', false)	 
	  
	  makeAnimatedLuaSprite('tank', 'Background/WalkingCats/tank_Cat', 270, getRandomInt(625,665))
	  addAnimationByPrefix('tank', 'Walk', 'Walk', 8, true)
	  scaleObject('tank', 2.75, 2.75)
	  addLuaSprite('tank', false)	

	  makeAnimatedLuaSprite('axe', 'Background/WalkingCats/axe_Cat', 250, getRandomInt(750,775))
	  addAnimationByPrefix('axe', 'Walk', 'Walk', 8, true)
	  scaleObject('axe', 2, 2)
	  addLuaSprite('axe', false)		  
end
function onUpdate()
 --basic cat walking--
  if catWalk == true then
    objectPlayAnimation('cat', 'Walk', false)  
     if catWalkPlus == true then
	   setProperty('cat.flipX', true)
	   setProperty('cat.x', getProperty('cat.x')+ 2) 	 
	 end
     if catWalkPlus == false then
	   setProperty('cat.flipX', false)
	   setProperty('cat.x', getProperty('cat.x')- 2)
     end	 
  end	 
  if getProperty('cat.x') == 270 then
     catWalkPlus = false
  elseif getProperty('cat.x') == -220 then
     catWalkPlus = true
  end	 
 --tank cat walking--
  if tankWalk == true then
    objectPlayAnimation('tank', 'Walk', false)  
     if tankWalkPlus == true then
	   setProperty('tank.flipX', true)
	   setProperty('tank.x', getProperty('tank.x')+ 1) 	 
	 end
     if tankWalkPlus == false then
	   setProperty('tank.flipX', false)
	   setProperty('tank.x', getProperty('tank.x')- 1)
     end	 
  end	 
  if getProperty('tank.x') == 270 then
     tankWalkPlus = false
  elseif getProperty('tank.x') == -220 then
     tankWalkPlus = true
  end	 
 --axe cat walking--
  if axeWalk == true then
    objectPlayAnimation('axe', 'Walk', false)  
     if axeWalkPlus == true then
	   setProperty('axe.flipX', true)
	   setProperty('axe.x', getProperty('axe.x')+ 3) 	 
	 end
     if axeWalkPlus == false then
	   setProperty('axe.flipX', false)
	   setProperty('axe.x', getProperty('axe.x')- 3)
     end	 
  end	 
  if getProperty('axe.x') == 250 then
     axeWalkPlus = false
  elseif getProperty('axe.x') == -221 then
     axeWalkPlus = true
  end	   
end