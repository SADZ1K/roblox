-- Data/SetStatus.luau
return function(ui)
    return function(msg, color, duration)
        ui.StatusLabel.Text=msg or ""
        ui.StatusLabel.TextColor3=color or Color3.fromRGB(230,210,255)
        if duration and duration>0 then
            task.delay(duration, function()
                if ui.StatusLabel.Text==msg then ui.StatusLabel.Text="" end
            end)
        end
    end
end