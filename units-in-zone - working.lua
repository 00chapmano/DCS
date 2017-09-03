function checkUnits1()

local zone_names = {'zone1'}
local unit_names = {'test', 'test2'}

local unitTable1 = mist.getUnitsInZones(unit_names ,zone_names)

mist.scheduleFunction(checkUnits2, {unitTable1}, timer.getTime() + 10)

end





function checkUnits2(unitTable1)

	local zone_names = {'zone1'}
	local unit_names = {'test', 'test2'}


	unitTable2 = mist.getUnitsInZones(unit_names ,zone_names)

	
	if unitTable1[1] == unitTable2[1] then


	trigger.action.outText("did it!", 10, false)
	end
end






checkUnits1()
