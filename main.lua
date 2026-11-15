-- Wait for the game to fully load
if not game:IsLoaded() then
    game.Loaded:Wait()
end

print("Game loaded, skipping...")
wait(1)
print("🩻")

local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VIM = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local playerGui = player:WaitForChild("PlayerGui")

-- Safely wait for nested Intro UI elements to replicate
local intro = playerGui:WaitForChild("Intro", 30)
local container = intro and intro:WaitForChild("Container", 30)
local safeContent = container and container:WaitForChild("SafeContent", 30)
local skipVote = safeContent and safeContent:WaitForChild("SkipVote", 30)
local introFire = skipVote and skipVote:WaitForChild("ActualButton", 30)

if not introFire then
    warn("Skip button could not be found.")
    return
end

local function tapIntroFire(holdTime)
    holdTime = holdTime or 1
    local pos = introFire.AbsolutePosition + introFire.AbsoluteSize / 2
    local inset = GuiService:GetGuiInset()
    local x, y = pos.X + inset.X, pos.Y + inset.Y

    VIM:SendTouchEvent(1, 0, x, y) -- begin
    task.wait(holdTime)
    VIM:SendTouchEvent(1, 2, x, y) -- end
end

tapIntroFire()

function firegun(token)
    local suspectsFolder = workspace.Game.NPCS.Suspects
    
    for _, suspect in ipairs(suspectsFolder:GetChildren()) do
        local humanoid = suspect:FindFirstChild("Humanoid")
        
        if humanoid then
            local args = {
                [1] = game:GetService("Players").LocalPlayer.Character.MP5,
                [2] = humanoid,
                [3] = 18.15108871459961,
                [4] = 2,
                [5] = {
                    ["SlideLock"] = false,
                    ["Jammed"] = false,
                    ["ShootType"] = 3,
                    ["CanBreak"] = false,
                    ["InfraRed"] = false,
                    ["Ammo"] = 30,
                    ["EnableHUD"] = true,
                    ["DamageFallOf"] = 1.75,
                    ["ShootRate"] = 800,
                    ["IgnoreProtection"] = false,
                    ["SlideEx"] = CFrame.new(0, 0, -0.30000001192092896) * CFrame.Angles(-0, 0, -0),
                    ["EnableZeroing"] = true,
                    ["BarrelAtt"] = "",
                    ["LimbDamage"] = {
                        [1] = 20,
                        [2] = 24
                    },
                    ["TracerEveryXShots"] = 3,
                    ["MaxStoredAmmo"] = 210,
                    ["IncludeChamberedBullet"] = true,
                    ["Zoom"] = 60,
                    ["RandomTracer"] = {
                        ["Enabled"] = false,
                        ["Chance"] = 25
                    },
                    ["TracerColor"] = nil, --[[Color3]]
                    ["BulletFlare"] = false,
                    ["UnderBarrelAtt"] = "",
                    ["Tracer"] = true,
                    ["StoredAmmo"] = 90,
                    ["SightAtt"] = "",
                    ["CenterDot"] = true,
                    ["BulletDrop"] = 0.25,
                    ["MinSpread"] = 1.75,
                    ["BulletPenetration"] = 62.5,
                    ["CanCheckMag"] = true,
                    ["MuzzleVelocity"] = 1250,
                    ["BulletType"] = "9x19mm",
                    ["AimRecoilReduction"] = 4,
                    ["TorsoDamage"] = {
                        [1] = 36,
                        [2] = 38
                    },
                    ["ShellInsert"] = false,
                    ["MinDamage"] = 5,
                    ["gunRecoil"] = {
                        ["gunRecoilTilt"] = {
                            [1] = 1,
                            [2] = 3
                        },
                        ["gunRecoilUp"] = {
                            [1] = 3,
                            [2] = 5
                        },
                        ["gunRecoilLeft"] = {
                            [1] = 1,
                            [2] = 3
                        },
                        ["gunRecoilRight"] = {
                            [1] = 1,
                            [2] = 3
                        }
                    },
                    ["BurstShot"] = 3,
                    ["ZeroIncrement"] = 50,
                    ["RecoilPowerStepAmount"] = 0.05,
                    ["MinRecoilPower"] = 0.25,
                    ["WalkMult"] = 0,
                    ["AimInaccuracyDecrease"] = 0.25,
                    ["MaxSpread"] = 100,
                    ["CrossHair"] = true,
                    ["AmmoInGun"] = 30,
                    ["AimSpreadReduction"] = 1,
                    ["MaxRecoilPower"] = 1.25,
                    ["camRecoil"] = {
                        ["camRecoilUp"] = {
                            [1] = 1,
                            [2] = 2
                        },
                        ["camRecoilRight"] = {
                            [1] = 0,
                            [2] = 2
                        },
                        ["camRecoilLeft"] = {
                            [1] = 0,
                            [2] = 2
                        },
                        ["camRecoilTilt"] = {
                            [1] = 1,
                            [2] = 2
                        }
                    },
                    ["gunName"] = "MP5",
                    ["HeadDamage"] = {
                        [1] = 110,
                        [2] = 110
                    },
                    ["Zoom2"] = 60,
                    ["MagCount"] = true,
                    ["MaxZero"] = 200,
                    ["AimInaccuracyStepAmount"] = 1,
                    ["CurrentZero"] = 0,
                    ["canAim"] = true,
                    ["OtherAtt"] = "",
                    ["RainbowMode"] = false,
                    ["CanBreachDoor"] = false,
                    ["FireModes"] = {
                        ["Auto"] = true,
                        ["Burst"] = false,
                        ["ChangeFiremode"] = true,
                        ["Semi"] = true
                    },
                    ["CrosshairOffset"] = 0,
                    ["Bullets"] = 1,
                    ["Type"] = "Gun"
                },
                [6] = {
                    ["SpreadRM"] = 1,
                    ["RecoilPowerStepAmount"] = 1,
                    ["Zoom2Value"] = 60,
                    ["MaxSpread"] = 1,
                    ["MinRecoilPower"] = 1,
                    ["DamageMod"] = 1,
                    ["gunRecoilMod"] = {
                        ["RecoilRight"] = 1,
                        ["RecoilLeft"] = 1,
                        ["RecoilTilt"] = 1,
                        ["RecoilUp"] = 1
                    },
                    ["MaxRecoilPower"] = 1,
                    ["AimInaccuracyStepAmount"] = 1,
                    ["WalkMult"] = 1,
                    ["MuzzleVelocity"] = 1,
                    ["adsTime"] = 1,
                    ["minDamageMod"] = 1,
                    ["ZoomValue"] = 60,
                    ["MinSpread"] = 1,
                    ["AimInaccuracyDecrease"] = 1,
                    ["camRecoilMod"] = {
                        ["RecoilRight"] = 1,
                        ["RecoilLeft"] = 1,
                        ["RecoilUp"] = 1,
                        ["RecoilTilt"] = 1
                    },
                    ["AimRM"] = 1
                },
                [9] = token,
                [10] = 1
            }

            game:GetService("ReplicatedStorage").Storage.ACS.ACS_Engine.Events.Damage:InvokeServer(unpack(args))
        end
    end
