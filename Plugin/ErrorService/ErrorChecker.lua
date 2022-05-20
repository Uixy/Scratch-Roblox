local Eror = script.Parent.Parent.UI.RoScratch.ErrorBanner
local Ignorication = script.Parent.Parent.UI.RoScratch.ErrorBanner.TextButton
if game.Workspace.Baseplate.Transparency == 1 then
	Eror.Visible = true
	end
	function MouseEnter()
		Ignorication.Visible = true
	end
	function MouseLeave()
		Ignorication.Visible = true
	end
Ignorication.MouseEnter:connect(MouseEnter)
Ignorication.MouseLeave:connect(MouseLeave)
