function checkUnitsInZone1()

local zone_names = {'zone-4808A'}
local unitNames = {'test'}

local unitsInZones1 = mist.getUnitsInZones(unitNames, zone_names)



-- Count table function...

local lengthNum = 0

		for k, v in pairs(unitsInZones1) do  -- for every key in the table with a corresponding non-nil value 
		lengthNum = lengthNum + 1
		end

	
	
		for unitCount = 1, (lengthNum) do
	
			local groupID = unitsInZones1[unitCount]:getGroup():getID()	
		
			trigger.action.outTextForGroup((groupID), "Your group is in a restricted zone. You have 10 seconds to turn around or you will be destroyed.", 10, false)

		end
		
mist.scheduleFunction(checkUnitsInZone2,{unitsInZones1} ,timer.getTime() + 10)
		
end




function checkUnitsInZone2(unitsInZones1)

local zone_names = {'zone-4808A'}
local unitNames = {'test'}

local unitsInZones2 = mist.getUnitsInZones(unitNames, zone_names)

	for unitCount = 1, 25 do

		if unitsInZones2[1] ==  unitsInZones1[unitCount] then
		unitsInZones[1]:destroy()
		end

	end

end



checkUnitsInZone1()