end


local player = game.Players.LocalPlayer
local suspects = game.Workspace.Game.NPCS.Suspects
local camera = workspace.CurrentCamera

local function teleportAndLook(dist)
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    local target = suspects:GetChildren()[1]
    
    if root and target then

        target:PivotTo(root.CFrame * CFrame.new(0, 0, -(dist or 5)) * CFrame.Angles(0, math.pi, 0))
        
        local suspectRoot = target:FindFirstChild("HumanoidRootPart") or target.PrimaryPart
        if suspectRoot then
            camera.CFrame = CFrame.lookAt(camera.CFrame.Position, suspectRoot.Position)
        end
    end
end

teleportAndLook(5)
wait(1)
print("HELLOLLLLLLOL<<O<O<,odfsenojdsfgnlk;jdsds;lk")
------
-- Safely wait for MobileControls to replicate after spawning in-game
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VIM = game:GetService("VirtualInputManager")

local localPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- Safely wait for MobileControls to replicate after spawning in-game
local mobileControls = playerGui:WaitForChild("MobileControls", 30)
local mobileContainer = mobileControls and mobileControls:WaitForChild("Container", 30)
local fireButton = mobileContainer and mobileContainer:WaitForChild("Fire", 30)

if not fireButton then
    warn("Mobile Fire button could not be found.")
    return
