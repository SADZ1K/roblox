-- UI/SideBar.luau
return function(ScreenGui)
    local menu=Instance.new("Frame")
    menu.Size=UDim2.new(0,110,0,260); menu.Position=UDim2.new(1,-130,0.5,-130)
    menu.BackgroundTransparency=1; menu.Parent=ScreenGui

    local layout=Instance.new("UIListLayout")
    layout.FillDirection=Enum.FillDirection.Vertical
    layout.HorizontalAlignment=Enum.HorizontalAlignment.Center
    layout.VerticalAlignment=Enum.VerticalAlignment.Center
    layout.Padding=UDim.new(0,12); layout.Parent=menu

    local function makeBtn(text, color)
        local btn=Instance.new("TextButton")
        btn.Size=UDim2.new(0,100,0,70); btn.BackgroundColor3=color
        btn.BorderSizePixel=0; btn.Text=text
        btn.TextColor3=Color3.fromRGB(255,255,255)
        btn.TextScaled=true; btn.Font=Enum.Font.GothamBlack; btn.Parent=menu
        Instance.new("UICorner",btn).CornerRadius=UDim.new(0,18)
        local s=Instance.new("UIStroke",btn); s.Color=Color3.new(0,0,0); s.Thickness=2
        return btn
    end

    return {
        ShopButton    = makeBtn("SHOP",    Color3.fromRGB(255,80,120)),
        RebirthButton = makeBtn("REBIRTH", Color3.fromRGB(255,120,80)),
        IndexButton   = makeBtn("INDEX",   Color3.fromRGB(80,120,255)),
    }
end