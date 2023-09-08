-- Get The Library Loadstring.
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Uncsypn/SVillyTextGui/main/Source.lua"))()

-- Updates The TextGui Properties.
UI:Refresh({
	Shadow = false, -- Logo Text's Shadow.
	Color = Color3.fromRGB(255, 255, 255), -- Logo Text's Color.
	Font = Enum.Font.GothamBold, -- Logo Text's Font.
	Text = "TEXTGUI", -- Logo Text's Text.
})

-- Add A New Item
UI:Add("Item", {
	Background = false, -- Item's Background.
	Shadow = true, -- Item's Shadow.
	Color = Color3.fromRGB(255, 255, 255), -- Item's Color.
	Font = Enum.Font.Gotham, -- Item's Text Font.
	Order = 0, -- Layout Order. (Higher Number Will Moves It Lower)
	Text = UI:DualStrings(Color3.fromRGB(255, 170, 255), {LLabel = "String1", RLabel = "String2"}), -- Item's Text.
})

-- Update An Existing Item (Same With The Add But Update)
UI:Update("Item", {
	Background = true,
	Shadow = false,
	Color = Color3.fromRGB(255, 170, 255),
	Font = Enum.Font.GothamBold,
	Order = 1,
	Text = UI:DualStrings(Color3.fromRGB(255, 255, 255), {LLabel = "String3", RLabel = "String4"}),
})

-- Remove The Item.
UI:Remove("Item")
