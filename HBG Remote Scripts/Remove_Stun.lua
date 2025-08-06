local player = game.Players.LocalPlayer
local targetFolder = workspace:WaitForChild("Live"):WaitForChild(player.Name)

local blacklist = {
			["ForwardDashCD"] = true,
			["DashCD"] = true,
			["DashPunchCD"] = true,
			["RecentStun"] = true,
			["RecentStunNoAction"] = true,
			["DASHCD"] = true,
			["RecentDash"] = true,
			["Dashing"] = true,
			["BDStun"] = true,
			["DontAllowBlocking"] = true,
			["CantPunchONCLIENT"] = true,
			["Stun"] = true,
			["TRUECANTSIDEDASH"] = true,
			["recentdashok"] = true,
			["SideDashCounter"] = true,
			["Ok"] = true,
			["InterruptEffectsVal"] = true,
			["BlueFlamesDashPunch"] = true,
			["TargetFoundBD"] = true,
			["ResettingTimer"] = true,
			["AirDASHCD"] = true,
			["NoDashingTrue"] = true,
			["EventInteractableCDTree"] = true,

			}
		if getgenv().RemoveStun == true then 
			warn("Already gone")
			return
		end
		for _, child in pairs(targetFolder:GetChildren()) do
			if blacklist[child.Name] then
				child:Destroy()
			end
		end

		targetFolder.ChildAdded:Connect(function(child)
			task.wait()
			if blacklist[child.Name] then
				child:Destroy()
			end
		end)

        getgenv().RemoveStun = true
