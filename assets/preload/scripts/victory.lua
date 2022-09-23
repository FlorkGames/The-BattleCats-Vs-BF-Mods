local pinkC = 'e600ff'
local yellowC = 'ffd900'
local pinkScore = false
local slideSD = false
local allowend = false -- trolling
function onCreate()

     makeLuaSprite('blackLine', nil, -1280, 380)
	 makeGraphic('blackLine', 1280, 84, '000000')
     addLuaSprite('blackLine', true)
	 setObjectCamera('blackLine', 'camOther')
	 setProperty('blackLine.alpha', 0.9)
     setProperty('blackLine.visible', false)	 	 
	 
     makeLuaText('victory', 'Victory!', 500, -555, 250)
	 addLuaText('victory', true)
	 setTextSize('victory', 100)
	 setObjectCamera('victory', 'other')	 
     setProperty('victory.visible', false)	 
	 
     makeLuaText('scoreTxT', 'Score:', 500, -555, 400)
	 setObjectCamera('scoreTxT', 'other')		 
	 addLuaText('scoreTxT', true)
	 setTextSize('scoreTxT', 50)  
     setProperty('scoreTxT.visible', false)	 	 
	 
     makeLuaText('scoredT', nil, 500, -555, 385)
	 setObjectCamera('scoredT', 'other')		 
	 addLuaText('scoredT', true)
	 setTextSize('scoredT', 75) 	 
	 
end

function onUpdate()
 	  setTextString('scoredT', getProperty('songScore'))
	 
   if pinkScore == false then
       setTextColor('scoredT', yellowC)	  
   elseif pinkScore == true then
       setTextColor('scoredT', pinkC)
   end	      
end
function onTimerCompleted(tag) --another timers
   if tag == 'pink' then
     pinkScore = true		 		   
	   runTimer('yellow', 0.05, 1)		     
   end
   if tag == 'yellow' then
     pinkScore = false	 	
	   runTimer('pink', 0.05, 1)	     
   end   

   if tag == 'victorySlide' then
	doTweenX('victorySlide', 'victory', 385, 1, 'cubeInOut')     
   end 
   if tag == 'scoreSlide' then
	doTweenX('scoreTxTSlide', 'scoreTxT', 165, 1, 'cubeInOut')    
	doTweenX('scoredSlide', 'scoredT', 405, 1, 'cubeInOut')      
	doTweenX('lineSlide', 'blackLine', 0, 1, 'cubeInOut')   	
   end   


   if tag == 'visibleAll' then
     setProperty('scoreTxT.visible', true)	 
     setProperty('victory.visible', true)
     setProperty('blackLine.visible', true)	 
   end 
   if tag == 'endSong' then  
	allowend = true
	endSong()     
   end   
   if tag == 'check' then  
    if isStoryMode and songName == 'Invading-Japan' then
	  loadSong('slow-battle')     
	end
   end     
end

function onEndSong()
     if not allowend then	 
         playSound('WinSound', 1, 1)
		 runTimer('visibleAll', 0.01, 1)
		 runTimer('endSong', 7, 1)
		 runTimer('victorySlide', 1, 1)
		 runTimer('scoreSlide', 2, 1)
		 runTimer('pink', 3.5, 1) 
		 runTimer('check', 6.9, 1)
         return Function_Stop
     end
   return Function_Continue
end --Script is done :3