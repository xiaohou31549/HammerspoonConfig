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

-- 快速打开应用 --
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

-- 锁屏 --
hs.hotkey.bind({"alt"}, "L", function()
    hs.caffeinate.lockScreen()
end
)

-- 杀死所有的Application && 关机
hs.hotkey.bind({"ctrl","cmd"}, "P", function()
    local allApps = hs.application.runningApplications()
    for i = 1, #allApps do
        local app = allApps[i]
        if (app:name() == "Xcode")
        then
            app:kill9()
        end 
    end
    hs.caffeinate.shutdownSystem().shutdownSystem()
end
)