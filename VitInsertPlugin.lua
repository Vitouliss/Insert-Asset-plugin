-- 

self = PluginManager():CreatePlugin()

toolbar = self:CreateToolbar('InsertObject')

toolbarbutton = toolbar:CreateButton('Insert Menu', 'Inserts a model/item','')

toolbarbutton.Click:connect(function()

  local Gui = 59219364
	local coreholder = game:GetService('CoreGui')

	b = game:GetService("InsertService"):LoadAsset(Gui):GetChildren()[1] --This will probably not load for most users anymore.

	b.Parent = coreholder -- CoreGui? Seems a bit crazy don't you think?
	b.Name = "InputGui"

	local gobutton = coreholder.InputGui.MainFrame.InsertButton
	if gobutton then
		local input = coreholder.InputGui.MainFrame.Input
		if input then
			local exit = coreholder.InputGui.MainFrame.Exit
			if exit then
				
				gobutton.MouseButton1Click:connect(function()
					i = game:GetService("InsertService"):LoadAsset(tostring(input.Text))
					i.Parent = game:GetService("Workspace")
					i.Name = "ID: "..input.Text
					i:MakeJoints() --Just in case...You may never know.
					b:Destroy()
				end)

				exit.MouseButton1Click:connect(function()
					exit.Parent.Parent:Destory()
				end)

			else
				error("Possibe bug: Insert Service could not load service");

			end
		end
	end

end) 
