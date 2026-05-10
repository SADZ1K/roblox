-- Roll/OnRollClicked.luau
local Settings      = require(game:GetService("ReplicatedStorage").Shared.Config.Settings)
local PlayAnimation = require(script.Parent.PlayAnimation)

return function(ui, RollFunction, setStatus)
    local isRolling=false
    ui.RollButton.MouseButton1Click:Connect(function()
        if isRolling then return end
        isRolling=true
        ui.RollButton.Text="ROLLING..."
        ui.RollButton.BackgroundColor3=Color3.fromRGB(90,80,200)

        local result=RollFunction:InvokeServer()

        task.wait(Settings.RollCooldown)
        ui.RollButton.Text="ROLL"
        ui.RollButton.BackgroundColor3=Color3.fromRGB(130,120,255)
        isRolling=false

        if result and result.success then
            task.spawn(function() PlayAnimation(ui, result) end)
        else
            setStatus("❌ "..((result and result.message) or "Błąd"), Color3.fromRGB(255,120,120), 3)
        end
    end)
end