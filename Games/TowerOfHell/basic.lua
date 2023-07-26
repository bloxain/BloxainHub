local Logic = loadstring(game:HttpGet('https://github.com/bloxain/BloxainHub/raw/main/Games/TowerOfHell/Script.lua'))()
local UI = loadstring(game:HttpGet('https://github.com/bloxain/BloxainHub/raw/main/UI/Basic.lua'))()

--Pages
local Window = UI:MakeWindow({Name = 'Tower Of Hell V2', ConfigFolder = 'BloxainHub/Saves'})
local Movment = Window:MakeTab({Name = 'Movment'})
local TOH = Window:MakeTab({Name = 'TOH'})
local World = Window:MakeTab({Name = 'World'})
local System = Window:MakeTab({Name = 'Enviorment'})
local Playerpage = Window:MakeTab({Name = 'Players'})
local Settings = Window:MakeTab({Name = 'Settings'})
local Credit = Window:MakeTab({Name = 'Credits'})
-- MoveMent
Movment:AddLabel('Basic')
Movment:AddSlider({Name = 'Walkspeed', Min = 16, Max = 100, Flag = 'Walk', Callback = Logic.SetValues, Save = true})
Movment:AddSlider({Name = 'JumpPower', Min = Logic.CharValues.JumpPower, Max = 200, Flag = 'Jump', Save = true, Callback = Logic.SetValues})
Movment:AddLabel('Standerd')
Movment:AddToggle({Name = 'Inf Jump', Flag = 'InfJump', Save = true})
Movment:AddToggle({Name = "NoClip", Flag = "Noclip", Save = true, Default = false, Callback = Logic.HandelNoClip})
Movment:AddBind({Name = 'ClickTp', Flag = 'ClickTp', Save = true})
Movment:AddBind({Name = 'Spawn Platform', Flag = 'SpawnplatKey', Save = true, Default = Enum.KeyCode.Q, Callback = Logic.Spawnplatform})
Movment:AddBind({Name = 'Clear Platforms', Flag = 'DeleteplatKey', Save = true, Callback = Logic.clearplatforms})

-- TOH Mutators
local Mutators = TOH:AddSection({Name = 'Stop Mutators'})
Mutators:AddMutiToggle({Name = 'High Speed', Default = 1, Flag = 'High Speed', Save = true, Callback = Logic.UpdateMutators})
Mutators:AddMutiToggle({Name = 'Low Gravity', Default = 1, Flag = 'Low Gravity', Save = true, Callback = Logic.UpdateMutators})
Mutators:AddMutiToggle({Name = 'Foggy', Default = 1, Flag = 'Foggy', Save = true, Callback = Logic.UpdateMutators})
Mutators:AddMutiToggle({Name = 'Negative', Default = 1, Flag = 'Negative', Save = true, Callback = Logic.UpdateMutators})
Mutators:AddMutiToggle({Name = 'Bunny Hop', Default = 1, Flag = 'Bunny Hop', Save = true, Callback = Logic.UpdateMutators})
Mutators:AddMutiToggle({Name = 'Checkpoints', Default = 1, Flag = 'Checkpoints', Save = true, Callback = Logic.UpdateMutators})
Mutators:AddMutiToggle({Name = 'invincibility', Default = 1, Flag = 'invincibility', Save = true, Callback = Logic.UpdateMutators})
Mutators:AddMutiToggle({Name = 'invisibility', Default = 1, Flag = 'invisibility', Save = true, Callback = Logic.UpdateMutators})
Mutators:AddMutiToggle({Name = 'Double Jump', Default = 1, Flag = 'double jump', Save = true, Callback = Logic.UpdateMutators})
local AUTOFARM = TOH:AddSection({Name = 'Auto Farm'})
AutoFarmStatus = TOH:AddLabel('Status: idle')
AUTOFARM:AddToggle({Name = 'Enabled', Callback = Logic.UpdateMutators})
AUTOFARM:AddButton({Name = "Beat Game", Callback = Logic.BeatGame})

-- RTX
local RTX = TOH:AddSection({Name = 'RTX'})
RTX:AddToggle({Name = 'Shadows', Save = true, Flag = 'Shadows', Callback = Logic.Shadows}) --Callback = function(value) if value then RTXToggle:Set({Locked = false}) else RTXToggle:Set({Locked = true, Toggled = false}) end end
RTXToggle = RTX:AddToggle({Name = 'RTX', Save = true, Flag = 'RTX', Callback = Logic.RTXON})
RTX:AddSlider({Name = 'RTX brightness', Min = 1, Max = 100, Default = 7, Flag = 'RTXBrightness', Save = true, Callback = Logic.RTXBrightness})
RTX:AddSlider({Name = 'RTX Range', Min = 1, Max = 100, Default = 20, Flag = 'RTXRange', Save = true, Callback = Logic.RTXRange})
RTX:AddToggle({Name = 'Surface Light', Flag = 'Surface', Save = true, Callback = Logic.SurfaceLight})
RTX:AddSlider({Name = 'Exposure', Min = -20, Max = 20, Default = 3, Flag = 'Exposure', Save = true, Callback = Logic.Exposure})
RTX:AddSlider({Name = 'Time of day', Min = 0, Max = 24, Default = 14, Flag = 'TimeOfDay', Save = true, Callback = Logic.TimeOfDay})

