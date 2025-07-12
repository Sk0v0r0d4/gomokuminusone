-- menu
-- gameplay
-- win
-- loss

function board_draw()
    map()
    for i = 1, #board do
        local line = board[i]
        for j = 1, #line do
            if line[j] != 0 then
                x = (8 * j)
                y = (8 * i)
                spr(3 + line[j], x, y)
            end
        end
    end
end

function pointer_draw()
    x = (8 * pointer[1])
    y = (8 * pointer[2])
    spr(36, x, y)
    spr(
        20 + (fc / 10 % 2),
        x,
        y - 6
    )
end

function gameplay_draw()
    board_draw()
    pointer_draw()
end

function gameplay_update()
    pointer_update()
end