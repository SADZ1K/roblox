-- Players/SessionManager.luau
local Players  = game:GetService("Players")
local Settings = require(game:GetService("ReplicatedStorage").Shared.Config.Settings)
local LoadData = require(script.Parent.LoadData)
local SaveData = require(script.Parent.SaveData)

local sessions = {}
local lastRoll = {}
local SessionManager = {}

function SessionManager.OnJoin(player, remotes)
    sessions[player.UserId] = LoadData(player)
    lastRoll[player.UserId] = 0
    player.CharacterAdded:Wait()
    task.wait(0.5)
    remotes.UpdateDataEvent:FireClient(player, sessions[player.UserId])
end

function SessionManager.OnLeave(player)
    SaveData(player, sessions)
    sessions[player.UserId] = nil
    lastRoll[player.UserId] = nil
end

function SessionManager.StartAutoSave()
    task.spawn(function()
        while true do
            task.wait(Settings.AutoSaveInterval)
            for _, p in ipairs(Players:GetPlayers()) do SaveData(p, sessions) end
        end
    end)
end

function SessionManager.GetData(userId)      return sessions[userId] end
function SessionManager.GetLastRoll(userId)  return lastRoll[userId] or 0 end
function SessionManager.SetLastRoll(userId, t) lastRoll[userId] = t end

return SessionManager