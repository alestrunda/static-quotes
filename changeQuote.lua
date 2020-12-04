MAX_QUOTE_PARTS = 5

function Update()
  local quoteIDs = SKIN:GetVariable('Quotes')
  local quotes = {}
  local index = 1 --Lua indexes tables from 1

  for id in string.gmatch(quoteIDs, "%w+") do 
    quotes[index] = id
    setQuoteVisibility(id, false)
    index = index + 1
  end

  local randomID = quotes[ math.random( #quotes ) ]
  print("Random " .. randomID)
  setQuoteVisibility(randomID, true)
  return randomID
end

function setQuoteVisibility(quoteID, isVisible)
  local index = 1
  while index < MAX_QUOTE_PARTS do
    local quotePart = 'Quote' .. quoteID .. 'Part' .. index
    if not SKIN:GetMeter(quotePart) then
      break
    end
    if isVisible then
      SKIN:Bang('!ShowMeter', quotePart)
    else
      SKIN:Bang('!HideMeter', quotePart)
    end
    index = index + 1
  end
end