end

local function tapGameFire(holdTime)
    holdTime = holdTime or 0.30
    local pos = fireButton.AbsolutePosition + fireButton.AbsoluteSize / 2
    local inset = GuiService:GetGuiInset()
    local x, y = pos.X + inset.X, pos.Y + inset.Y

    VIM:SendTouchEvent(1, 0, x, y)  -- begin
    task.wait(holdTime)
    VIM:SendTouchEvent(1, 2, x, y)  -- end
end

tapGameFire()
tapGameFire()
teleportAndLook(5)
tapGameFire()
tapGameFire()
tapGameFire()
tapGameFire()
-----

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local damageRemote = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("ACS"):WaitForChild("ACS_Engine"):WaitForChild("Events"):WaitForChild("Damage")

getgenv().token = nil
local captured = false

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    
    -- Only intercept if we haven't captured the token yet
    if not captured and self == damageRemote and method == "InvokeServer" then
        local args = {...}
        getgenv().token = args[9] 
        print(tostring(args[9]) .. " 🌱")
        captured = true -- Disables future interception
    end
    
    setnamecallmethod(method)
    return oldNamecall(self, ...)
end)

repeat task.wait() until getgenv().token ~= nil
local myToken = getgenv().token
--⋆༺𓆩☠𓆪༻⋆:
print(tostring(myToken).." 🧿")

local suspectsFolder = workspace.Game.NPCS.Suspects

-- Function to check if any suspect is still alive
local function hasLivingSuspects()
    for _, suspect in ipairs(suspectsFolder:GetChildren()) do
        local humanoid = suspect:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health > 0 then
            return true -- Found someone still alive
        end
    end
    return false -- Everyone is dead/0 health
end

-- Loop continues firing until all suspects have 0 health
while hasLivingSuspects() do
    firegun(myToken)
    task.wait()
end


--------
print("Time to rob 💸")



local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera

local GameFolder = Workspace:WaitForChild("Game")
local Scriptable = GameFolder:WaitForChild("Scriptable")

local HOLD_BUFFER = 0.15      -- extra time added on top of HoldDuration
local REPLICATE_WAIT = 0.4    -- time for the server to receive the teleport
local STAND_OFFSET = Vector3.new(0, 3, 3)
local FOLLOW_DISTANCE = 3     -- studs behind the civilian while following
local MAX_PASSES = 5          -- max retry passes over the civilians

------------------------------------------------------------
-- Helpers
------------------------------------------------------------
local function getChar()
	return player.Character or player.CharacterAdded:Wait()
end

local function getRoot()
	return getChar():WaitForChild("HumanoidRootPart")
end

local function getHumanoid()
	return getChar():WaitForChild("Humanoid")
end

local function disableLineOfSight()
	for _, obj in ipairs(GameFolder:GetDescendants()) do
		if obj:IsA("ProximityPrompt") then
			obj.RequiresLineOfSight = false
		end
	end
end

local function getPromptPosition(prompt)
	local parent = prompt.Parent
	if parent:IsA("Attachment") then
		return parent.WorldPosition
	elseif parent:IsA("BasePart") then
		return parent.Position
	end
	local part = parent:FindFirstAncestorWhichIsA("BasePart")
	return part and part.Position
end

------------------------------------------------------------
-- Freeze (no anchoring, so teleports replicate)
------------------------------------------------------------
local saved = {}

local function freezePlayer()
	local hum = getHumanoid()
	saved.WalkSpeed = hum.WalkSpeed
	saved.JumpHeight = hum.JumpHeight
	saved.JumpPower = hum.JumpPower
	hum.WalkSpeed = 0
	hum.JumpHeight = 0
	hum.JumpPower = 0
