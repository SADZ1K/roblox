-- init.client.luau
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player            = Players.LocalPlayer
local PlayerGui         = player:WaitForChild("PlayerGui")

local BuildTopBar      = require(script.UI.TopBar)
local BuildBottomBar   = require(script.UI.BottomBar)
local BuildSideBar     = require(script.UI.SideBar)
local BuildDiceWidget  = require(script.UI.DiceWidget)
local BuildResultPanel = require(script.UI.ResultPanel)
local OnRollClicked    = require(script.Roll.OnRollClicked)
local UpdateHud        = require(script.Data.UpdateHud)
local SetStatus        = require(script.Data.SetStatus)

local Remotes         = ReplicatedStorage:WaitForChild("Remotes", 30)
local RollFunction    = Remotes:WaitForChild("RollFunction")
local UpdateDataEvent = Remotes:WaitForChild("UpdateDataEvent")
local GetDataFunction = Remotes:WaitForChild("GetDataFunction")

local ScreenGui=Instance.new("ScreenGui")
ScreenGui.Name="RNGHud"; ScreenGui.ResetOnSpawn=false
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset=true; ScreenGui.Parent=PlayerGui

local ui={}
for k,v in pairs(BuildTopBar(ScreenGui))      do ui[k]=v end
for k,v in pairs(BuildBottomBar(ScreenGui))   do ui[k]=v end
for k,v in pairs(BuildSideBar(ScreenGui))     do ui[k]=v end
for k,v in pairs(BuildDiceWidget(ScreenGui))  do ui[k]=v end
for k,v in pairs(BuildResultPanel(ScreenGui)) do ui[k]=v end

local setStatus=SetStatus(ui)
OnRollClicked(ui, RollFunction, setStatus)

ui.BackpackButton.MouseButton1Click:Connect(function() setStatus("BACKPACK - wkrótce!",nil,2) end)
ui.UpgradeButton.MouseButton1Click:Connect(function()  setStatus("UPGRADE - wkrótce!",nil,2)  end)
ui.ShopButton.MouseButton1Click:Connect(function()     setStatus("SHOP - wkrótce!",nil,2)     end)
ui.RebirthButton.MouseButton1Click:Connect(function()  setStatus("REBIRTH - wkrótce!",nil,2)  end)
ui.IndexButton.MouseButton1Click:Connect(function()    setStatus("INDEX - wkrótce!",nil,2)    end)

UpdateDataEvent.OnClientEvent:Connect(function(data) UpdateHud(ui,data) end)

task.spawn(function()
    task.wait(1)
    local data=GetDataFunction:InvokeServer()
    if data then UpdateHud(ui,data) end
end)

print("[CLIENT] ✅ RNG załadowany!")