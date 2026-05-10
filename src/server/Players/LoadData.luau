-- Players/LoadData.luau
local DataStoreService = game:GetService("DataStoreService")
local Settings         = require(game:GetService("ReplicatedStorage").Shared.Config.Settings)
local DefaultData      = require(script.Parent.DefaultData)

local store = DataStoreService:GetDataStore(Settings.DataStoreKey)

return function(player)
    if not Settings.UseDataStore then return DefaultData() end
    local ok, data = pcall(function() return store:GetAsync("p_"..player.UserId) end)
    return (ok and data) or DefaultData()
end