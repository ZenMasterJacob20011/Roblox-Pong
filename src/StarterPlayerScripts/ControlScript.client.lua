local UserInputService = game:GetService("UserInputService");
local leftPlayerPart = game.Workspace:WaitForChild("LeftPlayer");
local gameSurface = game.Workspace:WaitForChild("GameSurface");
local inputEnded = false;
UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessedEvent: boolean)
	local function startMoveUp(speed: number)
		local function canMoveUp()
			return leftPlayerPart.Position.Y + (leftPlayerPart.Size.Y / 2) < gameSurface.Size.Y;
		end
		inputEnded = false
		while(inputEnded == false and canMoveUp()) do
			leftPlayerPart.Position += Vector3.new(0, speed, 0)
			task.wait(0.01)
		end
	end
	local function startMoveDown(speed: number)
		local function canMoveDown()
			return leftPlayerPart.Position.Y - (leftPlayerPart.Size.Y / 2) > 0;
		end
		inputEnded = false
		while(inputEnded == false and canMoveDown()) do
			leftPlayerPart.Position += Vector3.new(0, -speed, 0)
			task.wait(0.01)
		end
	end

	if input.KeyCode == Enum.KeyCode.W then
		startMoveUp(0.5)
	elseif input.KeyCode == Enum.KeyCode.S then
		startMoveDown(0.5)
	end
end)

UserInputService.InputEnded:Connect(function(input: InputObject, gameProcessedEvent: boolean)
	print(input.KeyCode.Name .. " ended")
	inputEnded = true
end)