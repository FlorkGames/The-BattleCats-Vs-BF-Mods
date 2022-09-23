function onUpdate()
    if hits < 1 then
        setProperty('scoreTxt.text', 'Score: 0 | Misses: 0/10 | Accuracy: ?')
    elseif misses > 0 then
        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Misses: ' .. misses .. '/10 | Accuracy: '.. ratingName ..' ' ..  round(rating * 100, 2) .. '%' )
	else
        setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Misses: ' .. misses .. '/10 | Accuracy: '.. ratingName ..' ' ..  round(rating * 100, 2) .. '%' )	
    end
	
	if misses < 3 then
	  setProperty('scoreTxt.color', getColorFromHex('00FF00'))
    elseif misses >= 3 and misses < 7 then  
	  setProperty('scoreTxt.color', getColorFromHex('FFFF00'))	
	elseif misses > 7 then
	  setProperty('scoreTxt.color', getColorFromHex('FF0000'))	
	end  
	
	if misses >= 10 then
	  setProperty('health', 0)
	end
end
function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end