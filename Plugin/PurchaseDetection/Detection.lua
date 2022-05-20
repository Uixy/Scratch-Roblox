local playerId = game:GetService("StudioService"):GetUserId()
local GamepassId = 26751751
local UI = script.Parent.Parent.UI.RoScratch
local ownsGamepass = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(playerId, GamepassId)
if ownsGamepass == true then
	UI.ButtonsFrame.Visible = true
	UI.CodeFrame.Visible = true
	UI.MainFrame.Visible = true
	UI.PleasePurchase.Visible = false
	print("TRUE")
end
	if ownsGamepass == false then
	print("FALSE")
		end
