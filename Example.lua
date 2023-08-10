local SvillyHUD = loadstring(game:HttpGet("https://raw.githubusercontent.com/Uncsypn/SVillyTextGui/main/Source.lua"))()

-- Keep This Function For Double Text.
local function ToFormat(color3)return"rgb("..math.floor(math.min(color3.R*255,255))..", "..math.floor(math.min(color3.G*255,255))..", "..math.floor(math.min(color3.B*255,255))..")";end

-- Create HUD Window.
getgenv().hud = SvillyHUD.new()

-- Update HUD Window.
getgenv().hud:UpdateHud({
    Text = string.format("%s - <font color='%s'>%s</font>", "SVilly", ToFormat(Color3.fromRGB(100,0,100)), "HUD"),
    Color = Color3.new(1, 0, 0),
    Visible = true,
    Enabled = true
})

-- Create HUD Item.
getgenv().hud:AddItem("NewItem", {
    Text = string.format("%s - <font color='%s'>%s</font>", "String1", ToFormat(Color3.fromRGB(100,0,0)), "String2"),
    Color = Color3.new(0, 1, 0),
    Font = Enum.Font.Arial
})

-- Update HUD Item.
getgenv().hud:UpdateItem("NewItem", {
    Text = string.format("%s - <font color='%s'>%s</font>", "String3", ToFormat(Color3.fromRGB(100,100,0)), "String4"),
    Color = Color3.new(0, 0, 1)
})

-- Remove HUD Item.
getgenv().hud:RemoveItem("NewItem")

-- Destroy HUD.
getgenv().hud:DestroyHud(true)
