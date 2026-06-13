local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local infinityJump = false

-- tombol ON/OFF (tekan J)
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end

	if input.KeyCode == Enum.KeyCode.J then
		infinityJump = not infinityJump

		if infinityJump then
			humanoid.JumpPower = 200 -- super tinggi
			humanoid.UseJumpPower = true
			print("Super Jump ON")
		else
			humanoid.JumpPower = 50 -- normal
			print("Super Jump OFF")
		end
	end
end)

-- biar tetap aktif kalau respawn
player.CharacterAdded:Connect(function(char)
	char:WaitForChild("Humanoid").JumpPower = infinityJump and 200 or 50
end)
