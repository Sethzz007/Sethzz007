local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AntiCheat = require(script.Parent:WaitForChild("AntiCheatModule"))

-- Constantes
local CHECK_INTERVAL = 1
local SPEED_TOLERANCE = 2
local JUMP_TOLERANCE = 5
local REMOTE_MAX_AMOUNT = 100
local REMOTE_COOLDOWN = 2

-- Tabelas de controle
local lastCheck = 0
local warnings = {}
local remoteCooldowns = {}

-- Função auxiliar para avisos e kicks (com tolerância)
local function warnAndKick(player, reason)
    warnings[player] = (warnings[player] or 0) + 1
    if warnings[player] >= 2 then
        warn(player.Name .. " foi kickado. Motivo: " .. reason)
        player:Kick(reason)
    else
        warn(player.Name .. " recebeu aviso por: " .. reason)
    end
end

-- Checagem periódica de trapaça
RunService.Heartbeat:Connect(function(deltaTime)
    lastCheck = lastCheck + deltaTime
    if lastCheck >= CHECK_INTERVAL then
        lastCheck = 0
        for _, player in ipairs(Players:GetPlayers()) do
            local char = player.Character
            if char and char.Parent then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local maxSpeed = AntiCheat:GetMaxSpeed(player)
                    if humanoid.WalkSpeed > maxSpeed + SPEED_TOLERANCE then
                        warnAndKick(player, "Speed hack detectado.")
                    end
                    if humanoid.JumpPower > AntiCheat:GetMaxJump() + JUMP_TOLERANCE then
                        warnAndKick(player, "Jump hack detectado.")
                    end
                    if AntiCheat:IsFlying(char) then
                        warnAndKick(player, "Fly hack detectado.")
                    end
                end
            end
        end
    end
end)

-- Proteção do RemoteEvent
local Remote = ReplicatedStorage:WaitForChild("GiveCoins")

Remote.OnServerEvent:Connect(function(player, amount)
    if typeof(amount) ~= "number" or amount > REMOTE_MAX_AMOUNT then
        warnAndKick(player, "Tentativa de abuso de RemoteEvent: " .. tostring(amount))
        return
    end
    local now = tick()
    remoteCooldowns[player] = remoteCooldowns[player] or 0
    if now - remoteCooldowns[player] < REMOTE_COOLDOWN then
        warnAndKick(player, "Spam de RemoteEvent detectado.")
        return
    end
    remoteCooldowns[player] = now
    -- Código para conceder moedas ao jogador
end)

-- Limpeza de dados ao sair
Players.PlayerRemoving:Connect(function(player)
    warnings[player] = nil
    remoteCooldowns[player] = nil
end)