function checkUnits1()

local zoneNames = {'zone1'}
local unitNames = {'test', 'test2'}

local unitTable1 = mist.getUnitsInZones(unitNames ,zoneNames)

mist.scheduleFunction(checkUnits2, {unitTable1, unitNames, zoneNames}, timer.getTime() + 10)

end



--function 2

function checkUnits2(units, unitNames, zoneNames)

	unitTable2 = mist.getUnitsInZones(unitNames ,zoneNames)

	
	if units[1] == unitTable2[1] then
		trigger.action.outText("did it!", 10, false)
	end
end






checkUnits1()
