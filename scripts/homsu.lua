#!/usr/bin/env lua

local home_gen_name = "Home default"

if #arg == 0 then
  print("No name gen specified")
else
  home_gen_name = arg[1]
end

os.execute("pwd")
os.execute("cd " .. os.getenv("HOME") .. "/.dotfiles/home-manager/")
print("The Dir is:")
os.execute("pwd")

local handle = io.popen("home-manager switch --flake ../")
if handle then
  local result = handle:read("*a")
  handle:close()

  if result and result:find("error", 1, true) then
    print("Error rebuilding home")
    os.exit(1)
  else
    print("Home rebuilt successfully")
    local file = io.open("home-generation", "a")
    if file then
      file:write(home_gen_name .. "\n")
      file:write(os.date() .. "\n")
      file:close()
    else
      print("Error: Failed to open file")
    end
    os.execute("git add .")
    os.execute("git commit -m 'Home Generation: " .. home_gen_name .. "'")
    os.execute("cd ..")
  end
else
  print("Error: Failed to open handle")
end
