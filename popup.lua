POPUP_DELAY = 30
current_popup = {
    text = "",
    y = 0,
    ty = 0,
    time_on_screen = 0,
    bg_color = 0,
    text_color = 0,
    done = true
}

function new_popup(text)
    current_popup.text = text
    current_popup.y = 0
    current_popup.ty = 10
    current_popup.bg_color = 2
    current_popup.text_color = 15
    current_popup.done = false
    current_popup.time_on_screen = 0
end

function popup_update()
    if current_popup.done then
        return
    end
    if current_popup.y ~= current_popup.ty then
        diff = current_popup.ty - current_popup.y
        if abs(diff) < 1 then
            current_popup.y = current_popup.ty
            if current_popup.y == 0 then
                current_popup.done = true
            end
            return
        end
        current_popup.y += diff / 3
        return
    end
    if current_popup.time_on_screen > POPUP_DELAY then
        current_popup.ty = 0
        -- current_popup.done = true
        return
    end
    current_popup.time_on_screen += 1
end

function popup_draw()
    if current_popup.done or current_popup.y == 0 then
        return
    end
    -- diff = current_popup.ty - current_popup.y
    rectfill(
        0,
        0,
        127,
        current_popup.y,
        current_popup.bg_color
    )
    print(
        current_popup.text,
        3,
        current_popup.y - 7,
        current_popup.text_color
    )
end