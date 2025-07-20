POINTER_INPUT_DELAY = 4
--add moves and win/lose check

function gameplay_init()
    board_init()
    pointer_init()
    behavior_table_init()
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

function behavior_table_init()
    starts_and_deltas = {}
    for i = 1, 14 do
        add(
            starts_and_deltas, {
                start = { i, 1 },
                delta = { 0, 1 },
                lenght = 14
            }
        ) -- horizontal
        add(
            starts_and_deltas, {
                start = { 1, i },
                delta = { 1, 0 },
                lenght = 14
            }
        ) -- vertical
        if (i > 4) then
            -- ul to dr diagonals
            add(
                starts_and_deltas, {
                    start = { 1, i },
                    delta = { 1, -1 },
                    lenght = i
                }
            )
            if (i ~= 14) then
                -- to not include central diagonal twice
                add(
                    starts_and_deltas, {
                        start = { i, 14 },
                        delta = { 1, -1 },
                        lenght = 15 - i
                    }
                )
            end
        end
        if (i < 11) then
            -- dl to ur diagonals
            add(
                starts_and_deltas, {
                    start = { 1, i },
                    delta = { 1, 1 },
                    lenght = 15 - i
                }
            )
            if (i ~= 1) then
                -- to not include central diagonal twice
                add(
                    starts_and_deltas, {
                        start = { i, 1 },
                        delta = { 1, 1 },
                        lenght = 15 - i
                    }
                )
            end
        end
    end
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
    for i = 1, #starts_and_deltas do
        local obj = starts_and_deltas[i]
        local count = 1
        local prev = -1
        local v = { obj.start[1], obj.start[2] }
        for j = 1, obj.lenght do
            local current = board[v[1]][v[2]]
            if current == prev and current ~= 0 then
                count += 1
            else
                count = 1
            end
            if count == 5 then
                return prev
            end
            prev = current
            sum(v, obj.delta)
        end
    end
    return -1
end