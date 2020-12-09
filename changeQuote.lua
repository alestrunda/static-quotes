MAX_QUOTE_PARTS = 5

--need to seed the random number generator first before using math.random()
math.randomseed(os.time())

function Update()
  local quoteIDs = SKIN:GetVariable('Quotes')
  local quotes = {}
  local index = 1 --lua indexes tables from 1

  --loop all quotes and hide them
  for id in string.gmatch(quoteIDs, "%w+") do 
    quotes[index] = id
    setQuoteVisibility(id, false)
    index = index + 1
  end

  --show random quote
  local randomID = quotes[ math.random( #quotes ) ]
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
