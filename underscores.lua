function _init()
    -- frame count
    fc = 0
    board_init()
    pointer_init()
end

function _update()
    fc += 1
end

function _draw()
    gameplay_draw()
end