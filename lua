local VirtualInputManager = game:GetService("VirtualInputManager")
local Library = require(game.ReplicatedStorage:WaitForChild('Library'))
local pets = Library.Save.Get().Inventory.Pet

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Daycare V1", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
-------------Tab--------------
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddToggle({
	Name = "Daycare",
	Default = getgenv().config.DayCare,
	Callback = function(daycarev1)
        getgenv().config.DayCare = daycarev1
        if getgenv().config.DayCare then
            for i, v in pairs(pets) do
                if v["id"] == getgenv().config.NamePetDaycare then
                    if getgenv().config.DayCare == true then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                            CFrame.new(130.3366241455078, 16.55925750732422, 509.1855163574219)
                        task.wait(0.5)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                            CFrame.new(122.06338500976562, 17.816198348999023, 510.73876953125)
                        task.wait(0.1)
                        while getgenv().config.DayCare do
                            local args = {
                                [1] = {
                                    [i] = getgenv().config.NumberPetDaycare
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Daycare: Enroll"):InvokeServer(unpack(args))
                            task.wait(0.5)
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Daycare: Claim"):InvokeServer()
                    end
                end
            end
        end
    end
end
})
Tab:AddToggle({
	Name = "AntiAFK Jump",
	Default = getgenv().config.AntiAFK,
	Callback = function(antiafk)
        getgenv().config.AntiAFK = antiafk
        if getgenv().config.AntiAFK then
            while getgenv().config.AntiAFK do
                VirtualInputManager:SendKeyEvent(true, "Space", false, game)
                task.wait(0.2)
                VirtualInputManager:SendKeyEvent(false, "Space", false, game)
                task.wait(5)
            end
        end
    end
})
OrionLib:Init()
