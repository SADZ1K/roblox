-- UI/BottomBar.luau
return function(ScreenGui)
    local bar = Instance.new("Frame")
    bar.Size=UDim2.new(0,420,0,90); bar.Position=UDim2.new(0.5,-210,1,-110)
    bar.BackgroundTransparency=1; bar.Parent=ScreenGui

    local layout=Instance.new("UIListLayout")
    layout.FillDirection=Enum.FillDirection.Horizontal
    layout.HorizontalAlignment=Enum.HorizontalAlignment.Center
    layout.VerticalAlignment=Enum.VerticalAlignment.Center
    layout.Padding=UDim.new(0,12); layout.Parent=bar

    local function makeBtn(text, color)
        local btn=Instance.new("TextButton")
        btn.Size=UDim2.new(0,110,0,80); btn.BackgroundColor3=color
        btn.BorderSizePixel=0; btn.AutoButtonColor=true
        btn.Text=text; btn.TextColor3=Color3.fromRGB(255,255,255)
        btn.TextScaled=true; btn.Font=Enum.Font.GothamBlack; btn.Parent=bar
        Instance.new("UICorner",btn).CornerRadius=UDim.new(0,18)
        local s=Instance.new("UIStroke",btn); s.Color=Color3.new(0,0,0); s.Thickness=2
        return btn
    end

    return {
        BackpackButton = makeBtn("BACKPACK", Color3.fromRGB(180,130,70)),
        RollButton     = makeBtn("ROLL",     Color3.fromRGB(130,120,255)),
        UpgradeButton  = makeBtn("UPGRADE",  Color3.fromRGB(255,190,80)),
    }
end