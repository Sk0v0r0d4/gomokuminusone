-- menu
-- gameplay
-- win
-- loss

function gameplay_draw()
    board_draw()
    pointer_draw()
end

function gameplay_update()
    pointer_update()
end

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
    rectfill(
        0,
        128,
        36,
        120,
        2
    )
    spr(
        3 + player,
        0,
        15 * 8
    )
    print(
        "'s move",
        8,
        (15 * 8) + 2,
        15
    )
end

function pointer_draw()
    x = (8 * pointer[2])
    y = (8 * pointer[1])
    spr(36, x, y)
    --arrow jumping animation
    spr(
        20 + (fc / 10 % 2),
        x,
        y - 6
    )
end