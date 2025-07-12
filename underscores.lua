function _init()
    -- frame count
    fc = 0
    board_init()
    pointer_init()
end

function _update()
    fc += 1
    gameplay_update()
end

function _draw()
    gameplay_draw()
end