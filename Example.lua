-- Get The Library Loadstring.
local HUD = loadstring(game:HttpGet("https://raw.githubusercontent.com/Uncsypn/SVillyTextGui/main/Source.lua"))()

-- Update HUD.
UpdateHud({
	Shadow = true,
	Logo = false,
	Enabled = true,
	Color = Color3.fromRGB(255,255,255),
	Font = Enum.Font.SourceSansBold,
	RichText = true,
	Text = string.format("%s <font color='%s'>%s</font>", "SVilly", ToFormat(Color3.fromRGB(255, 170, 255)), "Hud")
})

-- Create HUD Item.
AddItem("Item", {
	Background = true,
	Shadow = true,
	Color = Color3.fromRGB(255, 170, 255),
	Font = Enum.Font.SourceSansBold,
	RichText = true,
	Text = string.format("%s <font color='%s'>%s</font>", "String1", ToFormat(Color3.fromRGB(255, 255, 255)), "String2")
})

-- Update HUD Item.
UpdateItem("Item", {
	Background = false,
	Shadow = false,
	Color = Color3.fromRGB(0, 170, 255),
	Font = Enum.Font.SourceSansBold,
	RichText = true,
	Text = string.format("%s <font color='%s'>%s</font>", "String3", ToFormat(Color3.fromRGB(255, 255, 255)), "String4")
})

-- Remove HUD Item.
RemoveItem("Speed")

-- Destroy HUD.
getgenv().hud:DestroyHud(true)
