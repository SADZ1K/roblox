-- Roll/GetLuck.luau
local Settings = require(script.Parent.Parent.Config.Settings)
local Boosts   = require(script.Parent.Parent.Config.Boosts)

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