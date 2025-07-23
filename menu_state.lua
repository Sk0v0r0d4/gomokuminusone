MENU_INPUT_DELAY = 6

function menu_init()
    menu = {
        {
            name = "play",
            do_that = 123
        },
        {
            name = "play",
            do_that = 123
        },
        {
            name = "play",
            do_that = 123
        },
        {
            name = "play",
            do_that = 123
        },
        {
            name = "config",
            do_that = 123
        }
    }
    pntr = 1
    delay = 0
    current_menu = menu
end

function menu_draw()
    local x = 25
    local y = 25
    rectfill(22, 22, 127 - 22, 127 - 22, 2)
    for k, v in pairs(current_menu) do
        local name = v.name
        if k == pntr then
            name = name .. " <-"
        end
        print(name, x, y, 15)
        y += 7
    end
end

function menu_update()
    if delay > 0 then
        delay -= 1
        return
    end
    if btn() ~= 0 then
        delay = MENU_INPUT_DELAY
    end
    if btn(❎) then
        new_popup("testing")
    elseif btn(⬆️) then
        pntr -= 1
        pntr = (pntr - 1) % #current_menu + 1
    elseif btn(⬇️) then
        pntr += 1
        pntr = (pntr - 1) % #current_menu + 1
    end
end

function game_start()
end