-- Genral TOH
TOH:AddButton({Name = "Make everyone a furry", Callback = Logic.Furry})
TOH:AddBind({Name = "Time Freeze Key", Flag = "Fre", Default = Enum.KeyCode.E, Save = true, Callback = Logic.FreezeTime})
TOH:AddButton({Name = "Give All Tools(local)", Callback = Logic.GiveAllTools})
TOH:AddSlider({Name = 'Change total jumps(in air)', Min = 0, Max = 500, Default = 0, Flag = 'Jumps', Callback = Logic.TotalJumps})

-- World
World:AddToggle({Name = 'Max View Distance', Flag = 'MaxView', Save = true, Callback = Logic.MaxView})
World:AddBind({Name = 'Click Delete', Flag = 'ClickDelete', Save = true, Default = Enum.KeyCode.LeftAlt})
World:AddButton({Name = 'Undo', Callback = Logic.Undo})
World:AddSlider({Name = 'Gravity', Min = 0, Max = 500, Default = Logic.Advanced.DefaultGrav, Flag = 'Gravity', Callback = Logic.SetValues})
World:AddSlider({Name = 'Fps Cap', Min = 30, Max = 488, Default = 120, Flag = 'FpsCap', Save = true, Callback = Logic.FpsCap})
World:AddDropdown({Name = 'Change Lighting', Options = {'Future', 'Voxel', 'Legacy', 'ShadowMap', 'Compatibility', 'Default'}, Flag = 'Lighting', Save = true, Default = 'Default', Callback = Logic.Lighting})
World:AddToggle({Name = 'Full Bright', Flag = 'FullBright', Save = true, Callback = Logic.SetValues})

-- Enveriment
local RandomBypass = System:AddSection({Name = 'Force Random Output'})
RandomBypass:AddToggle({Name = 'Enabled', Flag = 'RandReturn', Save = true})
RandomBypass:AddSlider({Name = 'Return Value', Max = 100, Flag = 'RandomReturn', Save = true})
RandomBypass:AddButton({Name = 'Start(Required)', Callback = Logic.RandomBypass})
-- Players
Playerpage:AddLabel('LocalPlayer')
Playerpage:AddToggle({Name = 'AntiAFK', Flag = 'AntiAfk', Save = true})
Playerpage:AddTextbox({Name = 'PlayerName', Flag = 'UserName', TextDisappear = true})
Playerpage:AddButton({Name = 'Teleport', Callback = Logic.Teleport})
local HitBoxSec = Playerpage:AddSection({Name = 'HitBox Expander'})
HitBoxSec:AddDropdown({Name = 'Part', Options = {'Head', 'HumanoidRootPart'}, Flag = 'HitBoxPart', Save = true, Default = 'Head'})
HitBoxSec:AddSlider({Name = 'Size', Min = 2, Max = 50, Flag = 'HitBoxSize', Save = true, Default = 5})
HitBoxSec:AddSlider({Name = 'Transparency', Min = 0, Max = 100, Flag = 'HitBoxTran', Save = true, Default = 85})
HitBoxSec:AddToggle({Name = 'Enabled', Callback = Logic.HitBoxExpander})
Playerpage:AddToggle({Name = 'ESP', Flag = 'ESPON', Callback = Logic.ESPON})

-- Settings
Settings:AddLabel('UI')
local UISettings = Settings:AddSection({Name = 'UI Settings'})
UISettings:AddBind({Name = 'Toggle UI', Flag = 'ToggleUi', Save = true, Default = Enum.KeyCode.F3, Callback = function() Window:Toggle() end})
UISettings:AddToggle({Name = 'Fast Dragging', Flag = 'FastDrag', Save = true, Callback = function(value) UI.Settings.Movement.Lerp = not value UI.Settings.Control().Write(UI.Settings) end})
UISettings:AddToggle({Name = 'Diffrent Dragging', Flag = 'DIffrentDragging', Save = true, Callback = function(value) UI.Settings.Movement.SmallScreen = value UI.Settings.Control().Write(UI.Settings) end, Default = UI.Settings.Movement.SmallScreen})
UISettings:AddSlider({Name = 'Drag Speed', Flag = 'DragSpeed',Min = 1, Max = 100, Save = true, Default = 10, Callback = function(value) UI.Settings.Movement.LerpSpeed = value / 20 end})
UISettings:AddSlider({Name = 'ESP Size', Min = 75, Max = 400, Flag = 'EspSize', Default = 100, Save = true, Callback = Logic.UpdateSizes})
UISettings:AddButton({Name = 'KILL SCRIPT', Callback = Logic.EMERGENCY_STOP})
Settings:AddLabel('Basic')
Settings:AddSlider({Name = 'Platform Size', Min = 1, Max = 30, Flag = 'PlatSize', Save = true, Default = 6})
local UISystem = Settings:AddSection({Name = 'SYSTEM 64'})
UISystem:AddSlider({Name = 'TickTime(milliseconds)', Min = 0, Max = 10000, Default = 1000, Flag = 'Tick', Save = true})
UISystem:AddSlider({Name = 'FastTickTime(milliseconds)', Min = 0, Max = 10000, Flag = 'FastTick', Save = true})
UISystem:AddSlider({Name = 'Max Undo Storage', Min = 1, Max = 1000, Default = 100, Flag = 'UndoStorage', Save = true})

-- Credits
Credit:AddLabel('Credit to Robloxain_Pro & CPU_Accelerator and a little ChatGPT')
Credit:AddButton({Name = 'Join Discord', Callback = Logic.JoinDiscord})

game["Run Service"].Stepped:Connect(function()
	Logic.Flags = UI.Flags
end)
