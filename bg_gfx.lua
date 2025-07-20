gradient = {
    0, 1, 8, 14, 15
}

function bg_color(x, y)
    x += fc / 40
    y -= fc / 60
    x += cos(fc / 145) * 3
    y += cos(fc / 99) * 3
    sin_1 = abs(sin(x / 30) + 0.99)
    sin_2 = abs(sin(y / 15) + 0.99)
    index = ceil((sin_1 + sin_2) * 1.2)
    return gradient[index]
end

function bg_draw()
    for i = 0, 15 do
        for j = 0, 15 do
            local x = i * 4
            local y = j * 8
            local col = bg_color(i, j)
            rectfill(x, y, x + 3, y + 7, col)
            rectfill(124 - x, y, 124 - x + 3, y + 7, col)
        end
    end
end