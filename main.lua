local jump = 0
local uis = game:GetService("UserInputService")

function traverse(instance)
    for _,child in ipairs(instance:GetChildren()) do
		if child:IsA("ProximityPrompt") then
			child.HoldDuration = 0
			print(child.HoldDuration)
		end
        traverse(child)
    end
end

uis.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
		if jump > 0 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, jump, 0)
		end
    end
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Steel a Brainrot V1", "DarkTheme")

local Main = Window:NewTab("Main")
local Move = Window:NewTab("Move")
local Esp = Window:NewTab("Esp")
local Scripts = Window:NewTab("Scripts")
local GUI = Window:NewTab("GUI")
local Creator = Window:NewTab("Creator")

local MainSection = Main:NewSection("Main")
local MoveSection = Move:NewSection("Move")
local EspSection = Esp:NewSection("Esp")
local ScriptSection = Scripts:NewSection("Scripts")
local GUISection = GUI:NewSection("GUI")
local CreatorSection = Creator:NewSection("Creator: ArbuzikNew")

-- MAIN --
MainSection:NewButton("Rejoin", "Rejoin To This Server", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

MainSection:NewToggle("Self Lock Time", "Showing Self Base Lock Time", function(state)
	if state then
		local ScreenGui = Instance.new("ScreenGui")
		local Frame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local TextLabel = Instance.new("TextLabel")

		ScreenGui.Name = "Lock Time"
		ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		Frame.Parent = ScreenGui
		Frame.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.5, -75, 0, 0)
		Frame.Size = UDim2.new(0, 150, 0, 50)

		UICorner.Parent = Frame

		TextLabel.Parent = Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0, 25, 0, 0)
		TextLabel.Size = UDim2.new(0, 100, 0, 50)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.Text = "Lock Time: ?"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 28.000

		coroutine.wrap(function()
			while task.wait(0.25) do
				pcall(function()
					local plot = nil

					for _,pl in ipairs(game:GetService("Workspace").Plots:GetChildren()) do
						local text = pl.PlotSign.SurfaceGui.Frame.TextLabel.Text
						if text:find(game:GetService("Players").LocalPlayer.Name) then
							plot = pl
							break
						end
					end

					if plot ~= nil then
						TextLabel.Text = "Lock Time: " .. plot.Purchases.PlotBlock.Main.BillboardGui.RemainingTime.Text
					end
				end)
			end
		end)()
	else
		if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Lock Time") then
			game:GetService("Players").LocalPlayer.PlayerGui["Lock Time"]:Destroy()
		end
	end
	
end)

-- MOVE --
MoveSection:NewSlider("Jump Boost", "MORE!!!", 250, 0, function(value)
	jump = value
end)

-- ESP --
EspSection:NewToggle("Base Esp", "Showing Lock Time Base", function(state)
	if state then
		for _,plot in ipairs(game:GetService("Workspace").Plots:GetChildren()) do
			local main = plot.PlotSign
			local BillboardGui = Instance.new("BillboardGui")
			BillboardGui.Name = "Esp"
			BillboardGui.Parent = main
			BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			BillboardGui.Active = true
			BillboardGui.AlwaysOnTop = true
			BillboardGui.LightInfluence = 1
			BillboardGui.Size = UDim2.new(0, 200, 0, 50)
			BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
			local TextLabel = Instance.new("TextLabel")
			TextLabel.Parent = BillboardGui
			TextLabel.Active = true
			TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			TextLabel.BackgroundTransparency = 1
			TextLabel.Size = UDim2.new(0, 200, 0, 1)
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.Text = "Lock Time: " .. plot.Purchases.PlotBlock.Main.BillboardGui.RemainingTime.Text
			TextLabel.TextColor3 = Color3.new(0.6, 0.6, 0.6)
			TextLabel.TextScaled = false
			TextLabel.TextStrokeTransparency = 0
			TextLabel.TextSize = 24
			TextLabel.TextWrapped = true
			local TextLabel1 = Instance.new("TextLabel")
			TextLabel1.Parent = BillboardGui
			TextLabel1.Active = true
			TextLabel1.BackgroundColor3 = Color3.new(1, 1, 1)
			TextLabel1.BackgroundTransparency = 1
			TextLabel1.Size = UDim2.new(0, 200, 0, 50)
			TextLabel1.Font = Enum.Font.SourceSans
			TextLabel1.Text = plot.PlotSign.SurfaceGui.Frame.TextLabel.Text
			TextLabel1.TextColor3 = Color3.new(0.6, 0.6, 0.6)
			TextLabel1.TextScaled = false
			TextLabel1.TextStrokeTransparency = 0
			TextLabel1.TextSize = 24
			TextLabel1.TextWrapped = true
			coroutine.wrap(function()
				while task.wait(0.25) do
					TextLabel.Text = "Lock Time: " .. plot.Purchases.PlotBlock.Main.BillboardGui.RemainingTime.Text
					TextLabel1.Text = plot.PlotSign.SurfaceGui.Frame.TextLabel.Text
				end
			end)()
		end
	else
		for _,plot in ipairs(game:GetService("Workspace").Plots:GetChildren()) do
			local main = plot.PlotSign
			main.Esp:Destroy()
		end
	end
end)

-- SCRIPTS --
ScriptSection:NewButton("Dex 4", "Dex V4", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Arbuzik-New/Steeal-a-Brainrot/refs/heads/main/dex.lua", true))()
end)

ScriptSection:NewButton("Infinite Yield", "Infinite Yield", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
end)

-- GUI --
GUISection:NewKeybind("Toggle GUI", "Toggle GUI", Enum.KeyCode.L, function()
	Library:ToggleUI()
end)
