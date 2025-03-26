-- Original remove junk script from Asta, if any question, find him here: https://discord.gg/ZUZdMzQ
-- Original repo here: https://github.com/frasta/DCS_script_removeJunkWhenCrash
-- My changes: The original only removes debris from crashes that happen within a zone.
--             If the script is going to run, why not just remove the debris regardless?
-- I don't use this script, I just found it and thought I would imp-rove upon it.
-- Note: This script runs based on the event of a crash. I'm not sure if it will remove 
--       the seat and the canopy if they are still in the air. I set the radius to 8000
--       to attempt to clear them, unsure if the function will remove them if they are 
--       moving in the air.

-- If this comment is still here, this script is untested

local flyingUnits = mist.makeUnitTable({'[blue][plane]','[blue][helicopter]','[red][plane]','[red][helicopter]'})
local eventListener = {}
local coordinatesCrash = nil
local volumeToPurify = nil

function eventListener:onEvent(event)
	if event.id == 5 then --https://wiki.hoggitworld.com/view/DCS_event_crash
		coordinatesCrash = event.initiator:getPoint()
        coordinatesCrash.point.y = land.getHeight({x = coordinatesCrash.point.x, y = coordinatesCrash.point.z})
        volumeToPurify = {
            id = world.VolumeType.SPHERE,
            params = {
                point = currentZone.point,
                radius = 8000
            }
        }
        mist.scheduleFunction(purifaction, {volumeToPurify}, timer.getTime() + 3)
		coordinatesCrash = nil
		volumeToPurify = nil
	end
end
world.addEventHandler(eventListener)

function purifaction(volumeToPurify)
	world.removeJunk(volumeToPurify) --https://wiki.hoggitworld.com/view/DCS_func_removeJunk
end