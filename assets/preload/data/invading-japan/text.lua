function onCreate()
   makeLuaText('tip', 'You need to break the enemy base, buy cats with the Cat Icon and break the base', 545, 20, 190)
   setTextSize('tip', '25')
   addLuaText('tip', true)
   setProperty('tip.alpha', 1)
end   
function onUpdate()
   if curStep == 16 then
      doTweenAlpha('bye', 'tip', 0, 0.5, 'linear')   
   end  
end