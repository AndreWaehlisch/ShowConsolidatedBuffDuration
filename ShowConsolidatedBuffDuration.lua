local LoginFrame = CreateFrame("Frame");
LoginFrame:RegisterEvent("PLAYER_LOGIN");
LoginFrame:SetScript("OnEvent",function()
	local curframe;
	local title = "ConsolidatedBuffsTooltipBuff";
	for i=1, NUM_LE_RAID_BUFF_TYPES do
		curframe = CreateFrame("Cooldown",title..i.."Duration",_G[title..i]);
		
		curframe:SetAllPoints(_G[title..i].icon);
		curframe:SetReverse(true)
		
		_G[title..i]:HookScript("OnShow",function()
			local _, _, _, WholeDur, EndTime = GetRaidBuffTrayAuraInfo(i);
			
			if EndTime then
				_G[title..i.."Duration"]:SetCooldown(EndTime-WholeDur,WholeDur);
			end;
		end);
	end;
	
	LoginFrame:UnregisterAllEvents();
end);