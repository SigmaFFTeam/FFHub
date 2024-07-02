--[[
loadstring script:
loadstring(game:HttpGet("https://raw.githubusercontent.com/SigmaFFTeam/FFHub/main/script.lua"))()
]]
getgenv().SecureMode = true
local lib = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart

local TS = game:GetService("TweenService")

function findCoin()
    for _, v in pairs(workspace.Normal.CoinContainer:GetChildren()) do
        if v.Name == "Coin_Server" then
            if v:FindFirstChild("CoinVisual") then
                if v.CoinVisual:FindFirstChild("MainCoin") then
                       return v.CoinVisual.MainCoin 
                end
            end
        end
    end
end

local currentTween = nil
function tween()
    local coin = findCoin()
    if coin then
		local tw= TS:Create(hrp, TweenInfo.new(2), {CFrame = coin.CFrame})
		tw:Play()
		currentTween =tw
    
    	tw.Stopped:Connect(function()
    		return
    	end)
    end
end

local active = false

function Loop()
	while active == true do
		wait()
		tween()
	end
end

local Window = Rayfield:CreateWindow({
   Name = "FF Hub",
   LoadingTitle = "Another NoName hub by FFTeam",
   LoadingSubtitle = "Powered by Rayfield",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "FFTeam",
      FileName = "FFHub"
   },
   KeySystem = false
})

local UniTab = Window:CreateTab("Universal", 4483362458)

local MM2Tab = Window:CreateTab("MM2", 4483362458)
local MM2Farm = MM2Tab:CreateSection("Farm")
local Toggle = MM2Farm:CreateToggle({
   Name = "CoinsFarm",
   CurrentValue = false,
   Flag = "CoinFarm",
   Callback = function(v)
   		active = v
   		if v == true then
   			Loop()
   		end
   end
})
