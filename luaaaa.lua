--General
local toolsSector = general:CreateSector("Tools", "left")
local creatureSector = general:CreateSector("Creatures", "left")
local tpSector = general:CreateSector("Waypoints", "right")
local mJuice = {}
local rPoison = {}

function isFilesFound()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "classified files" and v:FindFirstChild("Handle") then
            return true
        end
    end
    return false
end

toolsSector:AddButton("Pick up all Classified Files", function()
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        if isFilesFound() then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "classified files" and v:FindFirstChild("Handle") then
                    firetouchinterest(v.Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                end
            end
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "🌸 Sakura System:";
                Text = "No classified files found.";
                Duration = 2;
            })
        end
    end
end)

local loopPickUp = false
toolsSector:AddToggle("Auto pick up files", false, function(State)
    loopPickUp = State
end)

spawn(function()
    while task.wait() do
        if loopPickUp then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "classified files" and v:FindFirstChild("Handle") then
                    firetouchinterest(v.Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                end
            end
        end
    end
end)

toolsSector:AddButton("Sell all Classified Files", function()
    if Player.Character:FindFirstChild("classified files") or Player.Backpack:FindFirstChild("classified files") then
        for _, v in ipairs(Player.Backpack:GetChildren()) do
            if v.Name == "classified files" then
                 v.Parent = Player.Character
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v.Name == "classified files" then
                firetouchinterest(v.Handle ,game:GetService("Workspace").contrabandman.Head, 0)
            end
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "🌸 Sakura System:";
            Text = "No classified files in inventory.";
            Duration = 2;
        })
    end
end)

local loopSell = false
toolsSector:AddToggle("Auto sell files", false, function(State)
    loopSell = State
end)

spawn(function()
    while task.wait() do
        if loopSell then
            for _, v in ipairs(Player.Backpack:GetChildren()) do
                if v.Name == "classified files" then
                    v.Parent = Player.Character
                end
            end
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v.Name == "classified files" then
                    firetouchinterest(v.Handle ,game:GetService("Workspace").contrabandman.Head, 0)
                end
            end
        end
    end
end)