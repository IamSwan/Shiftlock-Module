local ShiftlockModule = {}

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")
local mouse = plr:GetMouse()

local CUSTOM_SHIFTLOCK_CURSOR = "rbxassetid://0"
--[[
	Make sure to replace the 0 by the id of your custom cursor
]]--

function ShiftlockModule:isLocked()
	return char:GetAttribute("Locked")
end

function ShiftlockModule:shiftlock(active)
	if active then -- enable shiftlock
		hum.CameraOffset = Vector3.new(1.75,0,0)
		hum.AutoRotate = false

		RunService:BindToRenderStep("ShiftLock", Enum.RenderPriority.Character.Value, function()
			UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
			char:SetAttribute("Locked", active)
			local _, y = workspace.CurrentCamera.CFrame.Rotation:ToEulerAnglesYXZ()
			root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0,y,0)
			mouse.Icon = CUSTOM_SHIFTLOCK_CURSOR
		end)
	else -- Disable it
		hum.AutoRotate = true
		hum.CameraOffset = Vector3.new(0,0,0)
		RunService:UnbindFromRenderStep("ShiftLock")
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		mouse.Icon = ""
		char:SetAttribute("Locked", active)
	end
	return active
end

return ShiftlockModule