end

local function unfreezePlayer()
	local hum = getHumanoid()
	hum.WalkSpeed = saved.WalkSpeed or 16
	hum.JumpHeight = saved.JumpHeight or 7.2
	hum.JumpPower = saved.JumpPower or 50
end

------------------------------------------------------------
-- Teleport + camera
------------------------------------------------------------
local function teleportTo(position, lookAtPos)
	local root = getRoot()
	local standPos = position + STAND_OFFSET
	root.CFrame = CFrame.lookAt(standPos, Vector3.new(lookAtPos.X, standPos.Y, lookAtPos.Z))
	root.AssemblyLinearVelocity = Vector3.zero
	root.AssemblyAngularVelocity = Vector3.zero
	return root
end

local function aimCamera(targetPos)
	camera.CameraType = Enum.CameraType.Scriptable
	local origin = getRoot().Position + Vector3.new(0, 1.5, 0)
	camera.CFrame = CFrame.lookAt(origin, targetPos)
end

local function releaseCamera()
	camera.CameraType = Enum.CameraType.Custom
end

------------------------------------------------------------
-- Main prompt trigger (static targets)
------------------------------------------------------------
local function triggerPrompt(prompt, teleportPos)
	if not prompt or not prompt:IsA("ProximityPrompt") then
		warn("Invalid prompt:", prompt)
		return false
	end

	prompt.RequiresLineOfSight = false
	prompt.Enabled = true

	local promptPos = getPromptPosition(prompt)
	if not promptPos then
		warn("No position for prompt:", prompt:GetFullName())
		return false
	end

	-- 1. Teleport while unfrozen so the server receives the new position
	teleportTo(teleportPos or promptPos, promptPos)
	aimCamera(promptPos)
	task.wait(REPLICATE_WAIT)

	-- 2. Freeze in place (WalkSpeed/Jump only, no anchoring)
	freezePlayer()

	-- 3. Hold for the prompt's own duration
	prompt:InputHoldBegin()
	task.wait(prompt.HoldDuration + HOLD_BUFFER)
	prompt:InputHoldEnd()

	-- 4. Release
	task.wait(0.1)
	unfreezePlayer()
	releaseCamera()
	return true
end

------------------------------------------------------------
-- Civilians: follow a moving NPC while holding its prompt
------------------------------------------------------------
local ShoutRemote = ReplicatedStorage:WaitForChild("Storage")
	:WaitForChild("Remotes")
	:WaitForChild("NPC")
	:WaitForChild("RequestShout")

local function getCivilianPrompt(civ)
	local hrp = civ:FindFirstChild("HumanoidRootPart")
	return hrp and hrp:FindFirstChild("CivilianRestrainPrompt"), hrp
end

-- A civilian counts as secured when its prompt is gone or disabled
local function isSecured(civ)
	if not civ.Parent then return true end
	local prompt = getCivilianPrompt(civ)
	return (not prompt) or (not prompt.Enabled)
end

local function followAndHold(civ)
	local prompt, civRoot = getCivilianPrompt(civ)
	if not prompt or not civRoot then return false end

	prompt.RequiresLineOfSight = false
	prompt.Enabled = true

	-- Shout at this civilian (remote takes the NPC model)
	pcall(function()
		ShoutRemote:FireServer(civ)
	end)

	local root = getRoot()

	-- Stick to the civilian every frame: stand behind it, camera locked on it
	local function updatePosition()
		if not civRoot.Parent then return end
		local pos = (civRoot.CFrame * CFrame.new(0, 0, FOLLOW_DISTANCE)).Position
		root.CFrame = CFrame.lookAt(pos, Vector3.new(civRoot.Position.X, pos.Y, civRoot.Position.Z))
		root.AssemblyLinearVelocity = Vector3.zero
		camera.CameraType = Enum.CameraType.Scriptable
		camera.CFrame = CFrame.lookAt(root.Position + Vector3.new(0, 1.5, 0), civRoot.Position)
	end

	local conn = RunService.Heartbeat:Connect(updatePosition)

	-- Let the position replicate before pressing
	task.wait(REPLICATE_WAIT)
	freezePlayer()

	prompt:InputHoldBegin()
	task.wait(prompt.HoldDuration + HOLD_BUFFER)
	prompt:InputHoldEnd()

	task.wait(0.1)
	conn:Disconnect()
	unfreezePlayer()
	releaseCamera()
	return true
