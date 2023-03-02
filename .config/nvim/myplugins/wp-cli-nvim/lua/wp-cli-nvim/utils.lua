local P = function (v)
  print(vim.inspect(v))
  return v
end

local function split (inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

return {
  P = P,
  split = split
}
