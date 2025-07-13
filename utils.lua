--tables are passed by reference, so the v1 gets mutated
function sum(v1, v2)
    v1[1] += v2[1]
    v1[2] += v2[2]
    return v1
end

function mult(v1, m)
    v1[1] *= m
    v1[2] *= m
    return v1
end

-- TODO - remake this rot when needed
-- function rot_dot(v, rotation)
--     --   1/4
--     --2/4 + 0/4
--     --   3/4
--     sn = sin(rotation)
--     cs = cos(rotation)
--     return {
--         v[1] * cs + v[2] * -sn,
--         v[2] * cs + v[1] * sn
--     }
-- end