end

local function secureCivilians()
	local civilians = GameFolder:WaitForChild("NPCS"):WaitForChild("Civilians")

	for pass = 1, MAX_PASSES do
		local remaining = 0

		for _, civ in ipairs(civilians:GetChildren()) do
			if not isSecured(civ) then
				remaining += 1
				followAndHold(civ)
			end
		end

		if remaining == 0 then
			print("All civilians secured")
			return
		end

		task.wait(0.5)  -- let the server update prompt states before re-checking
	end

	warn("Some civilians may not be secured after " .. MAX_PASSES .. " passes")
end

------------------------------------------------------------
-- Sequence
------------------------------------------------------------
disableLineOfSight()

-- 1. Entrance gate
do
	local control = Scriptable.EntranceGate.Control
	triggerPrompt(control:WaitForChild("ProximityPrompt"), control.Position)
end

-- 2. Cellphone hang up
do
	local outline = Scriptable.Cellphone.Outline
	local prompt = outline:WaitForChild("SoundEmitter"):WaitForChild("HangUpPrompt")
	triggerPrompt(prompt, outline.Position)
end

-- 3. Evidence
for _, obj in ipairs(GameFolder.Evidence:GetDescendants()) do
	if obj:IsA("ProximityPrompt") then
		triggerPrompt(obj, getPromptPosition(obj))
	end
end

-- 4. Mansion bomb
do
	local base = Scriptable.MansionBomb.Base
	local prompt = base:WaitForChild("SoundEmitter"):WaitForChild("DisarmPrompt")
	triggerPrompt(prompt, base.Position)
end

-- 5. Secure all civilians (last)

print("👑")



local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local VIM = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local fire = player.PlayerGui.MobileControls.Container.Shout
local civilians = workspace:WaitForChild("Game"):WaitForChild("NPCS"):WaitForChild("Civilians")

local STAND_DISTANCE = 2
local SETTLE_TIME = 0.2
local AFTER_TIME = 0.2
local MIN_PASSES = 2        -- always do at least this many full passes
local PASS_DELAY = 0.5      -- wait between passes
local SKIP_DISABLED = false -- true = skip civilians whose prompt is disabled

local TARGET_COLOR = {104, 220, 132}

-- Completion check: objective text color matches
local function objectiveDone()
    local ok, result = pcall(function()
        local gui = player.PlayerGui
        local label = gui.Main.Container.Objectives.ActualObjectives
            :FindFirstChild("Objective_SecureCivilians")
        label = label and label:FindFirstChild("ObjectiveText")
        if not label then return false end
        local c = label.TextColor3
        return math.round(c.R * 255) == TARGET_COLOR[1]
            and math.round(c.G * 255) == TARGET_COLOR[2]
            and math.round(c.B * 255) == TARGET_COLOR[3]
    end)
    return ok and result
end

local function tapFire(holdTime)
    holdTime = holdTime or 0.05
    local pos = fire.AbsolutePosition + fire.AbsoluteSize / 2
    local inset = GuiService:GetGuiInset()
    local x, y = pos.X + inset.X, pos.Y + inset.Y
    VIM:SendTouchEvent(1, 0, x, y)
    task.wait(holdTime)
    VIM:SendTouchEvent(1, 2, x, y)
end

local target      -- NPC HumanoidRootPart being tracked
local pinCFrame   -- where we want the player to stay

