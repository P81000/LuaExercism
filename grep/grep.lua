return function(options)
    local pattern = options.pattern
    local flags = options.flags or {}
    local files = options.files
    local active_flag = {
        ["-n"] = false, -- Print Line Numbers
        ["-l"] = false, -- Print File Names Only
        ["-i"] = false, -- Case Insensitive
        ["-v"] = false, -- Invert Match
        ["-x"] = false  -- Match Entire Line
    }

    -- Configurar flags
    for _, flag in ipairs(flags) do
        if active_flag[flag] ~= nil then active_flag[flag] = true end
    end

    local results = {}
    local file_names_added = {}

    for _, filename in ipairs(files) do
        local file = io.open(filename, "r")
        if file then
            local line_number = 0
            local has_match = false
            for line in file:lines() do
                line_number = line_number + 1
                local line_to_match = line
                local pattern_to_match = pattern
                if active_flag["-i"] then
                    line_to_match = string.lower(line)
                    pattern_to_match = string.lower(pattern)
                end
                local matches
                if active_flag["-x"] then
                    matches = (line_to_match == pattern_to_match)
                else
                    matches = string.find(line_to_match, pattern_to_match, 1, true) ~= nil
                end
                if active_flag["-v"] then
                    matches = not matches
                end
                if matches then
                    has_match = true
                    if active_flag["-l"] then
                        if not file_names_added[filename] then
                            table.insert(results, filename)
                            file_names_added[filename] = true
                        end
                    else
                        local result = ""
                        if #files > 1 then
                            result = filename .. ":"
                        end
                        if active_flag["-n"] then
                            result = result .. line_number .. ":"
                        end
                        result = result .. line
                        table.insert(results, result)
                    end
                end
            end
            file:close()
        end
    end
    return results
end
