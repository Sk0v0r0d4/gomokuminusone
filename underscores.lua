function _init()
    -- frame count
    fc = 0
    -- gameplay_init()
end

function _update()
    fc += 1
    -- gameplay_update()
    if btn(❎) then
        new_popup("❎ pressed")
    end
    popup_update()
end

function _draw()
    cls()
    -- gameplay_draw()
    popup_draw()
    print(current_popup.done, 50, 50)
end