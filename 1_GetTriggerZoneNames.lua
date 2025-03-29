-- This script worke in conjunction with 1_RemoveJunkInZones

TriggerZoneList = {}

for idx = 1, #env.mission["triggers"]["zones"] do
    table.insert(TriggerZoneList, env.mission["triggers"]["zones"][idx]["name"])
end
