-- GetLuck.luau
local RS       = game:GetService("ReplicatedStorage")
local Settings = require(RS.Shared.Config.Settings)
local Boosts   = require(RS.Shared.Config.Boosts)

return function(playerData)
    local luck = Settings.BaseLuck
    if playerData and playerData.activeBoosts then
        for _, boostId in ipairs(playerData.activeBoosts) do
            for _, boost in ipairs(Boosts) do
                if boost.id == boostId then
                    luck += (boost.multiplier - 1)
                end
            end
        end
    end
    return luck
end