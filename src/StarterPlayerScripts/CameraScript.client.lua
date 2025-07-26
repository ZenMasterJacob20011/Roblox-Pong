local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

player.CharacterAdded:Wait()
player.Character:WaitForChild("HumanoidRootPart")

camera.CameraSubject = player.Character.HumanoidRootPart
camera.CameraType = Enum.CameraType.Fixed
camera.FieldOfView = 40

local RunService = game:GetService("RunService")

local gameSurface = workspace.GameSurface
local startPosition = Vector3.new(-2, 15, -50)
local lookAtPosition = gameSurface.Position

camera.CFrame = CFrame.new(startPosition, lookAtPosition)

local function onUpdate()
end

RunService:BindToRenderStep("Camera", Enum.RenderPriority.Camera.Value, onUpdate)