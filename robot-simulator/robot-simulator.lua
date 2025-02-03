return function(config)
    local dir = { "north", "east", "south", "west" }
    local dir_map = { north = 1, east = 2, south = 3, west = 4 }

    local robot = {
        x = config.x,
        y = config.y,
        heading = config.heading
    }

    local actions = {
        R = function()
            local idx = dir_map[robot.heading]
            idx = (idx % 4) + 1
            robot.heading = dir[idx]
        end,
        L = function()
            local idx = dir_map[robot.heading]
            idx = (idx - 2) % 4 + 1
            robot.heading = dir[idx]
        end,
        A = function()
            if robot.heading == "north" then robot.y = robot.y + 1 end
            if robot.heading == "south" then robot.y = robot.y - 1 end
            if robot.heading == "east" then robot.x = robot.x + 1 end
            if robot.heading == "west" then robot.x = robot.x - 1 end
        end
    }


    function robot:move(str)
        for command in str:gmatch(".") do
            assert(actions[command], "Invalid command")
            actions[command]()
        end
    end

    return robot
end