-- Every frame: pin the player and put the camera at the head looking at the NPC
RunService:BindToRenderStep("CivilianLock", Enum.RenderPriority.Camera.Value + 1, function()
    local char = player.Character
    local myRoot = char and char:FindFirstChild("HumanoidRootPart")
    local head = char and char:FindFirstChild("Head")
    if not (target and target.Parent and myRoot and head and pinCFrame) then return end

    char:PivotTo(pinCFrame)
    myRoot.AssemblyLinearVelocity = Vector3.zero
    myRoot.AssemblyAngularVelocity = Vector3.zero

    for _, d in ipairs(char:GetDescendants()) do
        if d:IsA("BasePart") then
            d.LocalTransparencyModifier = 1
        end
    end

    camera.CameraType = Enum.CameraType.Scriptable
    camera.CFrame = CFrame.lookAt(head.Position, target.Position)
end)

local function stopTracking()
    target, pinCFrame = nil, nil
    pcall(function() RunService:UnbindFromRenderStep("CivilianLock") end)

    local char = player.Character
    if char then
        for _, d in ipairs(char:GetDescendants()) do
            if d:IsA("BasePart") then
                d.LocalTransparencyModifier = 0
            end
        end
    end

    camera.CameraType = Enum.CameraType.Custom
end

local function holdPrompt(prompt)
    prompt.RequiresLineOfSight = false
    prompt:InputHoldBegin()
    task.wait(prompt.HoldDuration + 0.05)
    prompt:InputHoldEnd()
end

local function processCivilian(civ)
    local char = player.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local npcRoot = civ:FindFirstChild("HumanoidRootPart")
    local prompt = civ:FindFirstChild("CivilianRestrainPrompt", true)
    if not (char and hum and npcRoot and prompt) then return false end
    if SKIP_DISABLED and not prompt.Enabled then return false end

    if hum.Sit then hum.Sit = false end

    local flatLook = npcRoot.CFrame.LookVector * Vector3.new(1, 0, 1)
    if flatLook.Magnitude < 0.01 then flatLook = Vector3.new(0, 0, 1) end
    local standPos = npcRoot.Position + flatLook.Unit * STAND_DISTANCE
    pinCFrame = CFrame.lookAt(standPos, Vector3.new(npcRoot.Position.X, standPos.Y, npcRoot.Position.Z))
    target = npcRoot

    task.wait(SETTLE_TIME)

    tapFire()
    task.wait(0.1)
    holdPrompt(prompt)
    return true
end

local passes = 0
while not (passes >= MIN_PASSES and objectiveDone()) do
    passes += 1
    local didAny = false

    for _, civ in ipairs(civilians:GetChildren()) do
        if objectiveDone() and passes >= MIN_PASSES then break end
        if civ:IsA("Model") then
            local ok, result = pcall(processCivilian, civ)
            if not ok then
                warn("Civilian failed:", civ.Name, result)
            elseif result then
                didAny = true
            end
            task.wait(AFTER_TIME)
        end
    end

    -- Nothing to interact with this pass: don't spin, just wait and re-check
    if not didAny then
        target, pinCFrame = nil, nil
        task.wait(1)
    else
        task.wait(PASS_DELAY)
    end
end

stopTracking()
print("Complete after", passes, "passes") 

------
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VIM = game:GetService("VirtualInputManager")

local fire = Players.LocalPlayer.PlayerGui.EndGame.Container.PlayButton.ActualButton

local function tapFire(holdTime)
    holdTime = holdTime or 0.05
    local pos = fire.AbsolutePosition + fire.AbsoluteSize / 2
    local inset = GuiService:GetGuiInset()
    local x, y = pos.X + inset.X, pos.Y + inset.Y

    -- touch input (what mobile controls usually listen for)
    VIM:SendTouchEvent(1, 0, x, y)  -- begin
    task.wait(holdTime)
    VIM:SendTouchEvent(1, 2, x, y)  -- end

    -- fallback: mouse click
    -- VIM:SendMouseButtonEvent(x, y, 0, true, game, 0)
    -- task.wait(holdTime)
    -- VIM:SendMouseButtonEvent(x, y, 0, false, game, 0)
end

tapFire()
-----
