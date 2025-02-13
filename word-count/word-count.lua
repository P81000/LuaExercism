local function word_count(s)
    local wc = {}

    s = s:lower()

    for word in s:gmatch("[%w']+") do
        word = word:gsub("^'+", ""):gsub("'+$", "")

        if word ~= "" then
            wc[word] = (wc[word] or 0) + 1
        end
    end

    return wc
end

return { word_count = word_count }
