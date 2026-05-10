-- Roll/HandleRoll.luau
local RS           = game:GetService("ReplicatedStorage")
local Settings     = require(RS.Shared.Config.Settings)
local RarityBonus  = require(RS.Shared.Config.RarityBonus)
local GetLuck      = require(RS.Shared.Roll.GetLuck)
local DoRoll       = require(RS.Shared.Roll.DoRoll)
local FormatChance = require(RS.Shared.Roll.FormatChance)

return function(player, sessionManager, remotes)
    local data = sessionManager.GetData(player.UserId)
    if not data then return { success=false, message="Brak sesji" } end

    local now = tick()
    if now - sessionManager.GetLastRoll(player.UserId) < Settings.RollCooldown then
        return { success=false, message="Cooldown! Poczekaj chwilę." }
    end
    sessionManager.SetLastRoll(player.UserId, now)

    local luck = GetLuck(data)
    local item = DoRoll(luck)

    data.totalRolls += 1
    data.coins      += 1

    local result = { success=true, won=false, luck=luck, totalRolls=data.totalRolls }

    if item then
        data.inventory[item.name] = (data.inventory[item.name] or 0) + 1
        data.coins += (RarityBonus[item.rarity] or 0)
        result.won             = true
        result.item            = item
        result.effectiveChance = FormatChance(item.chance, luck)
    end

    remotes.UpdateDataEvent:FireClient(player, data)
    return result
end