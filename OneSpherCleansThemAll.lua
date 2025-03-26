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
world.removeJunk(volS)