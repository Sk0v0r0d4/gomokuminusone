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
        pointer[3] = POINTER_INPUT_DELAY
        if board[pointer[1]][pointer[2]] != 0 then
            new_popup("no u don't")
            sfx(9)
            return
        end
        board[pointer[1]][pointer[2]] = player
        sfx(8)
        n = win_check()
        new_popup(n)
        if n ~= 0 then
        end
        player += 1
        if player == 3 then
            player = 1
        end
        return
    elseif btn(⬆️) then
        pointer[1] -= 1
        pointer_bound()
        pointer[3] = POINTER_INPUT_DELAY
        sfx(10)
    elseif btn(⬇️) then
        pointer[1] += 1
        pointer_bound()
        pointer[3] = POINTER_INPUT_DELAY
        sfx(10)
    end
    if btn(⬅️) then
        pointer[2] -= 1
        pointer_bound()
        pointer[3] = POINTER_INPUT_DELAY
        sfx(10)
    elseif btn(➡️) then
        pointer[2] += 1
        pointer_bound()
        pointer[3] = POINTER_INPUT_DELAY
        sfx(10)
    end
end

function win_check()
    local delta = { 0, 1 }
    for i = 1, 14 do
        local v = { i, 1 }
        local prev = -1
        local count = 1
        for j = 1, 14 do
            local current = board[v[1]][v[2]]
            if current == prev and current ~= 0 then
                count += 1
            else
                count = 1
            end
            prev = current
            if count == 5 then
                return prev
            end
            sum(v, delta)
        end
    end
    delta = { 1, 0 }
    for i = 1, 14 do
        local v = { 1, i }
        local prev = -1
        local count = 1
        for j = 1, 14 do
            local current = board[v[1]][v[2]]
            if current == prev and current ~= 0 then
                count += 1
            else
                count = 1
            end
            prev = current
            if count == 5 then
                return prev
            end
            sum(v, delta)
        end
    end
    return 0
end