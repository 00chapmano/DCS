function checkUnitsInZone1()
	local zoneNames = {'zone-4808A'}
	local unitNames = {'test'}

	local unitsInZones1 = mist.getUnitsInZones(unitNames, zoneNames)

	for num, unit in pairs(unitsInZones1) do  -- for every key in the table with a corresponding non-nil value 
		local groupID = unit:getGroup():getID()	
		trigger.action.outTextForGroup((groupID), "Your group is in a restricted zone. You have 10 seconds to turn around or you will be destroyed.", 10, false)
	end

	mist.scheduleFunction(checkUnitsInZone2,{unitsInZones1, zoneNames, unitNames} ,timer.getTime() + 10)
end

function checkUnitsInZone2(unitsInZones1, zoneNames, unitNames)
	local unitsInZones2 = mist.getUnitsInZones(unitNames, zoneNames)

	for num2, unit2 in pairs(unitsInZones2) do 
		for num1, unit1 in pairs(unitsInZones1) do 
			if unit2 == unit1 then
				unit2:destroy()
			end
		end
	end
end

checkUnitsInZone1()
