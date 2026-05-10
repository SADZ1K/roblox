-- init.server.luau
local Players        = game:GetService("Players")
local RemoteSetup    = require(script.Remotes.Setup)
local SessionManager = require(script.Players.SessionManager)
local HandleRoll     = require(script.Roll.HandleRoll)
local HandleBuyBoost = require(script.Roll.HandleBuyBoost)

local remotes = RemoteSetup

SessionManager.StartAutoSave()

Players.PlayerAdded:Connect(function(player)
    SessionManager.OnJoin(player, remotes)
end)
Players.PlayerRemoving:Connect(function(player)
    SessionManager.OnLeave(player)
end)

remotes.GetDataFunction.OnServerInvoke = function(player)
    return SessionManager.GetData(player.UserId) or {}
end
remotes.RollFunction.OnServerInvoke = function(player)
    return HandleRoll(player, SessionManager, remotes)
end
remotes.BuyBoostFunction.OnServerInvoke = function(player, boostId)
    return HandleBuyBoost(player, boostId, SessionManager, remotes)
end

print("[SERVER] ✅ RNG Server załadowany!")