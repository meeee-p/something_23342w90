local LocalPlayer = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Camera = game.Workspace.CurrentCamera

local Checkpoints = {}
local hidingCheckpoints = true

local Character
Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local function teleportPlayer()
	local hrp, hum = Character:WaitForChild("HumanoidRootPart"), Character:WaitForChild("Humanoid")
	if not (hrp and hum) then warn("Unable to teleport player because no \"HumanoidRootPart\" or \"Humanoid.\"") end

	local checkpointData = Checkpoints[#Checkpoints]

	hrp.CFrame = checkpointData[1]
	hum:ChangeState(checkpointData[2])
	Camera.CFrame = checkpointData[3]
	Camera.Focus = checkpointData[4]
	Camera.CameraType = Enum.CameraType.Custom
	Camera.CameraSubject = hum

	task.wait(task.wait())
	if Camera.CFrame ~= checkpointData[3] then
		Camera.CFrame = checkpointData[3]
		Camera.Focus = checkpointData[4]
		Camera.CameraType = Enum.CameraType.Custom
		Camera.CameraSubject = hum
	end
end

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
	Character = newCharacter
	
	if #Checkpoints > 0 then
		teleportPlayer()
	end
end)

local function makePart(hrpCF)
	local part = Instance.new("Part")
	part.CFrame = hrpCF
	part.Name = "Checkpoint"
	part.Transparency = hidingCheckpoints and 1 or 0.25
	part.Size = Vector3.new(2.05, 2.05, 1.05)
	part.TopSurface = Enum.SurfaceType.Smooth
	part.Color = Color3.new(1,0,0)
	part.CanCollide = false
	part.Anchored = true
	part.Parent = game.Workspace
	
	return part
end

local function addCheckpoint()
	if Character then
		local hrp, hum = Character:FindFirstChild("HumanoidRootPart"), Character:FindFirstChild("Humanoid")
		if not (hrp and hum) then warn("Unable to place checkpoint because no HumanoidRootPart or Humanoid.") end
		
		local hrpCF = hrp.CFrame
		local humState = hum:GetState()
		local cameraCF = Camera.CFrame
		local camFocus = Camera.Focus
		local part = makePart(hrpCF)
		
		table.insert(Checkpoints, 
			{
				hrpCF,
				humState,
				cameraCF,
				camFocus,
				part,
			}
		)
	end
end

local function removeCheckpoint()
	if #Checkpoints > 0 then
		Checkpoints[#Checkpoints][5]:Destroy()
		table.remove(Checkpoints, #Checkpoints)
	end
end

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	
	if input.KeyCode == Enum.KeyCode.T then
		addCheckpoint()
	elseif input.KeyCode == Enum.KeyCode.M then
		removeCheckpoint()
	
	
	elseif input.KeyCode == Enum.KeyCode.R then
		teleportPlayer()
	elseif input.KeyCode == Enum.KeyCode.K then
		hidingCheckpoints = not hidingCheckpoints
		
		print(Checkpoints)
		
		for i=1,#Checkpoints do
			Checkpoints[i][5].Transparency = hidingCheckpoints and 1 or 0.25
		end
 	end
end)
