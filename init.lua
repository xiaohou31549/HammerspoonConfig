function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
      if file:sub(-4) == ".lua" then
          doReload = true
      end
  end
  if doReload then
      hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

-- 快速打开应用
function open(name)
  return function()
      hs.application.launchOrFocus(name)
      if name == 'Finder' then
          hs.appfinder.appFromName(name):activate()
      end
  end
end

hs.hotkey.bind({"alt"}, "F", open("Finder"))
hs.hotkey.bind({"alt"}, "W", open("WeChat"))
hs.hotkey.bind({"alt"}, "C", open("Google Chrome"))
hs.hotkey.bind({"alt"}, "I", open("iTerm"))
hs.hotkey.bind({"alt"}, "X", open("Xcode"))
hs.hotkey.bind({"alt"}, "V", open("Visual Studio Code"))
hs.hotkey.bind({"alt"}, "N", open("Notes"))