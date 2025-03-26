TriggerZoneList = {}

for idx = 1, #env.mission["triggers"]["zones"] do
    table.insert(TriggerZoneList, env.mission["triggers"]["zones"][idx]["name"])
    env.info(string.format("Adding zone: %s", env.mission["triggers"]["zones"][idx]["name"]))
end


for currentZoneNum in pairs(TriggerZoneList) do
    local sphere = trigger.misc.getZone(TriggerZoneList[currentZoneNum])
    sphere.point.y = land.getHeight({x = sphere.point.x, y = sphere.point.z})
    local volS = {
        id = world.VolumeType.SPHERE,
        params = {
            point = sphere.point,
            radius = sphere.radius
        }
    }
    local count = world.removeJunk(volS)
    env.info(string.format("Removal count for zone %s: %d", TriggerZoneList[currentZoneNum], count))
end




local sphere = {
    ["x"] = -114146.14614615,
    ["z"] = 287114.61461461,
    ["y"] = land.getHeight({x = -114146.14614615, y = 287114.61461461})
}
local volS = {
    id = world.VolumeType.SPHERE,
    params = {
        point = sphere,
        radius = 975360
    }
}
local count = world.removeJunk(volS)
env.info(string.format("Removal count for map: %d", count))



function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

--for currentZoneNum in pairs(TriggerZoneList) do
--    local sphere = trigger.misc.getZone(TriggerZoneList[currentZoneNum])
    env.info(string.format(dump(sphere)))
--end