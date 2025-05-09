-- Arquivo: AntiCheatModule (ModuleScript)
local AntiCheat = {}

function AntiCheat:GetMaxSpeed(player)
    local stats = player:FindFirstChild("leaderstats")
    if stats and stats:FindFirstChild("Level") then
        return math.clamp(stats.Level.Value, 1, 39)
    end
    return 16
end

function AntiCheat:GetMaxJump()
    return 50
end

function AntiCheat:IsFlying(char)
    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then return false end

    if humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        local touching = workspace:FindPartsInRegion3WithWhiteList(
            Region3.new(root.Position - Vector3.new(1, 4, 1), root.Position + Vector3.new(1, 0, 1)),
            {workspace.Terrain}, 1
        )
        return #touching == 0
    end
    return false
end

return AntiCheat
