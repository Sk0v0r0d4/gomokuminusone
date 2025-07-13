POINTER_INPUT_DELAY = 4
--add moves and win/lose check

function gameplay_init()
    board_init()
    pointer_init()
    player = 1
end

function board_init()
    board = {}
    for i = 1, 14 do
        local line = {}
        for j = 1, 14 do
            line[j] = 0
        end
        board[i] = line
    end
end

function pointer_init()
    pointer = { flr(rnd(14) + 1), flr(rnd(14) + 1), 0 }
end

function pointer_bound()
    pointer[1] = (pointer[1] - 1) % 14 + 1
    pointer[2] = (pointer[2] - 1) % 14 + 1
end

function pointer_update()
    --todo - rewrite that part better
    if pointer[3] ~= 0 then
        pointer[3] -= 1
        return
    elseif btn(❎) then
        if board[pointer[1]][pointer[2]] != 0 then
            --popup
            return
        end
        board[pointer[1]][pointer[2]] = player
        player += 1
        if player == 3 then
            player = 1
        end
        pointer[3] = POINTER_INPUT_DELAY
        return
    elseif btn(⬆️) then
        pointer[1] -= 1
        pointer_bound()
        pointer[3] = POINTER_INPUT_DELAY
    elseif btn(⬇️) then
        pointer[1] += 1
        pointer_bound()
        pointer[3] = POINTER_INPUT_DELAY
    end
    if btn(⬅️) then
        pointer[2] -= 1
        pointer_bound()
        pointer[3] = POINTER_INPUT_DELAY
    elseif btn(➡️) then
        pointer[2] += 1
        pointer_bound()
        pointer[3] = POINTER_INPUT_DELAY
    end
end