local SvillyHUD = loadstring(game:HttpGet("https://raw.githubusercontent.com/Uncsypn/SVillyTextGui/main/Source.lua"))()

-- Create HUD Window.
local hud = SvillyHUD.new()

-- Update HUD Window.
hud:UpdateHud({
    Text = "New HUD Text",
    Color = Color3.new(1, 0, 0),
    Visible = true,
    Enabled = true
})

-- Create HUD Item.
hud:AddItem("NewItem", {
    Text = "New Item",
    Color = Color3.new(0, 1, 0),
    Font = Enum.Font.Arial
})

-- Update HUD Item.
hud:UpdateItem("NewItem", {
    Text = "Updated Text",
    Color = Color3.new(0, 0, 1)
})

-- Remove HUD Item.
hud:RemoveItem("NewItem")
