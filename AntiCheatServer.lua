-- Arquivo: AntiCheatServer (Script)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local AntiCheat = require(script.Parent:WaitForChild("AntiCheatModule"))

RunService.Stepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        local char = player.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local maxSpeed = AntiCheat:GetMaxSpeed(player)
                if humanoid.WalkSpeed > maxSpeed + 2 then
                    player:Kick("Speed hack detectado.")
                end

                if humanoid.JumpPower > AntiCheat:GetMaxJump() + 5 then
                    player:Kick("Jump hack detectado.")
                end

                if AntiCheat:IsFlying(char) then
                    player:Kick("Fly detectado.")
                end
            end
        end
    end
end)

local Remote = game.ReplicatedStorage:WaitForChild("GiveCoins")

Remote.OnServerEvent:Connect(function(player, amount)
    if typeof(amount) ~= "number" or amount > 100 then
        player:Kick("Tentativa de abuso de RemoteEvent.")
        return
    end
end)
