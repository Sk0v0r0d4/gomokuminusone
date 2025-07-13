function _init()
    -- frame count
    fc = 0
    gameplay_init()
end

function _update()
    fc += 1
    gameplay_update()
    popup_update()
end

function _draw()
    cls()
    gameplay_draw()
    popup_draw()
end