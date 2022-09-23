local HPbase = 100
local catBuyable = false
local catt = 0
local catSpawned = false
local CDcat = false -- max cats are 8 (catt + 1 = 8 < 9 yes)
local catsIs = 0
local catAttacks = false
local baseIsDead = false
function onSongStart()
   noteTweenAlpha('nonote1', 0, 0, 1, 'cubeInOut')
   noteTweenAlpha('nonote2', 1, 0, 0.9, 'cubeInOut')
   noteTweenAlpha('nonote3', 2, 0, 0.8, 'cubeInOut')
   noteTweenAlpha('nonote4', 3, 0, 0.7, 'cubeInOut')	
end
function onCreate()
    makeLuaSprite('base', 'Background/ChinaBase', -165, 500)
	addLuaSprite('base', false)
	scaleObject('base', 1.6, 1.6)
    setProperty('base.antialiasing', true);	
	
	makeLuaSprite('catIcon', 'icons/basicCatIcon', 580, 65)
	addLuaSprite('catIcon', true)
	scaleObject('catIcon', 0.75, 0.75)
	setObjectCamera('catIcon', 'camHUD')
	
	makeLuaText('catCost', '15000$', 100, 620, 130)
	addLuaText('catCost', true)
	setTextSize('catCost', 20)	
	setProperty('catCost.color', getColorFromHex('ffd900'))
	
	makeLuaText('cantDeploy', 'Can`t deploy any more!', 550, 370, 256)
	addLuaText('cantDeploy')
	setTextSize('cantDeploy', 40)		
	setProperty('cantDeploy.color', getColorFromHex('ffff00'))   
    setProperty('cantDeploy.alpha', 0)	
	
end

function onUpdate()
	makeLuaText('misses', 'Misses: ' .. getProperty('songMisses'), 500, 100, 685)	
	setTextSize('misses', 25)
	addLuaText('misses', true)
	makeLuaText('score', 'Score: ' .. getProperty('songScore'), 500, 380, 675)	
	setTextSize('score', 35)
	addLuaText('score', true)	
	setProperty('score.color', getColorFromHex('ffd900'))
	makeLuaText('acc', 'Accuracy: ' .. getProperty('ratingName'), 500, 660, 685)	
	setTextSize('acc', 25)
	addLuaText('acc', true)	
	
	setProperty('timeBarBG.visible', false)	
	setProperty('timeBar.visible', false)
	setProperty('healthBar.x', -6666)	
	setProperty('scoreTxt.visible', false)
	
	makeLuaText('baseHP',  ''..HPbase..'/100', 150, 170, 265)
    setTextSize('baseHP', 25)
	addLuaText('baseHP', false)	
	
  if getProperty('songScore') < 15000 then	
	 setProperty('catIcon.color', getColorFromHex('878787'))
  end	
  if getProperty('songScore') > 15000 then	
	 setProperty('catIcon.color', getColorFromHex('FFFFFF'))
  end	  
  
	if getPropertyFromClass('ClientPrefs', 'downScroll') then
	   setProperty('misses.y', 10)
	   setProperty('score.y', 15)
	   setProperty('acc.y', 10)
	   setProperty('catIcon.y', 580)
	   setProperty('catCost.y', 640)	   
	end    
	
	if (getMouseX('camHUD') > getProperty('catIcon.x') and getMouseX('camHUD') < getProperty('catIcon.x')+146) and (getMouseY('camHUD') > getProperty('catIcon.y') and getMouseY('camHUD') < getProperty('catIcon.y')+ 90 and mouseReleased('left')) and catSpawned == false and CDcat == false and getProperty('songScore') >= 15000 and catsIs < 8 then
        makeAnimatedLuaSprite('cat'..catt + 1, 'characters/Basic_Cat', 45, 740)   
        addAnimationByPrefix('cat'..catt + 1, 'Idle', 'Idle', 1, false)    
        addAnimationByPrefix('cat'..catt + 1, 'attack', 'Attack', 8, true)  
        scaleObject('cat'..catt + 1, 2, 2)  		
		addLuaSprite('cat'..catt + 1, false)
		setObjectOrder('cat'..catt + 1, getObjectOrder('cat'..catt + 1)+ 1)
	   catSpawned = true
	   catt = catt + 1
       catsIs = catsIs + 1	   
	   runTimer('catSpawned', 0.01, 1)		
	   runTimer('CDcat', 0.01, 1)
	   runTimer('catAttack', 4, 1)	   
	   playSound('BuyCat', 1)
	   setProperty('songScore', getProperty('songScore')- 15000)
	end  
	
	if CDcat == true then
	   setProperty('catIcon.color', getColorFromHex('878787'))
	end
	 
	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SPACE') and catsIs == 8 then
       setProperty('cantDeploy.alpha', 1)
	   runTimer('cantDeployBye', 1.3, 1)
    end	
	
  for i = 1, catt do	
	if catSpawned == true and CDcat == false then
	   setProperty('cat'..i..'.y', getProperty('cat'..i..'.y')+ 12)
    end 
  end		
 if HPbase < 0 then
   HPbase = 0
   baseIsDead = true
 end
 
 if curStep == 771 and baseIsDead == false then
    loadSong('Invading-Japan')
 end
 if curStep == 771 and baseIsDead == true then
    runTimer('winScorePlus', 0.5, 1)
 end 
end
function onGameOver()
     if getProperty('health') > -9999 then --  bf cant die
          return Function_Stop
     else
          return Function_Continue
     end
end

function onTimerCompleted(tag)
	if tag == 'catSpawned' then
	   catSpawned = false
	end
	if tag == 'catAttack' then
	for i = 1, catt do	
	    objectPlayAnimation('cat'..i, 'attack', false)
		runTimer('catBite', 0.4, 1)
	end	
	end
	if tag == 'catBite' then
	for i = 1, catt do
       objectPlayAnimation('cat'..i, 'Idle', false)
       runTimer('catAttack', 4, 1)		   
	   HPbase = HPbase - 3
	   playSound('baseDamaged', 0.45)
    end 	   
	end		
	
	if tag == 'CDcat' then
	   CDcat = true 
	   runTimer('noCDcat', 1.5, 1)
	end
	if tag == 'noCDcat' then
	   CDcat = false
	   playSound('recharged', 1)
	end

    if tag == 'cantDeployBye' then
       doTweenAlpha('cantDeployBye', 'cantDeploy', 0, 0.5, 'cubeInOut')	
	end 

    if tag == 'winScorePlus' then
       setProperty('songScore', getProperty('songScore')+ getRandomInt(75000, 850000))
	end 	
end

function goodNoteHit(id, direction, noteType, isSustainNote)
   if isSustainNote then
      setProperty('songScore', getProperty('songScore')+ 50)
   end	  
end