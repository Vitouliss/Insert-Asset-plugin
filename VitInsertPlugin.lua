local insertService = game:GetService("InsertService")

local coreGui = game:GetService("CoreGui")
local inputGui = script.Parent.inputGui

local toolbar = plugin:CreateToolbar("insertAsset")
toolbarButton = toolbar:CreateButton("Insert Menu", "Opens the insertAsset menu", "")

toolbarButton.Click:Connect(function()
	
	-- If the inputGui doesn't exist yet the plugin will insert it
	if(coreGui:FindFirstChild("inputGui")) then
		warn("inputGui already exists in coreGui.")
	else
		inputGui.Parent = coreGui
		print("inputGui opened")
	end
	
end)

-- insertAssetButton
inputGui.mainFrame.insertButton.MouseButton1Click:Connect(function()
	
	-- If the TextBox doesn't contain any text the plugin will not try inserting
	if(inputGui.mainFrame.inputBox.Text == "") then
		warn("inputId cannot be unspecified.")
	else
		
		local success, model = pcall(function()
			return insertService:LoadAsset(inputGui.mainFrame.inputBox.Text)
		end)
		
		if success then
			model.Parent = workspace
			model.Name = "ID: " .. inputGui.mainFrame.inputBox.Text
			model:MakeJoints()
			print("Model loaded, inserted into Workspace.")
		else
			warn("Model failed to load.")
		end
		
	end
	
end)

-- close gui button
inputGui.mainFrame.closeButton.MouseButton1Click:Connect(function()
	
	inputGui.Parent = script.Parent
	print("inputGui closed")
	
end)