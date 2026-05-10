-- Roll/HandleBuyBoost.luau
local Boosts = require(game:GetService("ReplicatedStorage").Shared.Config.Boosts)

return function(player, boostId, sessionManager, remotes)
    local data = sessionManager.GetData(player.UserId)
    if not data then return false, "Błąd sesji" end

    local boostCfg
    for _, b in ipairs(Boosts) do if b.id == boostId then boostCfg = b; break end end
    if not boostCfg then return false, "Nieznany boost" end

    for _, id in ipairs(data.activeBoosts) do
        if id == boostId then return false, "Już posiadasz ten boost!" end
    end

    if data.coins < boostCfg.price then
        return false, "Za mało monet! Potrzebujesz " .. tostring(boostCfg.price)
    end

    data.coins -= boostCfg.price
    table.insert(data.activeBoosts, boostId)
    remotes.UpdateDataEvent:FireClient(player, data)
    return true, "Kupiono: " .. boostCfg.name
end