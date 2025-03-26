TriggerZoneList = {}

for idx = 1, #env.mission["triggers"]["zones"] do
    table.insert(TriggerZoneList, env.mission["triggers"]["zones"][idx]["name"])
    env.info(string.format("Adding zone: %s", env.mission["triggers"]["zones"][idx]["name"]))
end