function _init()
    init()
end

function _update()
    update()
end

function _draw()
    draw()
end

function init()
    -- frame count
    fc = 0
    -- gameplay_init()
    menu_init()
end

function update()
    fc += 1
    menu_update()
    -- gameplay_update()
    popup_update()
end

function draw()
    cls()
    bg_draw()
    menu_draw()
    -- gameplay_draw()
    popup_draw()
end