self = PluginManager():CreatePlugin()

toolbar = self:CreateToolbar("InsertObject")

toolbarbutton = toolbar:CreateButton("Insert Menu","Inserts An Item","")

toolbarbutton.Click:connect(function()


local gui = 59219364

b = game:GetService("InsertService"):LoadAsset(gui):GetChildren()[1] --This will probably not load for most users.

b.Parent = game.CoreGui
b.Name = "InputGui"

local gobutton = game.CoreGui.InputGui.MainFrame.InsertButton
if gobutton then
local input = game.CoreGui.InputGui.MainFrame.Input
if input then
local exit = game.CoreGui.InputGui.MainFrame.Exit
if exit then

gobutton.MouseButton1Click:connect(function()

i = game:GetService("InsertService"):LoadAsset(tostring(input.Text))
i.Parent = game:GetService("Workspace")
i.Name = "ID: "..input.Text
i:MakeJoints() --Just in case...You may never know.
b:Destroy()
end)

exit.MouseButton1Click:connect(function()
exit.Parent.Parent:Destroy()
end)

else
print("TRRRRRRRRRRRRRRROOOOOOOOOOOOLLLLLLLLLOOOO")
end
end
end 

end)
