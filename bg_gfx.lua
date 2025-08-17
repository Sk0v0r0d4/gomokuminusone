gradient = {
    0, 1, 2, 8, 14, 15
}

function bg_color(x, y)
    x = x / 2
    local angle = fc / 300
    -- local angle = 0

    local new_x = x * sin(angle) + y * cos(angle)
    local new_y = x * cos(angle) - y * sin(angle)

    new_x *= 0.9 + cos(fc / 300) * 0.5
    new_y *= 0.9 + cos(fc / 300) * 0.5
    new_x += fc / 40
    new_y -= fc / 60
    new_x += cos(fc / 145) * 3
    new_y += cos(fc / 99) * 3

    local sin_1 = abs(sin(new_x / 16) + 0.99)
    local sin_2 = abs(sin(new_y / 16) + 0.99)
    local index = ceil((sin_1 + sin_2) * 1.5)
    return gradient[index]
end

function bg_draw()
    fillp(░)
    for i = 0, 15 do
        for j = 0, 15 do
            local x = i * 4
            local y = j * 8
            local col = bg_color(i, j)
            rectfill(x, y, x + 3, y + 7, col)
            rectfill(124 - x, y, 124 - x + 3, y + 7, col)
        end
    end
    fillp()
    -- print(fc, 1, 1, 7)
end