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
    world.removeJunk(volS)
end
