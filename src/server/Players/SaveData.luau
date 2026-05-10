-- Players/SaveData.luau
local DataStoreService = game:GetService("DataStoreService")
local Settings         = require(game:GetService("ReplicatedStorage").Shared.Config.Settings)

local store = DataStoreService:GetDataStore(Settings.DataStoreKey)

return function(player, sessions)
    if not Settings.UseDataStore then return end
    local data = sessions[player.UserId]
    if data then
        pcall(function() store:SetAsync("p_"..player.UserId, data) end)
    end
end