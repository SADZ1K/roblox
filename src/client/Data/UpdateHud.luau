-- Data/UpdateHud.luau
local GetLuck = require(game:GetService("ReplicatedStorage").Shared.Roll.GetLuck)

return function(ui, data)
    local luck=GetLuck(data)
    ui.CoinsLabel.Text="🪙 "..tostring(data.coins)
    ui.StatsLabel.Text=string.format("Luck: %sx   •   Rolls: %d", tostring(luck), data.totalRolls)
end