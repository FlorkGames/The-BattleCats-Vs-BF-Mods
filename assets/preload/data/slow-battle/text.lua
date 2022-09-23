function onCreate()
   makeLuaText('tip', 'Youll be on the moon soon, so take a break and practice your singing skills. Do not make more than 10 misses, otherwise the base will be destroyed', 545, 20, 190)
   setTextSize('tip', '25')
   addLuaText('tip', true)
   setProperty('tip.alpha', 1)
end   
function onUpdate()
   if curStep == 32 then
      doTweenAlpha('bye', 'tip', 0, 0.5, 'linear')   
   end  
end