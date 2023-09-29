-- Define Library.
local Library = require(script:WaitForChild("ModuleScript"))

-- Update Window.
Library:Refresh({
	Enabled = true,
	Watermark = true,
	PadLine = true,
	Shadow = true,
	Padding = 0,
	Text = Library:DualStrings(Color3.fromRGB(85, 85, 85), {LLabel = "Raycat"}),
	Font = Enum.Font.GothamBold,
	Color = Color3.fromRGB(255, 255, 255),
})

-- Add Item.
Library:Add("Item", {
	Text = Library:DualStrings(Color3.fromRGB(255, 255, 255), {LLabel = "LeftStr", RLabel = "RightStr"}),
	Color = Color3.new(1, 0, 0),
	Font = Enum.Font.SourceSans,
	StrokeShadow = false,
	Background = true,
	Shadow = false,
	Smooth = true,
})

-- Update Item.
Library:Update("Item", {
	Text = Library:DualStrings(Color3.fromRGB(255, 0, 0), {LLabel = "OnlyStr"}),
	Color = Color3.new(1, 1, 1),
	Font = Enum.Font.SourceSansBold,
	StrokeShadow = true,
	Background = false,
	Shadow = true,
	Smooth = false,
})

-- Remove Item.
Library:Remove("Item", {
	Smooth = true,
})

-- Remove All Items.
Library:RemoveAll({Smooth = true})

-- Auto LayoutOrder.
Library:AutoUpdateLayout(true)
