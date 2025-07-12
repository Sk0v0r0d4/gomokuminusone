function board_init()
    board = {}
    for i = 1, 14 do
        local line = {}
        for j = 1, 14 do
            line[j] = flr(rnd(3))
        end
        board[i] = line
    end
end

function pointer_init()
    pointer = { flr(rnd(14) + 1), flr(rnd(14) + 1) }
end