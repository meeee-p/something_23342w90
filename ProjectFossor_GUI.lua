local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProjectFossor"
syn.protect_gui(ScreenGui)

local Container = Instance.new("Frame")
Container.AnchorPoint = Vector2.new(1, 0.5)
Container.Position = UDim2.fromScale(0.98, 0.5)
Container.Size = UDim2.fromScale(0.16, 0.7)
Container.BackgroundColor3 = Color3.fromRGB(35, 38, 47)
Container.Name = "Container"

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Container

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0.027, 0)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
UIListLayout.Parent = Container

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingBottom = UDim.new(0, 10)
UIPadding.PaddingLeft = UDim.new(0, 10)
UIPadding.PaddingRight = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 10)
UIPadding.Parent = Container

local frameTemplate = Instance.new("Frame")
frameTemplate.AnchorPoint = Vector2.new(0, 0)
frameTemplate.BackgroundColor3 = Color3.fromRGB(53, 60, 71)
frameTemplate.Size = UDim2.fromScale(1, 0.075)
UICorner:Clone().Parent = frameTemplate

local textLabelTemplate = Instance.new("TextLabel")
textLabelTemplate.Name = "Label"
textLabelTemplate.AnchorPoint = Vector2.new(0.5, 0.5)
textLabelTemplate.BackgroundTransparency = 1
textLabelTemplate.Position = UDim2.fromScale(0.5, 0.5)
textLabelTemplate.Size = UDim2.new(1, -15, 1, -10)
textLabelTemplate.Font = Enum.Font.Cartoon
textLabelTemplate.Text = ""
textLabelTemplate.TextColor3 = Color3.new(1, 1, 1)
textLabelTemplate.TextScaled = true
textLabelTemplate.TextWrapped = true
textLabelTemplate.TextXAlignment = Enum.TextXAlignment.Left
textLabelTemplate.TextYAlignment = Enum.TextYAlignment.Center
textLabelTemplate.Parent = frameTemplate

local FrameCount = frameTemplate:Clone()
FrameCount.Name = "FrameCount"
FrameCount.LayoutOrder = 1
FrameCount.Label.Text = "Frame: 0"
FrameCount.Parent = Container

local IsDead = frameTemplate:Clone()
IsDead.Name = "IsDead"
IsDead.LayoutOrder = 2
IsDead.Label.TextColor3 = Color3.new(0, 1, 0)
IsDead.Label.Text = "Humanoid: Alive"
IsDead.Parent = Container

local Velocity = frameTemplate:Clone()
Velocity.Name = "Velocity"
Velocity.LayoutOrder = 3
Velocity.Label.Text = "Velocity: (0,0,0)"
Velocity.Parent = Container

local IsJumping = frameTemplate:Clone()
IsJumping.Name = "IsJumping"
IsJumping.LayoutOrder = 4
IsJumping.Label.TextColor3 = Color3.new(1, 0, 0)
IsJumping.Label.Text = "Jumping: False"
IsJumping.Parent = Container

local Direction = frameTemplate:Clone()
Direction.Name = "Direction"
Direction.LayoutOrder = 5
Direction.Label.Text = "Direction: (0,0,0)"
Direction.Parent = Container

local IsShiftlocked = frameTemplate:Clone()
IsShiftlocked.Name = "IsShiftlocked"
IsShiftlocked.LayoutOrder = 6
IsShiftlocked.Label.TextColor3 = Color3.new(1, 0, 0)
IsShiftlocked.Label.Text = "Shiftlocked: False"
IsShiftlocked.Parent = Container

local Zoom = frameTemplate:Clone()
Zoom.Name = "Zoom"
Zoom.LayoutOrder = 7
Zoom.Label.Text = "Zoom: 12.5"
Zoom.Parent = Container

local MouseBehavior = frameTemplate:Clone()
MouseBehavior.Name = "MouseBehavior"
MouseBehavior.LayoutOrder = 8
MouseBehavior.Label.Text = "Behavior: Default"
MouseBehavior.Parent = Container

local MousePosition = frameTemplate:Clone()
MousePosition.Name = "MousePosition"
MouseBehavior.LayoutOrder = 8
MouseBehavior.Label.Text = "Position: (0,0)"
MouseBehavior.Parent = Container

local Mode = frameTemplate:Clone()
Mode.Name = "Mode"
Mode.LayoutOrder = 9
Mode.Label.Text = "Mode: Off"
Mode.Parent = Container

Container.Parent = ScreenGui

ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

print("[Project Fossor]: Done Loading GUI!")

return ScreenGui
