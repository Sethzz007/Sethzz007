local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local AntiCheat = require(script.Parent:WaitForChild("AntiCheatModule"))

local lastCheck = 0

RunService.Stepped:Connect(function(_, deltaTime)
    lastCheck = lastCheck + deltaTime
    if lastCheck >= 1 then -- Verifica a cada 1 segundo
        lastCheck = 0
        for _, player in ipairs(Players:GetPlayers()) do
            local char = player.Character
            if char and char.Parent then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local maxSpeed = AntiCheat:GetMaxSpeed(player)
                    if humanoid.WalkSpeed > maxSpeed + 2 then
                        warn(player.Name .. " foi detectado com Speed hack.")
                        player:Kick("Speed hack detectado.")
                    end

                    if humanoid.JumpPower > AntiCheat:GetMaxJump() + 5 then
                        warn(player.Name .. " foi detectado com Jump hack.")
                        player:Kick("Jump hack detectado.")
                    end

                    if AntiCheat:IsFlying(char) then
                        warn(player.Name .. " foi detectado com Fly hack.")
                        player:Kick("Fly detectado.")
                    end
                end
            end
        end
    end
end)

local Remote = game.ReplicatedStorage:WaitForChild("GiveCoins")

Remote.OnServerEvent:Connect(function(player, amount)
    if typeof(amount) ~= "number" or amount > 100 then
        warn(player.Name .. " tentou abusar do RemoteEvent com valor: " .. tostring(amount))
        player:Kick("Tentativa de abuso de RemoteEvent.")
        return
    end

    -- Código para conceder moedas ao jogador, se necessário
end)