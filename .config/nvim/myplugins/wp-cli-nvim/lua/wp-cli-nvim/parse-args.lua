
local cmd_parser = {}

local STATES = {
  OUTSIDE_QUOTES= 1,
  INSIDE_QUOTES=2,
  START_NEW_ITEM = 3,
}

function cmd_parser:new()
  local state = {
      cur_char_index = nil,
      parseString = "",
      items= {},
      pair_to = nil,
      cur_item_index = 0,
      state=STATES.START_NEW_ITEM,
    }
   setmetatable(state,self)
   self.__index = self
  return state
end

function cmd_parser:parse(words)

  local parsed = {}
  local state=0
  local pairMatch = nil;
  for _,word in pairs(words) do
    if word:find("\"") and pairMatch==nil then
      pairMatch = "\"";
      state=1;
      local insertWord = word:gsub("\"","")
      parsed[#parsed + 1]=insertWord;
      goto continue
    end
    if word:find("'") and pairMatch ==nil then
      pairMatch = "'"
      state=1
      local insertWord = word:gsub("'","")
      parsed[#parsed + 1]=insertWord;
      goto continue
    end

    if state==1 then
      local insertWord = word:gsub("\"","")
      insertWord = insertWord:gsub("'","")
      parsed[#parsed] = parsed[#parsed].." "..insertWord
    end
    if state==0 then
      local insertWord = word:gsub("\"","")
      insertWord = word:gsub("'","")
      parsed[#parsed + 1]= insertWord
    end

    if word:find("\"") and pairMatch=="\"" then
      state=0;
      pairMatch=nil;
    end
    if word:find("'") and pairMatch=="'" then
      state=0;
      pairMatch=nil;
    end
    ::continue::
  end
  return parsed
end



return cmd_parser
