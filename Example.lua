-- Get The Library Loadstring.
local HUD = loadstring(game:HttpGet("https://raw.githubusercontent.com/Uncsypn/SVillyTextGui/main/Source.lua"))()

-- Update HUD.
HUD:UpdateHud({
	Shadow = true,
	Logo = false,
	Enabled = true,
	Color = Color3.fromRGB(255,255,255),
	Font = Enum.Font.SourceSansBold,
	RichText = true,
	Text = UI:DualStrings(Color3.fromRGB(255,170,255), {LLabel = "SVilly", RLabel = "Hud"}),
})

-- Create HUD Item.
HUD:AddItem("Item", {
	Background = true,
	Shadow = true,
	Color = Color3.fromRGB(255, 170, 255),
	Font = Enum.Font.SourceSansBold,
	RichText = true,
	ZIndex = 1,
	Text = UI:DualStrings(Color3.fromRGB(0,255,255), {LLabel = "String1", RLabel = "String2"}),
})

-- Update HUD Item.
HUD:UpdateItem("Item", {
	Background = false,
	Shadow = false,
	Color = Color3.fromRGB(0, 170, 255),
	Font = Enum.Font.SourceSansBold,
	RichText = true,
	ZIndex = 2,
	Text = UI:DualStrings(Color3.fromRGB(255,255,0), {LLabel = "String3", RLabel = "String4"}),
})

-- Remove HUD Item.
HUD:RemoveItem("Item")

-- Destroy HUD.
HUD:DestroyHud()
