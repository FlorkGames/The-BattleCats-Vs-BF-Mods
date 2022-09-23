local allowStart=false
function onStartCountdown()
runTimer('song', 0.1, 1)
	if allowStart==false then
		setProperty('inCutscene', true)
		return Function_Stop;
	end
	return Function_Continue;
end
function onCreate()
setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
   makeLuaSprite('bg', 'menu/menuBG', -2, -200)
   addLuaSprite('bg', true)
   setObjectCamera('bg', 'other')
   scaleObject('bg', 1.335, 1.35)
   makeLuaSprite('title', 'menu/menuTitle', 280, 0)
   addLuaSprite('title', true)
   scaleObject('title', 1, 1)
   setObjectCamera('title', 'other')
   
   makeLuaSprite('line', nil, 0, 360)
   makeGraphic('line', 1280, 280, '000000')
   setProperty('line.alpha', 0.75)
   addLuaSprite('line', true)
   setObjectCamera('line', 'other')
   
   makeAnimatedLuaSprite('play', 'menu/Play_button', 460,380)
   addAnimationByPrefix('play', 'non', 'non', 16, true)
   addAnimationByPrefix('play', 'on', 'on', 16, true)
   addLuaSprite('play', true)
   scaleObject('play', 1.4, 1.4)
   setObjectCamera('play', 'other')  
   makeAnimatedLuaSprite('exit', 'menu/Exit_button', 460,460)
   addAnimationByPrefix('exit', 'non', 'non', 16, true)
   addAnimationByPrefix('exit', 'on', 'on', 16, true)
   addLuaSprite('exit', true)
   scaleObject('exit', 1.4, 1.4)
   setObjectCamera('exit', 'other')  

   makeAnimatedLuaSprite('EoC', 'menu/EoC', -900,370)
   addAnimationByPrefix('EoC', 'Idle', 'Idle', 16, true)
   addAnimationByPrefix('EoC', 'Anim', 'Anim', 16, true)
   addLuaSprite('EoC', true)
   scaleObject('EoC', 1, 1)
   setObjectCamera('EoC', 'other') 
   makeAnimatedLuaSprite('ItF', 'menu/ItF', -500,370)
   addAnimationByPrefix('ItF', 'Idle', 'Idle', 16, true)
   addAnimationByPrefix('ItF', 'Anim', 'Anim', 16, true)
   addLuaSprite('ItF', true)
   scaleObject('ItF', 1, 1)
   setObjectCamera('ItF', 'other')  

   makeLuaSprite('book', 'menu/catBook', 1495, 640)
   addLuaSprite('book', true)
   scaleObject('book', 1, 1)
   setObjectCamera('book', 'other')   
end
function onUpdate()
 getPropertyFromClass('FlxG', 'mouse.visible', true)

    if (getMouseX('camHUD') > getProperty('play.x') and getMouseX('camHUD') < getProperty('play.x')+ 360) and (getMouseY('camHUD') > getProperty('play.y') and getMouseY('camHUD') < getProperty('play.y')+ 70) then
       objectPlayAnimation('play', 'on', false)	
	else  
       objectPlayAnimation('play', 'non', false)		
	end  
    if (getMouseX('camHUD') > getProperty('play.x') and getMouseX('camHUD') < getProperty('play.x')+ 360) and (getMouseY('camHUD') > getProperty('play.y') and getMouseY('camHUD') < getProperty('play.y')+ 70) and mouseReleased('left') then
	   doTweenX('playBye', 'play', 1320, 1, 'cubeInOut')
	   doTweenX('exitBye', 'exit', 1320, 1, 'cubeInOut')
	   doTweenX('eocHi', 'EoC', 300, 1, 'cubeInOut')
	   doTweenX('itfHi', 'ItF', 650, 1, 'cubeInOut')
	   doTweenX('bookHi', 'book', 1195, 1, 'cubeInOut')	   
	   playSound('confirmBC', 1)
    end	
    if (getMouseX('camHUD') > getProperty('exit.x') and getMouseX('camHUD') < getProperty('exit.x')+ 360) and (getMouseY('camHUD') > getProperty('exit.y') and getMouseY('camHUD') < getProperty('exit.y')+ 70) then
       objectPlayAnimation('exit', 'on', false)	
	else  
       objectPlayAnimation('exit', 'non', false)		
	end  	
    if (getMouseX('camHUD') > getProperty('exit.x') and getMouseX('camHUD') < getProperty('exit.x')+ 360) and (getMouseY('camHUD') > getProperty('exit.y') and getMouseY('camHUD') < getProperty('exit.y')+ 70) and mouseReleased('left') then
       endSong()
	   playSound('confirmBC', 1)	   
	end 	
    if (getMouseX('camHUD') > getProperty('EoC.x') and getMouseX('camHUD') < getProperty('EoC.x')+ 325) and (getMouseY('camHUD') > getProperty('EoC.y') and getMouseY('camHUD') < getProperty('EoC.y')+ 260) then
       objectPlayAnimation('EoC', 'Anim', false)	
	else  
       objectPlayAnimation('EoC', 'Idle', false)		
	end  	
    if (getMouseX('camHUD') > getProperty('ItF.x') and getMouseX('camHUD') < getProperty('ItF.x')+ 325) and (getMouseY('camHUD') > getProperty('ItF.y') and getMouseY('camHUD') < getProperty('ItF.y')+ 260) then
       objectPlayAnimation('ItF', 'Anim', false)	
	else  
       objectPlayAnimation('ItF', 'Idle', false)		
	end  	
    if (getMouseX('camHUD') > getProperty('EoC.x') and getMouseX('camHUD') < getProperty('EoC.x')+ 325) and (getMouseY('camHUD') > getProperty('EoC.y') and getMouseY('camHUD') < getProperty('EoC.y')+ 260) and mouseReleased('left') then
	   loadSong('Invading-japan')
	   playSound('confirmBC', 1)	   
    end	
    if (getMouseX('camHUD') > getProperty('ItF.x') and getMouseX('camHUD') < getProperty('ItF.x')+ 325) and (getMouseY('camHUD') > getProperty('ItF.y') and getMouseY('camHUD') < getProperty('ItF.y')+ 260) and mouseReleased('left') then	
       loadSong('To-the-unknown-world')
	   playSound('confirmBC', 1)	   
	end
	
    if (getMouseX('camHUD') > getProperty('book.x') and getMouseX('camHUD') < getProperty('book.x')+ 85) and (getMouseY('camHUD') > getProperty('book.y') and getMouseY('camHUD') < getProperty('book.y')+ 77) and mouseReleased('left') then	
       loadSong('CatGuide')
	   playSound('confirmBC', 1)	   
	end	
end

function onTimerCompleted(tag)
if tag == 'song' then playSound('menuTheme', 0.75) runTimer('song', 104, 1) end
end  