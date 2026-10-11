local l_base64_0 = require("neverlose/base64");
local l_weapons_0 = require("neverlose/csgo_weapons");
local l_clipboard_0 = require("neverlose/clipboard");
local l_get_0 = l_clipboard_0.get;
do
    local l_l_get_0_0 = l_get_0;
    l_clipboard_0.get = function(...)
        -- upvalues: l_l_get_0_0 (ref)
        local v5 = l_l_get_0_0(...);
        local v6 = v5:find("\000");
        if v6 ~= nil then
            return v5:sub(1, v6 - 1);
        else
            return v5;
        end;
    end;
end;
l_get_0 = "\226\128\138";
local function v10(v7, v8)
    for v9 = 1, #v7 do
        if v7[v9] == v8 then
            return v9;
        end;
    end;
    return nil;
end;
local function v13(...)
    local v11 = "";
    for v12 = 1, select("#", ...) do
        v11 = v11 .. select(v12, ...);
    end;
    return v11;
end;
local function v15(v14)
    return math.floor(v14 + 0.5);
end;
local v16 = {};
local v17 = common.get_username();
v16.name = "angelwings";
v16.user = v17;
v16.build = "illusory";
v17 = nil;
v17 = {
    lerp = function(v18, v19, v20)
        return v18 + v20 * (v19 - v18);
    end, 
    extrapolate = function(v21, v22, v23)
        return v21 + v22 * (v23 * globals.tickinterval);
    end, 
    closest_ray_point = function(v24, v25, v26, v27)
        local v28 = v26 - v24;
        local v29 = v25 - v24;
        local v30 = v29.x * v29.x + v29.y * v29.y;
        local v31 = (v28.x * v29.x + v28.y * v29.y) / v30;
        if v27 then
            if v31 <= 0 then
                return v24;
            elseif v31 >= 1 then
                return v25;
            end;
        end;
        return v24 + v31 * v29;
    end
};
local v32 = nil;
v32 = {
    antiaim = {
        angles = {
            enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
            }, 
            yaw_modifier = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
            }, 
            body_yaw = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
            }, 
            freestanding = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
            }, 
            extended_angles = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
            }
        }, 
        misc = {
            fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
        }
    }, 
    ragebot = {
        main = {
            hide_shots = {
                ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
                ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
            }, 
            double_tap = {
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch")
            }
        }, 
        selection = {
            min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
        }
    }
};
local v33 = nil;
v33 = {};
local v34 = {};
v34.__index = v34;
v34.new = function(v35)
    return setmetatable({
        count = 0, 
        list = {}
    }, v35);
end;
v34.__len = function(v36)
    return v36.count;
end;
v34.__call = function(v37, v38, v39)
    if v39 == false then
        return v37:unset(v38);
    else
        return v37:set(v38);
    end;
end;
v34.unset = function(v40, v41)
    -- upvalues: v10 (ref)
    local v42 = v10(v40.list, v41);
    if v42 ~= nil then
        v40.count = v40.count - 1;
        table.remove(v40.list, v42);
    end;
    return v40;
end;
v34.set = function(v43, v44, v45)
    -- upvalues: v10 (ref)
    if v45 == false then
        return v43:unset(v44);
    else
        if not v10(v43.list, v44) then
            v43.count = v43.count + 1;
            table.insert(v43.list, v44);
        end;
        return v43;
    end;
end;
v34.fire = function(v46, ...)
    local l_list_0 = v46.list;
    for v48 = 1, #l_list_0 do
        l_list_0[v48](...);
    end;
    return v46;
end;
local v49 = {};
do
    local l_v34_0, l_v49_0 = v34, v49;
    local function v55(v52, v53)
        -- upvalues: l_v34_0 (ref)
        local v54 = rawget(v52, v53);
        if v54 == nil then
            v54 = l_v34_0:new();
            rawset(v52, v53, v54);
        end;
        return v54;
    end;
    do
        local l_v55_0 = v55;
        l_v49_0.new = function(_)
            -- upvalues: l_v55_0 (ref)
            return setmetatable({}, {
                __index = l_v55_0
            });
        end;
    end;
    v33.new = function(_)
        -- upvalues: l_v49_0 (ref)
        return l_v49_0:new();
    end;
end;
v34 = nil;
v34 = {};
v49 = bit.lshift(1, 0);
local v59 = {};
v59.__index = v59;
v59.__newindex = function(v60, v61, v62)
    v60[0][v61] = v62;
end;
do
    local l_v49_1, l_v59_0 = v49, v59;
    l_v59_0.__index = function(v65, v66)
        -- upvalues: l_v59_0 (ref), l_v49_1 (ref)
        local v67 = rawget(l_v59_0, v66);
        if v67 ~= nil then
            return v67;
        else
            local v68 = rawget(v65, v66);
            if v68 ~= nil then
                return v68;
            else
                local v69 = v65[0][v66];
                if v69 == nil then
                    return nil;
                elseif type(v69) == "function" then
                    local function v73(...)
                        -- upvalues: v65 (ref), l_v49_1 (ref), v69 (ref)
                        local v70 = {};
                        local v71 = select("#", ...);
                        for v72 = 1, v71 do
                            v70[v72] = select(v72, ...);
                        end;
                        if bit.band(v65.flags, l_v49_1) ~= 0 then
                            v65:fire_callbacks(v70, v71);
                        end;
                        if v70[1] == v65 then
                            v70[1] = v65[0];
                        end;
                        return v69(unpack(v70, 1, v71));
                    end;
                    rawset(v65, v66, v73);
                    return v73;
                else
                    return v69;
                end;
            end;
        end;
    end;
    l_v59_0.new = function(v74, v75)
        -- upvalues: l_v49_1 (ref)
        local v76 = {
            flags = 0, 
            [0] = v75, 
            callbacks = {}
        };
        v76.flags = bit.bor(v76.flags, l_v49_1);
        return setmetatable(v76, v74);
    end;
    l_v59_0.fire_callbacks = function(v77, ...)
        local v78 = rawget(v77, "callbacks");
        for v79 = 1, #v78 do
            v78[v79](...);
        end;
        return v77;
    end;
    l_v59_0.get_flag = function(v80, v81)
        return bit.band(v80.flags, v81) ~= 0;
    end;
    l_v59_0.set_flag = function(v82, v83, v84)
        if v84 then
            v82.flags = bit.bor(v82.flags, v83);
        else
            v82.flags = bit.band(v82.flags, bit.bnot(v83));
        end;
        return v82;
    end;
    l_v59_0.set_callback = function(v85, v86)
        -- upvalues: v10 (ref)
        local v87 = rawget(v85, "callbacks");
        if v10(v87, v86) == nil then
            table.insert(v87, v86);
        end;
        return v85;
    end;
    l_v59_0.unset_callback = function(v88, v89)
        -- upvalues: v10 (ref)
        local v90 = rawget(v88, "callbacks");
        local v91 = v10(v90, v89);
        if v91 ~= nil then
            table.remove(v90, v91);
        end;
        return v88;
    end;
    v34.group_flags = {
        callbacks = l_v49_1
    };
    v34.cast = function(v92)
        -- upvalues: l_v59_0 (ref)
        return l_v59_0:new(v92);
    end;
    v34.create = function(...)
        -- upvalues: l_v59_0 (ref)
        return l_v59_0:new(ui.create(...));
    end;
end;
v49 = nil;
v49 = {};
v59 = "ui\\beepclear.wav";
local v93 = "resource\\warning.wav";
local l_play_0 = cvar.play;
local function v99(v95, v96)
    -- upvalues: v16 (ref)
    local v97 = " \194\183 ";
    local v98 = string.format("\a%s[%s]\aDEFAULT", v95:to_hex(), v16.name);
    print_raw(v98 .. v97 .. v96);
end;
do
    local l_v59_1, l_v93_0, l_l_play_0_0, l_v99_0 = v59, v93, l_play_0, v99;
    v49.log = function(v104)
        -- upvalues: l_v99_0 (ref)
        l_v99_0(color(255, 255, 255, 200), v104);
    end;
    v49.success = function(v105)
        -- upvalues: l_v99_0 (ref), l_l_play_0_0 (ref), l_v59_1 (ref)
        l_v99_0(color(250, 137, 250, 255), v105);
        l_l_play_0_0:call(l_v59_1);
    end;
    v49.error = function(v106)
        -- upvalues: l_v99_0 (ref), l_l_play_0_0 (ref), l_v93_0 (ref)
        l_v99_0(color(250, 0, 50, 255), v106);
        l_l_play_0_0:call(l_v93_0);
    end;
end;
v59 = nil;
v59 = {};
v93 = {};
do
    local l_v93_1 = v93;
    v59.get = function()
        -- upvalues: l_v93_1 (ref)
        return l_v93_1;
    end;
    v59.add = function(v108, v109, v110)
        -- upvalues: l_v93_1 (ref)
        l_v93_1[v108] = {
            [1] = v109, 
            [2] = v110
        };
    end;
end;
v93 = nil;
v93 = {};
l_play_0 = function(v111, v112, v113, v114)
    return v113 * v111 / v114 + v112;
end;
v99 = function()
    return globals.frametime;
end;
local function v121(v115, v116, v117, v118, v119)
    if v118 <= 0 then
        return v117;
    elseif v119 <= v118 then
        return v117;
    else
        v116 = v115(v118, v116, v117 - v116, v119);
        if type(v116) == "number" then
            if math.abs(v117 - v116) < 0.001 then
                return v117;
            else
                local v120 = v116 % 1;
                if v120 < 0.001 then
                    return math.floor(v116);
                elseif v120 > 0.999 then
                    return math.ceil(v116);
                end;
            end;
        end;
        return v116;
    end;
end;
do
    local l_l_play_0_1, l_v99_1, l_v121_0 = l_play_0, v99, v121;
    v93.interp = function(v125, v126, v127, v128)
        -- upvalues: l_l_play_0_1 (ref), l_v121_0 (ref), l_v99_1 (ref)
        if not v128 then
            v128 = l_l_play_0_1;
        end;
        if type(v126) == "boolean" then
            v126 = v126 and 1 or 0;
        end;
        return l_v121_0(v128, v125, v126, l_v99_1(), v127);
    end;
end;
l_play_0 = nil;
v99 = _G.render;
v121 = math.floor;
local v129 = color(0, 0, 0, 0);
local v130 = 1;
local v131 = "s";
do
    local l_v99_2, l_v129_0, l_v130_0 = v99, v129, v130;
    local function v136(v135)
        -- upvalues: l_v130_0 (ref)
        if l_v130_0 == 1 then
            return v135;
        else
            return v135 * l_v130_0;
        end;
    end;
    local v137 = 1;
    local v138 = {};
    local l_alpha_modulate_0 = color().alpha_modulate;
    local function v142(v140, v141)
        -- upvalues: v137 (ref), l_v129_0 (ref), l_alpha_modulate_0 (ref)
        if v137 == 1 then
            return v140;
        elseif not v141 and v137 == 0 then
            return l_v129_0;
        else
            return l_alpha_modulate_0(v140, v137, true);
        end;
    end;
    l_play_0 = setmetatable({
        cheap = false, 
        dpi = l_v99_2.get_scale(2), 
        push_alpha = function(v143)
            -- upvalues: v138 (ref), v137 (ref)
            local v144 = #v138;
            if v144 > 255 then
                error("alpha stack exceeded 255 objects, report to developers");
            end;
            v138[v144 + 1] = v143;
            v137 = v137 * v138[v144 + 1] * (v138[v144] or 1);
        end, 
        pop_alpha = function()
            -- upvalues: v138 (ref), v137 (ref)
            local v145 = #v138;
            local l_v138_0 = v138;
            local l_v145_0 = v145;
            local v148 = nil;
            v145 = v145 - 1;
            l_v138_0[l_v145_0] = v148;
            v137 = v145 == 0 and 1 or v138[v145] * (v138[v145 - 1] or 1);
        end, 
        get_alpha = function(v149)
            -- upvalues: v138 (ref), v137 (ref)
            if v149 then
                return v138[v149];
            else
                return v137, #v138;
            end;
        end, 
        screen_size = function(v150)
            -- upvalues: l_v99_2 (ref), l_v130_0 (ref)
            return l_v99_2.screen_size() / (v150 and 1 or l_v130_0);
        end, 
        measure_text = function(v151, ...)
            -- upvalues: l_v99_2 (ref), l_v130_0 (ref)
            return l_v99_2.measure_text(v151, ...) / l_v130_0;
        end, 
        load_font = function(v152, v153, v154)
            -- upvalues: l_v99_2 (ref)
            return l_v99_2.load_font(v152, v153, v154 or "");
        end, 
        text = function(v155, v156, v157, v158, ...)
            -- upvalues: l_v99_2 (ref), v136 (ref), v142 (ref), l_play_0 (ref)
            l_v99_2.text(v155, v136(v156), v142(v157), v158, ...);
            if measure == true then
                return l_play_0.measure_text(v155, v158, ...);
            else
                return;
            end;
        end, 
        blur = function(v159, v160, v161, v162, v163)
            -- upvalues: l_play_0 (ref), v136 (ref), v137 (ref), l_v99_2 (ref)
            if l_play_0.cheap then
                return;
            else
                if type(v163) == "table" then
                    for v164 = 1, 4 do
                        v163[v164] = v136(v163[v164] or 0);
                    end;
                else
                    v163 = v136(v163 or 0);
                end;
                local v165 = (v162 or 1) * v137;
                v161 = v136(v161 or 2);
                v162 = v165;
                if v162 > 0 and v161 > 0 then
                    l_v99_2.blur(v136(v159), v136(v160), v161, v162, v163);
                end;
                return;
            end;
        end, 
        shadow = function(v166, v167, v168, v169, v170, v171)
            -- upvalues: l_play_0 (ref), l_v99_2 (ref), v136 (ref), v142 (ref)
            if l_play_0.cheap then
                return;
            else
                l_v99_2.shadow(v136(v166), v136(v167), v142(v168), v136(v169 or 16), v136(v170 or 0), v136(v171 or 0));
                return;
            end;
        end, 
        line = function(v172, v173, v174)
            -- upvalues: l_v99_2 (ref), v136 (ref), v142 (ref)
            l_v99_2.line(v136(v172), v136(v173), v142(v174));
        end, 
        rect = function(v175, v176, v177, v178, v179)
            -- upvalues: v136 (ref), l_v99_2 (ref), v142 (ref)
            if type(v178) == "table" then
                for v180 = 1, 4 do
                    v178[v180] = v136(v178[v180] or 0);
                end;
            else
                v178 = v136(v178 or 0);
            end;
            l_v99_2.rect(v136(v175), v136(v176), v142(v177), v178, v179 or false);
        end, 
        rect_outline = function(v181, v182, v183, v184, v185, v186)
            -- upvalues: v136 (ref), l_v99_2 (ref), v142 (ref)
            if type(v185) == "table" then
                for v187 = 1, 4 do
                    v185[v187] = v136(v185[v187] or 0);
                end;
            else
                v185 = v136(v185 or 0);
            end;
            l_v99_2.rect_outline(v136(v181), v136(v182), v142(v183), v136(v184 or 0), v185, v186 or false);
        end, 
        gradient = function(v188, v189, v190, v191, v192, v193, v194)
            -- upvalues: l_v99_2 (ref), v136 (ref), v142 (ref)
            local v195 = v192 or v190;
            if not v193 then
                v193 = v191;
            end;
            l_v99_2.gradient(v136(v188), v136(v189), v142(v190, true), v142(v191, true), v142(v195, true), v142(v193, true), v194 or 0);
        end, 
        circle = function(v196, v197, v198, v199, v200)
            -- upvalues: l_v99_2 (ref), v136 (ref), v142 (ref)
            l_v99_2.circle(v136(v196), v142(v197), v136(v198), v199 or 0, v200 or 1);
        end, 
        circle_outline = function(v201, v202, v203, v204, v205, v206)
            -- upvalues: l_v99_2 (ref), v136 (ref), v142 (ref)
            l_v99_2.circle_outline(v136(v201), v142(v202), v136(v203), v204 or 0, v205 or 1, v136(v206 or 1));
        end, 
        circle_3d = function(v207, v208, v209, v210, v211)
            -- upvalues: l_v99_2 (ref), v142 (ref)
            l_v99_2.circle_3d(v207, v142(v208), v209, v210 or 0, v211 or 1, false);
        end, 
        circle_3d_outline = function(v212, v213, v214, v215, v216, v217)
            -- upvalues: l_v99_2 (ref), v142 (ref), v136 (ref)
            l_v99_2.circle_3d_outline(v212, v142(v213), v214, v215 or 0, v216 or 1, v136(v217 or 1));
        end, 
        circle_3d_gradient = function(v218, v219, v220, v221, v222, v223, v224)
            -- upvalues: l_v99_2 (ref), v142 (ref), v136 (ref)
            l_v99_2.circle_3d_gradient(v218, v142(v219), v142(v220), v221, v222 or 0, v223 or 1, v136(v224 or 1));
        end, 
        texture = function(v225, v226, v227, v228, v229, v230)
            -- upvalues: l_v99_2 (ref), v136 (ref), v142 (ref)
            if not v225 then
                return;
            else
                if not v228 then
                    v228 = color();
                end;
                l_v99_2.texture(v225, v136(v226), v136(v227 or vector(v225.width, v225.height)), v142(v228), v229 or "", v230 or 0);
                return;
            end;
        end, 
        push_clip_rect = function(v231, v232, v233)
            -- upvalues: l_v99_2 (ref), v136 (ref)
            l_v99_2.push_clip_rect(v136(v231), v136(v232), v233 or false);
        end
    }, {
        __index = l_v99_2
    });
end;
v99 = nil;
v121 = {};
v129 = nil;
v130 = color(255, 255, 255, 255);
v131 = function(v234, v235, v236)
    return v234.x >= v235.x and v234.x <= v236.x and v234.y >= v235.y and v234.y <= v236.y;
end;
local v237 = v34.create("##DRAG");
v237:visibility(false);
local v238 = l_play_0.screen_size();
do
    local l_v129_1, l_v130_1, l_v131_0, l_v237_0, l_v238_0 = v129, v130, v131, v237, v238;
    v99 = {
        data = v121, 
        in_bounds = l_v131_0, 
        new = function(v244, v245)
            -- upvalues: v99 (ref), l_v237_0 (ref), l_v238_0 (ref), v15 (ref)
            if type(v245) ~= "table" then
                v245 = {};
            end;
            v99[v244.id] = {
                x = l_v237_0:slider(v244.id .. "::x", 0, 10000, v244.pos.x / l_v238_0.x * 10000), 
                y = l_v237_0:slider(v244.id .. "::y", 0, 10000, v244.pos.y / l_v238_0.y * 10000)
            };
            v99[v244.id].x:set_callback(function(v246)
                -- upvalues: v244 (ref), v15 (ref), l_v238_0 (ref)
                v244.pos.x = v15(v246:get() * 1.0E-4 * l_v238_0.x);
            end, true);
            v99[v244.id].y:set_callback(function(v247)
                -- upvalues: v244 (ref), v15 (ref), l_v238_0 (ref)
                v244.pos.y = v15(v247:get() * 1.0E-4 * l_v238_0.y);
            end, true);
            v244.__drag = {
                active = false, 
                locked = false, 
                point = vector(), 
                progress = {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 0, 
                    [4] = 0
                }, 
                border = v245.border or {
                    [1] = vector(), 
                    [2] = oscreen
                }, 
                rulers = v245.rulers or {}, 
                on_release = v245.on_release, 
                on_held = v245.on_held, 
                on_active = v245.on_active, 
                config = v99[v244.id]
            };
            events.mouse_input:set(function()
                -- upvalues: v244 (ref)
                if ui.get_alpha() > 0 and (v244.__drag.hovered or v244.__drag.active) then
                    return false;
                else
                    return;
                end;
            end);
            events.dpi_change:set(function(_, _, _)
                -- upvalues: v99 (ref), v244 (ref)
                v99[v244.id].x:set(v99[v244.id].x.value);
                v99[v244.id].y:set(v99[v244.id].y.value);
            end);
        end, 
        process = function(v251)
            -- upvalues: l_play_0 (ref), l_v131_0 (ref), l_v129_1 (ref), v93 (ref), l_v130_1 (ref), l_v238_0 (ref)
            local l___drag_0 = v251.__drag;
            if l___drag_0.locked or ui.get_alpha() == 0 then
                return;
            else
                local v253 = ui.get_mouse_position() / l_play_0.dpi;
                local v254 = ui.get_position();
                local v255 = ui.get_size();
                local v256 = ui.get_alpha() > 0 and common.is_button_down(1);
                local v257 = l_v131_0(v253, v251.pos, v251.pos + v251.size) and not l_v131_0(v253, v254 / l_play_0.dpi, (v254 + v255) / l_play_0.dpi);
                if v256 and l___drag_0.ready == nil then
                    local l_v257_0 = v257;
                    local v259 = v251.pos - v253;
                    l___drag_0.init = v251.pos:clone();
                    l___drag_0.point = v259;
                    l___drag_0.ready = l_v257_0;
                end;
                if v256 and l___drag_0.ready then
                    if l_v129_1 == nil and l___drag_0.on_held then
                        l___drag_0.on_held(v251, l___drag_0);
                    end;
                    l_v129_1 = l___drag_0.ready and l_v129_1 == nil and v251.id or l_v129_1;
                    l___drag_0.active = l_v129_1 == v251.id;
                elseif not v256 then
                    if l___drag_0.active and l___drag_0.on_release then
                        l___drag_0.on_release(v251, l___drag_0);
                    end;
                    l___drag_0.active = false;
                    local v260 = nil;
                    local v261 = nil;
                    local v262 = nil;
                    local v263 = nil;
                    l_v129_1 = nil;
                    l___drag_0.aligning = v263;
                    l___drag_0.init = v262;
                    l___drag_0.point = v261;
                    l___drag_0.ready = v260;
                end;
                local v264 = v251.pos * l_play_0.dpi;
                local v265 = v251.size * l_play_0.dpi;
                l___drag_0.hovered = v257 or l___drag_0.active;
                local v266 = {};
                local v267 = v264 + v265 * 0.5;
                local v268 = l___drag_0.point and (l___drag_0.point + v253) * l_play_0.dpi or v264;
                l___drag_0.progress[1] = v93.interp(l___drag_0.progress[1], l___drag_0.active, 0.1);
                l___drag_0.progress[2] = v93.interp(l___drag_0.progress[2], l___drag_0.active or l___drag_0.hovered, 0.1);
                local v269 = l___drag_0.progress[1];
                local v270 = l___drag_0.progress[2];
                l_play_0.push_alpha(ui.get_alpha());
                l_play_0.rect(v251.pos - 4, v251.pos + v251.size + 4, l_v130_1:alpha_modulate(0.1 * (v270 * 0.65 + 0.35), true), 6);
                l_play_0.rect_outline(v251.pos - 5, v251.pos + v251.size + 5, l_v130_1:alpha_modulate(0.3 * v269, true), 1, 7);
                l_play_0.push_alpha(v269);
                if v269 > 0 and not common.is_button_down(162) then
                    local v271 = (v268 + v265 * 0.5) / l_play_0.dpi;
                    for _, v273 in ipairs(l___drag_0.rulers) do
                        v273[4] = v273[4] or {
                            [1] = 0
                        };
                        local v274 = v273[2] / l_play_0.dpi;
                        local v275 = math.abs(v273[1] and v271.x - v274.x or v271.y - v274.y) < 10 * l_play_0.dpi;
                        local l_v274_0 = v274;
                        local v277 = v273[1] and vector(v274.x + 1, v273[3] / l_play_0.dpi) or vector(v273[3] / l_play_0.dpi, v274.y + 1);
                        local v278 = v273[1] and 1 or 2;
                        if not v266[v278] then
                            v266[v278] = v275 and (v273[1] and v274.x - v251.size.x * 0.5 or v274.y - v251.size.y * 0.5) or nil;
                        end;
                        local v279 = math.abs(v273[1] and v267.x - v274.x or v267.y - v274.y);
                        l___drag_0.progress[4] = v93.interp(l___drag_0.progress[4], v275 or v279 < 10 * l_play_0.dpi, 0.1);
                        local v280 = l___drag_0.progress[4] * 0.35 + 0.1;
                        l_play_0.rect(l_v274_0, v277, l_v130_1:alpha_modulate(v280, true));
                    end;
                    if l___drag_0.border[3] then
                        local v281 = utilities.in_bounds(v251.pos, l___drag_0.border[1], l___drag_0.border[2] - v251.size * 0.5 - 1);
                        l___drag_0.progress[3] = v93.interp(l___drag_0.progress[3], not v281, 0.1);
                        local v282 = l___drag_0.progress[3];
                        l_play_0.rect_outline(l___drag_0.border[1] / l_play_0.dpi, l___drag_0.border[2] / l_play_0.dpi, l_v130_1:alpha_modulate(v282 * 0.75 + 0.25, true), 1, 4);
                    end;
                end;
                l_play_0.pop_alpha();
                l_play_0.pop_alpha();
                if l___drag_0.active then
                    local v283 = v268 / l_play_0.dpi;
                    if common.is_button_down(160) then
                        local v284 = l___drag_0.init:to(v283);
                        local v285 = math.abs(v284.y);
                        local v286 = math.abs(v284.x);
                        if l___drag_0.aligning == nil then
                            if v285 > 0.9 then
                                l___drag_0.aligning = 0;
                            elseif v286 > 0.9 then
                                l___drag_0.aligning = 1;
                            end;
                        end;
                        if l___drag_0.aligning == 0 then
                            v283.x = l___drag_0.init.x;
                            l_play_0.rect(vector(v283.x + v251.size.x * 0.5, 0), vector(v283.x + v251.size.x * 0.5 + 1, l_v238_0.y), color(255, 64));
                        elseif l___drag_0.aligning == 1 then
                            v283.y = l___drag_0.init.y;
                            l_play_0.rect(vector(0, v283.y + v251.size.y * 0.5), vector(l_v238_0.x, v283.y + v251.size.y * 0.5 + 1), color(255, 64));
                        end;
                    end;
                    local v287 = v266[1] or v283.x;
                    v283.y = v266[2] or v283.y;
                    v283.x = v287;
                    v287 = (l___drag_0.border[1] - v265 * 0.5) / l_play_0.dpi;
                    local v288 = (l___drag_0.border[2] - v265 * 0.5) / l_play_0.dpi;
                    v251:set_position(math.clamp(v283.x, v287.x, math.min(v288.x, l_v238_0.x - v251.size.x)), (math.clamp(v283.y, v287.y, math.min(v288.y, l_v238_0.y - v251.size.y))));
                    if l___drag_0.on_active then
                        l___drag_0.on_active(v251, l___drag_0, v283);
                    end;
                end;
                return;
            end;
        end
    };
end;
v121 = nil;
v129 = nil;
do
    local l_v129_2 = v129;
    l_v129_2 = {
        update = function(_)
            return 1;
        end, 
        paint = function(_, _, _)

        end, 
        set_position = function(v294, v295, v296)
            -- upvalues: l_play_0 (ref)
            local v297 = nil;
            local v298 = nil;
            if type(v295) == "userdata" then
                local l_x_0 = v295.x;
                v298 = v295.y;
                v297 = l_x_0;
            else
                local l_v295_0 = v295;
                v298 = v296;
                v297 = l_v295_0;
            end;
            local v301 = l_play_0.screen_size();
            if v294.__drag then
                if v297 then
                    v294.__drag.config.x:set(v297 / v301.x * 10000);
                end;
                if v298 then
                    v294.__drag.config.y:set(v298 / v301.y * 10000);
                end;
            else
                local l_pos_0 = v294.pos;
                local l_pos_1 = v294.pos;
                local v304;
                if not v297 then
                    v304 = v294.pos.x;
                else
                    v304 = v297;
                end;
                local v305;
                if not v298 then
                    v305 = v294.pos.y;
                else
                    v305 = v298;
                end;
                l_pos_1.y = v305;
                l_pos_0.x = v304;
            end;
        end, 
        get_drag_position = function(v306)
            -- upvalues: l_play_0 (ref)
            local v307 = v306.__drag and v306.__drag.config;
            if not v307 then
                return v306.pos;
            else
                local v308 = l_play_0.screen_size();
                local v309 = v307.x:get();
                local v310 = v307.y:get();
                return vector(v309 * 1.0E-4 * v308.x, v310 * 1.0E-4 * v308.y);
            end;
        end, 
        get_drag_size = function(v311)
            return v311.size:clone();
        end, 
        __call = function(v312)
            -- upvalues: l_play_0 (ref), v99 (ref), l_v129_2 (ref)
            local l___list_0 = v312.__list;
            local l___drag_1 = v312.__drag;
            if l___list_0 then
                local v315 = l___list_0.collect();
                l___list_0.active = 0;
                l___list_0.items = v315;
                for v316 = 1, #l___list_0.items do
                    if l___list_0.items[v316].active then
                        l___list_0.active = l___list_0.active + 1;
                    end;
                end;
            end;
            v312.alpha = v312:update();
            l_play_0.push_alpha(v312.alpha);
            if v312.alpha > 0 then
                if l___drag_1 then
                    v99.process(v312);
                end;
                if l___list_0 then
                    l_v129_2.traverse(v312);
                end;
                v312:paint(v312.pos, v312.pos + v312.size);
            end;
            l_play_0.pop_alpha();
        end, 
        enlist = function(v317, v318, v319, v320)
            v317.__list = {
                longest = 0, 
                active = 0, 
                items = {}, 
                progress = setmetatable({}, {
                    __mode = "k"
                }), 
                minwidth = v317.size.x, 
                collect = v318, 
                paint = v319, 
                rev = v320
            };
        end, 
        traverse = function(v321)
            -- upvalues: l_play_0 (ref)
            local l___list_1 = v321.__list;
            local v323 = 0;
            local v324 = vector();
            local v325 = 0;
            l___list_1.longest = 0;
            l___list_1.active = v325;
            for v326 = 1, #l___list_1.items do
                local v327 = l___list_1.items[v326];
                local v328 = v327.name or v326;
                l___list_1.progress[v328] = l___list_1.progress[v328] or {
                    [1] = 0
                };
                local v329 = anima.condition(l___list_1.progress[v328], v327.active, 6, {
                    [1] = {
                        [1] = 1, 
                        [2] = 3
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = 3
                    }
                });
                if v329 > 0 then
                    l_play_0.push_alpha(v329);
                    v324 = l___list_1.paint(v321, v327, v323, v329);
                    l_play_0.pop_alpha();
                    local v330 = l___list_1.active + 1;
                    v323 = v323 + v324.y * v329;
                    l___list_1.active = v330;
                    l___list_1.longest = math.max(l___list_1.longest, v324.x);
                end;
            end;
            v321.size.x = anima.lerp(v321.size.x, math.max(l___list_1.longest, l___list_1.minwidth), 10, 0.5);
        end, 
        lock = function(v331, v332)
            if not v331.__drag then
                return;
            else
                v331.__drag.locked = v332 and true or false;
                return;
            end;
        end
    };
    l_v129_2.__index = l_v129_2;
    v121 = {
        new = function(v333, v334, v335, v336)
            -- upvalues: v99 (ref), l_v129_2 (ref)
            local v337 = {
                alpha = 1, 
                id = v333, 
                pos = v334, 
                size = v335, 
                progress = {
                    [1] = 0
                }
            };
            if v336 then
                v99.new(v337, type(v336) == "table" and v336 or nil);
            end;
            return setmetatable(v337, l_v129_2);
        end
    };
end;
v129 = nil;
v129 = {};
v130 = function(v338)
    local v339 = {};
    local v340 = 0;
    for v341 in string.gmatch(v338, ".[\128-\191]*") do
        v340 = v340 + 1;
        v339[v340] = v341;
    end;
    return v339, v340;
end;
do
    local l_v130_2 = v130;
    v129.gradient = function(v343, v344, v345, v346)
        -- upvalues: l_v130_2 (ref)
        local v347 = {};
        local v348, v349 = l_v130_2(v343);
        local v350 = 1 / (v349 - 1);
        local v351 = v346.r - v345.r;
        local v352 = v346.g - v345.g;
        local v353 = v346.b - v345.b;
        local v354 = v346.a - v345.a;
        for v355 = 1, v349 do
            local v356 = v348[v355];
            local v357 = v344 % 2;
            if v357 > 1 then
                v357 = 2 - v357;
            end;
            local v358 = v345.r + v357 * v351;
            local v359 = v345.g + v357 * v352;
            local v360 = v345.b + v357 * v353;
            local v361 = v345.a + v357 * v354;
            local v362 = string.format("%02x%02x%02x%02x", v358, v359, v360, v361);
            table.insert(v347, "\a");
            table.insert(v347, v362);
            table.insert(v347, v356);
            v344 = v344 + v350;
        end;
        return table.concat(v347);
    end;
end;
v130 = nil;
v130 = {
    recorder = {}
};
v131 = nil;
v131 = {
    aimtools = {
        [1] = "Pistols", 
        [2] = "AutoSnipers", 
        [3] = "AWP", 
        [4] = "SSG-08", 
        [5] = "Desert Eagle", 
        [6] = "R8 Revolver"
    }, 
    states = {
        [0] = "Shared", 
        [1] = "Standing", 
        [2] = "Running", 
        [3] = "Slow motion", 
        [4] = "Crouching", 
        [5] = "Move & Crouching", 
        [6] = "Air", 
        [7] = "Air & Crouching", 
        [8] = "On use", 
        [9] = "Fakelag", 
        [10] = "Freestanding", 
        [11] = "Safe Head", 
        [12] = "Manual Yaw", 
        [13] = "Warmup AA"
    }
};
v237 = nil;
v237 = {};
v238 = ".\\" .. v16.name;
local function v364(v363)
    return type(v363.type) == "string" and type(v363.link) == "string" and type(v363.width) == "number" and type(v363.height) == "number";
end;
do
    local l_v238_1, l_v364_0 = v238, v364;
    local function v373(v367)
        -- upvalues: l_v364_0 (ref), l_v238_1 (ref), v237 (ref), l_play_0 (ref)
        return function(v368)
            -- upvalues: l_v364_0 (ref), l_v238_1 (ref), v367 (ref), v237 (ref), l_play_0 (ref)
            if not l_v364_0(v368) then
                return false;
            else
                files.create_folder(l_v238_1);
                local v369 = string.format("%s/%s.%s", l_v238_1, v367, v368.type);
                local v370 = files.read(v369, true);
                if v370 ~= nil then
                    v237[v367] = l_play_0.load_image(v370, vector(v368.width, v368.height));
                else
                    network.get(v368.link, {}, function(v371)
                        -- upvalues: v237 (ref), v367 (ref), l_play_0 (ref), v368 (ref), v369 (ref)
                        if v371 == nil then
                            return;
                        else
                            local l_v371_0 = v371;
                            v237[v367] = l_play_0.load_image(l_v371_0, vector(v368.width, v368.height));
                            files.write(v369, l_v371_0, true);
                            return;
                        end;
                    end);
                end;
                return true;
            end;
        end;
    end;
    v373("eva_small")({
        type = "png", 
        height = 35, 
        width = 35, 
        link = "https://cdn.hysteria.one/angelwings/angelwings_eva_img.png"
    });
    v373("billy")({
        type = "png", 
        height = 185, 
        width = 131, 
        link = "https://cdn.hysteria.one/angelwings/billy.png"
    });
    v373("tulen")({
        type = "png", 
        height = 401, 
        width = 401, 
        link = "https://cdn.hysteria.one/angelwings/tulen.png"
    });
end;
v238 = nil;
v238 = {};
local v374 = ({
    debug = -1, 
    exclusive = 1, 
    illusory = 0, 
    live = 2
})[v16.build:lower()];
local v375 = {};
local function v378(v376, v377)
    v376:set(unpack(v377));
    v376:disabled(true);
end;
do
    local l_v374_0, l_v375_0, l_v378_0 = v374, v375, v378;
    local function v384()
        -- upvalues: l_v375_0 (ref), l_v378_0 (ref)
        for v382 = 1, #l_v375_0 do
            local v383 = l_v375_0[v382];
            l_v378_0(v383.item, v383.value);
        end;
    end;
    v238.is_locked = function(v385)
        -- upvalues: l_v374_0 (ref)
        if l_v374_0 == -1 then
            return false;
        elseif v385 == -1 then
            return true;
        else
            return v385 <= l_v374_0;
        end;
    end;
    v238.push = function(v386, v387, ...)
        -- upvalues: v238 (ref), l_v375_0 (ref), l_v378_0 (ref)
        if not v238.is_locked(v386) then
            return v387;
        else
            local v388 = {
                ...
            };
            if select("#", ...) == 0 then
                v388 = {
                    [1] = false
                };
            end;
            table.insert(l_v375_0, {
                item = v387, 
                value = v388
            });
            v387:set_callback(function(v389)
                -- upvalues: l_v378_0 (ref), v388 (ref)
                l_v378_0(v389, v388);
            end, true);
            return v387;
        end;
    end;
    v238.update = function()
        -- upvalues: v384 (ref)
        v384();
    end;
    local function v391(v390)
        -- upvalues: v384 (ref)
        if v390 == "pre_save" then
            v384();
        end;
    end;
    utils.execute_after(0, v384);
    events.config_state(v391);
end;
v364 = nil;
v364 = {};
v374 = 1;
v375 = 2;
v378 = function(v392)
    return (string.gsub(v392, "${(.-)}", "\a{Link Active}%1\aDEFAULT"));
end;
local function v394(v393)
    -- upvalues: l_get_0 (ref)
    return string.rep(l_get_0, v393);
end;
local function v398(v395, v396)
    -- upvalues: l_get_0 (ref)
    local v397 = string.rep(l_get_0, v396);
    return v397 .. v395 .. v397;
end;
do
    local l_v378_1, l_v394_0 = v378, v394;
    local function v406(v401, v402, v403, v404, v405)
        -- upvalues: l_v394_0 (ref)
        return l_v394_0(v404) .. "\a" .. v401 .. ui.get_icon(v402) .. l_v394_0(v405) .. "\aDEFAULT" .. v403;
    end;
    local function v411(v407, v408, v409, v410)
        -- upvalues: v406 (ref)
        return v406("{Link Active}", v407, v408, v409, v410);
    end;
    local function v418(v412, v413, v414, v415)
        -- upvalues: l_v394_0 (ref)
        local v416 = l_v394_0(v415);
        local v417 = l_v394_0(3);
        return v416 .. "\a" .. v412 .. ui.get_icon(v413) .. v417 .. "\aDEFAULT" .. v414 .. v416;
    end;
    local function v422(v419, v420, v421)
        -- upvalues: v418 (ref)
        return v418("{Link Active}", v419, v420, v421);
    end;
    local function v427(v423, v424, v425)
        -- upvalues: l_v394_0 (ref)
        local v426 = l_v394_0(v425);
        return v426 .. "\a" .. v423 .. ui.get_icon(v424) .. v426;
    end;
    local function v430(v428, v429)
        -- upvalues: v427 (ref)
        return v427("{Link Active}", v428, v429);
    end;
    local function v438(v431, v432)
        local v433 = v431:get();
        if #v433 == 0 then
            if v432 == nil then
                local v434 = v431:type();
                local v435 = v431:list();
                if v434 == "selectable" then
                    v432 = v435;
                elseif v434 == "listable" then
                    v432 = {};
                    for v436 = 1, #v435 do
                        v432[v436] = v436;
                    end;
                end;
            end;
            v433 = v432;
            v431:set(v432);
        end;
        v431:set_callback(function()
            -- upvalues: v431 (ref), v433 (ref)
            local v437 = v431:get();
            if #v437 > 0 then
                v433 = v437;
            else
                v431:set(v433);
            end;
        end);
    end;
    local v439 = {
        category = v34.create("~", "##CATEGORY", v374), 
        info = v34.create("~", "##INFO", v374), 
        antiaim = {
            main = v34.create("~", "##AA_MAIN", v374), 
            state = v34.create("~", "##AA_STATE", v375), 
            recorder = v34.create("~", "##AA_RECORDER", v375), 
            settings = v34.create("~", "##AA_SETTINGS", v375), 
            presets = v34.create("~", "##AA_PRESETS", v375)
        }, 
        ragebot = v34.create("~", "##RAGEBOT", v375), 
        visuals = v34.create("~", "##VISUALS", v375), 
        misc = v34.create("~", "##MISC", v375)
    };
    local _ = nil;
    local function v446()
        -- upvalues: v129 (ref), v16 (ref)
        local v441 = ui.get_style();
        local v442 = color(40, 40, 40, 255);
        local v443 = v441["Link Active"];
        local v444 = -globals.realtime * 0.8;
        local v445 = v129.gradient(v16.name, v444, v443, v442);
        ui.sidebar(v445, "sparkles");
    end;
    events.render(v446);
    v446 = nil;
    v446 = v439.category:list("##CATEGORY", {
        [1] = "Anti-Aim", 
        [2] = "Ragebot", 
        [3] = "Visuals", 
        [4] = "Misc"
    });
    v364.category = v446;
    local v447 = {};
    local v448 = string.lower(v16.build);
    v447.welcome_text = v439.info:label(v411("user", l_v378_1(string.format("Welcome back, ${%s}", v16.user)), 1, 7));
    v447.welcome_text = v439.info:label(v411("code-branch", l_v378_1(string.format("Your build is ${%s}", v448)), 1, 7));
    v364.info = v447;
    v364.links = {
        label = v439.info:label(v13("\a{Link Active}", "Links")), 
        discord = v439.info:button(v430("discord", 10), nil, true), 
        youtube = v439.info:button(v430("youtube", 10), nil, true), 
        config = v439.info:button(v430("file", 10), nil, true)
    };
    v364.configs = {
        label = v439.info:label(v13("\a{Link Active}", "Config")), 
        export = v439.info:button(v422("copy", "Export", 7), nil, true), 
        import = v439.info:button(v422("paste", "Import", 7), nil, true), 
        default = v439.info:button(v398("Load Default Config", 34), nil, true)
    };
    local v449 = {};
    local l_main_0 = v439.antiaim.main;
    local l_state_0 = v439.antiaim.state;
    local l_settings_0 = v439.antiaim.settings;
    local l_presets_0 = v439.antiaim.presets;
    local l_recorder_0 = v439.antiaim.recorder;
    v59.add("##ANTIAIM_MAIN", l_main_0, "AA");
    v59.add("##ANTIAIM_STATE", l_state_0, "AA");
    v59.add("##ANTIAIM_SETTINGS", l_settings_0, "AA");
    v449.enabled = l_main_0:switch("Enabled");
    v449.mode = l_main_0:list("##MODE", {
        [1] = "Main", 
        [2] = "Settings", 
        [3] = "Presets"
    });
    local v455 = {};
    local v456 = {
        unpack(v131.states, 0)
    };
    local v457 = {};
    v455.state = l_state_0:combo("State", v456);
    local v458 = nil;
    local function v460(v459)
        -- upvalues: v439 (ref)
        v439.info:visibility(v459);
    end;
    do
        local l_l_settings_0_0, l_l_presets_0_0, l_l_recorder_0_0, l_v455_0 = l_settings_0, l_presets_0, l_recorder_0, v455;
        do
            local l_v456_0, l_v457_0 = v456, v457;
            local function v478(v467)
                -- upvalues: l_v455_0 (ref), l_v456_0 (ref), l_v457_0 (ref), l_l_recorder_0_0 (ref)
                local v468 = l_v455_0.state:get();
                l_v455_0.state:visibility(v467);
                local v469 = false;
                for v470 = 1, #l_v456_0 do
                    local v471 = l_v456_0[v470];
                    local v472 = l_v455_0[v471];
                    local v473 = l_v457_0[v471];
                    local v474 = v467 and v471 == v468;
                    if v472 ~= nil and v472.enabled ~= nil then
                        v472.enabled:visibility(v474);
                        if v474 then
                            v474 = v472.enabled:get();
                        end;
                    end;
                    if v472.bomb_e_fix ~= nil then
                        v472.bomb_e_fix:visibility(v474);
                    end;
                    local v475 = v472.mode:get();
                    v472.mode:visibility(v474);
                    local v476 = v475 == "Builder";
                    local v477 = v475 == "Recorder";
                    if v473 ~= nil then
                        if v473.angles ~= nil then
                            v473.angles:visibility(v476 and v474);
                        end;
                        if v473.defensive ~= nil then
                            v473.defensive:visibility(v476 and v474);
                        end;
                        if v473.recorder ~= nil then
                            v473.recorder:visibility(v477 and v474);
                        end;
                    end;
                    if v477 and v474 then
                        v469 = true;
                    end;
                end;
                l_l_recorder_0_0:visibility(v469);
            end;
            local function v480(v479)
                -- upvalues: l_l_presets_0_0 (ref)
                l_l_presets_0_0:visibility(v479);
            end;
            local function v482(v481)
                -- upvalues: l_l_settings_0_0 (ref)
                l_l_settings_0_0:visibility(v481);
            end;
            do
                local l_v460_0, l_v478_0, l_v480_0, l_v482_0 = v460, v478, v480, v482;
                local function v493(v487)
                    -- upvalues: v449 (ref), l_v460_0 (ref), l_v478_0 (ref), l_v482_0 (ref), l_v480_0 (ref)
                    local v488 = v449.mode:get();
                    local v489 = v449.enabled:get();
                    local v490 = v488 == 1;
                    local v491 = v488 == 2;
                    local v492 = v488 == 3;
                    v449.enabled:visibility(v487);
                    v449.mode:visibility(v487 and v489);
                    l_v460_0(not v487 or not v489);
                    l_v478_0(v487 and v489 and v490);
                    l_v482_0(v487 and v489 and v491);
                    l_v480_0(v487 and v489 and v492);
                end;
                v458 = function()
                    -- upvalues: v446 (ref), v493 (ref)
                    local v494 = v446:get();
                    v493(v494 == 1);
                end;
            end;
            v460 = function(v495, v496, v497)
                -- upvalues: l_v378_1 (ref)
                local v498 = {
                    [1] = "Off", 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Skitter", 
                    [5] = "Custom Ways", 
                    [6] = "Spin", 
                    [7] = "Random", 
                    [8] = "Angelic"
                };
                local v499 = {
                    [1] = "Off", 
                    [2] = "Left", 
                    [3] = "Right", 
                    [4] = "Jitter", 
                    [5] = "Random"
                };
                local v500 = {
                    [1] = "Left", 
                    [2] = "Right", 
                    [3] = "Forward", 
                    [4] = "Forward-Left", 
                    [5] = "Forward-Right", 
                    [6] = "Backward", 
                    [7] = "Backward-Left", 
                    [8] = "Backward-Right"
                };
                local function v502(v501)
                    return v501 > 0 and v501 .. "%" or "Off";
                end;
                local function _(v503)
                    return v503 > 1 and v503 .. "t" or "Off";
                end;
                local function v506(v505)
                    return v505 > 0 and v505 .. "t" or "Off";
                end;
                if v495 == "Move & Crouching" then
                    v497.direction = v496:combo(l_v378_1("Direction"), {
                        "General", 
                        unpack(v500)
                    });
                end;
                v497.yaw_offset = v496:slider("Offset", -90, 90, 0, nil, "\194\176");
                v497.add_yaw = v496:switch("Add Yaw");
                v497.yaw_left = v496:slider(l_v378_1("${~}   Left##YAW"), -90, 90, 0, nil, "\194\176");
                v497.yaw_right = v496:slider(l_v378_1("${~}   Right##YAW"), -90, 90, 0, nil, "\194\176");
                if v495 == "Move & Crouching" then
                    for v507 = 1, #v500 do
                        local v508 = v500[v507];
                        v497[v508] = {
                            enabled = v496:switch(l_v378_1("${~}   Enabled##YAW_") .. v508), 
                            yaw_offset = v496:slider(l_v378_1("${~}   Offset##YAW_") .. v508, -90, 90, 0, nil, "\194\176"), 
                            yaw_left = v496:slider(l_v378_1("${~}   Left##YAW_") .. v508, -90, 90, 0, nil, "\194\176"), 
                            yaw_right = v496:slider(l_v378_1("${~}   Right##YAW_") .. v508, -90, 90, 0, nil, "\194\176")
                        };
                    end;
                end;
                local v509 = nil;
                local function v520()
                    -- upvalues: v497 (ref), v500 (ref)
                    local v510 = v497.add_yaw:get();
                    local v511 = "General";
                    if v497.direction ~= nil then
                        v511 = v497.direction:get();
                    end;
                    local v512 = v511 == "General";
                    v497.yaw_offset:visibility(v512);
                    v497.yaw_left:visibility(v512 and v510);
                    v497.yaw_right:visibility(v512 and v510);
                    for v513 = 1, #v500 do
                        local v514 = v500[v513];
                        local v515 = v497[v514];
                        if v515 ~= nil then
                            local v516 = v511 == v514;
                            v515.enabled:visibility(v516);
                            if not v515.enabled:get() then
                                v516 = false;
                            end;
                            v515.yaw_offset:visibility(v516);
                            local l_yaw_left_0 = v515.yaw_left;
                            local l_l_yaw_left_0_0 = l_yaw_left_0;
                            l_yaw_left_0 = l_yaw_left_0.visibility;
                            local v519;
                            if v516 then
                                v519 = v510;
                            else
                                v519 = v516;
                            end;
                            l_yaw_left_0(l_l_yaw_left_0_0, v519);
                            l_yaw_left_0 = v515.yaw_right;
                            l_l_yaw_left_0_0 = l_yaw_left_0;
                            l_yaw_left_0 = l_yaw_left_0.visibility;
                            if v516 then
                                v519 = v510;
                            else
                                v519 = v516;
                            end;
                            l_yaw_left_0(l_l_yaw_left_0_0, v519);
                        end;
                    end;
                end;
                v497.add_yaw:set_callback(v520);
                if v497.direction ~= nil then
                    v497.direction:set_callback(v520);
                    for v521 = 1, #v500 do
                        local v522 = v497[v500[v521]];
                        if v522 ~= nil then
                            v522.enabled:set_callback(v520);
                        end;
                    end;
                end;
                v520();
                v497.yaw_jitter = v496:combo("Jitter", v498);
                v509 = v497.yaw_jitter:create();
                v497.jitter_offset = v496:slider(l_v378_1("${~}   Degree"), -90, 90, 0, nil, "\194\176");
                v497.way_count = v509:slider("Count", 3, 5, 3);
                v497.way_values = {};
                for v523 = 1, 5 do
                    v497.way_values[v523] = v509:slider("Way " .. v523, -90, 90, 0, nil, "\194\176");
                end;
                v520 = nil;
                local function v527(v524)
                    -- upvalues: v497 (ref)
                    local v525 = v524:get();
                    for v526 = 1, #v497.way_values do
                        v497.way_values[v526]:visibility(v526 <= v525);
                    end;
                end;
                do
                    local l_v527_0 = v527;
                    local function v535(v529)
                        -- upvalues: v497 (ref), l_v527_0 (ref)
                        local v530 = v529:get();
                        local v531 = v530 == "Off";
                        local v532 = not v531 and v530 ~= "Custom Ways";
                        local v533 = not v531 and v530 == "Custom Ways";
                        v497.jitter_offset:visibility(v532);
                        v497.way_count:visibility(v533);
                        if v533 then
                            v497.way_count:set_callback(l_v527_0, true);
                        else
                            v497.way_count:unset_callback(l_v527_0);
                        end;
                        if not v533 then
                            for v534 = 1, #v497.way_values do
                                v497.way_values[v534]:visibility(false);
                            end;
                        end;
                    end;
                    v497.yaw_jitter:set_callback(v535, true);
                end;
                v497.body_yaw = v496:combo("Body Yaw", v499);
                v509 = v497.body_yaw:create();
                v497.invert_chance = v509:slider("Invert Chance", 1, 100, 100, nil, "%");
                v497.avoid_overlap = v509:switch("Avoid overlap");
                v497.freestanding_body_yaw = v509:combo("Freestanding", {
                    [1] = "Off", 
                    [2] = "Peek Fake", 
                    [3] = "Peek Real"
                });
                v497.left_limit = v496:slider(l_v378_1("${~}   Left##BODY_YAW"), 0, 60, 60, nil, "\194\176");
                v497.right_limit = v496:slider(l_v378_1("${~}   Right##BODY_YAW"), 0, 60, 60, nil, "\194\176");
                v520 = nil;
                v527 = function(v536)
                    -- upvalues: v497 (ref)
                    local v537 = v536:get();
                    local v538 = v537 == "Left";
                    local v539 = v537 == "Right";
                    local v540 = v537 == "Jitter";
                    local v541 = v537 == "Random";
                    v497.invert_chance:visibility(v540);
                    v497.left_limit:visibility(v538 or v540 or v541);
                    v497.right_limit:visibility(v539 or v540 or v541);
                end;
                v497.body_yaw:set_callback(v527, true);
                v497.random = v496:slider("Randomization", 0, 100, 0, nil, v502);
                v497.delay = v496:switch("Delay");
                v509 = v497.delay:create();
                v497.delay_affect_modifier = v509:switch("Affect Modifier");
                v497.delay_mode = v509:combo("Mode", {
                    [1] = "Default", 
                    [2] = "Custom"
                });
                v497.delay_value = v509:slider("Ticks", 2, 14, 1, nil, "t");
                v497.delay_random = v509:slider("Random ticks", 0, 14, 0, nil, v506);
                v497.delay_count = v509:slider("Count", 2, 8, 2);
                v497.delay_values = {};
                for v542 = 1, 8 do
                    v497.delay_values[v542] = v509:slider("Slider " .. v542, 1, 14, 1, nil, "t");
                end;
                v520 = nil;
                v527 = function(v543)
                    -- upvalues: v497 (ref)
                    local v544 = v543:get();
                    for v545 = 1, 8 do
                        v497.delay_values[v545]:visibility(v545 <= v544);
                    end;
                end;
                do
                    local l_v527_1 = v527;
                    local function v552(v547)
                        -- upvalues: v497 (ref), l_v527_1 (ref)
                        local v548 = v547:get();
                        local v549 = v548 == "Default";
                        local v550 = v548 == "Custom";
                        v497.delay_value:visibility(v549);
                        v497.delay_random:visibility(v549);
                        v497.delay_count:visibility(v550);
                        if v550 then
                            v497.delay_count:set_callback(l_v527_1, true);
                        else
                            v497.delay_count:unset_callback(l_v527_1);
                        end;
                        if not v550 then
                            for v551 = 1, 8 do
                                v497.delay_values[v551]:visibility(false);
                            end;
                        end;
                    end;
                    v497.delay_mode:set_callback(v552, true);
                end;
                return v497;
            end;
            v478 = function(_, v554, v555)
                -- upvalues: l_v378_1 (ref)
                local v556 = {
                    [1] = "Off", 
                    [2] = "Static", 
                    [3] = "Jitter", 
                    [4] = "Spin", 
                    [5] = "Random", 
                    [6] = "Angelic"
                };
                local v557 = {
                    [1] = "Off", 
                    [2] = "Static", 
                    [3] = "Spin", 
                    [4] = "Random", 
                    [5] = "Left/Right", 
                    [6] = "Side-Based"
                };
                local v558 = {
                    [1] = "Off", 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Skitter"
                };
                local function v560(v559)
                    return v559 > 0 and v559 .. "t" or "Off";
                end;
                v555.force_break_lc = v554:switch("Force Break LC");
                local v561 = v555.force_break_lc:create();
                v555.tickbase = v561:combo("Tickbase", {
                    [1] = "Default", 
                    [2] = "Ticks", 
                    [3] = "Random"
                });
                v555.tickbase_ticks = v561:slider("Ticks", 2, 22, 15, nil, "t");
                v555.tickbase_min = v561:slider("Min. Ticks", 2, 22, 15, nil, "t");
                v555.tickbase_max = v561:slider("Max. Ticks", 2, 22, 15, nil, "t");
                local v562 = nil;
                local function v567(v563)
                    -- upvalues: v555 (ref)
                    local v564 = v563:get();
                    local v565 = v564 == "Ticks";
                    local v566 = v564 == "Random";
                    v555.tickbase_ticks:visibility(v565);
                    v555.tickbase_min:visibility(v566);
                    v555.tickbase_max:visibility(v566);
                end;
                v555.tickbase:set_callback(v567, true);
                v555.enabled = v554:switch("Defensive AA");
                v555.pitch = v554:combo("Pitch", v556);
                v555.pitch_offset_1 = v554:slider(l_v378_1("${~}   Angle 1##PITCH"), -89, 89, 0, nil, "\194\176");
                v555.pitch_offset_2 = v554:slider(l_v378_1("${~}   Angle 2##PITCH"), -89, 89, 0, nil, "\194\176");
                v555.pitch_speed = v554:slider(l_v378_1("${~}   Speed##PITCH"), -50, 50, 20, 0.1);
                v555.yaw = v554:combo("Yaw", v557);
                v555.yaw_left = v554:slider(l_v378_1("${~}   Yaw Left##YAW"), -180, 180, 0, nil, "\194\176");
                v555.yaw_right = v554:slider(l_v378_1("${~}   Yaw Right##YAW"), -180, 180, 0, nil, "\194\176");
                v555.yaw_offset = v554:slider(l_v378_1("${~}   Yaw Offset##YAW"), 0, 360, 0, nil, "\194\176");
                v555.yaw_speed = v554:slider(l_v378_1("${~}   Yaw Speed##YAW"), -50, 50, 20, 0.1);
                v555.yaw_modifier = v554:combo(l_v378_1("${~}   Modifier##MOD"), v558);
                v555.modifier_offset = v554:slider(l_v378_1("${~}   Degree##MOD"), -180, 180, 0, nil, "\194\176");
                v555.delay = v554:switch(l_v378_1("${~}   Delay##MOD"));
                v561 = v555.delay:create();
                v555.delay_affect_modifier = v561:switch("Affect Modifier");
                v555.delay_mode = v561:combo("Mode", {
                    [1] = "Default", 
                    [2] = "Custom"
                });
                v555.delay_value = v561:slider("Ticks", 2, 14, 1, nil, "t");
                v555.delay_random = v561:slider("Random ticks", 0, 14, 0, nil, v560);
                v555.delay_count = v561:slider("Count", 2, 8, 2);
                v555.delay_values = {};
                for v568 = 1, 8 do
                    v555.delay_values[v568] = v561:slider("Slider " .. v568, 1, 14, 1, nil, "t");
                end;
                v562 = nil;
                v567 = function(v569)
                    -- upvalues: v555 (ref)
                    local v570 = v569:get();
                    for v571 = 1, 8 do
                        v555.delay_values[v571]:visibility(v571 <= v570);
                    end;
                end;
                do
                    local l_v567_0 = v567;
                    local function v578(v573)
                        -- upvalues: v555 (ref), l_v567_0 (ref)
                        local v574 = v573:get();
                        local v575 = v574 == "Default";
                        local v576 = v574 == "Custom";
                        v555.delay_value:visibility(v575);
                        v555.delay_random:visibility(v575);
                        v555.delay_count:visibility(v576);
                        if v576 then
                            v555.delay_count:set_callback(l_v567_0, true);
                        else
                            v555.delay_count:unset_callback(l_v567_0);
                        end;
                        if not v576 then
                            for v577 = 1, 8 do
                                v555.delay_values[v577]:visibility(false);
                            end;
                        end;
                    end;
                    v555.delay_mode:set_callback(v578, true);
                end;
                v555.force_target_yaw = v554:switch("Force Target Yaw");
                v561 = nil;
                v562 = function(v579)
                    -- upvalues: v555 (ref)
                    local v580 = v579:get();
                    local v581 = v580 == "Off";
                    local v582 = v580 == "Static";
                    local _ = v580 == "Jitter";
                    local _ = v580 == "Random";
                    local v585 = v580 == "Spin";
                    local v586 = v580 == "Angelic";
                    local v587 = not v581;
                    local v588 = not v581 and not v582;
                    local l_v585_0 = v585;
                    if v586 then
                        v587 = false;
                        v588 = false;
                        l_v585_0 = false;
                    end;
                    v555.pitch_offset_1:visibility(v587);
                    v555.pitch_offset_2:visibility(v588);
                    v555.pitch_speed:visibility(l_v585_0);
                end;
                v567 = function(v590)
                    -- upvalues: v555 (ref)
                    local v591 = v590:get() ~= "Off";
                    v555.modifier_offset:visibility(v591);
                    v555.delay:visibility(v591);
                end;
                do
                    local l_v562_0, l_v567_1 = v562, v567;
                    local function v603(v594)
                        -- upvalues: v555 (ref), l_v567_1 (ref)
                        local v595 = v594:get();
                        local v596 = v595 == "Off";
                        local v597 = v595 == "Spin";
                        local v598 = v595 == "Left/Right";
                        local v599 = v595 == "Side-Based";
                        local v600 = v597 or v599;
                        local l_v597_0 = v597;
                        local l_v598_0 = v598;
                        v555.yaw_left:visibility(l_v598_0);
                        v555.yaw_right:visibility(l_v598_0);
                        v555.yaw_offset:visibility(v600);
                        v555.yaw_speed:visibility(l_v597_0);
                        v555.yaw_modifier:visibility(not v596);
                        if not v596 then
                            v555.yaw_modifier:set_callback(l_v567_1, true);
                        else
                            v555.yaw_modifier:unset_callback(l_v567_1);
                        end;
                        if v596 then
                            v555.modifier_offset:visibility(false);
                            v555.delay:visibility(false);
                        end;
                    end;
                    local function v606(v604)
                        -- upvalues: v555 (ref), l_v562_0 (ref), v603 (ref), l_v567_1 (ref)
                        local v605 = v604:get();
                        if not v605 then
                            v555.pitch_offset_1:visibility(false);
                            v555.pitch_offset_2:visibility(false);
                            v555.pitch_speed:visibility(false);
                            v555.yaw_left:visibility(false);
                            v555.yaw_right:visibility(false);
                            v555.yaw_offset:visibility(false);
                            v555.yaw_speed:visibility(false);
                            v555.yaw_modifier:visibility(false);
                            v555.modifier_offset:visibility(false);
                            v555.delay:visibility(false);
                        end;
                        if v605 then
                            v555.pitch:set_callback(l_v562_0, true);
                            v555.yaw:set_callback(v603, true);
                        else
                            v555.pitch:unset_callback(l_v562_0);
                            v555.yaw:unset_callback(v603);
                            v555.yaw_modifier:unset_callback(l_v567_1);
                        end;
                        v555.pitch:visibility(v605);
                        v555.yaw:visibility(v605);
                        v555.force_target_yaw:visibility(v605);
                    end;
                    v555.enabled:set_callback(v606, true);
                end;
                v555.flick_enabled = v554:switch("Defensive Flick");
                v555.flick_mode = v554:combo("Mode", {
                    [1] = "Default", 
                    [2] = "Silent"
                });
                v555.flick_pitch = v554:slider("Pitch", -89, 89, 0);
                v555.flick_yaw = v554:slider("Yaw", 0, 180, 120);
                v555.flick_yaw_random = v555.flick_yaw:create():slider("Yaw Random", 0, 180, 0);
                v555.flick_limit = v554:slider("Limit", 0, 60, 60);
                v555.flick_speed = v554:slider("Speed", 2, 10, 7);
                v555.flick_speed_random = v555.flick_speed:create():slider("Speed Random", 0, 8, 0);
                v561 = nil;
                v562 = function(v607)
                    -- upvalues: v555 (ref)
                    local v608 = v607:get();
                    v555.flick_mode:visibility(v608);
                    v555.flick_pitch:visibility(v608);
                    v555.flick_yaw:visibility(v608);
                    v555.flick_limit:visibility(v608);
                    v555.flick_speed:visibility(v608);
                end;
                v555.flick_enabled:set_callback(v562, true);
                return v555;
            end;
            v480 = function(_, v610, v611)
                v611.record = v610:value("record", "[]");
                v611.inverse_inverter = v610:switch("Inverse Inverter");
                return v611;
            end;
            for v612 = 1, #l_v456_0 do
                local v613 = l_v456_0[v612];
                local v614 = string.format("##ANGLES_%s", v613);
                local v615 = string.format("##DEFENSIVE_%s", v613);
                local v616 = string.format("##RECORDER_%s", v613);
                local v617 = v34.create("~", v614, v375);
                local v618 = v34.create("~", v615, v375);
                local v619 = v34.create("~", v616, v375);
                do
                    local l_v613_0 = v613;
                    local function v625(v621)
                        -- upvalues: l_v613_0 (ref)
                        local v622 = string.format("##%s", l_v613_0);
                        local _, v624 = string.find(v621[2], "##");
                        if v624 ~= nil then
                            v622 = v622 .. string.sub(v621[2], v624 + 1);
                        end;
                        v621[2] = v621[2] .. v622;
                    end;
                    local v626 = {};
                    l_state_0:set_callback(v625);
                    v617:set_callback(v625);
                    v618:set_callback(v625);
                    v619:set_callback(v625);
                    v626.mode = l_state_0:combo("Mode", {
                        [1] = "Builder", 
                        [2] = "Recorder"
                    });
                    v626.mode:set_callback(v458);
                    if l_v613_0 ~= "Shared" then
                        l_state_0:set_flag(v34.group_flags.callbacks, false);
                        v626.enabled = l_state_0:switch(string.format("\a{Link Active}Allow %s", l_v613_0:lower()));
                        l_state_0:set_flag(v34.group_flags.callbacks, true);
                        v626.enabled:set_callback(v458);
                    end;
                    if l_v613_0 == "On use" then
                        v626.bomb_e_fix = l_state_0:switch("Bomb E Fix");
                    end;
                    v626.angles = v460(l_v613_0, v617, {});
                    if l_v613_0 ~= "Fakelag" then
                        v626.defensive = v478(l_v613_0, v618, {});
                    end;
                    v626.recorder = v480(l_v613_0, v619, {});
                    l_state_0:unset_callback(v625);
                    v617:unset_callback(v625);
                    v618:unset_callback(v625);
                    v619:unset_callback(v625);
                    l_v455_0[l_v613_0] = v626;
                    l_v457_0[l_v613_0] = {
                        angles = v617, 
                        defensive = v618, 
                        recorder = v619
                    };
                    v59.add(v614, v617, "AA");
                    v59.add(v615, v618, "AA");
                    v59.add(v616, v619, "AA");
                end;
            end;
            v482 = nil;
            v446:set_callback(v458);
            v449.enabled:set_callback(v458);
            v449.mode:set_callback(v458);
            l_v455_0.state:set_callback(v458);
            v458();
            v449.builder = l_v455_0;
        end;
        v449.recorder = {
            sequence_list = l_l_recorder_0_0:list("##SEQUENCE_LIST", {}), 
            set_start_button = l_l_recorder_0_0:button(v398("Set Start", 52), nil, true), 
            set_end_button = l_l_recorder_0_0:button(v398("Set End", 53), nil, true), 
            save_button = l_l_recorder_0_0:button(v398("Save", 57), nil, true), 
            import_button = l_l_recorder_0_0:button(v398("Import", 53), nil, true)
        };
        v449.presets = {
            list = l_l_presets_0_0:list("##PRESET_LIST", {
                [1] = "Empty"
            }), 
            name = l_l_presets_0_0:input("##PRESET_NAME", ""), 
            load = l_l_presets_0_0:button(v398("\a{Link Active}Load", 12), nil, true), 
            save = l_l_presets_0_0:button(v398("Save", 12), nil, true), 
            delete = l_l_presets_0_0:button(v398("\aCD6060FFDelete", 8), nil, true), 
            import = l_l_presets_0_0:button(v398("Import", 19), nil, true), 
            export = l_l_presets_0_0:button(v398("Export", 20), nil, true)
        };
        v458 = {};
        v460 = {};
        local v627 = {
            [1] = "Awp", 
            [2] = "Auto", 
            [3] = "Scout", 
            [4] = "Pistol", 
            [5] = "Deagle"
        };
        local v628 = {
            [1] = "Standing", 
            [2] = "Running", 
            [3] = "Slow motion", 
            [4] = "Air", 
            [5] = "Air & Crouching", 
            [6] = "Crouching", 
            [7] = "Move & Crouching"
        };
        v460.enabled = l_l_settings_0_0:switch("Auto Hide Shots");
        local v629 = v460.enabled:create();
        v460.weapons = v629:selectable("Weapons", v627);
        v460.states = v629:selectable("States", v628);
        v438(v460.weapons);
        v438(v460.states, {
            [1] = "Slow motion", 
            [2] = "Crouching", 
            [3] = "Move & Crouching"
        });
        v238.push(2, v460.enabled);
        v458.auto_hide_shots = v460;
        v627 = {
            enabled = l_l_settings_0_0:switch("Anti-Bruteforce")
        };
        v628 = v627.enabled:create();
        v627.refresh_modifier = v628:combo("Refresh Modifier", {
            [1] = "Off", 
            [2] = "Adaptive", 
            [3] = "Increase", 
            [4] = "Decrease"
        });
        v627.refresh_offset = v628:switch("Refresh Offset");
        v627.enforce_delay = v628:switch("Enforce Delay Period");
        v627.duration = v628:slider("Duration", 0, 100, 0, 0.1, function(v630)
            return v630 == 0 and "Inf." or v630 * 0.1 .. "s";
        end);
        v238.push(2, v627.enabled);
        v458.antibrute = v627;
        v628 = {
            enabled = l_l_settings_0_0:switch("Safe Head")
        };
        v628.states = v628.enabled:create():selectable("Safe Head", {
            [1] = "Standing", 
            [2] = "Crouch", 
            [3] = "Air Crouch Knife", 
            [4] = "Distance"
        });
        v438(v628.states);
        v238.push(2, v628.enabled);
        v458.safe_head = v628;
        v629 = {
            select = l_l_settings_0_0:combo("Manual Yaw", {
                [1] = "Off", 
                [2] = "Left", 
                [3] = "Right", 
                [4] = "Backward", 
                [5] = "Forward"
            })
        };
        local v631 = v629.select:create();
        v629.disable_yaw_modifiers = v631:switch("Disable Yaw Modifiers");
        v629.body_freestanding = v631:switch("Body Freestanding");
        v458.manual_yaw = v629;
        v458.disablers = {
            select = l_l_settings_0_0:selectable("Disablers", {
                [1] = "On Warmup", 
                [2] = "Enemies Dead"
            })
        };
        local v632 = {
            enabled = l_l_settings_0_0:switch("Freestanding")
        };
        local v633 = v632.enabled:create();
        v632.disablers = v633:selectable("Disablers", {
            [1] = "Standing", 
            [2] = "Running", 
            [3] = "Slow motion", 
            [4] = "Crouching", 
            [5] = "Air"
        });
        v632.disable_yaw_modifiers = v633:switch("Disable Yaw Modifiers");
        v632.body_freestanding = v633:switch("Body Freestanding");
        v458.freestanding = v632;
        v458.edge_yaw = {
            enabled = l_l_settings_0_0:switch("Edge Yaw")
        };
        v458.invert_flick = {
            enabled = l_l_settings_0_0:switch("Invert Flick")
        };
        local v634 = {
            value = l_l_settings_0_0:slider("Roll", -45, 45, 0, nil, "\194\176")
        };
        local v635 = v634.value:create();
        v634.change_on_fakelag = v635:switch("Change on Fakelag");
        v634.fakelag_value = v635:slider("Fakelag Roll", -45, 45, 0, nil, "\194\176");
        local _ = nil;
        do
            local l_v634_0 = v634;
            local function v639(v638)
                -- upvalues: l_v634_0 (ref)
                l_v634_0.fakelag_value:visibility(v638:get());
            end;
            l_v634_0.change_on_fakelag:set_callback(v639, true);
            v238.push(2, l_v634_0.value, 0);
            v458.roll = l_v634_0;
            v449.settings = v458;
        end;
        v364.antiaim = v449;
    end;
    l_main_0 = {};
    l_state_0 = v439.ragebot;
    v59.add("##RAGEBOT", l_state_0, "AA");
    l_settings_0 = {};
    l_presets_0 = {
        [1] = "Higher than you", 
        [2] = "Lower than you", 
        [3] = "Lethal", 
        [4] = "After X misses", 
        [5] = "HP lower than X"
    };
    l_settings_0.enabled = l_state_0:switch("Aimtools");
    l_recorder_0 = v34.cast(l_settings_0.enabled:create());
    l_settings_0.flag = l_recorder_0:switch("Draw Flags");
    l_settings_0.weapon = l_recorder_0:combo("Weapon", v131.aimtools);
    v455 = nil;
    v456 = function(v640, v641)
        v640.conditions:visibility(v641);
        v640.max_misses:visibility(v641 and v640.conditions:get("After X misses"));
        v640.lower_hp:visibility(v641 and v640.conditions:get("HP lower than X"));
    end;
    do
        local l_l_state_0_0, l_l_settings_0_1, l_l_recorder_0_1 = l_state_0, l_settings_0, l_recorder_0;
        do
            local l_l_presets_0_1 = l_presets_0;
            v457 = function(v646, v647)
                -- upvalues: l_l_presets_0_1 (ref)
                local v648 = v646.conditions:get();
                v646.conditions:visibility(v647);
                for v649 = 1, #l_l_presets_0_1 do
                    local v650 = l_l_presets_0_1[v649];
                    local v651 = v646[v650];
                    if v651 ~= nil then
                        local v652 = v647 and v648 == v650;
                        v651.enabled:visibility(v652);
                        if not v651.enabled:get() then
                            v652 = false;
                        end;
                        if v651.max_misses ~= nil then
                            v651.max_misses:visibility(v652);
                        end;
                        if v651.lower_hp ~= nil then
                            v651.lower_hp:visibility(v652);
                        end;
                        if v651.value ~= nil then
                            v651.value:visibility(v652);
                        end;
                    end;
                end;
            end;
            do
                local l_v456_1, l_v457_1, l_v458_0, l_v460_1 = v456, v457, v458, v460;
                l_v458_0 = function(v657, v658)
                    -- upvalues: l_v456_1 (ref), l_v457_1 (ref)
                    l_v456_1(v657.prefer_body, v658);
                    l_v456_1(v657.force_safe, v658);
                    l_v457_1(v657.hit_chance, v658);
                    l_v457_1(v657.multipoints, v658);
                end;
                l_v460_1 = function(v659, v660)
                    -- upvalues: l_l_settings_0_1 (ref), l_v458_0 (ref)
                    local v661 = v660:get();
                    for v662 = 1, #v659 do
                        local v663 = v659[v662];
                        local v664 = l_l_settings_0_1[v663];
                        local v665 = v663 == v661;
                        l_v458_0(v664, v665);
                    end;
                end;
                v455 = function()
                    -- upvalues: l_v460_1 (ref), v131 (ref), l_l_settings_0_1 (ref)
                    l_v460_1(v131.aimtools, l_l_settings_0_1.weapon);
                end;
            end;
            do
                local l_l_l_recorder_0_1_0, l_v455_1, l_v456_2, l_v457_2 = l_l_recorder_0_1, v455, v456, v457;
                l_v456_2 = function(v670)
                    -- upvalues: l_l_l_recorder_0_1_0 (ref), l_l_presets_0_1 (ref), l_v455_1 (ref)
                    local v671 = {};
                    local function v673(v672)
                        -- upvalues: v670 (ref)
                        v672[2] = v672[2] .. string.format("##%s", v670);
                    end;
                    l_l_l_recorder_0_1_0:set_callback(v673);
                    v671.conditions = l_l_l_recorder_0_1_0:selectable(v670, l_l_presets_0_1);
                    v671.max_misses = l_l_l_recorder_0_1_0:slider("\tMax Misses", 1, 10, 2);
                    v671.lower_hp = l_l_l_recorder_0_1_0:slider("\tLower HP", 0, 100, 80);
                    v671.conditions:set_callback(l_v455_1);
                    l_l_l_recorder_0_1_0:unset_callback(v673);
                    return v671;
                end;
                l_v457_2 = function(v674, v675, v676, v677)
                    -- upvalues: l_l_l_recorder_0_1_0 (ref), l_l_presets_0_1 (ref), l_v455_1 (ref)
                    local v678 = {};
                    local function v680(v679)
                        -- upvalues: v674 (ref)
                        v679[2] = v679[2] .. string.format("##%s", v674);
                    end;
                    l_l_l_recorder_0_1_0:set_callback(v680);
                    v678.conditions = l_l_l_recorder_0_1_0:combo(v674, l_l_presets_0_1);
                    for v681 = 1, #l_l_presets_0_1 do
                        local v682 = l_l_presets_0_1[v681];
                        do
                            local l_v682_0 = v682;
                            local function v685(v684)
                                -- upvalues: l_v682_0 (ref)
                                v684[2] = v684[2] .. string.format("##%s", l_v682_0);
                            end;
                            l_l_l_recorder_0_1_0:set_callback(v685);
                            local v686 = {
                                enabled = l_l_l_recorder_0_1_0:switch("\tEnabled")
                            };
                            if l_v682_0 == "After X misses" then
                                v686.max_misses = l_l_l_recorder_0_1_0:slider("\tMax Misses", 1, 10, 2);
                            end;
                            if l_v682_0 == "HP lower than X" then
                                v686.lower_hp = l_l_l_recorder_0_1_0:slider("\tLower HP", 0, 100, 80);
                            end;
                            v686.value = l_l_l_recorder_0_1_0:slider("\tValue", v675, v676, v677);
                            l_l_l_recorder_0_1_0:unset_callback(v685);
                            v686.enabled:set_callback(l_v455_1);
                            v678[l_v682_0] = v686;
                        end;
                    end;
                    l_l_l_recorder_0_1_0:unset_callback(v680);
                    v678.conditions:set_callback(l_v455_1);
                    return v678;
                end;
                v458 = function(_, v688)
                    -- upvalues: l_v456_2 (ref), l_v457_2 (ref)
                    v688.prefer_body = l_v456_2("Prefer Body Aim");
                    v688.force_safe = l_v456_2("Force Safe Point");
                    v688.hit_chance = l_v457_2("Hit Chance", 0, 100, 50);
                    v688.multipoints = l_v457_2("Multipoints", 0, 100, 50);
                    return v688;
                end;
                for v689 = 1, #v131.aimtools do
                    local v690 = v131.aimtools[v689];
                    do
                        local l_v690_0 = v690;
                        local function v696(v692)
                            -- upvalues: l_v690_0 (ref)
                            local v693 = string.format("##%s", l_v690_0);
                            local _, v695 = string.find(v692[2], "##");
                            if v695 ~= nil then
                                v693 = v693 .. string.sub(v692[2], v695 + 1);
                            end;
                            v692[2] = v692[2] .. v693;
                        end;
                        l_l_l_recorder_0_1_0:set_callback(v696);
                        l_l_settings_0_1[l_v690_0] = v458(l_v690_0, {});
                        l_l_l_recorder_0_1_0:unset_callback(v696);
                    end;
                end;
                v238.push(1, l_l_settings_0_1.enabled);
                l_l_settings_0_1.weapon:set_callback(l_v455_1, true);
            end;
            l_main_0.aimtools = l_l_settings_0_1;
        end;
        l_presets_0 = {
            enabled = l_l_state_0_0:switch("AI Peek")
        };
        l_l_recorder_0_1 = l_presets_0.enabled:create();
        l_presets_0.simulation = l_l_recorder_0_1:slider("Simulation", 25, 35, 28, 0.01, "s");
        l_presets_0.scan_frequency = l_l_recorder_0_1:slider("Scan Frequency", 0, 30, 2, 0.01, "s");
        l_presets_0.hit_chance = l_l_recorder_0_1:slider("Hit Chance", 0, 100, 35, nil, function(v697)
            return v697 == 0 and "Def." or v697 .. "%";
        end);
        l_presets_0.weapons = l_l_recorder_0_1:selectable("Weapons", {
            [1] = "AutoSnipers", 
            [2] = "AWP", 
            [3] = "SSG-08", 
            [4] = "Pistols", 
            [5] = "R8 Revolver", 
            [6] = "Desert Eagle"
        });
        l_presets_0.hitboxes = l_l_recorder_0_1:selectable("Hitboxes", {
            [1] = "Head", 
            [2] = "Chest", 
            [3] = "Stomach", 
            [4] = "Arms", 
            [5] = "Legs"
        });
        l_presets_0.unsafe = l_l_recorder_0_1:switch("Unsafe", false);
        l_presets_0.color = l_l_recorder_0_1:color_picker("Color", color(200, 0, 0, 255));
        v438(l_presets_0.weapons);
        v438(l_presets_0.hitboxes);
        v238.push(1, l_presets_0.enabled);
        l_main_0.ai_peek = l_presets_0;
        l_l_recorder_0_1 = {
            enabled = l_l_state_0_0:switch("Logs")
        };
        v455 = l_l_recorder_0_1.enabled:create();
        l_l_recorder_0_1.output = v455:selectable("Output", {
            [1] = "Events", 
            [2] = "Render", 
            [3] = "Console"
        });
        l_l_recorder_0_1.hit_color = v455:color_picker("Hit Color", color(163, 211, 80, 255));
        l_l_recorder_0_1.miss_color = v455:color_picker("Miss Color", color(240, 191, 86, 255));
        l_l_recorder_0_1.background_color = v455:color_picker("Background Color", color(22, 22, 22, 255));
        l_l_recorder_0_1.logo = v455:combo("Logo", {
            [1] = "Off", 
            [2] = "!", 
            [3] = "Icon", 
            [4] = "Text"
        });
        l_l_recorder_0_1.glow = v455:slider("Glow", 0, 150, 100, nil, "%");
        l_l_recorder_0_1.offset = v455:slider("Offset", 1, 144, 60, 5, "px");
        l_l_recorder_0_1.duration = v455:slider("Duration", 1, 8, 5, nil, "s.");
        v456 = nil;
        v457 = function(v698)
            -- upvalues: l_l_recorder_0_1 (ref)
            local v699 = v698:get("Render");
            l_l_recorder_0_1.background_color:visibility(v699);
            l_l_recorder_0_1.logo:visibility(v699);
            l_l_recorder_0_1.glow:visibility(v699);
            l_l_recorder_0_1.offset:visibility(v699);
            l_l_recorder_0_1.duration:visibility(v699);
        end;
        l_l_recorder_0_1.output:set_callback(v457, true);
        l_main_0.logs = l_l_recorder_0_1;
        v455 = {
            enabled = l_l_state_0_0:switch("Dormant Aimbot")
        };
        v456 = v455.enabled:create();
        v455.hitboxes = v456:selectable("Hitboxes", {
            [1] = "Head", 
            [2] = "Chest", 
            [3] = "Stomach", 
            [4] = "Legs"
        });
        v455.alpha_modifier = v456:slider("Alpha Modifier", 0, 90, 80, nil, "%");
        v455.minimum_damage = v456:slider("Minimum Damage", 0, 130, 0, nil, function(v700)
            if v700 == 0 then
                return "Def.";
            elseif v700 > 100 then
                return "+" .. v700 - 100;
            else
                return;
            end;
        end);
        v438(v455.hitboxes);
        v238.push(1, v455.enabled);
        l_main_0.dormant_aimbot = v455;
        v456 = {
            enabled = l_l_state_0_0:switch("Force Shot")
        };
        v456.show_indicator = v456.enabled:create():switch("Show Indicator"):tooltip("Requires 'GameSense Indicators' enabled");
        v238.push(1, v456.enabled);
        v238.push(1, v456.show_indicator);
        l_main_0.force_shot = v456;
        v457 = nil;
        v446:set_callback(function(v701)
            -- upvalues: l_l_state_0_0 (ref)
            local v702 = v701:get() == 2;
            l_l_state_0_0:visibility(v702);
        end, true);
        v364.ragebot = l_main_0;
    end;
    l_state_0 = {};
    l_settings_0 = v439.visuals;
    v59.add("##VISUALS", l_settings_0, "VISUALS");
    l_presets_0 = {};
    l_recorder_0 = {
        [1] = "5:4", 
        [2] = "4:3", 
        [3] = "16:9", 
        [4] = "16:10"
    };
    v455 = {
        ["4:3"] = 133, 
        ["5:4"] = 125, 
        ["16:10"] = 160, 
        ["16:9"] = 177
    };
    v456 = {};
    for v703 = 1, #l_recorder_0 do
        local v704 = l_recorder_0[v703];
        v456[v455[v704]] = v704;
    end;
    l_presets_0.enabled = l_settings_0:switch("Aspect Ratio");
    v457 = l_presets_0.enabled:create();
    do
        local l_l_settings_0_2, l_l_presets_0_2, l_v455_2, l_v456_3, l_v457_3, l_v458_1 = l_settings_0, l_presets_0, v455, v456, v457, v458;
        do
            local l_l_v456_3_0 = l_v456_3;
            l_l_presets_0_2.value = l_v457_3:slider("##VALUE", 1, 200, 177, 0.01, function(v712)
                -- upvalues: l_l_v456_3_0 (ref)
                return l_l_v456_3_0[v712] or nil;
            end);
            for v713 = 1, #l_recorder_0 do
                local v714 = l_recorder_0[v713];
                local v715 = l_v455_2[v714];
                do
                    local l_v715_0 = v715;
                    local function v717()
                        -- upvalues: l_l_presets_0_2 (ref), l_v715_0 (ref)
                        l_l_presets_0_2.value:set(l_v715_0);
                    end;
                    l_v457_3:button(v398(v714, (math.ceil(#v714 * 1.34))), v717, true);
                end;
            end;
            l_state_0.aspect_ratio = l_l_presets_0_2;
        end;
        l_recorder_0 = {
            enabled = l_l_settings_0_2:switch("Viewmodel")
        };
        l_v455_2 = l_recorder_0.enabled:create();
        l_recorder_0.fov = l_v455_2:slider("FOV", 2000, 17000, 6800, 0.01);
        l_recorder_0.offset_x = l_v455_2:slider("X", -2000, 2000, 0, 0.01);
        l_recorder_0.offset_y = l_v455_2:slider("Y", -2000, 2000, 0, 0.01);
        l_recorder_0.offset_z = l_v455_2:slider("Z", -2000, 2000, 0, 0.01);
        l_recorder_0.opposite_knife_hand = l_v455_2:switch("Opposite Knife Hand");
        l_state_0.viewmodel = l_recorder_0;
        l_v455_2 = {
            enabled = l_l_settings_0_2:switch("Indicators")
        };
        l_v456_3 = l_v455_2.enabled:create();
        l_v455_2.style = l_v456_3:list("Style", {
            [1] = "Stars", 
            [2] = "Pixel"
        });
        l_v455_2.offset = l_v456_3:slider("Offset", 0, 200, 32, nil, "px");
        l_v455_2.accent_color = l_v456_3:color_picker("Accent", color(172, 167, 209, 255));
        l_v455_2.secondary_color = l_v456_3:color_picker("Secondary", color(255, 255, 255, 255));
        l_state_0.indicators = l_v455_2;
        l_v456_3 = {
            enabled = l_l_settings_0_2:switch("Solus UI")
        };
        l_v457_3 = l_v456_3.enabled:create();
        l_v456_3.color = l_v457_3:color_picker("Color", color(172, 167, 209, 50));
        l_v456_3.select = l_v457_3:listable("##SELECT", {
            [1] = "Watermark", 
            [2] = "Spectators", 
            [3] = "Hotkey List", 
            [4] = "Anti-aimbot indication", 
            [5] = "Frequency update information"
        });
        l_v456_3.only_key_state = l_v457_3:switch("Only Key State", false);
        v438(l_v456_3.select);
        l_v458_1 = nil;
        v460 = function(v718)
            -- upvalues: l_v456_3 (ref)
            l_v456_3.only_key_state:visibility(v718:get("Hotkey List"));
        end;
        l_v456_3.select:set_callback(v460, true);
        l_state_0.solus_ui = l_v456_3;
        l_v457_3 = {
            enabled = l_l_settings_0_2:switch("Watermark")
        };
        l_v458_1 = l_v457_3.enabled:create();
        l_v457_3.style = l_v458_1:listable("Style", {
            [1] = "Branded", 
            [2] = "Corner"
        });
        l_v457_3.color = l_v458_1:color_picker("Color", color(172, 167, 209, 255));
        v438(l_v457_3.style, {
            [1] = "Branded"
        });
        l_state_0.watermark = l_v457_3;
        l_v458_1 = {
            enabled = l_l_settings_0_2:switch("Manual Arrows")
        };
        v460 = l_v458_1.enabled:create();
        l_v458_1.style = v460:list("Style", {
            [1] = "Invictus", 
            [2] = "Teamskeet", 
            [3] = "Modern", 
            [4] = "Ambani"
        });
        l_v458_1.animate_scope = v460:switch("Animate Scope", true);
        l_v458_1.dynamic_mode = v460:switch("Dynamic Mode", true);
        l_v458_1.offset = v460:slider("Offset", 5, 150, 40, nil, "px");
        l_v458_1.accent_color = v460:color_picker("Accent", color(172, 167, 209, 255));
        l_v458_1.secondary_color = v460:color_picker("Secondary", color(255, 255, 255, 255));
        local v719 = nil;
        local function v722(v720)
            -- upvalues: l_v458_1 (ref)
            local v721 = v720:get();
            l_v458_1.animate_scope:visibility(v721 == 3);
            l_v458_1.dynamic_mode:visibility(v721 == 1 or v721 == 4);
        end;
        l_v458_1.style:set_callback(v722, true);
        l_state_0.manual_arrows = l_v458_1;
        v460 = {
            enabled = l_l_settings_0_2:switch("Custom Scope")
        };
        v719 = v460.enabled:create();
        v460.offset = v719:slider("Offset", 0, 500, 10, nil, "px");
        v460.position = v719:slider("Position", 0, 500, 105, nil, "px");
        v460.thickness = v719:slider("Thickness", 1, 10, 1, nil, "px");
        v460.accent_color = v719:color_picker("Accent", color(255, 255, 255, 255));
        v460.secondary_color = v719:color_picker("Secondary", color(255, 255, 255, 0));
        v460.extra_options = v719:selectable("Extra Options", {
            [1] = "Rotate Angle", 
            [2] = "Dynamic Offset"
        });
        v460.exclude_lines = v719:selectable("Exclude Lines", {
            [1] = "Left", 
            [2] = "Top", 
            [3] = "Right", 
            [4] = "Bottom"
        });
        l_state_0.custom_scope = v460;
        v719 = {
            enabled = l_l_settings_0_2:switch("Damage Indicator")
        };
        v722 = v719.enabled:create();
        v719.if_override = v722:switch("If override");
        v719.font = v722:combo("Font", {
            [1] = "Default", 
            [2] = "Alternative"
        });
        v719.offset = v722:slider("Offset", 2, 8, 2, nil, "px");
        v719.active_color = v722:color_picker("Active Color", color(172, 167, 209, 255));
        v719.inactive_color = v722:color_picker("Inactive Color", color(255, 255, 255, 100));
        local v723 = nil;
        local function v725(v724)
            -- upvalues: v719 (ref)
            v719.inactive_color:visibility(not v724:get());
        end;
        v719.if_override:set_callback(v725, true);
        l_state_0.damage_indicator = v719;
        v722 = {
            enabled = l_l_settings_0_2:switch("Break LC Indicator")
        };
        v238.push(1, v722.enabled);
        l_state_0.break_lc_indicator = v722;
        v723 = {
            enabled = l_l_settings_0_2:switch("Velocity Warning")
        };
        v725 = v723.enabled:create();
        v723.color_accent = v725:color_picker("Accent Color", color(255, 255, 255, 200));
        v723.color_secondary = v725:color_picker("Secondary Color", color(150, 150, 150, 255));
        l_state_0.velocity_warning = v723;
        v725 = {
            enabled = l_l_settings_0_2:switch("Gamesense Indicators")
        };
        local v726 = v725.enabled:create();
        v725.spectator_list = v726:switch("Spectator List", true);
        v725.feature_list = v726:listable("Indicators", {
            [1] = "Hit/Miss", 
            [2] = "Dormant Aimbot", 
            [3] = "Damage Override", 
            [4] = "Hitchance Override", 
            [5] = "Lag Compensation", 
            [6] = "Hitbox Override", 
            [7] = "Fake Latency", 
            [8] = "Fake Angles", 
            [9] = "Fake Duck", 
            [10] = "Body Aim", 
            [11] = "Safe Points", 
            [12] = "Freestanding", 
            [13] = "Bomb Info", 
            [14] = "Hide Shots", 
            [15] = "Double Tap"
        });
        v438(v725.feature_list, {
            [1] = "Damage Override", 
            [2] = "Fake Latency", 
            [3] = "Fake Duck", 
            [4] = "Body Aim", 
            [5] = "Safe Points", 
            [6] = "Freestanding", 
            [7] = "Bomb Info", 
            [8] = "Hide Shots", 
            [9] = "Double Tap"
        });
        l_state_0.gamesense_indicators = v725;
        v726 = {
            enabled = l_l_settings_0_2:switch("Kibit Markers")
        };
        local v727 = v726.enabled:create();
        v726.color_x = v727:color_picker("Color X", color(0, 255, 255));
        v726.color_y = v727:color_picker("Color Y", color(0, 255, 0));
        v726.speed = v727:slider("Time", 0, 100, 0, 0.1, "s");
        l_state_0.kibit_markers = v726;
        v727 = {
            enabled = l_l_settings_0_2:switch("Grenade Radius")
        };
        local v728 = v727.enabled:create();
        v727.molotov = v728:switch("Molotov", true);
        v727.molotov_color = v727.molotov:color_picker(color(245, 90, 90, 255));
        v727.smoke = v728:switch("Smoke", true);
        v727.smoke_color = v727.smoke:color_picker(color(130, 130, 255, 255));
        v238.push(1, v727.enabled);
        local v729 = nil;
        local function v731(v730)
            -- upvalues: v727 (ref)
            if not v730:get() and not v727.smoke:get() then
                v727.smoke:set(true);
            end;
        end;
        local function v733(v732)
            -- upvalues: v727 (ref)
            if not v732:get() and not v727.molotov:get() then
                v727.molotov:set(true);
            end;
        end;
        v727.molotov:set_callback(v731);
        v727.smoke:set_callback(v733);
        l_state_0.grenade_radius = v727;
        v728 = {
            label = l_l_settings_0_2:label("Static Watermark")
        };
        v729 = v728.label:create();
        v728.style = v729:list("Style", {
            [1] = "Classic", 
            [2] = "Modern"
        });
        v728.position = v729:combo("Position", {
            [1] = "Bottom", 
            [2] = "Left", 
            [3] = "Right"
        });
        v728.remove_spaces = v729:switch("Remove Spaces");
        v728.color = v729:color_picker("Color", color(142, 165, 229, 255));
        v729 = nil;
        v731 = function()
            -- upvalues: l_v457_3 (ref), l_v455_2 (ref), l_v456_3 (ref), v728 (ref)
            local v734 = l_v457_3.enabled:get() or l_v455_2.enabled:get();
            local v735 = l_v456_3.enabled:get() and l_v456_3.select:get("Watermark");
            v728.label:disabled(v734 or v735);
        end;
        l_v457_3.enabled:set_callback(v731);
        l_v455_2.enabled:set_callback(v731);
        l_v456_3.enabled:set_callback(v731);
        l_v456_3.select:set_callback(v731);
        v731();
        l_state_0.static_watermark = v728;
        v729 = nil;
        v446:set_callback(function(v736)
            -- upvalues: l_l_settings_0_2 (ref)
            local v737 = v736:get() == 3;
            l_l_settings_0_2:visibility(v737);
        end, true);
        v364.visuals = l_state_0;
    end;
    l_settings_0 = {};
    l_presets_0 = v439.misc;
    v59.add("##MISC", l_presets_0, "MISC");
    l_settings_0.clantag = {
        enabled = l_presets_0:switch("Clantag")
    };
    l_settings_0.trashtalk = {
        enabled = l_presets_0:switch("Trashtalk")
    };
    v456 = {
        enabled = l_presets_0:switch("Fast Ladder")
    };
    v238.push(2, v456.enabled);
    l_settings_0.fast_ladder = v456;
    v457 = {
        enabled = l_presets_0:switch("Edge Stop")
    };
    v238.push(1, v457.enabled);
    l_settings_0.edge_stop = v457;
    v458 = {
        enabled = l_presets_0:switch("Collision Air Duck")
    };
    v238.push(1, v458.enabled);
    l_settings_0.collision_air_duck = v458;
    v460 = {
        enabled = l_presets_0:switch("No Fall Damage")
    };
    v238.push(2, v460.enabled);
    l_settings_0.no_fall_damage = v460;
    local v738 = {
        enabled = l_presets_0:switch("Super Toss")
    };
    v238.push(2, v738.enabled);
    l_settings_0.super_toss = v738;
    local v739 = {
        enabled = l_presets_0:switch("Grenade Release")
    };
    v739.damage = v739.enabled:create():slider("Damage", 1, 50, 35, nil, "hp");
    v238.push(2, v739.enabled);
    l_settings_0.grenade_release = v739;
    local v740 = {
        enabled = l_presets_0:switch("Fps Optimize")
    };
    local v741 = v740.enabled:create();
    v740.always_on = v741:switch("Always on");
    v740.detections = v741:selectable("Detections", {
        [1] = "Peeking", 
        [2] = "Hit Flag"
    });
    v740.select = v741:selectable("Optimizations", {
        [1] = "Fog", 
        [2] = "Blood", 
        [3] = "Bloom", 
        [4] = "Decals", 
        [5] = "Shadows", 
        [6] = "Sprites", 
        [7] = "Particles", 
        [8] = "Ropes", 
        [9] = "Dynamic lights", 
        [10] = "Map details", 
        [11] = "Weapon effects", 
        [12] = "Teammates"
    });
    v438(v740.detections);
    v438(v740.select, {
        [1] = "Blood", 
        [2] = "Decals", 
        [3] = "Sprites", 
        [4] = "Ropes", 
        [5] = "Dynamic lights", 
        [6] = "Weapon effects"
    });
    local v742 = nil;
    do
        local l_l_presets_0_3, l_v740_0, l_v742_0 = l_presets_0, v740, v742;
        local function v747(v746)
            -- upvalues: l_v740_0 (ref)
            l_v740_0.detections:visibility(not v746:get());
        end;
        l_v740_0.always_on:set_callback(v747, true);
        l_settings_0.fps_optimize = l_v740_0;
        v741 = {
            enabled = l_l_presets_0_3:switch("Ping Unlocker")
        };
        v741.value = v741.enabled:create():slider("Latency", 0, 200, 0, nil, "ms");
        v238.push(2, v741.enabled);
        l_settings_0.ping_unlocker = v741;
        l_v742_0 = {
            enabled = l_l_presets_0_3:switch("Animation Breaker")
        };
        v747 = l_v742_0.enabled:create();
        l_v742_0.air_legs = v747:combo("Air Legs", {
            [1] = "Disabled", 
            [2] = "Static", 
            [3] = "Haram"
        });
        l_v742_0.ground_legs = v747:combo("Ground Legs", {
            [1] = "Default", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Allah", 
            [5] = "Kangaroo"
        });
        l_v742_0.legs_offset_1 = v747:slider("Offset 1", 0, 100, 100);
        l_v742_0.legs_offset_2 = v747:slider("Offset 2", 0, 100, 100);
        l_v742_0.body_lean = v747:slider("Body Lean", -1, 100, -1, nil, function(v748)
            return v748 == -1 and "Off" or v748 .. "%";
        end);
        l_v742_0.pitch_on_land = v747:switch("Pitch on Land", true);
        v238.push(2, l_v742_0.enabled);
        local v749 = nil;
        local function v752(v750)
            -- upvalues: l_v742_0 (ref)
            local v751 = v750:get() == "Jitter";
            l_v742_0.legs_offset_1:visibility(v751);
            l_v742_0.legs_offset_2:visibility(v751);
        end;
        l_v742_0.ground_legs:set_callback(v752, true);
        l_settings_0.animation_breaker = l_v742_0;
        v747 = {
            label = l_l_presets_0_3:label("Fake Duck")
        };
        v747.options = v747.label:create():selectable("Options", {
            [1] = "Unlock Speed", 
            [2] = "On Freezetime"
        });
        v238.push(2, v747.label);
        v238.push(2, v747.options, {});
        l_settings_0.fake_duck = v747;
        v749 = {
            label = l_l_presets_0_3:label("Nickname Generator")
        };
        v752 = v749.label:create();
        v749.input = v752:input("##INPUT");
        v749.set_button = v752:button(v398("Set", 11), nil, false);
        v749.generate_button = v752:button(v398("Generate", 5), nil, true);
        v749.reset_button = v752:button(v398("Reset", 8), nil, true);
        l_settings_0.nickname_generator = v749;
        v752 = nil;
        v446:set_callback(function(v753)
            -- upvalues: l_l_presets_0_3 (ref)
            local v754 = v753:get() == 4;
            l_l_presets_0_3:visibility(v754);
        end, true);
        v364.misc = l_settings_0;
    end;
    l_presets_0 = nil;
    l_recorder_0 = ui.get_icon("sparkles");
    l_presets_0 = v34.create("~", "##COPYRIGHT", v375):label(v13("\a{Link Active}", l_recorder_0, l_v394_0(4), v16.name, "\aDEFAULT", " \226\128\148 2026"));
end;
v374 = nil;
v374 = {};
v375 = 0;
v378 = 0;
v374.is_onground = false;
v374.is_moving = false;
v374.is_crouched = false;
v374.is_peeking = false;
v374.is_vulnerable = false;
v374.velocity2d = 0;
v374.duck_amount = 0;
v374.team_num = 0;
v374.sent_packets = 0;
v374.forwardmove = 0;
v374.sidemove = 0;
v394 = function(v755)
    -- upvalues: v17 (ref)
    local v756 = false;
    local v757 = false;
    local l_m_vecVelocity_0 = v755.m_vecVelocity;
    local v759 = v755:get_eye_position();
    local v760 = v17.extrapolate(v759, l_m_vecVelocity_0, 14);
    local v761 = entity.get_players(true);
    local v762 = entity.get_threat(true);
    for v763 = 1, #v761 do
        local v764 = v761[v763];
        if v764:is_alive() then
            if v764 == v762 then
                v757 = true;
            else
                local v765 = v764:get_hitbox_position(0);
                local v766 = v17.extrapolate(v765, l_m_vecVelocity_0, 4);
                local v767 = utils.trace_bullet(v755, v760, v766);
                if v767 ~= nil and v767 > 0 then
                    v756 = true;
                    break;
                end;
            end;
        end;
    end;
    return v756, v757;
end;
do
    local l_v375_1, l_v378_2, l_v394_1 = v375, v378, v394;
    v398 = function(v771)
        -- upvalues: l_v394_1 (ref), l_v375_1 (ref), v374 (ref)
        local v772 = entity.get_local_player();
        if v772 == nil then
            return;
        else
            local v773, v774 = l_v394_1(v772);
            l_v375_1 = v772.m_fFlags;
            v374.velocity2d = v772.m_vecVelocity:length2d();
            v374.is_peeking = v773;
            v374.is_vulnerable = v774;
            if v771.choked_commands == 0 then
                v374.duck_amount = v772.m_flDuckAmount;
                v374.sent_packets = v374.sent_packets + 1;
            end;
            v374.is_moving = v374.velocity2d > 3.63;
            v374.is_crouched = v374.duck_amount > 0;
            v374.team_num = v772.m_iTeamNum;
            v374.forwardmove = v771.forwardmove;
            v374.sidemove = v771.sidemove;
            return;
        end;
    end;
    local function v777(_)
        -- upvalues: l_v378_2 (ref), v374 (ref), l_v375_1 (ref)
        local v776 = entity.get_local_player();
        if v776 == nil then
            return;
        else
            l_v378_2 = v776.m_fFlags;
            v374.is_onground = bit.band(l_v375_1, 1) == 1 and bit.band(l_v378_2, 1) == 1;
            return;
        end;
    end;
    events.createmove(v398);
    events.createmove_run(v777);
end;
v375 = nil;
v375 = {};
v378 = nil;
v394 = 0;
v375.max_defensive_ticks = 0;
v375.defensive_ticks = 0;
v375.teleport_units_sqr = 0;
do
    local l_v378_3, l_v394_2, l_v398_0 = v378, v394, v398;
    l_v398_0 = function(v781)
        -- upvalues: l_v394_2 (ref), v375 (ref)
        local l_m_nTickBase_0 = v781.m_nTickBase;
        if math.abs(l_m_nTickBase_0 - l_v394_2) > 64 then
            l_v394_2 = 0;
        end;
        local v783 = 0;
        if l_v394_2 < l_m_nTickBase_0 then
            l_v394_2 = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < l_v394_2 then
            v783 = math.min(14, math.max(0, l_v394_2 - l_m_nTickBase_0 - 1));
        end;
        if v783 > 0 then
            if v375.max_defensive_ticks == 0 then
                v375.max_defensive_ticks = v783;
            end;
            v375.defensive_ticks = v783;
        else
            v375.defensive_ticks = 0;
            v375.max_defensive_ticks = 0;
        end;
    end;
    local function v786(v784, v785)
        -- upvalues: v375 (ref)
        v375.teleport_units_sqr = (v785 - v784):lengthsqr();
    end;
    local function v791(v787)
        -- upvalues: l_v378_3 (ref), v786 (ref)
        local v788 = v787:get_simulation_time();
        if v788 == nil then
            return;
        else
            local l_m_vecOrigin_0 = v787.m_vecOrigin;
            if l_v378_3 ~= nil then
                local v790 = to_ticks(v788.current - v788.old);
                if v790 < 0 or v790 > 0 and v790 <= 64 then
                    v786(l_v378_3, l_m_vecOrigin_0);
                end;
            end;
            l_v378_3 = l_m_vecOrigin_0;
            return;
        end;
    end;
    local function v793()
        -- upvalues: l_v398_0 (ref)
        local v792 = entity.get_local_player();
        if v792 == nil then
            return;
        else
            l_v398_0(v792);
            return;
        end;
    end;
    local function v795()
        -- upvalues: v791 (ref)
        local v794 = entity.get_local_player();
        if v794 == nil then
            return;
        else
            v791(v794);
            return;
        end;
    end;
    events.createmove(v793);
    events.net_update_start(v795);
end;
v378 = nil;
v378 = {};
v394 = nil;
v398 = function()
    -- upvalues: v374 (ref), v32 (ref)
    if v374.is_onground then
        if v32.antiaim.misc.slow_walk:get() then
            return "Slow motion";
        elseif not v374.is_moving then
            if v374.is_crouched then
                return "Crouching";
            else
                return "Standing";
            end;
        elseif v374.is_crouched then
            return "Move & Crouching";
        else
            return "Running";
        end;
    else
        return v374.is_crouched and "Air & Crouching" or "Air";
    end;
end;
do
    local l_v394_3, l_v398_1 = v394, v398;
    local function v798()
        -- upvalues: l_v394_3 (ref), l_v398_1 (ref)
        l_v394_3 = l_v398_1();
    end;
    v378.get = function()
        -- upvalues: l_v394_3 (ref)
        return l_v394_3;
    end;
    events.createmove(v798);
end;
v394 = nil;
v394 = {};
v398 = v33:new();
local v799 = {};
local function v803(v800)
    local l_tickcount_0 = globals.tickcount;
    local v802 = v800:get_eye_position();
    return {
        tick = l_tickcount_0, 
        player = v800, 
        eye_pos = v802, 
        impacts = {}
    };
end;
do
    local l_v398_2, l_v799_0, l_v803_0 = v398, v799, v803;
    local function v809(v807)
        -- upvalues: l_v799_0 (ref), l_v803_0 (ref)
        local v808 = entity.get(v807.userid, true);
        if v808 == nil then
            return;
        else
            table.insert(l_v799_0, l_v803_0(v808));
            return;
        end;
    end;
    local function v815(v810)
        -- upvalues: l_v799_0 (ref)
        local v811 = entity.get(v810.userid, true);
        local v812 = entity.get(v810.attacker, true);
        if v811 == nil or v812 == nil then
            return;
        else
            for v813 = #l_v799_0, 1, -1 do
                local v814 = l_v799_0[v813];
                if v814.player == v812 then
                    v814.victim = v811;
                    v814.damage = v810.dmg_health;
                    v814.hitgroup = v810.hitgroup;
                    break;
                end;
            end;
            return;
        end;
    end;
    local function v821(v816)
        -- upvalues: l_v799_0 (ref)
        local v817 = entity.get(v816.userid, true);
        if v817 == nil then
            return;
        else
            for v818 = #l_v799_0, 1, -1 do
                local v819 = l_v799_0[v818];
                if v819.player == v817 then
                    local v820 = vector(v816.x, v816.y, v816.z);
                    table.insert(v819.impacts, v820);
                    break;
                end;
            end;
            return;
        end;
    end;
    local function v833()
        -- upvalues: l_v799_0 (ref), l_v398_2 (ref), v17 (ref)
        local v822 = entity.get_local_player();
        if v822 == nil then
            return;
        else
            local v823 = nil;
            if v822:is_alive() then
                v823 = v822:get_hitbox_position(0);
            end;
            for v824 = 1, #l_v799_0 do
                local v825 = l_v799_0[v824];
                local v826 = #v825.impacts;
                if v826 ~= 0 then
                    local l_eye_pos_0 = v825.eye_pos;
                    local v828 = v825.impacts[v826];
                    l_v398_2.player_shot:fire({
                        tick = v825.tick, 
                        player = v825.player, 
                        victim = v825.victim, 
                        eye_pos = l_eye_pos_0, 
                        end_pos = v828, 
                        damage = v825.damage, 
                        hitgroup = v825.hitgroup
                    });
                    if v823 ~= nil and v825.player ~= nil and v825.player:is_enemy() then
                        local v829 = v17.closest_ray_point(l_eye_pos_0, v828, v823, true);
                        local v830 = v823.distsqr(v823, v829);
                        if v830 <= 6400 then
                            local v831 = math.sqrt(v830);
                            l_v398_2.enemy_shot:fire({
                                tick = v825.tick, 
                                distance = v831, 
                                player = v825.player, 
                                victim = v825.victim, 
                                eye_pos = l_eye_pos_0, 
                                end_pos = v828, 
                                damage = v825.damage, 
                                hitgroup = v825.hitgroup
                            });
                        end;
                    end;
                end;
            end;
            for v832 = 1, #l_v799_0 do
                l_v799_0[v832] = nil;
            end;
            return;
        end;
    end;
    v394.get_event_bus = function()
        -- upvalues: l_v398_2 (ref)
        return l_v398_2;
    end;
    events.weapon_fire(v809);
    events.player_hurt(v815);
    events.bullet_impact(v821);
    events.net_update_start(v833);
end;
v398 = nil;
v398 = {};
v799 = "lTZA7O1VkC3wj2YacHuBdMPRE8mtQXpnJKe5Ux9L4SIvNirWohDygszf60FbqG+/=";
v803 = ".\\" .. v16.name;
local v834 = v803 .. "\\db.dat";
local v835 = {};
do
    local l_v799_1, l_v803_1, l_v834_0, l_v835_0 = v799, v803, v834, v835;
    local function v840()
        -- upvalues: l_v834_0 (ref)
        return files.read(l_v834_0);
    end;
    local function v843(v841, v842)
        -- upvalues: l_v834_0 (ref)
        if v842 == nil then
            v842 = false;
        end;
        return files.write(l_v834_0, v841, v842);
    end;
    local function v849(v844)
        -- upvalues: l_base64_0 (ref), l_v799_1 (ref)
        local l_status_0, l_result_0 = pcall(json.stringify, v844);
        if not l_status_0 then
            return false, l_result_0;
        else
            local l_status_1, l_result_1 = pcall(l_base64_0.encode, l_result_0, l_v799_1);
            l_result_0 = l_result_1;
            if not l_status_1 then
                return false, l_result_0;
            else
                return true, l_result_0;
            end;
        end;
    end;
    local function v855(v850)
        -- upvalues: l_base64_0 (ref), l_v799_1 (ref)
        local l_status_2, l_result_2 = pcall(l_base64_0.decode, v850, l_v799_1);
        if not l_status_2 then
            return false, l_result_2;
        else
            local l_status_3, l_result_3 = pcall(json.parse, l_result_2);
            l_result_2 = l_result_3;
            if not l_status_3 then
                return false, l_result_2;
            else
                return true, l_result_2;
            end;
        end;
    end;
    local function v859(v856)
        -- upvalues: l_v803_1 (ref), v849 (ref), v49 (ref), v843 (ref)
        files.create_folder(l_v803_1);
        local v857, v858 = v849(v856);
        if not v857 then
            v49.error("Unable to encode data");
            return false;
        elseif not v843(v858) then
            v49.error("Unable to write db");
            return false;
        else
            return true;
        end;
    end;
    local function v863()
        -- upvalues: l_v803_1 (ref), v840 (ref), v859 (ref), v49 (ref), v855 (ref)
        files.create_folder(l_v803_1);
        local v860 = v840();
        if v860 == nil then
            if not v859({}) then
                v49.log("Unable to create db");
            end;
            return {};
        else
            local v861, v862 = v855(v860);
            if not v861 then
                v49.error("Unable to decode db");
                v49.log("Trying to flush db");
                if not v859({}) then
                    v49.error("Unable to flush db");
                end;
                return {};
            else
                return v862;
            end;
        end;
    end;
    local v869 = {
        __index = function(_, v865)
            -- upvalues: l_v835_0 (ref)
            return l_v835_0[v865];
        end, 
        __newindex = function(_, v867, v868)
            -- upvalues: l_v835_0 (ref), v859 (ref)
            l_v835_0[v867] = v868;
            v859(l_v835_0);
        end
    };
    l_v835_0 = v863();
    setmetatable(v398, v869);
end;
v799 = nil;
v799 = {};
v803 = {};
do
    local l_v803_2 = v803;
    v834 = function()
        -- upvalues: l_v803_2 (ref)
        local v871 = ui.get_binds();
        for v872 in pairs(l_v803_2) do
            l_v803_2[v872] = nil;
        end;
        for v873 = 1, #v871 do
            local v874 = v871[v873];
            l_v803_2[v874.reference:id()] = v874;
        end;
    end;
    v799.get = function(v875)
        -- upvalues: l_v803_2 (ref)
        if v875 == nil then
            return nil;
        else
            return l_v803_2[v875:id()];
        end;
    end;
    events.render(v834);
end;
v803 = nil;
v834 = v364.links;
v835 = nil;
local function v876()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/BtbuapEw4e");
end;
local function v877()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://youtube.com/channel/UCT78kJfwruisG8w4u8LOEkQ");
end;
local function v878()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=5QrOCS");
end;
v834.discord:set_callback(v876);
v834.youtube:set_callback(v877);
v834.config:set_callback(v878);
v834 = nil;
v834 = {};
v835 = v364.configs;
v876 = "MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/=";
v877 = "qCfof7ezm72eRHQNXSfdzdvxSVf2Ba9CBaMlgrN9fowxSVfCgr9nzsyrgrN9foD2BY7ASVf2gsEnBo90goECSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsRHgaEHBaMHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsb7gsRlBrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goUrgsy7BoEYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2grUYgof1Ba8HSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrE2grBrBofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaRngaMCzsR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsbnBobnBak9fowxSVfCgr9nzsyrgrN9foDHgY7ASVfrBoblBs82Bav9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgoECBoR1gpldzIG9fofYgr80zaBYBeldzoR1ht29foU2zaM2gaRHBrO9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfYgoE1gs9ngrk9fowxSVfCgr9nzsyrgrN9foDGBoeQ4eldzaf2go92go9lSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQNXSfyvdNa95QH8n3wc59dzdvxSVfCBayYgsRYzs8nSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fofCga9HBrU2zsN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgaBrBsflBsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMlBsB0grM2SVfjqHldBo9Ygob1Br9lSVfj4sfnht29foBlzaE2ga80BoN9fowxSVfCgr9nzsyrgrN9foDrgY7ASVfrBo9YgoRYBsUCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBr8ngsRCzaB7SVfjqHldBo9Ygob1Br9lSVfjgspQ4eldBrR2gs8HBoE2BeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrBrzsMrzeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsfCBs9CBoe9fowxSVfCgr9nzsyrgrN9foDlht29foR2zsy7goM1zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgobCgrRngsylSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0Bs8YgrynBpldzIG9fofYgr80zaBYBeldzoNQ4eldzsbHBabYBse9fowxSVfCgr9nzsyrgrN9foDHzPHQfdldfCgNsbkBmZghUYvKkFgDXF0IfoDdqHldBsU0zsMCBa80BZldzIG9fofYgr80zaBYBeldzd7rBS7ASVf2gsB2gafCBr81SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs8lBrB2Bo81geldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2Bry0gsU1geldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzabnBoRYzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof0gaflzaflgsN9fowxSVfCgr9nzsyrgrN9foDlht29foB2zsM1zaRHgag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBCzsUnzsylgo39fowxSVfCgr9nzsyrgrN9foDlht29foBHBoBCgs8ngre9fowxSVfCgr9nzsyrgrN9foDlht29foBYBrUYBsfYgap9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr8rBrBYgs92SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bay0gaR1gsUlSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foyrBoE0zaB7BpldzIG9fofYgr80zaBYBeldzoUHht29foy7zsyrBaR7BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7O3XnZA8F9dzdvxSVf2BrErgof7goy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsBHzsU0gaBCgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs8Cgob0BsB1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBs87zaE7grB0gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrfHzsfHzsb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaBHgr8CzsRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMCBr90Bs9YSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoblBrRngaBrBpldzIG9fofYgr80zaBYBeldzoNQ4eldBobYBsBngs9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldBrBHgaM2BrBlBpldzIG9fofYgr80zaBYBeldzo8lht29foBnBoM0BrB1gsg9fowxSVfCgr9nzsyrgrN9foDlht29foBngaU1Ba97gom9fowxSVfCgr9nzsyrgrN9foDlht29foUlgsR7zsyYgae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgrBYBsf7BrU1SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghmIvpOSg78F0bXF0IfoDdqHldBsB0zaBYgsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBsRHgsfYgsp9fowxSVfCgr9nzsyrgrN9foDlht29fofCgob2gsyrBrN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgrfHBofHgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoB1gsB1zsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCzablBs9lBsv9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrErzaElBoE1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrUHBobCgs9HgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHBoMrgrynBeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaMrBsM0gav9fowxSVfCgr9nzsyrgrN9foDlht29foUlgr97grB0zsO9fowxSVfCgr9nzsyrgrN9foDlht29fo92BrRHzaB0gZldzIG9fofYgr80zaBYBeldzoNQ4eldgrf7BsfYBoBnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzsbHBrBngsO9fowxSVfCgr9nzsyrgrN9foDnBPHQfdldfCgNsbkBmZghsFe6kFeAfep3kCfjfIG9foECBoBngsM7grk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoBngobrzaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsRHBay1zs97gHldzIG9fofYgr80zaBYBeldzoNQ4eldBs9lgsR1gsf0gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoM1BsE0Ba91geldzIG9fofYgr80zaBYBeldzoNQ4eldBoBYBoyHBaE1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBrMrgrf2Br92BHldzIG9fofYgr80zaBYBeldzoNQ4eldBrUCBaBHBay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrUrzsflzaMHgHldzIG9fofYgr80zaBYBeldzoNQ4eldBr9rzsRnza90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrza9YgoUCgoy2SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foUCzabHBaU1gsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7zsErBr91gZldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYgry0BaE1SVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0PsEZsS7HKk5RyvdNa95QH8n3wc59dzdvxSVfCBr9lgoy2BoR2SVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBoU1za8rBsyrgpldzIG9fofYgr80zaBYBeldzovQ4eldBoRrBaU7zaBHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBo81BsyCza9rSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BrR1BoE0BHldzIG9fofYgr80zaBYBeldzoNQ4eldBr82gaBlgr80BeldzIG9fofYgr80zaBYBeldzo8lht29foBYgrRlzs90gsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB1gsf7gay1gae9fowxSVfCgr9nzsyrgrN9foDGgsmQ4eldBryHzaB2Bo8lzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnzsb1BoB7gZldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaRCgsU1BrU0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgoR0Bo8rBsUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnzsf7BsMrBoN9fowxSVfCgr9nzsyrgrN9foDGzP7ASVf1zsECBabHgok9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQWcdNH9nRdzdvxSVf2BafngrUHBoE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Ba8HgoR7Br9CSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foErzaRYBr81Bo39fowxSVfCgr9nzsyrgrN9foDlht29foEnga8YgoErBsp9fowxSVfCgr9nzsyrgrN9foDlht29foE0goUrBrRlBop9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgrbHgoR7BsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgs9YBaECgo39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr87Bo8lgsbnBeldzIG9fofYgr80zaBYBeldzo8lht29foBngr90BaE2zs39fowxSVfCgr9nzsyrgrN9foDlht29foUlgay0grbrgrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaRlBr80Br87SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsUCgoMngoN9fowxSVfCgr9nzsyrgrN9foDlht29foUHgab0zsfYgpldzIG9fofYgr80zaBYBeldzoNQ4eldzaU2BrU2go97SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRIZ6c5p6OCfjfIG9foElzaE1Ba90Bag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoErgrEngsEYSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBsRrBrU7BoMCzeldzIG9fofYgr80zaBYBeldzo8lht29foE0gaMlzsRnBsk9fowxSVfCgr9nzsyrgrN9foDlht29foflBa91zs80zsm9fowxSVfCgr9nzsyrgrN9foDlht29foflgrRnzsyrgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoRCgo8HBsZ9fowxSVfCgr9nzsyrgrN9foDlht29fofYgab2gaM2BoO9fowxSVfCgr9nzsyrgrN9foDCht29foB2gsb1BrE7Bag9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrb2zsy1BoEnBpldzIG9fofYgr80zaBYBeldzd7CBP7ASVf7Bs90gs9rgsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUnBryCgob1gHldzIG9fofYgr80zaBYBeldzd77gS7ASVfYBrErBoUlgag9fowxSVfCgr9nzsyrgrN9foDlht29fo9HBoU1BaMHzZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghRne5OtNfOFebfoDdqHldBsMngaf2go8nzeldzIG9fofYgr80zaBYBeldzo8lht29foECBsUlBsE2BsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs97BoE0gr81BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsb0BsMlBsEYgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgsbCzaE7Bop9fowxSVfCgr9nzsyrgrN9foDlht29foflzsU1BsBnzsp9fowxSVfCgr9nzsyrgrN9foDGBsNQ4eldBoBCBrBYBoBlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRnBrUHBrflBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo9CgoElBr9YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy1zsRYgaEYBZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBsRHzabrgsyrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrB1ga9lza9CBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrb7gab2BrUngHldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgaf1BrEHSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRn3395ZbfoDdqHldBsf2grU2BoR0BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsB7go9rgo39fowxSVfCgr9nzsyrgrN9foDlht29foEHBr97zsRlgap9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsyHBsbHgaN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaUnBoBrgsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof0ga97Bsfrgam9fowxSVfCgr9nzsyrgrN9foDlht29foBlgoE1gsy1zav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BoMlgrBYgsbnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaflBoECgrR1gZldzIG9fofYgr80zaBYBeldzoNQ4eldgaUHBs8CgsEYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgsM0gaR0gay0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRngoM2zay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMngrRYgabYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsBlzsb1zsZ9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQsciQYfiHKkipKcdfjfIG9foErgoU1gaR0Bsv9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrU7gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gs9CgoBlgaErSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE7BaMHgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab0gaMrzam9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE0zsEnBsR0gae9fowxSVfCgr9nzsyrgrN9foDlht29foflBr97zs8CBog9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfCBsb7zsEYBof2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrRYgs82Bo8lSVfjqHldBo9Ygob1Br9lSVfj4sB1ht29fofrzsRHga87zZldzIG9fofYgr80zaBYBeldzo8lht29foBlBrElBoyrzsN9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr91BrRYzsfHSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foU2BoM1gaB7gse9fowxSVfCgr9nzsyrgrN9foDlht29foy2zsb7BabHgpldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHg78F0bXF0IfoDdqHldBsfCgsBnBo82BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsyCBsMHzsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr82zs9lBr8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsMCzaMnBoE1SVfjqHldBo9Ygob1Br9lSVfjBrgQ4eldBsb7Bsy0Brb7gpldzIG9fofYgr80zaBYBeldzoNQ4eldBo80Ba8rgsB1BZldzIG9fofYgr80zaBYBeldzoeQ4eldBoy0grUHzafnSVfjqHldBo9Ygob1Br9lSVfj4s80ht29fof0ga8lzabngok9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrBa92BaEHBsM2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBHzaR7gs8rgeldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsb0gaEHzaM2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBo9CBsUlzav9fowxSVfCgr9nzsyrgrN9foDlht29fo80BsfHzsM2gHldzIG9fofYgr80zaBYBeldzoNQ4eldzsfYBa8HgaBlSVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0RtRevsZQgURpzfoDdqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzoeQ4eldBrUlBrUrgoUlBeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foflzabHgaU0zsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEYBob1zsyCgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsy1BrB2zay2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgo82goRrgrZ9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo8ASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BoM1BsU0gsMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBlzsb2goE0zsp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzsMCBrMYgog9fowxSVfCgr9nzsyrgrN9foD7BP7ASVfCBs9rBa81zaR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCBaR2Brb7gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgsMngaE1gsp9fowxSVfCgr9nzsyrgrN9foD2hSHQ4eldBrRnBob1grb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrRngo9lzsm9fowxSVfCgr9nzsyrgrN9foD2ht29fo97zablgsBngeldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foD0BV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzoy14eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foyHBaM0zsRnBHldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BsM0BrB1BaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2BsbrgryYgoRnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaUrBob0gs91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gabYBafHBafHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsR1zsU0gaMnzZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs8YBrRrzsErgHldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBr9CgrU7BHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9CgrU7zaUYgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs91goE2ga8rSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE2gobHBaRCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab1BrUlgablSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsb1BoblgsMnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrB1zs8nzsEnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngoErBrMngHldzIG9fofYgr80zaBYBeldzoNQ4eldBoBnza82zsfnSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoR7grRYBafHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo8CzaU0gsBHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo81gsBCgav9fowxSVfCgr9nzsyrgrN9foDlht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foBlzs9lgrU1grZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB2BablgrMHzaN9fowxSVfCgr9nzsyrgrN9foDlht29foBrBoM2goMCBrp9fowxSVfCgr9nzsyrgrN9foDlht29foB7BobCzs9YBre9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHzaU1zsE0Bo39fowxSVfCgr9nzsyrgrN9fow79IZpht29foyrBs91BsErgHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7ew9dfjfIG9foElBry1Bsf1BrO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BsU7Br97grbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BrMrzs9Yzse9fowxSVfCgr9nzsyrgrN9foD2ht29foE7gaU0BsU2gsv9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBsUHgoR0BofnzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsRrgr9Ygr82geldzIG9fofYgr80zaBYBeldzoNQ4eldBsylgoBlBaElBpldzIG9fofYgr80zaBYBeldzo8lht29foE1BsEnzsRlgsv9fowxSVfCgr9nzsyrgrN9foDlht29fof7BaR2zsU2gap9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgrUCzsRHzaRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryrBsy1goB7SVfjqHldBo9Ygob1Br9lSVfjBsylht29foBHBayYzaRnBap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsElBa91gaE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR1Bsb7ga97gpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrR0Ba80goe9fowxSVfCgr9nzsyrgrN9foD0BP7ASVfrgryrzs9HBrflSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzsfrgrblBsR0SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BoRlgobngoZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf7Bof1zs8rzsbCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8ngs87zaMCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfYgo87BoRCBsm9fowxSVfCgr9nzsyrgrN9foDGzsNQhtfAfdBomEZimR0stZOeS7ew9dM5fEgCcYZoXip6OCfjfIG9foECgs8lBry2gsg9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BoylgaEHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsR1zayHBrMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsbCzsB7za8nSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gofCgrU7BaUnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs91gayYBobHBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1goy2gryrgoe9fowxSVfCgr9nzsyrgrN9foDlht29foE0Bsy2gaB7zsZ9fowxSVfCgr9nzsyrgrN9foD2ht29fof2Brf1zafngoO9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgaf1goE0zak9fowxSVfCgr9nzsyrgrN9foDlht29fof7zsy2ga9rgam9fowxSVfCgr9nzsyrgrN9foDlht29fof1goBrzaBlgr39fowxSVfCgr9nzsyrgrN9foDlht29fof0BoBnBr9rBsm9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBob1gaylBo8rgpldzIG9fofYgr80zaBYBeldzoflht29foBlBrfYzs9nBrv9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElzsMYBaR1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrE0Br8HgoR2BpldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzaRnBs91BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7grMnBsbYgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYzaM2gaUHgoe9fowxSVfCgr9nzsyrgrN9foDlht29fobrgoylBrB2zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7gCcYZoXip6OCfjfIG9foElBaEYBsb0gsm9fowxSVfCgr9nzsyrgrN9foDlht29foElgrR1BoMHgsO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2zaB2ga80grEYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1Br9rzaf7zsm9fowxSVfCgr9nzsyrgrN9foD2ht29foE0gsRlgoEngre9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCBsR7BrE0gr8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrbCBsR7zs9nSVfjqHldBo9Ygob1Br9lSVfjBsylht29fofngaB0goblBrv9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0zsU7BofHBsv9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHgsb1goMlgaO9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsf7BoBYBaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaRHza97BsUCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1zsBHgrylzaZ9fowxSVfCgr9nzsyrgrN9foD2ht29foUCBsf0gaf0zsk9fowxSVfCgr9nzsyrgrN9foDlht29fo8Hza8lBs9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfngoBCgrf7gsZ9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfngoRlgsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9nzsM7gsfCgpldzIG9fofYgr80zaBYBeldzoflht29foy1zaBrBoBHgpldzIG9fofYgr80zaBYBeldzoNQ4eldzay0gaflgoR7SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhm5eTOF23OCfjf50Hcild4Vfof7membZzR7pFmZQi95Zp9Ym3c5mwc59dzdvxSVf2Ba8rzsB2BoynSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaUYzaU7ga82SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1goR7grE2BsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zabHgofrBrE1SVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE0grRnzay1goe9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zsyCzsMHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foflBrfngoRHgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsU0grBCzaEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoU1grE0goM1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoy1gsUYgoR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsM7gaylzaB7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBobrga9ngr9CgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrECgrB7BrRCgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7za92BafrgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrU7Bs9HgabCSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrUHgaM7goUrzZldzIG9fofYgr80zaBYBeldzoNQ4eldBry0BryCBo80gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0ga9HBoUngop9fowxSVfCgr9nzsyrgrN9foDlht29fo8rBaMngo81zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy7gsE0BrMCBHldzIG9fofYgr80zaBYBeldzoflht29fobCBablgo9ngZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7H3cIZ3cVNO8S9dzdvxSVf2BaflBrb7zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsEngaB7zab0gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7go92gr8ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1zsyHBsE2gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsRlgaflBrbYgHldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrR2Ba9HgeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2grM1gsR7zs8CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM2BsbCBsfHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBofrBsfCBry2BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoRYBrRYgrE0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBo87zaM2gsB1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoyHBaRrzs87gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrf2BsyrgrM2gHldzIG9fofYgr80zaBYBeldzo8lht29foB7BaBrBsfCBap9fowxSVfCgr9nzsyrgrN9foDlht29foB7BoE2Bob2grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgr82zaM7BoEHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaMHgs9lgrU2zZldzIG9fofYgr80zaBYBeldzoNQ4eldgafngaE1za8nzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUngaBCgay7BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgo92gsRrBsO9fowxSVfCgr9nzsyrgrN9foDCBPHQfdldfCgEmROespgvZbZhsFQnOtM5fEgCcYZoXip6OCfjfIG9foE2grMYBrM2gap9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE7go91BrEHgap9fowxSVfCgr9nzsyrgrN9foDrgoNQ4eldBsR2goMCgayYBHldzIG9fofYgr80zaBYBeldzo8lht29foEngsRrgrBrBsk9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bs8HBoynzsp9fowxSVfCgr9nzsyrgrN9foDCht29foflgry1grR2zaN9fowxSVfCgr9nzsyrgrN9foDlht29fof2gsMnBob2Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgs92BrE2gaM0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgo97Bo9CBab1SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzsBHzaU2BsB1SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0Bryrzsf2gre9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBrfYBofrBsR7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrflBs8lBoB0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgaynBoyYBs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9rgoEHgsb1BZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgrU7Bablgsk9fowxSVfCgr9nzsyrgrN9foDlht29foUCgs9rBoBlBHldzIG9fofYgr80zaBYBeldzoNQ4eldgsBCBrf2zsBrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfnBaB7zsUHBrv9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf1BaB2gsf0gsZ9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsbYgaf7ga81SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhsn1ykSgpfoDdqHldBsMnBsMrza8YzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2BoR7BoBrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBoflBofrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaM1Bob2gsMrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbnBsRngsErBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoB2BoRCgs9ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRCgsMnzsBnBpldzIG9fofYgr80zaBYBeldzoflht29fofngoElBoE0zae9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoyHBrf7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoyCgr9nBsRlBZldzIG9fofYgr80zaBYBeldzoNQ4eldBrMlgaBYBoEYBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7gaUHgrfYgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBa92zay7Bov9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr92grMrBa9lzeldzIG9fofYgr80zaBYBeldzo8lht29foB0BrR2gsE1geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0zs8CBaM0Bs39fowxSVfCgr9nzsyrgrN9foDlht29foU2BobHgoUCgak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsbrBoR0za80SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUrgaR2zaEnzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy2gsUnzs8YBpldzIG9fofYgr80zaBYBeldzoNQ4eldzaUYBsM7zaErSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRIZ6c5p6OCfjfIG9foElgaElza97grO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsf7Bo9Hgo8YBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsBCgsBnBsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0zsyCBsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7grUCgrU2grm9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaf7zs92gsbrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoMCBr9Hgr91zZldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsBlBo90BoM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrU1gsRrBofYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBo9YBs9CBsblgZldzIG9fofYgr80zaBYBeldzoNQ4eldBoyrBrRnBo9lBZldzIG9fofYgr80zaBYBeldzoNQ4eldBobrzaRrBsyHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBlgr9Cgsy2BoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBof7Boy2gsy1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoU7gsBlBrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgafCBrB7gsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgoUnzsbnBaB1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaM0BoM2BsyYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7gof7zabrBoO9fowxSVfCgr9nzsyrgrN9foDlht29foUngrfrBrBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzaB2gry2BsBYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRne5OtNfOFebfoDdqHldBsE7gsMHza91zeldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7gaM1ga8nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7gaylgrBrgae9fowxSVfCgr9nzsyrgrN9foDlht29foEngrBHBrb2Brk9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsUHBry2gag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsbnBsf1BrErSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoE2gsU2gsU7BHldzIG9fofYgr80zaBYBeldzoNQ4eldBofCzaylBrM7BZldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2BoRrzsBrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBsBYBsUrgs39fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsRlza87zs9lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoRHzsy0gr9rSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsBnzsBYBsO9fowxSVfCgr9nzsyrgrN9foDlht29foBlgsyHgsf1Bam9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEnBsR1za9rgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaE7Baf1gsm9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsbCBrylgog9fowxSVfCgr9nzsyrgrN9foDlht29foU2grM0BaB7zag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfnBoUHBsf1gov9fowxSVfCgr9nzsyrgrN9foDlht29fo8rgrU0zaECgZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgoMHBrbHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHgD8SvpOVfjfIG9foElzayCza9Czap9fowxSVfCgr9nzsyrgrN9foDlht29foEngsEYzsEHBsp9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2grynBsE7gog9fowxSVfCgr9nzsyrgrN9foDlht29foE0gsU7zaBngs39fowxSVfCgr9nzsyrgrN9foDlht29fof2zaU7BafrBak9fowxSVfCgr9nzsyrgrN9foDlht29fof7goUCzaB0zak9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bsf1gofngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2zsb1BoMCgpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgabnBoEHgabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR7gaflgrBngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrR1zablzs8YgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHzab7go87BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza81gry1zsf0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrblBsMnzsMrgZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBr92gsb2BoZ9fowxSVfCgr9nzsyrgrN9foDlht29foUCzaErBof7go39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7Bob2ga8lBsy1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgsUHBo9rgaMHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsynBo9nBry0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB0Bo87gayYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsy1goBlBrm9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7membZzR7pFmZQsciQYfiHKkipKcdfjfIG9foEHzsyrBsUlgap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2goE1gsbHzaEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go80goblBs9nSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbYgo8YBrbnBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsb1BrfCzs8rgZldzIG9fofYgr80zaBYBeldzoflht29fofrBof2gaBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBr8nBsBrBa8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaM1BaE1zs8YSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1zsR2zay1gaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0go8lBo9nBrk9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBaErgoyrzay1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBaBYzabHBrfHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoy2goMYgabrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBnzsB1goR1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8rBsMrBr92BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoU0ga9rgoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr80Brynzsy7gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrbYzaUHzsb1BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyCgr90BoR1BHldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYzsB0zsB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsMlgoU7BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgEmROespgvZbZhRYm3c5mwc59dzdvxSVf2BaMYgsb0BrN9fowxSVfCgr9nzsyrgrN9foDlht29foE2Bsf1BaB1Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaMrgsBrza82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaRYBaylBoMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaMYBsy1zse9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyHza87gsE7BeldzIG9fofYgr80zaBYBeldzoNQ4eldBofYzaR7grUlSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofrBrbHgaB0Ba39fowxSVfCgr9nzsyrgrN9foDlht29fofrgs82gobnBav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgsUlgaB2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgrynza80grO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrgaErBaUlBoRrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrRlgofYzs91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRlgo87gryHBZldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrMlgo91geldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBaR2zsU7zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrUrBa82gaBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBrBnBo97zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1Baf0BaB1Brm9fowxSVfCgr9nzsyrgrN9foDlht29fobYBsU2gr82BHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBosRpsUCfjfIG9foE7BrUnzsfngov9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBr8YgoR0zsfHSVfjqHldBo9Ygob1Br9lSVfjBoMlhSHQ4eldBs92zaf7gr9YgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBa92BaM2BHldzIG9fofYgr80zaBYBeldzoElBP7ASVf2BaMYBsMlBsm9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBoBrBaBngrfCgZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHgobYgs9lgag9fowxSVfCgr9nzsyrgrN9foDGBS7ASVfrzsfnzaMlBsv9fowxSVfCgr9nzsyrgrN9foD2ht29foylgoblgoBngHldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaMngoy1BaBHSVfjqHldgaMHBaU1BoEHBeldzIG9foBHBrUCgrfnBoZ9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBof1Brf1go9CBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrBsBCBsM0Bap9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofngo8HBoBnBrZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofYgsBYgoMCzak9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBlgrB1goRnzsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHBr81BoEYza39fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzoEASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCzsECBrfrgsy1SVfjqHldBo9Ygob1Br9lSVfjBokQhS7ASVfHBryrBo91gre9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fofCgabCBaUCgsZ9fowxSVfCgr9nzsyrgrN9foDCBaUYht29fofHgrRrgsM7zak9fowxSVfCgr9nzsyrgrN9foDrht29foB1Brb1BsB1grZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fo8HgrfYzaBCBpldzIG9foUlgsM7zaf2gsN9fowxSVf2gsB0grR1BaRnSVfjcIZAcV29foB2goU2BrM7zZldz50HcilASVfrgr9rgrb0BrRHSVfjqHldBo9Ygob1Br9lSVfjSVv9fI7ASVfnBrUrBr9rBoN9fow6kF2AhS7ASVfngsbHBaBYzsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYgafngobHBag9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtURkeUbQRfoDdqHldBsMlgo91BobrBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEnBo9YgaUlga39fowxSVfCgr9nzsyrgrN9foDCht29foE1zsMlgaE0gom9fowxSVfCgr9nzsyrgrN9foDrgS7ASVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1YzaUrBsBYzs90gsMYgaUnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrRlBa80BrN9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsfnzaRYgaE0SVfjqHldBo9Ygob1Br9lSVfjBreQ4eldBo81BrRrBoMCzeldzIG9fofYgr80zaBYBeldzofHht29fof0grbngaElgoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgafHgrRCgsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgoflgsUYzsm9fowxSVfCgr9nzsyrgrN9foDCzP7ASVfHBoyrgaUCBoO9fowxSVfCgr9nzsyrgrN9foDYhSHQ4eldBoM1zsBCzsf2BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBoM1zsE7goRCgpldzIG9fofYgr80zaBYBeldzoElBP7ASVfCBay0Brf0BoMnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBablBoBlgr8rSVfjqHldBo9Ygob1Br9lSVfjgS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBngo90zs9lBpldzIG9fofYgr80zaBYBeldzoZQ4eldBrU7BsUHBsflzZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oB2Br9CgsRlBsf0zablgaUASVf2gr9ngrO9foDl4oyCgrUHBsMHBaf1BsRCga9ASVf2gr9nzak9foDl4o8rzsf2gs9lgr9YzabrBakQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB7zs9lBoR1goN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1lza8CgrUHBsf2Bsf2gaMngd29foEYgr8YgpldzoM6BaynBo97gsECBsECBsUlgo8ASVf2gr9nzak9foDl4oM1gofYgaR2BoE2BoE7Ba8nhZHQht29foflzsMHBsRlBs39foDlhS7ASVf0goU1BoErgrO9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rBr9CgsU0BsEngoE2gaylgC29foEYgr8YgpldzoM6grU0BaE0gofCzaMCgrB7gV29foEYgr81gHldzoM6zsU2Bs9ngsBrgob0BaBHgIHkhS7ASVfCBablgsEHBaE1SVfjBPHQhS7ASVfCzaR1gsfCBsB7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoRCgoyHgrU2zZldzIG9fofYgr80zaBYBeldzoEHht29fofYgoBrgaE7Brm9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BoMHzab7goy1SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0gry1zsfnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBs8lzabYBoO9fowxSVfCgr9nzsyrgrN9foDlht29foElgay0grR1Brk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2Ba9Cgry7grR7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsE2BoECzaflgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE2BrflBrUlgrv9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2BsRCgs87gr9lSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Bs9nBrRlBr97SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsflBab2goECBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foECgoRlzsRrgr39fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2BoyCBob1BsbYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsf0goUrBoR2gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foErBs92BoU1BZldzIG9fofYgr80zaBYBeldzoylht29foErBo8ngrMrgrv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BrUlzaM7goblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsU2BafCgaBrBpldzIG9fofYgr80zaBYBeldzoylht29foE7Bry7grMHBsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaUngr9lzaylSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsU7zaE0gsElBeldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoU1zsMYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBrf1BsU2gam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gsBngaMHBoyrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsUlgs9CgrbYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsR1Ba81gay0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goE2BrfHzsRCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs82BoE1BaMlBpldzIG9fofYgr80zaBYBeldzovQ4eldBs8CBsRYzabrBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEngrM1gsBHBrk9fowxSVfCgr9nzsyrgrN9foDlht29foEngryYBsy1gsN9fowxSVfCgr9nzsyrgrN9foDlht29foEnzsElgsE7gov9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2gob1gaMYga8YSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBs9lBa8YgayCBHldzIG9fofYgr80zaBYBeldzoRlht29foEYBsB0Bofnzav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2grEHBr9HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs9rzsbrzaE2BpldzIG9fofYgr80zaBYBeldzoRlht29foEYgaBrgaRCgoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaf2BrRYzsU2SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsyCzsfCgoyrBpldzIG9fofYgr80zaBYBeldzoRlht29foE1gaE7Brf2zsp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaU0BayYgryCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaU0Br91Bay7SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsyHBo9nBa8lgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1gofHzaf2gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsyngoy0gabCgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1zaUHzsM2Brv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zabnBrRrBobnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsb2BaU1gr82geldzIG9fofYgr80zaBYBeldzoRlht29foE0BsyrgrUrgo39fowxSVfCgr9nzsyrgrN9foDlht29foE0Bo9ngoM7Bo39fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2zs92grUHBsBCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsbYzs8HzsBrgHldzIG9fofYgr80zaBYBeldzovQ4eldBsb1goElBr80BHldzIG9fofYgr80zaBYBeldzoRlht29foflBafCgrM2zsg9fowxSVfCgr9nzsyrgrN9foDCht29foflBobrzsbYBrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaUrgsB7BaR7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoM7grf2BoUnBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgo81zsR1ga39fowxSVfCgr9nzsyrgrN9foDCht29fof2BaB0BrU1gr39fowxSVfCgr9nzsyrgrN9foDlht29fof2BaUYBsUnBsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsE1zaU1zsBYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEngrfHzab7zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEYgoy0Bs81zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoE0BaMlgaUCgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofCBsBCBofCBsm9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBoBHBrE1gab7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBoB0gaM0grMnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBof1BrMlBoB0gpldzIG9fofYgr80zaBYBeldzoRlht29fofCzs91goUHgaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBrUngoyHgrZ9fowxSVfCgr9nzsyrgrN9foDCht29fofrgsUlgsE0Bsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgaMlBobCBZldzIG9fofYgr80zaBYBeldzoylht29fof7gof7BsbnBs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgab7goU0gov9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsR0zayHzs80SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBo8lBaf7go90zeldzIG9fofYgr80zaBYBeldzovQ4eldBo8lBrB1BsbHgZldzIG9fofYgr80zaBYBeldzoRlht29fofnBsUYBayngZldzIG9fofYgr80zaBYBeldzoRlht29fofnBrE7zsUnzag9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgo8lzs82zaBHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrf1zaR7grE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo9rgsBnBsf0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7BoUCgrfCzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof1gsMYBo9Hzap9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCza87za82zsMYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyYBab7grRrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyYgsE2gay1gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof1zsy1Bof2zae9fowxSVfCgr9nzsyrgrN9foDCht29fof0BaEYzabrgav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsEngoflzsbCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsE1gaR0BsN9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCzsfngaMngofHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobrBr87gsR0gpldzIG9fofYgr80zaBYBeldzovQ4eldBobrgo9YBayHBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof0gsUCBsMYgr39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBaR0zaMCBo39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBayCgr8CgryYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrElBob2gaMrzZldzIG9fofYgr80zaBYBeldzoRlht29foB2BaR7gsBCzsZ9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bs91grbrzse9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBsfHBrElBrRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBsUYBrM2zs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrE7zsfYBaB7geldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHBaR2goflgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHBoU1BsUHBpldzIG9fofYgr80zaBYBeldzoRlht29foB2goEYzaElgrN9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrBs9rBrM2BsE7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBsyCzaRngabYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrfrgs8lgrU0gpldzIG9fofYgr80zaBYBeldzoRlht29foBCgaylga8ngrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBo87BrRnBaErSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBoylzsfnBrErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrf0Bay0goBlBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaRlgo8HBo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrfCBoEHBsE1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrB7grU2BsRnzZldzIG9fofYgr80zaBYBeldzoRlht29foBrgoMHga91Bsp9fowxSVfCgr9nzsyrgrN9foDCht29foBrgoR1zaEYgag9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaMlBs8Cgs81SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrUrBrBYzsU1zZldzIG9fofYgr80zaBYBeldzoylht29foB7Bry7gsbngsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaU7gaf0gofYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrU7gsbnzsM0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrUHBsEnzsEYBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB7goflBrUCzaO9fowxSVfCgr9nzsyrgrN9foDCht29foB7zaU2BoyCBrg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgayngr9lBsblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRYBaBnBay0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRYgoE2zsMnBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHzafHgsyrgok9fowxSVfCgr9nzsyrgrN9foDCht29foBHza9rBsfCgHldzIG9fofYgr80zaBYBeldzoRlht29foBnBa9Hza91grv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgoECgsBlgo8rSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgoEYBs91zsfrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr87gsyrBobrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8nBafCgsElBHldzIG9fofYgr80zaBYBeldzoNQ4eldBr8YzaR7BoflgZldzIG9fofYgr80zaBYBeldzovQ4eldBr81BrR2goflgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBaE1BoECgsZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgrEHzsRHgs9rSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9ngry0BsMYgpldzIG9fofYgr80zaBYBeldzovQ4eldBr91zaB1BobnBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYzsBCgsy0zZldzIG9fofYgr80zaBYBeldzoNQ4eldBry7gry7gry2BHldzIG9fofYgr80zaBYBeldzoRlht29foB1gay7go80zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrza8rzaBrBrMnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzabCBaR0goyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrblBaBlgrf1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrblgoB7BaRCBpldzIG9fofYgr80zaBYBeldzoylht29foB0BsU1BofHgpldzIG9fofYgr80zaBYBeldzoylht29foB0Bo9ngo9ngrZ9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzs9HBo9HBoBrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzsy0Bs9YBayYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaMlgrBrza8ngeldzIG9fofYgr80zaBYBeldzoRlht29foUlBsf7Baf1zaZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BaR7za9rBeldzIG9fofYgr80zaBYBeldzoylht29foUlzsM7Ba92gr39fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BsB0Ba92za9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsRHBrfHBobYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaEYBrBlza91geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU2za9lBoUCgsp9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BoEYgoylzsR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaf1zsRHBrBCBHldzIG9fofYgr80zaBYBeldzoylht29foUCzabngs8lSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaB2BoM7gsB2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaU7za92gsECSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaUHBrB1zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaU1zaMrzabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldga97zaRnzaMHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7zsfrzs8Hzak9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHBaUYzsUrgsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfHBsE0go81BrO9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfHBrUnza9YBoN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHBrRYBaRrzav9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHzsB2Bs9ngaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHzsyYBoR1BrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBsBrgsy0gop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBoR7gaBlBok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBrElgsU2grk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfngafrBsyHBoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfngs80gsEngsp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfnzaBCBsfHzsm9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfnzaRrBoBnzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo81zsfCBa9HgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9lBa9Hgrb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9CzsBHzsUCgeldzIG9fofYgr80zaBYBeldzoNQ4eldgr82BablzsBCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgry0zsb1Bab0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldza8HBrECzsyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldza9CgoyYBrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf0BrE0grU7BrO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0ga9YgaRYgaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0gsB0zsy2gav9fowxSVfCgr9nzsyrgrN9foDCht29fobHgoyrgrfCgpldzIG9fofYgr80zaBYBeldzoRlht29fobYBabYBsR7geldzIG9fofYgr80zaBYBeldzoRlht29fob1zsUYBsBlBeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgtmRgWRbmeRpQNXSfdzdvxSVf2zay1BrRlzaB7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCzs9Yza80geldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7ew9dM5fEgCcYZoXip6OCfjfIG9foE0Baf7BsM0BaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgry7gaflzsElSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhUYvKkFgDXF0IfoDdqHldBrb1zaR7BsR2gpldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foR0zaU2BsE0BpldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtS7O3XnZA8F9dzdvxSVfCBsR2BrMngs82SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrfnBo8YBsMnBZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7OCOFZrkie6Oip6OCfjfIG9foflgryCBay0gam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsU0BrU7BsbnSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhsFe6kFeAfep3kCfjfIG9foB7BofCzsy0BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foR7grB1Bay1zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7HKk5RyvdNa95QH8n3wc59dzdvxSVf2BsbngoRHgrf2SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBoEHgsM0go8nBZldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtS7Q6fPZrOtfjfIG9foEnBrR2zaE7Bo39fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVf2grB2goR7BoUlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRIZ6c5p6OCfjfIG9foECgsRnBrbCBog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBr8YBaMrgrfrSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhRne5OtNfOFebfoDdqHldBo91za8HgrE7gHldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foBnzsB7zsU2Bsp9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQsXieCOFUdzdvxSVf2grynzsB0goU0SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBsy1BrU2BoUnBZldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtSHgAcY9ycFQ7XFQ6foDdqHldBsfHBrblBsE1zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foBlgrB1gsf0Bsg9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQskie6Oip6OCfjfIG9fof0goRlBrR0grN9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfngabYgaR1Br39fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgFtZgZUR2sfoDdqHldBsM2gr8rBs9YBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaf0gsU2Bov9fowxSVfCgr9nzsyrgrN9foDlht29foflBoUngo8rzap9fowxSVfCgr9nzsyrgrN9foDlht29fofYzs80BrU7zag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCzaMCzaUHgr9YSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBsRnBs81gry2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrBlBaE1grylBpldzIG9fofYgr80zaBYBeldzoElgS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBsNQhS7ASVf2BaRlzsElBrblSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2zsb0gayCzabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9Ygo82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr9ngov9fowxSVfCgr9nzsyrgrN9foDlht29foEYgr8nBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsbrgaRHzsflSVfjqHldBo9Ygob1Br9lSVfjgoylBP7ASVfrgsErBo80Bay1SVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foflga8ngoU1BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV12zs8lgry7gab7za9nza82gd29foEYgr8YBZldzoM6zaE0goMYzsErgab7BsElBt29foEYgr8YgpldzoM6goR7zsM2zsy2BrRrgrR0zV29foEYgr81gHldzoM6go97gsM0zafrBrfCBobnBSHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoyHgr9YBrRCBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBnBsy7goECBHldzIG9fofYgr80zaBYBeldzoEChSHQ4eldBofYzaUHgrbrSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2gaB0zayrBsR2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBr81za9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fofYzs80BrU7zag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11BsbnBa90BsB7zsU2BsM24eldBs9Ygo9nSVfjBV1ngsU0BaE0zaErgsBYgsb14eldBs9YgoyYSVfjBV1ngrUHBab1BoBrBofCzs82hZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBsRnBs81gry2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrB7zaR2BaRlzeldzIG9fofYgr80zaBYBeldzoUlht29foB0BaB2gsylgr39fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBoR2BaU0grUCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foErgoB1gsUngr39fowxSVfCgr9nzsyrgrN9fow79IZpht29foy1Bsy2Boy1gZldzIG9fofYgr80zaBYBeldzoBCgoB1hSHQ4eldBrfHBsR1gayngZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsR7gsyCBoylgHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oB0BoEHgoy0zabYgsBYBoBASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foflzab2BsB1BoN9fowxSVfCgr9nzsyrgrN9foDlht29fofrBsE0gry2gam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7Bo81BobCgaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foB7BrUHgofnBrm9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof7grblgof7gsN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBoUCBsyrgrf7SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gsy1BoBHBrE1go8lgrBnBt29foEYgr8YgpldzoM6gsy1BoBHBrE1go8lgrBnBt29foEYgr81gHldzoM6gsy1BoBHBrE1go8lgrBnBSHkhS7ASVfCBablgsEHBaE1SVfjBPHQhS7ASVfrgof7gsECzsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBr8nBoRrBsO9fowxSVfCgsRngoy1Bam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1HBab1BaB0gsMYza8HzsMn4eldBs9YgoyYSVfjBV1HBab1BaB0gsMYza8HzsMnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCgr9nzsyrgrN9fow79IZpht29foblBobrgsMCzZldzIG9fofHgs8nzaylgeldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oBHBob7BsE1gsfrgsbYgrfASVf2gr9ngrO9foDl4oBHBob7BsE1gsfrgsbYgrfASVf2gr9nzak9foDl4obnBa91gaBYgs8ngrRYBIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBo9Ygob1Br9lSVfjkPvHOSHQht29foB1BafCBr8lzag9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof2gr92zsBrBpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8HgablBsb1BsBHBr9HzsyASVf2gr9nzak9foDl4o8YgaRlzsyCBrBCBof0goeQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofrgoy1gr90zeldzIG9fofYgr80zaBYBeldzoeQhS7ASVf7Bs8HgrfHgr87SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMngry1BsElBHldz50HcilASVfCga87BsylBoMYSVfjcIZAcV29foB7gaf7BsMHgpldz50HcilASVfrgry1grU7gr9nSVfjqHldBo9Ygob1Br9lSVfjBs8lht29foUrzsbYBa92zeldz50Hci2Qht29foy7Brb2gry2zZldzIG9foUlgsM7zaf2gsN9fowxSVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11zsylBrbCzaErgoyCgsRn4eldBs9Ygo9nSVfjBV1nga9lgsy1gaUHgo8rgaRC4eldBs9YgoyYSVfjBV1Hgs81gofYgrEHBsElgr90hZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBr81za9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29foBrBaM2za91Bav9fowxSVfCgr9nzsyrgrN9foDlht29foUYgr8lgoR1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf1zaE1Bsf1zaZ9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fofrgoy1gr90zeldzIG9fofYgr80zaBYBeldzoeQ4eldBo90gobrgaU1BHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8HgablBsb1BsBHBr9HzsyASVf2gr9nzak9foDl4o8YgaRlzsyCBrBCBof0goeQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB2gs82goyYzae9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBrvQhSHQfI7=";
do
    local l_v876_0, l_v877_0, l_v878_0 = v876, v877, v878;
    l_v878_0 = function(v882)
        -- upvalues: l_base64_0 (ref), l_v876_0 (ref)
        local l_status_4, l_result_4 = pcall(json.stringify, v882);
        if not l_status_4 then
            return false, l_result_4;
        else
            local l_status_5, l_result_5 = pcall(l_base64_0.encode, l_result_4, l_v876_0);
            l_result_4 = l_result_5;
            l_status_4 = l_status_5;
            if not l_status_4 then
                return false, l_result_4;
            else
                return l_status_4, l_result_4;
            end;
        end;
    end;
    local function v892(v887)
        -- upvalues: l_base64_0 (ref), l_v876_0 (ref)
        local l_status_6, l_result_6 = pcall(l_base64_0.decode, v887, l_v876_0);
        if not l_status_6 then
            return false, l_result_6;
        else
            local l_status_7, l_result_7 = pcall(json.parse, l_result_6);
            l_result_6 = l_result_7;
            if not l_status_7 then
                return false, l_result_6;
            else
                return true, l_result_6;
            end;
        end;
    end;
    local function v897()
        -- upvalues: v59 (ref)
        local v893 = {};
        local v894 = v59.get();
        for v895, v896 in pairs(v894) do
            v893[v895] = v896[1]:export();
        end;
        return v893;
    end;
    local function v904(v898)
        -- upvalues: v59 (ref), v238 (ref)
        local v899 = v59.get();
        for v900, v901 in pairs(v898) do
            local v902 = v899[v900];
            if v902 ~= nil then
                local v903 = v902[1];
                pcall(v903.import, v903, v901);
            end;
        end;
        v238.update();
    end;
    v834.encode = function(_, v906)
        -- upvalues: l_v878_0 (ref)
        return l_v878_0(v906);
    end;
    v834.decode = function(_, v908)
        -- upvalues: v892 (ref)
        return v892(v908);
    end;
    local _ = nil;
    local function v912()
        -- upvalues: l_v878_0 (ref), v897 (ref), l_clipboard_0 (ref), v49 (ref)
        local v910, v911 = l_v878_0(v897());
        if not v910 then
            return;
        else
            l_clipboard_0.set(v911);
            v49.success("exported config");
            return;
        end;
    end;
    local function v915(v913)
        local v914 = string.find(v913, "\000");
        if v914 == nil then
            return v913;
        else
            return v913:sub(1, v914 - 1);
        end;
    end;
    do
        local l_v915_0 = v915;
        local function v920()
            -- upvalues: l_clipboard_0 (ref), l_v915_0 (ref), v892 (ref), v904 (ref), v49 (ref)
            local v917 = l_clipboard_0.get();
            v917 = l_v915_0(v917);
            local v918, v919 = v892(v917);
            if not v918 then
                return;
            else
                v904(v919);
                v49.success("imported config");
                return;
            end;
        end;
        local function v923()
            -- upvalues: v892 (ref), l_v877_0 (ref), v904 (ref), v49 (ref)
            local v921, v922 = v892(l_v877_0);
            if not v921 then
                return;
            else
                v904(v922);
                v49.success("imported default config");
                return;
            end;
        end;
        v835.export:set_callback(v912);
        v835.import:set_callback(v920);
        v835.default:set_callback(v923);
    end;
end;
v835 = nil;
v876 = v364.antiaim.presets;
v877 = "MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/=";
v878 = "presets";
local v924 = {};
local v925 = v398[v878] or v924;
local v926 = {};
local v927 = {};
local v928 = nil;
local l_match_0 = string.match;
do
    local l_l_match_0_0 = l_match_0;
    v928 = function(v931)
        -- upvalues: l_l_match_0_0 (ref)
        return l_l_match_0_0(v931, "^()%s*$") and "" or l_l_match_0_0(v931, "^%s*(.*%S)");
    end;
end;
do
    local l_v876_1, l_v878_1, l_v925_0, l_v926_0, l_v927_0, l_v928_0, l_l_match_0_1 = v876, v878, v925, v926, v927, v928, l_match_0;
    l_l_match_0_1 = function()
        -- upvalues: v398 (ref), l_v878_1 (ref), l_v925_0 (ref)
        v398[l_v878_1] = l_v925_0;
    end;
    local function v944()
        -- upvalues: v59 (ref)
        local v939 = {};
        local v940 = v59.get();
        for v941, v942 in pairs(v940) do
            local v943 = v942[1];
            if v942[2] == "AA" then
                v939[v941] = v943:export();
            end;
        end;
        return v939;
    end;
    local function v951(v945)
        -- upvalues: v59 (ref)
        local v946 = v59.get();
        for v947, v948 in pairs(v945) do
            local v949 = v946[v947];
            if v949 ~= nil then
                local v950 = v949[1];
                if v949[2] == "AA" then
                    v950:import(v948);
                end;
            end;
        end;
    end;
    local function v956(v952, v953, v954, v955)
        return {
            name = v953, 
            author = v952, 
            content = v955, 
            created_at = v954, 
            updated_at = v954
        };
    end;
    local function v959(v957)
        -- upvalues: v944 (ref), v956 (ref)
        local v958 = v944();
        if v958 == nil then
            return nil;
        else
            return v956(common.get_username(), v957, common.get_unixtime(), v958);
        end;
    end;
    local function v963(v960)
        -- upvalues: v834 (ref), l_v926_0 (ref)
        if type(v960.content) == "string" then
            local v961, v962 = v834:decode(v960.content);
            if not v961 then
                return;
            else
                v960.content = v962;
            end;
        end;
        table.insert(l_v926_0, v960);
    end;
    local function v967(v964)
        -- upvalues: l_v927_0 (ref)
        for v965 = #l_v927_0, 1, -1 do
            local v966 = l_v927_0[v965];
            if v966.name == v964 then
                return v966, v965;
            end;
        end;
        return nil, -1;
    end;
    local function v969(v968)
        -- upvalues: l_v927_0 (ref)
        return l_v927_0[v968];
    end;
    local function v972(v970)
        -- upvalues: v967 (ref), l_v928_0 (ref), v951 (ref)
        local v971 = v967(l_v928_0(v970));
        if v971 == nil or v971.content == nil then
            return false, "Preset is not valid";
        else
            v951(v971.content);
            events.update_records:call();
            return true, v971;
        end;
    end;
    local function v979(v973)
        -- upvalues: l_v928_0 (ref), v967 (ref), v959 (ref), l_v925_0 (ref), l_l_match_0_1 (ref), l_v926_0 (ref), v944 (ref)
        v973 = l_v928_0(v973);
        local v974, v975 = v967(v973);
        if v974 == nil then
            local v976 = v959(v973);
            if v976 == nil then
                return false, "Unable to create preset";
            else
                table.insert(l_v925_0, v976);
                l_l_match_0_1();
                return true, v976;
            end;
        elseif v975 ~= -1 and v975 <= #l_v926_0 then
            return false, "Can't modify script preset";
        else
            local v977 = v944();
            if v977 == nil then
                return false, "Unable to export config";
            else
                local v978 = common.get_unixtime();
                v974.content = v977;
                v974.updated_at = v978;
                l_l_match_0_1();
                return true, v974;
            end;
        end;
    end;
    local function v984(v980)
        -- upvalues: v967 (ref), l_v928_0 (ref), l_v926_0 (ref), l_v925_0 (ref)
        local v981, v982 = v967(l_v928_0(v980));
        if v982 ~= -1 and v982 <= #l_v926_0 then
            return false, "Can't delete script preset";
        else
            local v983 = v982 - #l_v926_0;
            table.remove(l_v925_0, v983);
            return true, v981;
        end;
    end;
    local function v989()
        -- upvalues: l_v927_0 (ref), l_v926_0 (ref)
        local v985 = #l_v927_0;
        if v985 == 0 then
            return {
                [1] = "Empty"
            };
        else
            local v986 = {};
            for v987 = 1, v985 do
                local l_name_0 = l_v927_0[v987].name;
                if v987 <= #l_v926_0 then
                    l_name_0 = string.format("%s\a{Link Active}*", l_name_0);
                end;
                v986[v987] = l_name_0;
            end;
            return v986;
        end;
    end;
    local function v994()
        -- upvalues: l_v927_0 (ref), l_v926_0 (ref), l_v925_0 (ref)
        l_v927_0 = {};
        for v990 = 1, #l_v926_0 do
            table.insert(l_v927_0, l_v926_0[v990]);
        end;
        table.sort(l_v925_0, function(v991, v992)
            return v991.name < v992.name;
        end);
        for v993 = 1, #l_v925_0 do
            table.insert(l_v927_0, l_v925_0[v993]);
        end;
    end;
    local _ = nil;
    local function v999(v996)
        -- upvalues: v969 (ref), l_v876_1 (ref)
        local v997 = v996:get();
        if v997 == nil or v997 <= 0 then
            return;
        else
            local v998 = v969(v997);
            if v998 == nil then
                return;
            else
                l_v876_1.name:set(v998.name);
                return;
            end;
        end;
    end;
    local function v1002()
        -- upvalues: v972 (ref), l_v876_1 (ref), v49 (ref)
        local v1000, v1001 = v972(l_v876_1.name:get());
        if not v1000 then
            v49.error(v1001);
            return;
        else
            events.update_records:call();
            v49.success(string.format("preset %s loaded", v1001.name));
            return;
        end;
    end;
    local function v1005()
        -- upvalues: v979 (ref), l_v876_1 (ref), v49 (ref), v994 (ref), v989 (ref)
        local v1003, v1004 = v979(l_v876_1.name:get());
        if not v1003 then
            v49.error(v1004);
            return;
        else
            v994();
            l_v876_1.list:update(v989());
            v49.success(string.format("preset %s saved", v1004.name));
            return;
        end;
    end;
    local function v1008()
        -- upvalues: v984 (ref), l_v876_1 (ref), v49 (ref), v994 (ref), v989 (ref)
        local v1006, v1007 = v984(l_v876_1.name:get());
        if not v1006 then
            v49.error(v1007);
            return;
        else
            v994();
            l_v876_1.list:update(v989());
            if v1007 ~= nil then
                v49.success(string.format("preset %s deleted", v1007.name));
            end;
            return;
        end;
    end;
    local function v1012()
        -- upvalues: v944 (ref), v834 (ref), v49 (ref), l_clipboard_0 (ref)
        local v1009 = v944();
        if v1009 == nil then
            return;
        else
            local v1010, v1011 = v834:encode(v1009);
            if not v1010 then
                v49.error("can't encode data");
                return;
            else
                l_clipboard_0.set(v1011);
                v49.success("preset exported");
                return;
            end;
        end;
    end;
    local function v1016()
        -- upvalues: l_clipboard_0 (ref), v834 (ref), v49 (ref), v951 (ref)
        local v1013 = l_clipboard_0.get();
        local v1014, v1015 = v834:decode(v1013);
        if not v1014 then
            v49.error("can't decode data");
            return;
        else
            v951(v1015);
            events.update_records:call();
            v49.success("preset imported");
            return;
        end;
    end;
    l_v876_1.list:set_callback(v999);
    l_v876_1.load:set_callback(v1002);
    l_v876_1.save:set_callback(v1005);
    l_v876_1.delete:set_callback(v1008);
    l_v876_1.export:set_callback(v1012);
    l_v876_1.import:set_callback(v1016);
    v963(v956("isabel", "Default", -1, "qCfof7ezm72eRHQNXSfdzdvxSVf2Ba9CBaMlgrN9fowxSVfCgr9nzsyrgrN9foD2BY7ASVf2gsEnBo90goECSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsRHgaEHBaMHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsb7gsRlBrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goUrgsy7BoEYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2grUYgof1Ba8HSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrE2grBrBofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaRngaMCzsR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsbnBobnBak9fowxSVfCgr9nzsyrgrN9foDHgY7ASVfrBoblBs82Bav9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgoECBoR1gpldzIG9fofYgr80zaBYBeldzoR1ht29foU2zaM2gaRHBrO9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfYgoE1gs9ngrk9fowxSVfCgr9nzsyrgrN9foDGBoeQ4eldzaf2go92go9lSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQNXSfyvdNa95QH8n3wc59dzdvxSVfCBayYgsRYzs8nSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fofCga9HBrU2zsN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgaBrBsflBsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMlBsB0grM2SVfjqHldBo9Ygob1Br9lSVfj4sfnht29foBlzaE2ga80BoN9fowxSVfCgr9nzsyrgrN9foDrgY7ASVfrBo9YgoRYBsUCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBr8ngsRCzaB7SVfjqHldBo9Ygob1Br9lSVfjgspQ4eldBrR2gs8HBoE2BeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrBrzsMrzeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsfCBs9CBoe9fowxSVfCgr9nzsyrgrN9foDlht29foR2zsy7goM1zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgobCgrRngsylSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0Bs8YgrynBpldzIG9fofYgr80zaBYBeldzoNQ4eldzsbHBabYBse9fowxSVfCgr9nzsyrgrN9foDHzPHQfdldfCgNsbkBmZghUYvKkFgDXF0IfoDdqHldBsU0zsMCBa80BZldzIG9fofYgr80zaBYBeldzd7rBS7ASVf2gsB2gafCBr81SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs8lBrB2Bo81geldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2Bry0gsU1geldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzabnBoRYzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof0gaflzaflgsN9fowxSVfCgr9nzsyrgrN9foDlht29foB2zsM1zaRHgag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBCzsUnzsylgo39fowxSVfCgr9nzsyrgrN9foDlht29foBHBoBCgs8ngre9fowxSVfCgr9nzsyrgrN9foDlht29foBYBrUYBsfYgap9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr8rBrBYgs92SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bay0gaR1gsUlSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foyrBoE0zaB7BpldzIG9fofYgr80zaBYBeldzoUHht29foy7zsyrBaR7BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7O3XnZA8F9dzdvxSVf2BrErgof7goy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsBHzsU0gaBCgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs8Cgob0BsB1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBs87zaE7grB0gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrfHzsfHzsb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaBHgr8CzsRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMCBr90Bs9YSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoblBrRngaBrBpldzIG9fofYgr80zaBYBeldzoNQ4eldBobYBsBngs9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldBrBHgaM2BrBlBpldzIG9fofYgr80zaBYBeldzo8lht29foBnBoM0BrB1gsg9fowxSVfCgr9nzsyrgrN9foDlht29foBngaU1Ba97gom9fowxSVfCgr9nzsyrgrN9foDlht29foUlgsR7zsyYgae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgrBYBsf7BrU1SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghmIvpOSg78F0bXF0IfoDdqHldBsB0zaBYgsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBsRHgsfYgsp9fowxSVfCgr9nzsyrgrN9foDlht29fofCgob2gsyrBrN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgrfHBofHgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoB1gsB1zsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCzablBs9lBsv9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrErzaElBoE1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrUHBobCgs9HgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHBoMrgrynBeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaMrBsM0gav9fowxSVfCgr9nzsyrgrN9foDlht29foUlgr97grB0zsO9fowxSVfCgr9nzsyrgrN9foDlht29fo92BrRHzaB0gZldzIG9fofYgr80zaBYBeldzoNQ4eldgrf7BsfYBoBnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzsbHBrBngsO9fowxSVfCgr9nzsyrgrN9foDnBPHQfdldfCgNsbkBmZghsFe6kFeAfep3kCfjfIG9foECBoBngsM7grk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoBngobrzaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsRHBay1zs97gHldzIG9fofYgr80zaBYBeldzoNQ4eldBs9lgsR1gsf0gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoM1BsE0Ba91geldzIG9fofYgr80zaBYBeldzoNQ4eldBoBYBoyHBaE1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBrMrgrf2Br92BHldzIG9fofYgr80zaBYBeldzoNQ4eldBrUCBaBHBay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrUrzsflzaMHgHldzIG9fofYgr80zaBYBeldzoNQ4eldBr9rzsRnza90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrza9YgoUCgoy2SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foUCzabHBaU1gsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7zsErBr91gZldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYgry0BaE1SVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0PsEZsS7HKk5RyvdNa95QH8n3wc59dzdvxSVfCBr9lgoy2BoR2SVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBoU1za8rBsyrgpldzIG9fofYgr80zaBYBeldzovQ4eldBoRrBaU7zaBHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBo81BsyCza9rSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BrR1BoE0BHldzIG9fofYgr80zaBYBeldzoNQ4eldBr82gaBlgr80BeldzIG9fofYgr80zaBYBeldzo8lht29foBYgrRlzs90gsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB1gsf7gay1gae9fowxSVfCgr9nzsyrgrN9foDGgsmQ4eldBryHzaB2Bo8lzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnzsb1BoB7gZldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaRCgsU1BrU0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgoR0Bo8rBsUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnzsf7BsMrBoN9fowxSVfCgr9nzsyrgrN9foDGzP7ASVf1zsECBabHgok9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQWcdNH9nRdzdvxSVf2BafngrUHBoE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Ba8HgoR7Br9CSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foErzaRYBr81Bo39fowxSVfCgr9nzsyrgrN9foDlht29foEnga8YgoErBsp9fowxSVfCgr9nzsyrgrN9foDlht29foE0goUrBrRlBop9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgrbHgoR7BsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgs9YBaECgo39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr87Bo8lgsbnBeldzIG9fofYgr80zaBYBeldzo8lht29foBngr90BaE2zs39fowxSVfCgr9nzsyrgrN9foDlht29foUlgay0grbrgrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaRlBr80Br87SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsUCgoMngoN9fowxSVfCgr9nzsyrgrN9foDlht29foUHgab0zsfYgpldzIG9fofYgr80zaBYBeldzoNQ4eldzaU2BrU2go97SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRIZ6c5p6OCfjfIG9foElzaE1Ba90Bag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoErgrEngsEYSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBsRrBrU7BoMCzeldzIG9fofYgr80zaBYBeldzo8lht29foE0gaMlzsRnBsk9fowxSVfCgr9nzsyrgrN9foDlht29foflBa91zs80zsm9fowxSVfCgr9nzsyrgrN9foDlht29foflgrRnzsyrgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoRCgo8HBsZ9fowxSVfCgr9nzsyrgrN9foDlht29fofYgab2gaM2BoO9fowxSVfCgr9nzsyrgrN9foDCht29foB2gsb1BrE7Bag9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrb2zsy1BoEnBpldzIG9fofYgr80zaBYBeldzd7CBP7ASVf7Bs90gs9rgsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUnBryCgob1gHldzIG9fofYgr80zaBYBeldzd77gS7ASVfYBrErBoUlgag9fowxSVfCgr9nzsyrgrN9foDlht29fo9HBoU1BaMHzZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghRne5OtNfOFebfoDdqHldBsMngaf2go8nzeldzIG9fofYgr80zaBYBeldzo8lht29foECBsUlBsE2BsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs97BoE0gr81BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsb0BsMlBsEYgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgsbCzaE7Bop9fowxSVfCgr9nzsyrgrN9foDlht29foflzsU1BsBnzsp9fowxSVfCgr9nzsyrgrN9foDGBsNQ4eldBoBCBrBYBoBlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRnBrUHBrflBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo9CgoElBr9YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy1zsRYgaEYBZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBsRHzabrgsyrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrB1ga9lza9CBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrb7gab2BrUngHldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgaf1BrEHSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRn3395ZbfoDdqHldBsf2grU2BoR0BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsB7go9rgo39fowxSVfCgr9nzsyrgrN9foDlht29foEHBr97zsRlgap9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsyHBsbHgaN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaUnBoBrgsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof0ga97Bsfrgam9fowxSVfCgr9nzsyrgrN9foDlht29foBlgoE1gsy1zav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BoMlgrBYgsbnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaflBoECgrR1gZldzIG9fofYgr80zaBYBeldzoNQ4eldgaUHBs8CgsEYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgsM0gaR0gay0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRngoM2zay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMngrRYgabYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsBlzsb1zsZ9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQsciQYfiHKkipKcdfjfIG9foErgoU1gaR0Bsv9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrU7gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gs9CgoBlgaErSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE7BaMHgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab0gaMrzam9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE0zsEnBsR0gae9fowxSVfCgr9nzsyrgrN9foDlht29foflBr97zs8CBog9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfCBsb7zsEYBof2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrRYgs82Bo8lSVfjqHldBo9Ygob1Br9lSVfj4sB1ht29fofrzsRHga87zZldzIG9fofYgr80zaBYBeldzo8lht29foBlBrElBoyrzsN9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr91BrRYzsfHSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foU2BoM1gaB7gse9fowxSVfCgr9nzsyrgrN9foDlht29foy2zsb7BabHgpldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHg78F0bXF0IfoDdqHldBsfCgsBnBo82BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsyCBsMHzsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr82zs9lBr8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsMCzaMnBoE1SVfjqHldBo9Ygob1Br9lSVfjBrgQ4eldBsb7Bsy0Brb7gpldzIG9fofYgr80zaBYBeldzoNQ4eldBo80Ba8rgsB1BZldzIG9fofYgr80zaBYBeldzoeQ4eldBoy0grUHzafnSVfjqHldBo9Ygob1Br9lSVfj4s80ht29fof0ga8lzabngok9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrBa92BaEHBsM2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBHzaR7gs8rgeldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsb0gaEHzaM2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBo9CBsUlzav9fowxSVfCgr9nzsyrgrN9foDlht29fo80BsfHzsM2gHldzIG9fofYgr80zaBYBeldzoNQ4eldzsfYBa8HgaBlSVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0RtRevsZQgURpzfoDdqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzovQ4eldBrUlBrUrgoUlBeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foflzabHgaU0zsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEYBob1zsyCgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsy1BrB2zay2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgo82goRrgrZ9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo8ASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BoM1BsU0gsMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBlzsb2goE0zsp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzsMCBrMYgog9fowxSVfCgr9nzsyrgrN9foD7BP7ASVfCBs9rBa81zaR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCBaR2Brb7gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgsMngaE1gsp9fowxSVfCgr9nzsyrgrN9foD2hSHQ4eldBrRnBob1grb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrRngo9lzsm9fowxSVfCgr9nzsyrgrN9foD2ht29fo97zablgsBngeldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foD0BV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzoy14eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foyHBaM0zsRnBHldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BsM0BrB1BaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2BsbrgryYgoRnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaUrBob0gs91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gabYBafHBafHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsR1zsU0gaMnzZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs8YBrRrzsErgHldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBr9CgrU7BHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9CgrU7zaUYgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs91goE2ga8rSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE2gobHBaRCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab1BrUlgablSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsb1BoblgsMnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrB1zs8nzsEnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngoErBrMngHldzIG9fofYgr80zaBYBeldzoNQ4eldBoBnza82zsfnSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoR7grRYBafHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo8CzaU0gsBHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo81gsBCgav9fowxSVfCgr9nzsyrgrN9foDlht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foBlzs9lgrU1grZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB2BablgrMHzaN9fowxSVfCgr9nzsyrgrN9foDlht29foBrBoM2goMCBrp9fowxSVfCgr9nzsyrgrN9foDlht29foB7BobCzs9YBre9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHzaU1zsE0Bo39fowxSVfCgr9nzsyrgrN9fow79IZpht29foyrBs91BsErgHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7ew9dfjfIG9foElBry1Bsf1BrO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BsU7Br97grbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BrMrzs9Yzse9fowxSVfCgr9nzsyrgrN9foD2ht29foE7gaU0BsU2gsv9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBsUHgoR0BofnzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsRrgr9Ygr82geldzIG9fofYgr80zaBYBeldzoNQ4eldBsylgoBlBaElBpldzIG9fofYgr80zaBYBeldzo8lht29foE1BsEnzsRlgsv9fowxSVfCgr9nzsyrgrN9foDlht29fof7BaR2zsU2gap9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgrUCzsRHzaRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryrBsy1goB7SVfjqHldBo9Ygob1Br9lSVfjBsylht29foBHBayYzaRnBap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsElBa91gaE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR1Bsb7ga97gpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrR0Ba80goe9fowxSVfCgr9nzsyrgrN9foD0BP7ASVfrgryrzs9HBrflSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzsfrgrblBsR0SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BoRlgobngoZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf7Bof1zs8rzsbCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8ngs87zaMCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfYgo87BoRCBsm9fowxSVfCgr9nzsyrgrN9foDGzsNQhtfAfdBomEZimR0stZOeS7ew9dM5fEgCcYZoXip6OCfjfIG9foECgs8lBry2gsg9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BoylgaEHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsR1zayHBrMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsbCzsB7za8nSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gofCgrU7BaUnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs91gayYBobHBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1goy2gryrgoe9fowxSVfCgr9nzsyrgrN9foDlht29foE0Bsy2gaB7zsZ9fowxSVfCgr9nzsyrgrN9foD2ht29fof2Brf1zafngoO9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgaf1goE0zak9fowxSVfCgr9nzsyrgrN9foDlht29fof7zsy2ga9rgam9fowxSVfCgr9nzsyrgrN9foDlht29fof1goBrzaBlgr39fowxSVfCgr9nzsyrgrN9foDlht29fof0BoBnBr9rBsm9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBob1gaylBo8rgpldzIG9fofYgr80zaBYBeldzoflht29foBlBrfYzs9nBrv9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElzsMYBaR1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrE0Br8HgoR2BpldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzaRnBs91BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7grMnBsbYgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYzaM2gaUHgoe9fowxSVfCgr9nzsyrgrN9foDlht29fobrgoylBrB2zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7gCcYZoXip6OCfjfIG9foElBaEYBsb0gsm9fowxSVfCgr9nzsyrgrN9foDlht29foElgrR1BoMHgsO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2zaB2ga80grEYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1Br9rzaf7zsm9fowxSVfCgr9nzsyrgrN9foD2ht29foE0gsRlgoEngre9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCBsR7BrE0gr8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrbCBsR7zs9nSVfjqHldBo9Ygob1Br9lSVfjBsylht29fofngaB0goblBrv9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0zsU7BofHBsv9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHgsb1goMlgaO9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsf7BoBYBaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaRHza97BsUCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1zsBHgrylzaZ9fowxSVfCgr9nzsyrgrN9foD2ht29foUCBsf0gaf0zsk9fowxSVfCgr9nzsyrgrN9foDlht29fo8Hza8lBs9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfngoBCgrf7gsZ9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfngoRlgsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9nzsM7gsfCgpldzIG9fofYgr80zaBYBeldzoflht29foy1zaBrBoBHgpldzIG9fofYgr80zaBYBeldzoNQ4eldzay0gaflgoR7SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhm5eTOF23OCfjf50Hcild4Vfof7membZzR7pFmZQi95Zp9Ym3c5mwc59dzdvxSVf2Ba8rzsB2BoynSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaUYzaU7ga82SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1goR7grE2BsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zabHgofrBrE1SVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE0grRnzay1goe9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zsyCzsMHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foflBrfngoRHgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsU0grBCzaEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoU1grE0goM1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoy1gsUYgoR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsM7gaylzaB7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBobrga9ngr9CgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrECgrB7BrRCgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7za92BafrgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrU7Bs9HgabCSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrUHgaM7goUrzZldzIG9fofYgr80zaBYBeldzoNQ4eldBry0BryCBo80gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0ga9HBoUngop9fowxSVfCgr9nzsyrgrN9foDlht29fo8rBaMngo81zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy7gsE0BrMCBHldzIG9fofYgr80zaBYBeldzoflht29fobCBablgo9ngZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7H3cIZ3cVNO8S9dzdvxSVf2BaflBrb7zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsEngaB7zab0gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7go92gr8ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1zsyHBsE2gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsRlgaflBrbYgHldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrR2Ba9HgeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2grM1gsR7zs8CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM2BsbCBsfHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBofrBsfCBry2BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoRYBrRYgrE0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBo87zaM2gsB1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoyHBaRrzs87gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrf2BsyrgrM2gHldzIG9fofYgr80zaBYBeldzo8lht29foB7BaBrBsfCBap9fowxSVfCgr9nzsyrgrN9foDlht29foB7BoE2Bob2grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgr82zaM7BoEHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaMHgs9lgrU2zZldzIG9fofYgr80zaBYBeldzoNQ4eldgafngaE1za8nzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUngaBCgay7BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgo92gsRrBsO9fowxSVfCgr9nzsyrgrN9foDCBPHQfdldfCgEmROespgvZbZhsFQnOtM5fEgCcYZoXip6OCfjfIG9foE2grMYBrM2gap9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE7go91BrEHgap9fowxSVfCgr9nzsyrgrN9foDrgoNQ4eldBsR2goMCgayYBHldzIG9fofYgr80zaBYBeldzo8lht29foEngsRrgrBrBsk9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bs8HBoynzsp9fowxSVfCgr9nzsyrgrN9foDCht29foflgry1grR2zaN9fowxSVfCgr9nzsyrgrN9foDlht29fof2gsMnBob2Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgs92BrE2gaM0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgo97Bo9CBab1SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzsBHzaU2BsB1SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0Bryrzsf2gre9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBrfYBofrBsR7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrflBs8lBoB0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgaynBoyYBs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9rgoEHgsb1BZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgrU7Bablgsk9fowxSVfCgr9nzsyrgrN9foDlht29foUCgs9rBoBlBHldzIG9fofYgr80zaBYBeldzoNQ4eldgsBCBrf2zsBrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfnBaB7zsUHBrv9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf1BaB2gsf0gsZ9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsbYgaf7ga81SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhsn1ykSgpfoDdqHldBsMnBsMrza8YzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2BoR7BoBrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBoflBofrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaM1Bob2gsMrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbnBsRngsErBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoB2BoRCgs9ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRCgsMnzsBnBpldzIG9fofYgr80zaBYBeldzoflht29fofngoElBoE0zae9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoyHBrf7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoyCgr9nBsRlBZldzIG9fofYgr80zaBYBeldzoNQ4eldBrMlgaBYBoEYBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7gaUHgrfYgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBa92zay7Bov9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr92grMrBa9lzeldzIG9fofYgr80zaBYBeldzo8lht29foB0BrR2gsE1geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0zs8CBaM0Bs39fowxSVfCgr9nzsyrgrN9foDlht29foU2BobHgoUCgak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsbrBoR0za80SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUrgaR2zaEnzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy2gsUnzs8YBpldzIG9fofYgr80zaBYBeldzoNQ4eldzaUYBsM7zaErSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRIZ6c5p6OCfjfIG9foElgaElza97grO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsf7Bo9Hgo8YBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsBCgsBnBsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0zsyCBsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7grUCgrU2grm9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaf7zs92gsbrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoMCBr9Hgr91zZldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsBlBo90BoM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrU1gsRrBofYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBo9YBs9CBsblgZldzIG9fofYgr80zaBYBeldzoNQ4eldBoyrBrRnBo9lBZldzIG9fofYgr80zaBYBeldzoNQ4eldBobrzaRrBsyHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBlgr9Cgsy2BoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBof7Boy2gsy1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoU7gsBlBrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgafCBrB7gsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgoUnzsbnBaB1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaM0BoM2BsyYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7gof7zabrBoO9fowxSVfCgr9nzsyrgrN9foDlht29foUngrfrBrBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzaB2gry2BsBYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRne5OtNfOFebfoDdqHldBsE7gsMHza91zeldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7gaM1ga8nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7gaylgrBrgae9fowxSVfCgr9nzsyrgrN9foDlht29foEngrBHBrb2Brk9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsUHBry2gag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsbnBsf1BrErSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoE2gsU2gsU7BHldzIG9fofYgr80zaBYBeldzoNQ4eldBofCzaylBrM7BZldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2BoRrzsBrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBsBYBsUrgs39fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsRlza87zs9lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoRHzsy0gr9rSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsBnzsBYBsO9fowxSVfCgr9nzsyrgrN9foDlht29foBlgsyHgsf1Bam9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEnBsR1za9rgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaE7Baf1gsm9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsbCBrylgog9fowxSVfCgr9nzsyrgrN9foDlht29foU2grM0BaB7zag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfnBoUHBsf1gov9fowxSVfCgr9nzsyrgrN9foDlht29fo8rgrU0zaECgZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgoMHBrbHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHgD8SvpOVfjfIG9foElzayCza9Czap9fowxSVfCgr9nzsyrgrN9foDlht29foEngsEYzsEHBsp9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2grynBsE7gog9fowxSVfCgr9nzsyrgrN9foDlht29foE0gsU7zaBngs39fowxSVfCgr9nzsyrgrN9foDlht29fof2zaU7BafrBak9fowxSVfCgr9nzsyrgrN9foDlht29fof7goUCzaB0zak9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bsf1gofngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2zsb1BoMCgpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgabnBoEHgabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR7gaflgrBngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrR1zablzs8YgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHzab7go87BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza81gry1zsf0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrblBsMnzsMrgZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBr92gsb2BoZ9fowxSVfCgr9nzsyrgrN9foDlht29foUCzaErBof7go39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7Bob2ga8lBsy1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgsUHBo9rgaMHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsynBo9nBry0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB0Bo87gayYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsy1goBlBrm9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7membZzR7pFmZQsciQYfiHKkipKcdfjfIG9foEHzsyrBsUlgap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2goE1gsbHzaEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go80goblBs9nSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbYgo8YBrbnBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsb1BrfCzs8rgZldzIG9fofYgr80zaBYBeldzoflht29fofrBof2gaBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBr8nBsBrBa8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaM1BaE1zs8YSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1zsR2zay1gaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0go8lBo9nBrk9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBaErgoyrzay1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBaBYzabHBrfHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoy2goMYgabrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBnzsB1goR1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8rBsMrBr92BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoU0ga9rgoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr80Brynzsy7gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrbYzaUHzsb1BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyCgr90BoR1BHldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYzsB0zsB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsMlgoU7BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgEmROespgvZbZhRYm3c5mwc59dzdvxSVf2BaMYgsb0BrN9fowxSVfCgr9nzsyrgrN9foDlht29foE2Bsf1BaB1Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaMrgsBrza82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaRYBaylBoMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaMYBsy1zse9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyHza87gsE7BeldzIG9fofYgr80zaBYBeldzoNQ4eldBofYzaR7grUlSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofrBrbHgaB0Ba39fowxSVfCgr9nzsyrgrN9foDlht29fofrgs82gobnBav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgsUlgaB2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgrynza80grO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrgaErBaUlBoRrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrRlgofYzs91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRlgo87gryHBZldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrMlgo91geldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBaR2zsU7zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrUrBa82gaBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBrBnBo97zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1Baf0BaB1Brm9fowxSVfCgr9nzsyrgrN9foDlht29fobYBsU2gr82BHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoRbePmRvWZVfjfIG9foElBa8Yzaf0Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gofYgrU7BaU1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2zablBaU2zs87SVfjqHldBo9Ygob1Br9lSVfjBrZQ4eldBoEYgrE0BrBCSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BV29foEYgr8YgpldzoM6BV29foEYgr81gHldzoM6gry7BrErgrbYzsRlgrU7gIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoBHBaMnzsBlSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoRCgoyHgrU2zZldzIG9fofYgr80zaBYBeldzoB2ht29fofnzaBHBrflBo39fowxSVfCgr9nzsyrgrN9foDCgS7ASVfCzs90goU2Ba8HSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrUCgs9HBoRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr8CBaR7grb7SVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldgsf1BrU7BofnSVfjqHldBo9Ygob1Br9lSVfjgYHQht29foflzabrBobCBsN9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzab2ga8HBoO9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBoM1zsBCzsflgpldzIG9fofYgr80zaBYBeldzovQ4eldBoM0BafrBa9nBHldzIG9fofYgr80zaBYBeldzoZQ4eldBrB7zaR2BaRlzeldzIG9fofYgr80zaBYBeldzo8lht29foBrgo8YzsbYBav9fowxSVfCgr9nzsyrgrN9foDHht29foB7gaE7gsECBap9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rBsBYBoRHBaECzsy0BaU74eldBs9Ygo9nSVfjBV11Bo97gsElgsMCzaEHBoUY4eldBs9YgoyYSVfjBV1nBrbCBsRYBa9Ygry0BrMYhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgabYBafHza8lSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BaynBo97gsECBsECBsUlgo8ASVf2gr9ngrO9foDl4oM1gofYgaR2BoE2BoE7Ba8n4eldBs9YgoyYSVfjBV1lza8CgrUHBsf2Bsf2gaMngIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldzs87zaf2Br9nSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BrBYBoR7zsE2go82BsU1Ba9ASVf2gr9ngrO9foDl4o97zsM2zs8CBoylBo9rgaUASVf2gr9nzak9foDl4ob7BsEYgoRrBr80zsMrgsOQSSHQ4eldBoM0BaR2gsM2zeldzoNQhSHQ4eldBoyHzaRCBoErgeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fofHBo81gs97Bsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgr8rBrU2gaB7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgaflgsy0ga81zeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzs91zabCgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaEnBay0grfnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BaU1zs9HzaBYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsMYBo91ga9HgeldzIG9fofYgr80zaBYBeldzoylht29foE2Bsf2BoyCBaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BsBCBaB7Ba9CSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsEHBoRnga9YBeldzIG9fofYgr80zaBYBeldzovQ4eldBsEYgoBHBaBYgeldzIG9fofYgr80zaBYBeldzoylht29foECBaM0Bs82Bog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2Bo8HBabHBr91SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsf1Bof0zaE0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foECzs87BrfHBsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BrEYBsf7zae9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2Brfngo9lBr9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsB7Baylga80BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7BsMCBoUrBrv9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2gaB1ga9lgsE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsU7go9YBay1BeldzIG9fofYgr80zaBYBeldzoRlht29foE7gay2zsR2BaN9fowxSVfCgr9nzsyrgrN9foDlht29foE7grf7zablgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gsBCzaE7BsU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsRrgoUlgsf1BHldzIG9fofYgr80zaBYBeldzoNQ4eldBsR7BaRYBo90gHldzIG9fofYgr80zaBYBeldzoRlht29foEHzaMnzaU1zZldzIG9fofYgr80zaBYBeldzoNQ4eldBs82BsBCgsbHBpldzIG9fofYgr80zaBYBeldzoRlht29foEnBsf2zaMlBav9fowxSVfCgr9nzsyrgrN9foDCht29foEnBoEHgry0BrN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2go9lzaRrgsBYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go91grE1zaRlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gob2BaR2ga8CSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs80zaUlgrUngHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEYBaMngrU1Bog9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grErzsfCgoyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBs92gsBYgsO9fowxSVfCgr9nzsyrgrN9foDCht29foEYBrb0Bry2Bsv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grUrBrUHBo8nSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsyCBsBHgrb7BZldzIG9fofYgr80zaBYBeldzoylht29foE1BobCBo81Brv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaU2gaBCBsb0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsy7zsM1gr91BpldzIG9fofYgr80zaBYBeldzoNQ4eldBsy7zsBYzaM1geldzIG9fofYgr80zaBYBeldzoRlht29foE1gsfYgoMnBaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2za8CgsyCBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1go81zsU0Bom9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zay7gsblBsBCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsy0goBHBrf0gpldzIG9fofYgr80zaBYBeldzoRlht29foE0BsM7za9nBsm9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zsE1Br97Br81SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsfYgo8lgaf1SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsbYBs97gsErBpldzIG9fofYgr80zaBYBeldzoRlht29foE0grbngsbrBrk9fowxSVfCgr9nzsyrgrN9foDCht29foE0za82BaBnzsg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBaMCBo9lBsbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBaf0Brb0grBnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoM7BrRrgaMHgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflga9CBsf7gog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBa8nzabHzaU1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsMrzsB7za91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM7grE7goE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoE2zay7zabrgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2go9Cgsy0gap9fowxSVfCgr9nzsyrgrN9foDlht29fof2gr81zsEnzap9fowxSVfCgr9nzsyrgrN9foDlht29fof2zsMlBaU7Bok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBoErBofCBoE7SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBofrgsB2zaU0geldzIG9fofYgr80zaBYBeldzoNQ4eldBofrzsUlzs9lgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofCzaBlBafrzsO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBobYza87gsUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoB7go81gs9HSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBrR7BaR2zsEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoUlBaf0Boe9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfCga8CgaE0goE1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoU0ga87zs8CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRHzsy1gsbnzZldzIG9fofYgr80zaBYBeldzoylht29fofnBaMCga8Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fofnBaBrzaE0gsZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgoE7grM1goZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgoB2gab7goyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBo8nBabnBsyrgZldzIG9fofYgr80zaBYBeldzovQ4eldBo9CzayHga92geldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYBrRrgoECzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaf7Bo9CBo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzaRlgrfYgsy0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyngaynBsblgHldzIG9fofYgr80zaBYBeldzoRlht29fof1grM0ga9HBHldzIG9fofYgr80zaBYBeldzoRlht29fof1grR2BsU1zaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzab1zafCBsy2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsM2gry0BrUCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBob2go8CBab0BpldzIG9fofYgr80zaBYBeldzoNQ4eldBob2zaUHzsElSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobCgoUlgo8CgZldzIG9fofYgr80zaBYBeldzoRlht29fof0BrBngaRHzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof0Br8YgrM1gsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsR7BoElgr91SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrMHzsylBof1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrM1Bo9nBo91gHldzIG9fofYgr80zaBYBeldzoRlht29foB2Baf0BsUlBrp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBsMHgaRrBobHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsEYza90Brb2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrECgsB2BaBHgpldzIG9fofYgr80zaBYBeldzovQ4eldBrE7grBlBsbYgZldzIG9fofYgr80zaBYBeldzoRlht29foB2gabCgrMrgam9fowxSVfCgr9nzsyrgrN9foDlht29foB2gsMHBs8CBaZ9fowxSVfCgr9nzsyrgrN9foDlht29foB2gsf7zaE7gsv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBs82gry2Ba9lSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrEYBrBlBsE2geldzIG9fofYgr80zaBYBeldzovQ4eldBrE1BoyHgoU0gHldzIG9fofYgr80zaBYBeldzoRlht29foBCBrRnBa97zsO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBoU1BaUngo9nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrfngaBHgoM2BHldzIG9fofYgr80zaBYBeldzovQ4eldBrf1BabCgoB2BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBCzsM1zs8rBag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrMHBa8ngsf1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBCBof2gsE2zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrga97BsEHgop9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBr8lgsUYzaE0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBr8Hzay2grUrSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrUlBaEnBoRnzeldzIG9fofYgr80zaBYBeldzoRlht29foB7BrBrgrb7zap9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaB1gaR0goRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrU7gaUCzs8CgHldzIG9fofYgr80zaBYBeldzoylht29foB7gaR0goblzZldzIG9fofYgr80zaBYBeldzoRlht29foB7gsE2gob2grv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrga8CBaB7BoynSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgay7Bsf1BoBrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrU1go9YBaE0BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrMrgoM1zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgr82Bsblgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsyCgsR1Br8YSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgsyYBrECBok9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgoMYgsyYza9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr82BoRrBa8nBHldzIG9fofYgr80zaBYBeldzovQ4eldBr82grEYzabCBHldzIG9fofYgr80zaBYBeldzoRlht29foBngaR1Brf0Brm9fowxSVfCgr9nzsyrgrN9foDlht29foBngoMCBoR2Bag9fowxSVfCgr9nzsyrgrN9foDlht29foBngryHgafCBaZ9fowxSVfCgr9nzsyrgrN9foDCht29foBnzaBHBs8CBak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrM2zaf2BoRHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr92gsbHgsRYBHldzIG9fofYgr80zaBYBeldzoRlht29foBYgo91zsElgrO9fowxSVfCgr9nzsyrgrN9foDCht29foBYzayrzaf0gov9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrbrBoR1zsp9fowxSVfCgr9nzsyrgrN9foDlht29foB1ga91ga91Bsg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrzaU1ga8nzsbrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrynBryrBrBlgpldzIG9fofYgr80zaBYBeldzovQ4eldBry0BoMHzs81BHldzIG9fofYgr80zaBYBeldzoRlht29foB0BaMrBa9Czae9fowxSVfCgr9nzsyrgrN9foDlht29foB0Ba8rgaMHBov9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzsE7zafCgsO9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzsfYgo8Ygo9HSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrbYgsfYgsfrBHldzIG9fofYgr80zaBYBeldzovQ4eldBrb1zsEYgrM1gHldzIG9fofYgr80zaBYBeldzoRlht29foUlBa9rBryngom9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BaECgaMCzayHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaMHgayYBrN9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BablgaMYBs91SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaErzsMYBsyYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgaEHgsBCgsf0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU2grBrBayYzam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsyYBaf7BoR0SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgaf2gr81BabHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUCzabHgsBrBog9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7Boy0goRnBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUrBsflgaRrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7gayYBsR2BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7gsBrzay7zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7zaylBry0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUYgayHgoylgZldzIG9fofYgr80zaBYBeldzovQ4eldgabCBrbngsyYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsM7grb7BrRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgsE2zs8nzaBnSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgsB7goyYgrflSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsBHgrMHBryCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsbrBsEYgoUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsb1grfHzaBnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoErBrR1zs80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgofHgaUrBafYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB2BaR7Bs9YSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoUCBrE1gsfnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoRnzsR2goR0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoyrBoECgsb7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgoyHBrfrgop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnzabCBoMYgsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBaMYgs90BsN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBobrgsb7Bom9fowxSVfCgr9nzsyrgrN9foDlht29fo9nBsM0BabrBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo91zsb0zaM0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyngsB2Bob1BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyYBo81grBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzsB2zs97gaBnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldzsUYgrUHgrUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldzsRrzsb1BsUCSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf0gs81Br9CBoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0grM0grEHgam9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0zab7grErBaN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoRbZasHvEmZvhUFpCfoDdqHldBsy1zaBHBayrgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBobYgrynzsm9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQNXSfyvdNa95QH8n3wc59dzdvxSVf2zsMCgaElzsMnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo91gaUCBab2BeldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7gCcYZoXip6OCfjfIG9foB0zayHgaEHBsO9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfHzsy7BsE2zsv9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQi8FGpcieIfoDdqHldBoEHBsBlgoRnBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBCgofngrElgoe9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQi95Zp9Ym3c5mwc59dzdvxSVfCBa91BoM1zsU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoE7zsB7gaE0gpldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7H3cIZ3cVNO8S9dzdvxSVfrgafCBob1zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHga9rzaM1zap9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQgcYOpfV8yUYvKkFgDXF0IfoDdqHldBsE0go8Hgs9CBZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29fof2gsRlzs8ngoe9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQWcdNH9nRdzdvxSVf2goBHBsy2gaf1SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBs9rBs8Hgaf7BeldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtSHvHc50wc59dzdvxSVf2BoRHgoB0BofrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngrMlBr9CBHldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtSHg3O5RytiZ3OVfjfIG9fofYzayngs92gak9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfrgobrgab7BsE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRn3395ZbfoDdqHldBs91gobrzs87zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foE1zaB7Bsf7goe9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQsciQYfiHKkipKcdfjfIG9foECgsB0BaE2zap9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfrBa9rzaRCzsErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRYm3c5mwc59dzdvxSVfCzs8HBaBHzs9lSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldgoU0grUHzaB1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtvQ"));
    v994();
    l_v876_1.list:update(v989());
end;
v876 = nil;
v876 = {};
v877 = 0;
v878 = false;
v924 = nil;
v925 = 0;
v926 = 0;
v927 = false;
v928 = {
    [1] = -1, 
    [2] = 1, 
    [3] = 0, 
    [4] = -1, 
    [5] = 1, 
    [6] = 0, 
    [7] = -1, 
    [8] = 0, 
    [9] = 1, 
    [10] = -1, 
    [11] = 0, 
    [12] = 1
};
l_match_0 = 0;
local v1017 = 0;
local v1018 = {};
local l_angles_0 = v32.antiaim.angles;
local v1020 = {};
v1020.__index = v1020;
v1020.clear = function(v1021)
    for v1022 in pairs(v1021) do
        v1021[v1022] = nil;
    end;
end;
v1020.copy = function(v1023, v1024)
    for v1025, v1026 in pairs(v1024) do
        v1023[v1025] = v1026;
    end;
end;
do
    local l_l_angles_0_0 = l_angles_0;
    v1020.unset = function(_)
        -- upvalues: l_l_angles_0_0 (ref)
        l_l_angles_0_0.enabled:override();
        l_l_angles_0_0.pitch:override();
        l_l_angles_0_0.yaw[1]:override();
        l_l_angles_0_0.yaw[2]:override();
        l_l_angles_0_0.yaw[3]:override();
        l_l_angles_0_0.yaw[4]:override();
        l_l_angles_0_0.yaw[5]:override();
        l_l_angles_0_0.yaw_modifier[1]:override();
        l_l_angles_0_0.yaw_modifier[2]:override();
        l_l_angles_0_0.body_yaw[1]:override();
        l_l_angles_0_0.body_yaw[2]:override();
        l_l_angles_0_0.body_yaw[3]:override();
        l_l_angles_0_0.body_yaw[4]:override();
        l_l_angles_0_0.body_yaw[5]:override();
        l_l_angles_0_0.body_yaw[6]:override();
        l_l_angles_0_0.freestanding[1]:override();
        l_l_angles_0_0.freestanding[2]:override();
        l_l_angles_0_0.freestanding[3]:override();
        l_l_angles_0_0.extended_angles[1]:override();
        l_l_angles_0_0.extended_angles[2]:override();
        l_l_angles_0_0.extended_angles[3]:override();
    end;
    v1020.set = function(v1029)
        -- upvalues: l_l_angles_0_0 (ref)
        l_l_angles_0_0.enabled:override(v1029.enabled);
        l_l_angles_0_0.pitch:override(v1029.pitch);
        l_l_angles_0_0.yaw[1]:override(v1029.yaw);
        l_l_angles_0_0.yaw[2]:override(v1029.yaw_base);
        l_l_angles_0_0.yaw[3]:override(v1029.yaw_offset);
        l_l_angles_0_0.yaw[4]:override(v1029.avoid_backstab);
        l_l_angles_0_0.yaw[5]:override(v1029.hidden);
        l_l_angles_0_0.yaw_modifier[1]:override(v1029.yaw_modifier);
        l_l_angles_0_0.yaw_modifier[2]:override(v1029.modifier_offset);
        l_l_angles_0_0.body_yaw[1]:override(v1029.body_yaw);
        l_l_angles_0_0.body_yaw[2]:override(v1029.inverter);
        l_l_angles_0_0.body_yaw[3]:override(v1029.left_limit);
        l_l_angles_0_0.body_yaw[4]:override(v1029.right_limit);
        l_l_angles_0_0.body_yaw[5]:override(v1029.options);
        l_l_angles_0_0.body_yaw[6]:override(v1029.freestanding_body_yaw);
        l_l_angles_0_0.freestanding[1]:override(v1029.freestanding);
        l_l_angles_0_0.freestanding[2]:override(v1029.freestanding_disable_yaw_modifiers);
        l_l_angles_0_0.freestanding[3]:override(v1029.freestanding_body_freestanding);
        l_l_angles_0_0.extended_angles[1]:override(v1029.extended_angles);
        l_l_angles_0_0.extended_angles[2]:override(v1029.extended_angles_pitch);
        l_l_angles_0_0.extended_angles[3]:override(v1029.extended_angles_roll);
    end;
    setmetatable(v1018, v1020);
end;
l_angles_0 = {};
v1020 = false;
local v1030 = 0;
do
    local l_v877_1, l_v878_2, l_v924_0, l_v925_1, l_v926_1, l_v927_1, l_v928_1, l_l_match_0_2, l_v1017_0, l_v1018_0, l_l_angles_0_1, l_v1020_0, l_v1030_0 = v877, v878, v924, v925, v926, v927, v928, l_match_0, v1017, v1018, l_angles_0, v1020, v1030;
    do
        local l_l_v1020_0_0, l_l_v1030_0_0 = l_v1020_0, l_v1030_0;
        local function v1046()
            -- upvalues: l_l_v1020_0_0 (ref)
            l_l_v1020_0_0 = not l_l_v1020_0_0;
        end;
        local function v1047()
            -- upvalues: l_l_v1030_0_0 (ref)
            l_l_v1030_0_0 = l_l_v1030_0_0 + 1;
        end;
        local function v1049(v1048)
            -- upvalues: v375 (ref), l_v1018_0 (ref)
            if not v1048.force_target_yaw:get() then
                return;
            elseif v375.defensive_ticks == 0 then
                return;
            else
                l_v1018_0.yaw_left = -9;
                l_v1018_0.yaw_right = 6;
                l_v1018_0.yaw_modifier = "Disabled";
                l_v1018_0.modifier_offset = 0;
                l_v1018_0.body_yaw = true;
                l_v1018_0.inverter = false;
                l_v1018_0.left_limit = 60;
                l_v1018_0.right_limit = 60;
                l_v1018_0.options = {};
                return;
            end;
        end;
        local function v1059(v1050, v1051)
            local v1052 = nil;
            if v1051.delay:get() then
                local v1053 = v1051.delay_mode:get();
                if v1053 == "Default" then
                    local v1054 = v1051.delay_value:get();
                    local v1055 = v1051.delay_random:get();
                    if v1055 > 0 then
                        v1054 = utils.random_int(v1054, v1055);
                    end;
                    v1052 = v1054;
                end;
                if v1053 == "Custom" then
                    local v1056 = v1051.delay_count:get();
                    local v1057 = math.random(1, v1056);
                    if v1051.delay_values[v1057] ~= nil then
                        v1052 = v1051.delay_values[v1057]:get();
                    end;
                end;
            end;
            local v1058 = v1051.delay_affect_modifier:get();
            v1050.delay = v1052;
            v1050.delay_affects_modifier = v1058;
        end;
        local function v1067(v1060, v1061)
            -- upvalues: l_l_v1020_0_0 (ref), v17 (ref)
            local v1062 = v1061.pitch:get();
            local v1063 = v1061.pitch_speed:get();
            local v1064 = v1061.pitch_offset_1:get();
            local v1065 = v1061.pitch_offset_2:get();
            if v1062 == "Off" then
                return;
            elseif v1062 == "Static" then
                v1060.pitch_offset = v1064;
                return;
            elseif v1062 == "Jitter" then
                v1060.pitch_offset = l_l_v1020_0_0 and v1065 or v1064;
                return;
            elseif v1062 == "Spin" then
                local v1066 = globals.curtime * v1063 * 0.1;
                v1060.pitch_offset = v17.lerp(v1064, v1065, v1066 % 1);
                return;
            elseif v1062 == "Random" then
                v1060.pitch_offset = utils.random_int(v1064, v1065);
                return;
            elseif v1062 == "Angelic" then
                v1060.pitch_offset = math.map(math.abs(globals.realtime % 0.3 - 0.15), 0, 0.15, -89, 89);
                return;
            else
                return;
            end;
        end;
        local function v1073(v1068, v1069)
            -- upvalues: l_l_v1030_0_0 (ref), v1059 (ref)
            local v1070 = v1069.yaw_modifier:get();
            if v1070 == "Off" then
                return;
            else
                local v1071 = v1069.modifier_offset:get();
                if v1070 == "Offset" then
                    v1068.yaw_offset = 0;
                    v1068.yaw_modifier = "Offset";
                    v1068.modifier_offset = v1071;
                end;
                if v1070 == "Center" then
                    if v1069.delay_affect_modifier:get() then
                        v1068.yaw_left = v1068.yaw_left - v1071 * 0.5;
                        v1068.yaw_right = v1068.yaw_right + v1071 * 0.5;
                    else
                        local v1072 = bit.band(l_l_v1030_0_0, 1) ~= 0;
                        v1068.yaw_offset = v1068.yaw_offset + (v1072 and v1071 or -v1071) * 0.5;
                    end;
                end;
                if v1070 == "Skitter" then
                    v1068.yaw_offset = 0;
                    v1068.yaw_modifier = "Skitter";
                    v1068.modifier_offset = v1071;
                end;
                v1059(v1068, v1069);
                return;
            end;
        end;
        local function v1082(v1074, v1075)
            -- upvalues: v17 (ref), v1073 (ref)
            local v1076 = v1075.yaw:get();
            if v1076 == "Off" then
                return;
            else
                local v1077 = v1075.yaw_speed:get();
                local v1078 = v1075.yaw_offset:get();
                v1074.yaw_left = 0;
                v1074.yaw_right = 0;
                v1074.yaw_offset = 0;
                v1074.delay = 1;
                if v1076 == "Static" then
                    v1074.yaw_offset = v1078;
                end;
                if v1076 == "Spin" then
                    local v1079 = globals.curtime * v1077 * 0.1;
                    local v1080 = v1078 * 0.5;
                    v1074.yaw_offset = -(180 + v17.lerp(-v1080, v1080, v1079 % 1));
                end;
                if v1076 == "Random" then
                    local v1081 = math.abs(v1078 * 0.5);
                    v1074.yaw_offset = 180 + utils.random_int(-v1081, v1081);
                end;
                if v1076 == "Left/Right" then
                    v1074.yaw_offset = 0;
                    v1074.yaw_left = v1074.yaw_left + v1075.yaw_left:get();
                    v1074.yaw_right = v1074.yaw_right + v1075.yaw_right:get();
                end;
                if v1076 == "Side-Based" then
                    v1074.yaw_offset = 0;
                    v1074.yaw_left = v1074.yaw_left - 90 + utils.random_int(-v1078, v1078);
                    v1074.yaw_right = v1074.yaw_right + 90 + utils.random_int(-v1078, v1078);
                end;
                v1073(v1074, v1075);
                return;
            end;
        end;
        local function v1086(v1083, v1084)
            local v1085 = nil;
            if v1084.tickbase:get() == "Ticks" then
                v1085 = v1084.tickbase_ticks:get();
            end;
            if v1084.tickbase:get() == "Random" then
                v1085 = utils.random_int(v1084.tickbase_min:get(), v1084.tickbase_max:get());
            end;
            if v1085 ~= nil then
                v1083.force_defensive = v1083.command_number % v1085 == 0;
            end;
        end;
        local function _(v1087, v1088)
            local v1089 = 1;
            if v1088.delay:get() then
                local v1090 = v1088.delays[1]:get();
                local v1091 = v1088.delays[2]:get();
                v1089 = math.max(1, utils.random_int(v1090, v1091));
            end;
            v1087.delay = v1089;
        end;
        l_l_angles_0_1.update = function(_, v1094)
            -- upvalues: l_v1018_0 (ref), v32 (ref), v1046 (ref), v1047 (ref)
            l_v1018_0.hidden = false;
            v32.ragebot.main.hide_shots[2]:override();
            v32.ragebot.main.double_tap[2]:override();
            if v1094.choked_commands == 0 then
                v1046();
                v1047();
            end;
        end;
        l_l_angles_0_1.apply = function(_, v1096, v1097)
            -- upvalues: l_v1018_0 (ref), v32 (ref), v1086 (ref), v1049 (ref), v1067 (ref), v1082 (ref)
            if v1097.force_break_lc ~= nil and v1097.force_break_lc:get() then
                l_v1018_0.hidden = true;
                v32.ragebot.main.hide_shots[2]:override("Break LC");
                v32.ragebot.main.double_tap[2]:override("Always On");
                v1086(v1096, v1097);
            end;
            if v1097.enabled:get() then
                local v1098 = {};
                v1049(v1097);
                v1067(v1098, v1097);
                v1082(v1098, v1097);
                l_v1018_0.defensive = v1098;
                return true;
            else
                return false;
            end;
        end;
    end;
    l_v1020_0 = {};
    l_v1030_0 = v364.antiaim.settings.invert_flick;
    local v1099 = 0;
    local function v1103()
        if rage.exploit:get() ~= 1 then
            return false;
        else
            local v1100 = entity.get_local_player();
            if v1100 == nil then
                return false;
            else
                local v1101 = v1100:get_player_weapon();
                if v1101 == nil then
                    return false;
                else
                    local v1102 = v1101:get_weapon_info();
                    if v1102 == nil or v1102.is_revolver then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
        end;
    end;
    do
        local l_l_v1030_0_1, l_v1099_0, l_v1103_0 = l_v1030_0, v1099, v1103;
        l_v1020_0.update = function(_, v1108, v1109)
            -- upvalues: l_v1103_0 (ref), l_v1099_0 (ref), v375 (ref), l_v1018_0 (ref), l_l_v1030_0_1 (ref)
            if not v1109.flick_enabled:get() then
                return false;
            elseif not l_v1103_0() then
                return false;
            else
                if v1108.choked_commands == 0 then
                    l_v1099_0 = l_v1099_0 + 1;
                end;
                v1108.force_defensive = v1108.command_number % 7 == 0;
                if v375.defensive_ticks > 0 then
                    local v1110 = v1109.flick_speed:get();
                    local v1111 = v1109.flick_speed_random:get();
                    if v1111 > 0 then
                        v1110 = v1110 + utils.random_int(-v1111, v1111);
                        v1110 = math.clamp(v1110, 2, 10);
                    end;
                    if v1110 < v375.defensive_ticks - v375.max_defensive_ticks then
                        return;
                    end;
                end;
                local v1112 = v1109.flick_limit:get();
                l_v1018_0.yaw = "Backward";
                l_v1018_0.yaw_offset = 0;
                l_v1018_0.yaw_left = 0;
                l_v1018_0.yaw_right = 0;
                l_v1018_0.hidden = true;
                l_v1018_0.yaw_modifier = "Disabled";
                l_v1018_0.modifier_offset = 0;
                l_v1018_0.body_yaw = true;
                l_v1018_0.inverter = false;
                l_v1018_0.left_limit = v1112;
                l_v1018_0.right_limit = v1112;
                l_v1018_0.options = {};
                local v1113 = {};
                local v1114 = v1109.flick_pitch:get();
                local v1115 = v1109.flick_yaw:get();
                local v1116 = v1109.flick_yaw_random:get();
                v1115 = v1115 + utils.random_int(-v1116 * 0.6, v1116 * 0.6);
                v1113.pitch_offset = v1114;
                v1113.yaw_offset = v1115;
                v1114 = l_l_v1030_0_1.enabled:get();
                if v1109.flick_mode:get() == "Silent" and bit.band(l_v1099_0, 1) ~= 0 then
                    v1114 = not v1114;
                end;
                if v1114 then
                    v1113.yaw_offset = -v1113.yaw_offset;
                end;
                l_v1018_0.defensive = v1113;
                return true;
            end;
        end;
    end;
    l_v1030_0 = {};
    v1099 = v364.antiaim.recorder;
    v1103 = v364.antiaim.builder;
    local v1117 = "dWP7FQ3AEliGeqr98jbUM64XmCfc05gw1JDHhaYBKk2tRxVypInNouvsLZzOST+/=";
    local v1118 = {};
    local v1119 = 0;
    local function v1123(v1120)
        local l_status_8, l_result_8 = pcall(json.parse, v1120);
        if not l_status_8 then
            return false, "Can't parse data";
        else
            return true, l_result_8;
        end;
    end;
    do
        local l_v1099_1, l_v1103_1, l_v1117_0, l_v1118_0, l_v1119_0, l_v1123_0 = v1099, v1103, v1117, v1118, v1119, v1123;
        local function v1133(v1130)
            -- upvalues: l_base64_0 (ref), l_v1117_0 (ref)
            local l_status_9, l_result_9 = pcall(l_base64_0.decode, v1130, l_v1117_0);
            if not l_status_9 then
                return false, "Can't decode data";
            else
                return true, l_result_9;
            end;
        end;
        local function v1135(v1134)
            if type(v1134) == "table" then
                v1134 = "[ " .. table.concat(v1134, ", ") .. " ]";
            end;
            return v1134;
        end;
        local function _(v1136, v1137)
            table.insert(v1136, {
                measure = vector(0, v1137)
            });
            return v1137;
        end;
        local function v1143(v1139, v1140)
            -- upvalues: l_play_0 (ref)
            local v1141 = l_play_0.measure_text(1, "", v1140);
            local v1142 = {
                text = v1140, 
                measure = v1141
            };
            table.insert(v1139, v1142);
            return v1142;
        end;
        local function _(v1144, v1145, v1146)
            -- upvalues: v1135 (ref), v1143 (ref)
            local v1147 = string.format("%s: \a{Link Active}%s\aDEFAULT", v1145, v1135(v1146));
            return v1143(v1144, v1147);
        end;
        local function v1152(v1149, v1150, v1151)
            -- upvalues: l_get_0 (ref)
            if v1149 == v1150 and v1149 == v1151 then
                return ui.get_icon("arrow-right") .. l_get_0:rep(3);
            elseif v1149 == v1150 then
                return ui.get_icon("arrow-down") .. l_get_0:rep(4);
            elseif v1149 == v1151 then
                return ui.get_icon("arrow-up") .. l_get_0:rep(4);
            elseif v1150 < v1149 and v1149 < v1151 then
                return l_get_0:rep(2) .. ui.get_icon("pipe") .. l_get_0:rep(6);
            else
                return l_get_0:rep(9);
            end;
        end;
        local function v1160(v1153)
            -- upvalues: v13 (ref), v1152 (ref)
            if v1153 == nil then
                return {};
            else
                local l_data_0 = v1153.data;
                local l_sequence_start_0 = v1153.sequence_start;
                local l_sequence_end_0 = v1153.sequence_end;
                if l_data_0 == nil then
                    return {};
                else
                    local v1157 = {};
                    for v1158 = 1, #l_data_0 do
                        local v1159 = l_data_0[v1158];
                        v1157[v1158] = v13(v1152(v1158, l_sequence_start_0, l_sequence_end_0), "\a{Link Active}", v1158, "\aDEFAULT", ":", " ", "Yaw: ", "\a{Link Active}", v1159[4], "\aDEFAULT", " ", "Modifier: ", "\a{Link Active}", v1159[8], "\aDEFAULT");
                    end;
                    return v1157;
                end;
            end;
        end;
        local function v1161()
            -- upvalues: l_v1103_1 (ref)
            return l_v1103_1.state:get();
        end;
        local function v1163(v1162)
            -- upvalues: l_v1103_1 (ref)
            return l_v1103_1[v1162];
        end;
        local function v1168(v1164, v1165)
            local l_status_10, l_result_10 = pcall(json.stringify, v1165);
            if not l_status_10 then
                return false;
            else
                v1164 = v1164.recorder;
                if v1164 == nil then
                    return false;
                else
                    v1164.record:set(l_result_10);
                    return true;
                end;
            end;
        end;
        local function v1172(v1169, v1170, v1171)
            v1169.pitch = v1170[1];
            v1169.yaw = v1170[2];
            v1169.yaw_base = v1170[3];
            v1169.yaw_offset = v1170[4];
            v1169.hidden = v1170[6];
            v1169.yaw_modifier = v1170[7];
            v1169.modifier_offset = v1170[8];
            v1169.body_yaw = v1170[9];
            v1169.inverter = v1170[10];
            v1169.left_limit = v1170[11];
            v1169.right_limit = v1170[12];
            v1169.options = v1170[13];
            v1169.freestanding_body_yaw = v1170[14];
            v1169.delay = nil;
            if v1171 then
                v1169.inverter = not v1169.inverter;
            end;
        end;
        local function v1174()
            -- upvalues: v1160 (ref), v130 (ref), l_v1099_1 (ref)
            local v1173 = v1160(v130.recorder);
            l_v1099_1.sequence_list:update(v1173);
        end;
        local function v1176(v1175)
            -- upvalues: l_v1099_1 (ref)
            l_v1099_1.sequence_list:visibility(v1175);
            l_v1099_1.set_start_button:visibility(v1175);
            l_v1099_1.set_end_button:visibility(v1175);
            l_v1099_1.save_button:visibility(v1175);
            l_v1099_1.import_button:visibility(not v1175);
        end;
        local function v1183()
            -- upvalues: v131 (ref), v1163 (ref), l_v1118_0 (ref)
            for v1177 = 0, #v131.states do
                local v1178 = v131.states[v1177];
                local v1179 = v1163(v1178);
                if v1179 ~= nil then
                    v1179 = v1179.recorder;
                    if v1179 ~= nil then
                        local v1180 = v1179.record:get();
                        local l_status_11, l_result_11 = pcall(json.parse, v1180);
                        if l_status_11 then
                            l_v1118_0[v1178] = l_result_11;
                        end;
                    end;
                end;
            end;
        end;
        l_v1030_0.update = function(_, v1185)
            -- upvalues: v1163 (ref), v130 (ref), l_v1099_1 (ref), v1172 (ref), l_v1018_0 (ref), l_v1118_0 (ref), l_v1119_0 (ref)
            local v1186 = v1163(v1185);
            if v1186 == nil then
                return;
            else
                v1186 = v1186.recorder;
                if v1186 == nil then
                    return;
                else
                    local l_data_1 = v130.recorder.data;
                    local l_capture_0 = v130.recorder.capture;
                    if l_data_1 ~= nil and l_capture_0 ~= nil then
                        local v1189 = l_v1099_1.sequence_list:get();
                        if v1189 == nil then
                            return false;
                        else
                            local v1190 = l_data_1[v1189];
                            if v1190 == nil then
                                return false;
                            else
                                local v1191 = v1186.inverse_inverter:get();
                                v1172(l_v1018_0, v1190, v1191);
                                return true;
                            end;
                        end;
                    else
                        local v1192 = l_v1118_0[v1185];
                        if v1192 == nil then
                            return false;
                        else
                            local v1193 = #v1192;
                            if globals.choked_commands == 0 then
                                if v1193 <= l_v1119_0 then
                                    l_v1119_0 = 0;
                                end;
                                l_v1119_0 = l_v1119_0 + 1;
                            end;
                            local v1194 = v1192[l_v1119_0];
                            if v1194 == nil then
                                return false;
                            else
                                local v1195 = v1186.inverse_inverter:get();
                                v1172(l_v1018_0, v1194, v1195);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local function v1196()
            -- upvalues: v1183 (ref)
            v1183();
        end;
        local _ = nil;
        local function v1199()
            -- upvalues: v130 (ref), l_v1099_1 (ref), v1174 (ref)
            if v130.recorder.capture == nil then
                return;
            else
                local v1198 = l_v1099_1.sequence_list:get();
                if v130.recorder.sequence_end < v1198 then
                    v130.recorder.sequence_end = #v130.recorder.data;
                end;
                v130.recorder.sequence_start = v1198;
                v1174();
                return;
            end;
        end;
        local function v1201()
            -- upvalues: v130 (ref), l_v1099_1 (ref), v1174 (ref)
            if v130.recorder.capture == nil then
                return;
            else
                local v1200 = l_v1099_1.sequence_list:get();
                if v1200 < v130.recorder.sequence_start then
                    v130.recorder.sequence_start = 1;
                end;
                v130.recorder.sequence_end = v1200;
                v1174();
                return;
            end;
        end;
        local function v1207()
            -- upvalues: v1161 (ref), v1163 (ref), v130 (ref), v1168 (ref), v1174 (ref), v1176 (ref), v1183 (ref)
            local v1202 = v1161();
            if v1202 == nil then
                return;
            else
                local v1203 = v1163(v1202);
                if v1203 == nil then
                    return;
                else
                    local l_data_2 = v130.recorder.data;
                    if l_data_2 == nil then
                        return;
                    else
                        local v1205 = {};
                        for v1206 = v130.recorder.sequence_start, v130.recorder.sequence_end do
                            table.insert(v1205, l_data_2[v1206]);
                        end;
                        v1168(v1203, v1205);
                        v130.recorder.data = nil;
                        v130.recorder.capture = nil;
                        v130.recorder.sequence_start = nil;
                        v130.recorder.sequence_end = nil;
                        v1174();
                        v1176(false);
                        v1183();
                        return;
                    end;
                end;
            end;
        end;
        local function v1214()
            -- upvalues: v1161 (ref), v1163 (ref), l_clipboard_0 (ref), v1133 (ref), l_v1123_0 (ref), v130 (ref), v1176 (ref), v1174 (ref)
            local v1208 = v1161();
            if v1208 == nil then
                return;
            elseif v1163(v1208) == nil then
                return;
            else
                local v1209 = l_clipboard_0.get();
                if v1209 == nil then
                    return nil;
                else
                    local v1210, v1211 = v1133(v1209);
                    if not v1210 or v1211 == nil then
                        return;
                    else
                        local v1212, v1213 = l_v1123_0(v1211);
                        v1211 = v1213;
                        if not v1212 or v1211 == nil then
                            return;
                        else
                            v1212 = #v1211;
                            v130.recorder.data = v1211;
                            v130.recorder.capture = v1208;
                            v130.recorder.sequence_start = 1;
                            v130.recorder.sequence_end = v1212;
                            v1176(true);
                            v1174();
                            return;
                        end;
                    end;
                end;
            end;
        end;
        l_v1099_1.set_start_button:set_callback(v1199);
        l_v1099_1.set_end_button:set_callback(v1201);
        l_v1099_1.save_button:set_callback(v1207);
        l_v1099_1.import_button:set_callback(v1214);
        events.update_records(v1196);
        v1176(false);
        v1183();
    end;
    v1099 = {};
    v1103 = v364.antiaim.builder;
    v1117 = nil;
    v1118 = function(v1215)
        local v1216 = {};
        if v1215.x > 0 then
            table.insert(v1216, "Forward");
        end;
        if v1215.x < 0 then
            table.insert(v1216, "Backward");
        end;
        if v1215.y > 0 then
            table.insert(v1216, "Right");
        end;
        if v1215.y < 0 then
            table.insert(v1216, "Left");
        end;
        return table.concat(v1216, "-");
    end;
    do
        local l_v1103_2, l_v1117_1, l_v1118_1, l_v1119_1, l_v1123_1 = v1103, v1117, v1118, v1119, v1123;
        l_v1119_1 = function(v1222)
            -- upvalues: l_v1118_1 (ref), v374 (ref), l_v1018_0 (ref)
            local l_angles_1 = v1222.angles;
            local v1224 = l_angles_1.yaw_offset:get();
            local v1225 = nil;
            local v1226 = nil;
            local v1227 = l_angles_1.random:get();
            local v1228 = l_angles_1.add_yaw:get();
            if v1228 then
                v1225 = l_angles_1.yaw_left:get();
                v1226 = l_angles_1.yaw_right:get();
            end;
            if l_angles_1.direction ~= nil then
                local v1229 = l_angles_1[l_v1118_1(vector(v374.forwardmove, v374.sidemove))];
                if v1229 ~= nil and v1229.enabled:get() then
                    v1224 = v1229.yaw_offset:get();
                    if v1228 then
                        v1225 = v1229.yaw_left:get();
                        v1226 = v1229.yaw_right:get();
                    end;
                end;
            end;
            if v1227 > 0 and v1225 ~= nil and v1226 ~= nil then
                local v1230 = v1227 * 0.01;
                local v1231 = utils.random_float(-v1230 * 0.6, v1230 * 0.6);
                v1225 = v1225 + v1225 * v1231;
                v1226 = v1226 + v1226 * v1231;
            end;
            l_v1018_0.yaw = "Backward";
            l_v1018_0.yaw_offset = v1224;
            l_v1018_0.yaw_left = v1225;
            l_v1018_0.yaw_right = v1226;
        end;
        l_v1123_1 = function(v1232)
            -- upvalues: l_v1018_0 (ref)
            local l_angles_2 = v1232.angles;
            local v1234 = l_angles_2.yaw_jitter:get();
            local v1235 = l_angles_2.jitter_offset:get();
            if v1234 == "Off" then
                l_v1018_0.yaw_modifier = "Disabled";
                l_v1018_0.modifier_offset = nil;
                return;
            else
                local v1236 = l_angles_2.random:get();
                if v1236 > 0 then
                    local v1237 = v1236 * 0.01;
                    v1235 = v1235 + v1235 * utils.random_float(-v1237 * 0.6, v1237 * 0.6);
                end;
                l_v1018_0.yaw_modifier = v1234;
                l_v1018_0.modifier_offset = v1235;
                if l_angles_2.way_values ~= nil then
                    l_v1018_0.way = {};
                    for v1238 = 1, l_angles_2.way_count:get() do
                        l_v1018_0.way[v1238] = l_angles_2.way_values[v1238]:get();
                    end;
                end;
                return;
            end;
        end;
        local function v1251(v1239)
            -- upvalues: l_v1018_0 (ref)
            local l_angles_3 = v1239.angles;
            local v1241 = l_angles_3.body_yaw:get();
            local v1242 = l_angles_3.left_limit:get();
            local v1243 = l_angles_3.right_limit:get();
            local v1244 = v1241 ~= "Off";
            if v1244 then
                l_v1018_0.options = {};
                l_v1018_0.left_limit = v1242;
                l_v1018_0.right_limit = v1243;
                if v1241 == "Left" then
                    l_v1018_0.inverter = true;
                    l_v1018_0.right_limit = v1242;
                end;
                if v1241 == "Right" then
                    l_v1018_0.inverter = false;
                    l_v1018_0.left_limit = v1243;
                end;
                if v1241 == "Jitter" then
                    table.insert(l_v1018_0.options, "Jitter");
                    l_v1018_0.invert_chance = l_angles_3.invert_chance:get();
                end;
                if v1241 == "Random" then
                    table.insert(l_v1018_0.options, "Jitter");
                    table.insert(l_v1018_0.options, "Randomize Jitter");
                end;
                if l_angles_3.avoid_overlap:get() then
                    table.insert(l_v1018_0.options, "Avoid Overlap");
                end;
                l_v1018_0.freestanding_body_yaw = l_angles_3.freestanding_body_yaw:get();
            end;
            if l_angles_3.delay:get() then
                local v1245 = l_angles_3.delay_mode:get();
                local v1246 = l_angles_3.delay_affect_modifier:get();
                if v1245 == "Default" then
                    local v1247 = l_angles_3.delay_value:get();
                    local v1248 = l_angles_3.delay_random:get();
                    if v1248 > 0 then
                        v1247 = utils.random_int(v1247, v1248);
                    end;
                    l_v1018_0.delay = v1247;
                    l_v1018_0.delay_affects_modifier = v1246;
                end;
                if v1245 == "Custom" then
                    local v1249 = l_angles_3.delay_count:get();
                    local v1250 = math.random(1, v1249);
                    if l_angles_3.delay_values[v1250] ~= nil then
                        l_v1018_0.delay = l_angles_3.delay_values[v1250]:get();
                        l_v1018_0.delay_affects_modifier = v1246;
                    end;
                end;
            end;
            l_v1018_0.body_yaw = v1244;
        end;
        v1099.get = function(_, v1253)
            -- upvalues: l_v1103_2 (ref)
            return l_v1103_2[v1253];
        end;
        v1099.is_active_ex = function(_, v1255)
            return v1255.enabled == nil or v1255.enabled:get();
        end;
        v1099.is_active = function(v1256, v1257)
            -- upvalues: v1099 (ref)
            local v1258 = v1256:get(v1257);
            if v1258 == nil then
                return false;
            else
                return v1099:is_active_ex(v1258);
            end;
        end;
        v1099.get_old_items = function(_)
            -- upvalues: l_v1117_1 (ref)
            return l_v1117_1;
        end;
        v1099.apply_ex = function(_, v1261)
            -- upvalues: l_v1018_0 (ref), l_v1119_1 (ref), l_v1123_1 (ref), v1251 (ref), l_v1117_1 (ref)
            if v1261 == nil then
                return false;
            else
                if v1261.angles ~= nil then
                    l_v1018_0.enabled = true;
                    l_v1018_0.pitch = "Down";
                    l_v1018_0.yaw_base = "At Target";
                    l_v1119_1(v1261);
                    l_v1123_1(v1261);
                    v1251(v1261);
                end;
                l_v1117_1 = v1261;
                return true;
            end;
        end;
        v1099.apply = function(v1262, v1263)
            -- upvalues: l_v1030_0 (ref)
            local v1264 = v1262:get(v1263);
            if v1264 == nil then
                return nil;
            elseif not v1262:is_active_ex(v1264) then
                return nil;
            else
                local v1265 = v1264.mode:get();
                if v1265 == "Builder" then
                    v1262:apply_ex(v1264);
                end;
                if v1265 == "Recorder" then
                    l_v1030_0:update(v1263);
                end;
                return v1264;
            end;
        end;
        v1099.update = function(v1266, _)
            -- upvalues: v378 (ref)
            if rage.exploit:get() ~= 1 then
                local v1268 = v1266:apply("Fakelag");
                if v1268 ~= nil then
                    return v1268;
                end;
            end;
            local v1269 = v1266:apply((v378.get()));
            if v1269 ~= nil then
                return v1269;
            else
                return v1266:apply("Shared");
            end;
        end;
        v876.builder = v1099;
    end;
    v1103 = {};
    v1117 = v364.antiaim.settings.disablers;
    v1118 = function()
        local v1270 = entity.get_game_rules();
        if v1270 == nil then
            return false;
        else
            return v1270.m_bWarmupPeriod;
        end;
    end;
    v1119 = function()
        local v1271 = entity.get_local_player();
        if v1271 == nil then
            return false;
        else
            local l_m_iTeamNum_0 = v1271.m_iTeamNum;
            local v1273 = entity.get_player_resource();
            for v1274 = 1, globals.max_players do
                if v1273.m_bConnected[v1274] then
                    local v1275 = v1273.m_iTeam[v1274];
                    if v1271 ~= v1274 and v1275 ~= l_m_iTeamNum_0 and v1273.m_bAlive[v1274] then
                        return false;
                    end;
                end;
            end;
            return true;
        end;
    end;
    do
        local l_v1117_2, l_v1118_2, l_v1119_2, l_v1123_2 = v1117, v1118, v1119, v1123;
        l_v1123_2 = function()
            -- upvalues: l_v1117_2 (ref), l_v1118_2 (ref), l_v1119_2 (ref)
            if l_v1117_2.select:get("On Warmup") and l_v1118_2() then
                return true;
            elseif l_v1117_2.select:get("Enemies Dead") and l_v1119_2() then
                return true;
            else
                return false;
            end;
        end;
        v1103.update = function(_, _)
            -- upvalues: l_v1123_2 (ref), v1099 (ref), l_v1018_0 (ref)
            if not l_v1123_2() then
                return false;
            else
                if v1099:apply("Warmup AA") == nil then
                    local v1282 = globals.curtime * 5;
                    l_v1018_0.pitch = "Disabled";
                    l_v1018_0.yaw = "Backward";
                    l_v1018_0.yaw_offset = 360 * (v1282 % 1);
                    l_v1018_0.yaw_modifier = "Disabled";
                    l_v1018_0.modifier_offset = 0;
                    l_v1018_0.body_yaw = false;
                end;
                return true;
            end;
        end;
    end;
    v1117 = {};
    v1118 = v364.antiaim.settings.auto_hide_shots;
    v1119 = 1;
    v1123 = 5;
    local function v1283()
        -- upvalues: v374 (ref), v32 (ref)
        if not v374.is_onground then
            if v374.is_crouched then
                return "Air & Crouching";
            else
                return "Air";
            end;
        elseif v374.is_crouched then
            if v374.is_moving then
                return "Move & Crouching";
            else
                return "Crouching";
            end;
        elseif v374.is_moving then
            if v32.antiaim.misc.slow_walk:get() then
                return "Slow motion";
            else
                return "Running";
            end;
        else
            return "Standing";
        end;
    end;
    do
        local l_v1118_3, l_v1119_3, l_v1123_3, l_v1283_0 = v1118, v1119, v1123, v1283;
        local function v1292(v1288)
            -- upvalues: l_v1119_3 (ref), l_v1123_3 (ref)
            local v1289 = v1288:get_weapon_info();
            if v1289 == nil then
                return nil;
            else
                local l_weapon_type_0 = v1289.weapon_type;
                local v1291 = v1288:get_weapon_index();
                if l_weapon_type_0 == l_v1119_3 then
                    if v1291 == 1 then
                        return "Deagle";
                    elseif v1291 == 64 then
                        return "Revolver";
                    else
                        return "Pistol";
                    end;
                elseif l_weapon_type_0 == l_v1123_3 then
                    if v1291 == 40 then
                        return "Scout";
                    elseif v1291 == 9 then
                        return "Awp";
                    else
                        return "Auto";
                    end;
                else
                    return nil;
                end;
            end;
        end;
        local function v1293()
            -- upvalues: v32 (ref)
            v32.ragebot.main.double_tap[1]:override();
            v32.ragebot.main.hide_shots[1]:override();
        end;
        local function v1294()
            -- upvalues: v32 (ref)
            v32.ragebot.main.double_tap[1]:override(false);
            v32.ragebot.main.hide_shots[1]:override(true);
        end;
        local function v1299()
            -- upvalues: v32 (ref), v1292 (ref), l_v1118_3 (ref), l_v1283_0 (ref)
            if v32.antiaim.misc.fake_duck:get() then
                return false;
            elseif v32.antiaim.misc.fake_duck:get() then
                return false;
            elseif not v32.ragebot.main.double_tap[1]:get() then
                return false;
            else
                local v1295 = entity.get_local_player();
                if v1295 == nil then
                    return false;
                else
                    local v1296 = v1295:get_player_weapon();
                    if v1296 == nil then
                        return false;
                    else
                        local v1297 = v1292(v1296);
                        if v1297 == nil or not l_v1118_3.weapons:get(v1297) then
                            return false;
                        else
                            local v1298 = l_v1283_0();
                            if not l_v1118_3.states:get(v1298) then
                                return false;
                            else
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local function v1300()
            -- upvalues: v1293 (ref)
            v1293();
        end;
        v1117.update = function(_, _)
            -- upvalues: l_v1118_3 (ref), v1299 (ref), v1294 (ref)
            if not l_v1118_3.enabled:get() then
                return;
            elseif not v1299() then
                return;
            else
                v1294();
                return;
            end;
        end;
        events.shutdown(v1300);
    end;
    v1118 = {};
    v1119 = v364.antiaim.settings.antibrute;
    v1123 = nil;
    v1283 = nil;
    local v1303 = nil;
    local v1304 = nil;
    local v1305 = v394.get_event_bus();
    do
        local l_v1119_4, l_v1123_4, l_v1283_1, l_v1303_0, l_v1304_0, l_v1305_0 = v1119, v1123, v1283, v1303, v1304, v1305;
        local function v1312()
            -- upvalues: l_v1119_4 (ref)
            if l_v1119_4.refresh_offset:get() then
                return math.random(-7, 13);
            else
                return nil;
            end;
        end;
        local function v1314()
            -- upvalues: l_v1119_4 (ref)
            local v1313 = l_v1119_4.refresh_modifier:get();
            if v1313 == "increase" then
                return math.random(0, 5);
            elseif v1313 == "decrease" then
                return math.random(-5, 0);
            elseif v1313 == "adaptive" then
                return math.random(-3, 5);
            else
                return nil;
            end;
        end;
        local function v1315()
            -- upvalues: l_v1123_4 (ref), l_v1283_1 (ref), l_v1303_0 (ref), l_v1304_0 (ref)
            l_v1123_4 = nil;
            l_v1283_1 = nil;
            l_v1303_0 = nil;
            l_v1304_0 = nil;
        end;
        v1118.update = function(_, _)
            -- upvalues: l_v1119_4 (ref), l_v1123_4 (ref), v1315 (ref), l_v1283_1 (ref), l_v1018_0 (ref), l_v1303_0 (ref), l_v1304_0 (ref)
            if not l_v1119_4.enabled:get() then
                return false;
            elseif l_v1123_4 ~= nil and globals.curtime > l_v1123_4 then
                v1315();
                return false;
            else
                if l_v1283_1 ~= nil then
                    l_v1018_0.delay = l_v1283_1;
                end;
                if l_v1303_0 ~= nil and l_v1018_0.yaw_offset ~= nil then
                    l_v1018_0.yaw_offset = l_v1018_0.yaw_offset + l_v1303_0;
                end;
                if l_v1304_0 ~= nil and l_v1018_0.modifier_offset ~= nil then
                    l_v1018_0.modifier_offset = l_v1018_0.modifier_offset + l_v1304_0;
                end;
                return true;
            end;
        end;
        local function v1319()
            -- upvalues: l_v1119_4 (ref), l_v1123_4 (ref), l_v1283_1 (ref), l_v1303_0 (ref), v1312 (ref), l_v1304_0 (ref), v1314 (ref)
            local v1318 = l_v1119_4.duration:get();
            if v1318 ~= 0 then
                l_v1123_4 = globals.curtime + v1318 * 0.1;
            end;
            if l_v1119_4.enforce_delay:get() then
                l_v1283_1 = math.random(1, 5);
            end;
            l_v1303_0 = v1312();
            l_v1304_0 = v1314();
        end;
        local _ = nil;
        local function v1323(v1321)
            -- upvalues: v1315 (ref), l_v1305_0 (ref), v1319 (ref)
            local v1322 = v1321:get();
            if not v1322 then
                v1315();
            end;
            l_v1305_0.enemy_shot:set(v1319, v1322);
        end;
        do
            local l_v1323_0 = v1323;
            local function v1327(v1325)
                -- upvalues: v1315 (ref), l_v1305_0 (ref), v1319 (ref), l_v1119_4 (ref), l_v1323_0 (ref)
                local v1326 = v1325:get();
                if not v1326 then
                    v1315();
                    l_v1305_0.enemy_shot:set(v1319, false);
                end;
                if v1326 then
                    l_v1119_4.enabled:set_callback(l_v1323_0, true);
                else
                    l_v1119_4.enabled:unset_callback(l_v1323_0);
                end;
            end;
            v364.antiaim.enabled:set_callback(v1327, true);
        end;
    end;
    v1119 = {};
    v1123 = v364.antiaim.settings.roll;
    do
        local l_v1123_5, l_v1283_2 = v1123, v1283;
        l_v1283_2 = function()
            -- upvalues: l_v1123_5 (ref)
            if l_v1123_5.change_on_fakelag:get() and rage.exploit:get() ~= 1 then
                return l_v1123_5.fakelag_value:get();
            else
                return l_v1123_5.value:get();
            end;
        end;
        v1119.update = function(_, v1331)
            -- upvalues: l_v1283_2 (ref)
            local v1332 = l_v1283_2();
            if v1332 == nil or v1332 == 0 then
                return;
            else
                v1331.view_angles.z = v1332;
                return;
            end;
        end;
    end;
    v1123 = {};
    v1283 = false;
    do
        local l_v1283_3, l_v1303_1 = v1283, v1303;
        l_v1303_1 = function(v1335, v1336)
            -- upvalues: l_play_0 (ref), l_v1283_3 (ref)
            local v1337 = entity.get_local_player();
            if v1337 == nil then
                return false;
            else
                local v1338 = v1337:get_player_weapon();
                if v1338 == nil then
                    return false;
                else
                    local l_m_iTeamNum_1 = v1337.m_iTeamNum;
                    local v1340 = v1337:get_origin();
                    local v1341 = v1338:get_weapon_index() == 49;
                    if v1337.m_bIsDefusing or v1337.m_bIsGrabbingHostage then
                        return false;
                    elseif v1337.m_bInBombZone and (not v1336.bomb_e_fix:get() or v1341) then
                        return false;
                    else
                        if l_m_iTeamNum_1 == 3 and v1335.view_angles.x > 15 then
                            local v1342 = entity.get_entities("CPlantedC4");
                            for v1343 = 1, #v1342 do
                                if (v1342[v1343]:get_origin() - v1340):lengthsqr() < 3844 then
                                    return false;
                                end;
                            end;
                        end;
                        local v1344 = l_play_0.camera_angles();
                        local v1345 = vector():angles(v1344);
                        local v1346 = v1337:get_eye_position();
                        local v1347 = v1346 + v1345 * 128;
                        local v1348 = utils.trace_line(v1346, v1347, v1337, 4294967295, 0);
                        if v1348.fraction ~= 1 then
                            local l_entity_0 = v1348.entity;
                            if l_entity_0 == nil then
                                return true;
                            else
                                local v1350 = l_entity_0:get_classname();
                                if v1350 == "CWorld" then
                                    return true;
                                elseif v1350 == "CFuncBrush" then
                                    return true;
                                elseif v1350 == "CCSPlayer" then
                                    return true;
                                elseif v1350 == "CHostage" and v1346:distsqr((l_entity_0:get_origin())) < 7056 then
                                    return false;
                                elseif not l_v1283_3 then
                                    l_v1283_3 = true;
                                    return false;
                                end;
                            end;
                        end;
                        return true;
                    end;
                end;
            end;
        end;
        v1123.update = function(_, v1352)
            -- upvalues: l_v1283_3 (ref), v1099 (ref), l_v1303_1 (ref), l_l_angles_0_1 (ref), l_v1020_0 (ref), l_v1018_0 (ref)
            if not v1352.in_use then
                l_v1283_3 = false;
                return false;
            else
                local v1353 = v1099:get("On use");
                if v1353 == nil then
                    return false;
                elseif not v1099:is_active_ex(v1353) then
                    return false;
                elseif not l_v1303_1(v1352, v1353) then
                    return false;
                else
                    v1352.in_use = false;
                    v1099:apply_ex(v1353);
                    if v1353 ~= nil and v1353.defensive ~= nil then
                        l_l_angles_0_1:apply(v1352, v1353.defensive);
                        l_v1020_0:update(v1352, v1353.defensive);
                    end;
                    if l_v1018_0.yaw_offset ~= nil then
                        l_v1018_0.yaw_offset = l_v1018_0.yaw_offset + 180;
                    end;
                    l_v1018_0.pitch = "Disabled";
                    l_v1018_0.yaw_base = "Local View";
                    l_v1018_0.freestanding = false;
                    return true;
                end;
            end;
        end;
    end;
    v1283 = {};
    v1303 = v364.antiaim.settings.manual_yaw;
    v1304 = {
        Left = -90, 
        Forward = 180, 
        Backward = 0, 
        Right = 90
    };
    do
        local l_v1303_2, l_v1304_1, l_v1305_1 = v1303, v1304, v1305;
        l_v1305_1 = function()
            -- upvalues: l_v1304_1 (ref), l_v1303_2 (ref)
            return l_v1304_1[l_v1303_2.select:get()];
        end;
        v1283.update = function(_, v1358)
            -- upvalues: l_v1305_1 (ref), l_v1018_0 (ref), l_v1303_2 (ref), v1099 (ref), l_v1020_0 (ref), l_l_angles_0_1 (ref)
            local v1359 = l_v1305_1();
            if v1359 == nil then
                return false;
            else
                local v1360 = l_v1018_0.yaw_offset or 0;
                l_v1018_0.enabled = true;
                l_v1018_0.yaw_offset = v1360 + v1359;
                l_v1018_0.freestanding = false;
                if l_v1303_2.disable_yaw_modifiers:get() then
                    l_v1018_0.yaw_offset = v1360 + v1359;
                    l_v1018_0.yaw_left = 0;
                    l_v1018_0.yaw_right = 0;
                    l_v1018_0.yaw_modifier = "Disabled";
                    l_v1018_0.modifier_offset = 0;
                end;
                if l_v1303_2.body_freestanding:get() then
                    l_v1018_0.body_yaw = true;
                    l_v1018_0.left_limit = 60;
                    l_v1018_0.right_limit = 60;
                    l_v1018_0.options = {};
                    l_v1018_0.freestanding_body_yaw = "Peek Fake";
                end;
                local v1361 = v1099:apply("Manual Yaw");
                if v1361 ~= nil then
                    l_v1018_0.yaw_offset = l_v1018_0.yaw_offset + v1359;
                    if v1361.defensive ~= nil and (l_v1020_0:update(v1358, v1361.defensive) or l_l_angles_0_1:apply(v1358, v1361.defensive)) then
                        local l_yaw_offset_0 = l_v1018_0.defensive.yaw_offset;
                        if l_yaw_offset_0 ~= nil then
                            l_v1018_0.defensive.yaw_offset = l_yaw_offset_0 + v1359;
                        end;
                    end;
                end;
                l_v1018_0.yaw_base = "Local View";
                return true;
            end;
        end;
    end;
    v1303 = {};
    v1304 = v364.antiaim.settings.freestanding;
    v1305 = function()
        -- upvalues: v374 (ref), v32 (ref)
        if not v374.is_onground then
            return "Air";
        elseif v374.is_crouched then
            return "Crouching";
        elseif v374.is_moving then
            if v32.antiaim.misc.slow_walk:get() then
                return "Slow motion";
            else
                return "Running";
            end;
        else
            return "Standing";
        end;
    end;
    do
        local l_v1304_2, l_v1305_2 = v1304, v1305;
        local function v1365()
            -- upvalues: l_v1304_2 (ref), l_v1305_2 (ref)
            return l_v1304_2.disablers:get(l_v1305_2());
        end;
        local function v1366()
            -- upvalues: l_v1304_2 (ref), v1365 (ref)
            return l_v1304_2.enabled:get() and not v1365();
        end;
        local function v1369()
            local v1367 = rage.antiaim:get_target(false);
            local v1368 = rage.antiaim:get_target(true);
            if v1367 == nil or v1368 == nil then
                return nil;
            else
                return v1368 - v1367;
            end;
        end;
        local function v1374(v1370)
            -- upvalues: v1369 (ref), v1099 (ref), l_v1018_0 (ref), l_v1304_2 (ref), l_v1020_0 (ref), l_l_angles_0_1 (ref)
            local v1371 = v1369();
            if v1371 == nil then
                return;
            else
                local v1372 = v1099:apply("Freestanding");
                if v1372 == nil then
                    l_v1018_0.freestanding = true;
                    l_v1018_0.freestanding_disable_yaw_modifiers = l_v1304_2.disable_yaw_modifiers:get();
                    l_v1018_0.freestanding_body_freestanding = l_v1304_2.body_freestanding:get();
                    return;
                else
                    l_v1018_0.yaw_offset = l_v1018_0.yaw_offset + v1371;
                    if v1372.defensive ~= nil and (l_v1020_0:update(v1370, v1372.defensive) or l_l_angles_0_1:apply(v1370, v1372.defensive)) then
                        local l_yaw_offset_1 = l_v1018_0.defensive.yaw_offset;
                        if l_yaw_offset_1 ~= nil then
                            l_v1018_0.defensive.yaw_offset = l_yaw_offset_1 + v1371;
                        end;
                    end;
                    l_v1018_0.freestanding = false;
                    return;
                end;
            end;
        end;
        v1303.update = function(_, v1376)
            -- upvalues: v1366 (ref), l_v1018_0 (ref), v1374 (ref)
            if not v1366() then
                l_v1018_0.freestanding = false;
                return false;
            else
                v1374(v1376);
                return true;
            end;
        end;
    end;
    v1304 = {};
    v1305 = v364.antiaim.settings.edge_yaw;
    local function v1391(v1377)
        local v1378 = entity.get_local_player();
        if v1378 == nil then
            return nil;
        else
            local v1379 = v1378:get_eye_position();
            if v1379 == nil then
                return nil;
            else
                local v1380 = 1;
                local v1381 = nil;
                local v1382 = {};
                for v1383 = -180, 179, 45 do
                    local v1384 = v1379 + vector():angles(vector(0, v1383, 0)) * 24;
                    local v1385 = utils.trace_line(v1379, v1384, v1378);
                    if v1385.fraction < v1380 and (v1385.entity == nil or not v1385.entity:is_player()) then
                        local l_fraction_0 = v1385.fraction;
                        v1381 = v1383;
                        v1380 = l_fraction_0;
                    end;
                end;
                if v1381 == nil then
                    return nil;
                else
                    for v1387 = v1381 - 30, v1381 + 30, 10 do
                        local v1388 = v1379 + vector():angles(vector(0, v1387, 0)) * 24;
                        local v1389 = utils.trace_line(v1379, v1388, v1378, nil, 1);
                        if v1389.fraction < 1 then
                            v1382[#v1382 + 1] = v1387;
                            if v1389.fraction < v1380 then
                                local l_fraction_1 = v1389.fraction;
                                v1381 = v1387;
                                v1380 = l_fraction_1;
                            end;
                        end;
                    end;
                    return math.normalize_yaw(v1381 * 2 - v1377.move_yaw);
                end;
            end;
        end;
    end;
    do
        local l_v1305_3, l_v1391_0 = v1305, v1391;
        v1304.update = function(_, v1395)
            -- upvalues: l_v1305_3 (ref), l_v1391_0 (ref), l_v1018_0 (ref)
            if not l_v1305_3.enabled:get() then
                return false;
            else
                local v1396 = l_v1391_0(v1395);
                if v1396 == nil then
                    return false;
                else
                    l_v1018_0.yaw_offset = (l_v1018_0.yaw_offset or 0) + v1396;
                    return true;
                end;
            end;
        end;
    end;
    v1305 = {};
    v1391 = v364.antiaim.settings.safe_head;
    local v1397 = 0;
    local function v1400(v1398)
        local v1399 = v1398:get_weapon_info();
        if v1399 == nil then
            return false;
        else
            return v1399.weapon_type == 0 and v1398:get_weapon_index() ~= 31;
        end;
    end;
    do
        local l_v1391_1, l_v1397_0, l_v1400_0 = v1391, v1397, v1400;
        local function v1411(v1404, v1405)
            -- upvalues: v374 (ref), l_v1400_0 (ref)
            local v1406 = v1404:get_player_weapon();
            if v1406 == nil then
                return nil;
            else
                local v1407 = v1404:get_origin();
                local v1408 = v1405:get_origin() - v1407;
                local v1409 = -v1408.z;
                local v1410 = v1408:length2dsqr();
                if v374.is_onground then
                    if (not v374.is_moving or v374.is_crouched) and v1409 >= 10 and v1410 > 1000000 then
                        return "Distance";
                    else
                        if v374.is_crouched then
                            if v1409 >= 48 then
                                return "Crouch";
                            end;
                        elseif not v374.is_moving and v1409 >= 24 then
                            return "Standing";
                        end;
                        return nil;
                    end;
                elseif v374.is_crouched and l_v1400_0(v1406) then
                    return "Air Crouch Knife";
                else
                    return nil;
                end;
            end;
        end;
        local function v1416(v1412)
            -- upvalues: l_weapons_0 (ref)
            local v1413 = v1412:get_player_weapon();
            if v1413 == nil then
                return nil;
            else
                local v1414 = l_weapons_0(v1413);
                if v1414 == nil then
                    return nil;
                else
                    local v1415 = v1414.max_speed or 250;
                    if v1412.m_bIsScoped then
                        v1415 = v1414.max_speed_alt or 250;
                    end;
                    if v1412.m_flDuckAmount > 0.5 then
                        v1415 = v1415 * 0.34;
                    end;
                    return v1415;
                end;
            end;
        end;
        local function v1422(v1417, v1418)
            local v1419 = v1417:get_origin();
            local v1420 = v1418:get_eye_position();
            local v1421 = v1417.m_flDuckAmount > 0.5;
            v1419.z = v1419.z + (v1421 and 45 or 60);
            return math.ceil(v1419.z - v1420.z);
        end;
        local function v1424(v1423)
            -- upvalues: v32 (ref)
            if v32.antiaim.angles.freestanding[1]:get_override() or v32.antiaim.angles.freestanding[1]:get() then
                return true;
            elseif v1423 ~= nil and entity.is_dormant(v1423) then
                return true;
            else
                return false;
            end;
        end;
        local function v1426(v1425)
            return v1425.m_vecVelocity:length2d();
        end;
        local function v1428(v1427)
            return bit.band(v1427.m_fFlags, 1) ~= 0;
        end;
        local function v1440(v1429, v1430)
            -- upvalues: v17 (ref)
            local l_m_iHealth_0 = v1430.m_iHealth;
            if l_m_iHealth_0 == nil or l_m_iHealth_0 <= 0 then
                return false;
            else
                local v1432 = v1429:get_eye_position();
                local l_m_vecVelocity_1 = v1429.m_vecVelocity;
                local v1434 = v1430:get_hitbox_position(3);
                local v1435, v1436 = utils.trace_bullet(v1429, v1432, v1434);
                if v1436 == nil then
                    return;
                else
                    if v1436.entity ~= v1430 then
                        v1435 = 0;
                    end;
                    if v1435 ~= nil and l_m_iHealth_0 <= v1435 then
                        return true;
                    else
                        local v1437 = v17.extrapolate(v1432, l_m_vecVelocity_1, 16);
                        local v1438, v1439 = utils.trace_bullet(v1429, v1437, v1434);
                        if v1439.entity ~= v1430 then
                            v1438 = 0;
                        end;
                        if v1438 ~= nil and l_m_iHealth_0 <= v1438 then
                            return true;
                        else
                            return false;
                        end;
                    end;
                end;
            end;
        end;
        local function v1452(v1441, v1442)
            -- upvalues: v17 (ref)
            local l_m_iHealth_1 = v1442.m_iHealth;
            if l_m_iHealth_1 == nil or l_m_iHealth_1 <= 0 then
                return false;
            else
                local v1444 = v1441:get_eye_position();
                local l_m_vecVelocity_2 = v1441.m_vecVelocity;
                local v1446 = v1442:get_hitbox_position(0);
                local v1447, v1448 = utils.trace_bullet(v1441, v1444, v1446);
                if v1448 == nil then
                    return;
                else
                    if v1448.entity ~= v1442 then
                        v1447 = 0;
                    end;
                    if v1447 ~= nil and l_m_iHealth_1 <= v1447 then
                        return true;
                    else
                        local v1449 = v17.extrapolate(v1444, l_m_vecVelocity_2, 32);
                        local v1450, v1451 = utils.trace_bullet(v1441, v1449, v1446);
                        if v1451.entity ~= v1442 then
                            v1450 = 0;
                        end;
                        if v1450 ~= nil and l_m_iHealth_1 <= v1450 then
                            return true;
                        else
                            return false;
                        end;
                    end;
                end;
            end;
        end;
        local function v1465(v1453, v1454)
            -- upvalues: l_v1400_0 (ref), v374 (ref), v1422 (ref), v1426 (ref), v1428 (ref), v1440 (ref), v1452 (ref), l_v1397_0 (ref)
            local v1455 = v1453.m_iTeamNum == 3;
            local v1456 = v1453:get_player_weapon();
            local v1457 = l_v1400_0(v1456);
            local v1458 = v374.is_onground and not v374.is_moving and not v374.is_crouched;
            local v1459 = v1422(v1453, v1454);
            if v1457 and not v374.is_onground and v374.is_crouched then
                return (v1455 and -35 or -20) < v1459;
            else
                local v1460 = v1458 and (v1455 and -6 or 20) <= v1459 or v374.is_crouched and v374.is_onground and (v1455 and -20 or -4) <= v1459;
                local v1461 = v1426(v1454);
                local v1462 = not v1428(v1454) and v1461 > 75 or not v1440(v1454, v1453);
                if v1460 and v1462 then
                    local l_tickcount_1 = globals.tickcount;
                    local v1464 = v1452(v1454, v1453);
                    if v1464 == false then
                        l_v1397_0 = l_tickcount_1 + 16;
                        return true;
                    elseif v1464 == true then
                        l_v1397_0 = 0;
                        return false;
                    else
                        return l_tickcount_1 <= l_v1397_0;
                    end;
                else
                    return false;
                end;
            end;
        end;
        local function v1475(v1466, v1467)
            -- upvalues: v1416 (ref), v374 (ref)
            local v1468 = v1466.m_vecVelocity:length();
            local v1469 = v1416(v1466) or 250;
            local v1470 = v1467.in_back and v1467.forwardmove < 0;
            local v1471 = v1467.in_forward and v1467.forwardmove > 0;
            local v1472 = v1467.in_moveleft and v1467.sidemove < 0;
            local v1473 = v1467.in_moveright and v1467.sidemove > 0;
            local v1474 = v1468 > 1.1001 and v1468 < v1469 - v1469 * 0.1;
            if v374.is_onground and not v374.is_moving and not v374.is_crouched then
                return 35;
            elseif not v374.is_onground then
                return 32;
            elseif v1471 then
                if v1474 then
                    return v1473 and 33 or v1472 and 20 or 20;
                else
                    return v1473 and 38 or v1472 and 14 or 26;
                end;
            elseif v1470 then
                return v1473 and 30 or v1472 and 20 or 30;
            else
                return v1473 and 38 or v1472 and 20 or 32;
            end;
        end;
        v1305.update = function(_, v1477)
            -- upvalues: l_v1391_1 (ref), v1411 (ref), v1424 (ref), l_v1397_0 (ref), v1465 (ref), l_v1018_0 (ref), v1475 (ref)
            if not l_v1391_1.enabled:get() then
                return false;
            else
                local v1478 = entity.get_local_player();
                local v1479 = entity.get_threat();
                if v1478 == nil or v1479 == nil then
                    return false;
                else
                    local v1480 = v1411(v1478, v1479);
                    if v1480 == nil or not l_v1391_1.states:get(v1480) then
                        return false;
                    elseif v1424() then
                        l_v1397_0 = 0;
                        return false;
                    elseif not v1465(v1478, v1479) then
                        return;
                    else
                        l_v1018_0.pitch = "Down";
                        l_v1018_0.yaw_base = "At Target";
                        l_v1018_0.yaw = "Backward";
                        l_v1018_0.yaw_offset = -v1475(v1478, v1477) + 45;
                        l_v1018_0.yaw_left = 0;
                        l_v1018_0.yaw_right = 0;
                        l_v1018_0.yaw_modifier = "Off";
                        l_v1018_0.modifier_offset = 0;
                        l_v1018_0.body_yaw = true;
                        l_v1018_0.left_limit = 0;
                        l_v1018_0.right_limit = 0;
                        l_v1018_0.options = {};
                        l_v1018_0.freestanding_body_yaw = "Off";
                        l_v1018_0.defensive = nil;
                        return true;
                    end;
                end;
            end;
        end;
    end;
    v1391 = function()
        -- upvalues: l_v1018_0 (ref), l_l_match_0_2 (ref), v10 (ref), l_v877_1 (ref), l_v878_2 (ref)
        if rage.exploit:get() == 1 then
            local v1481 = math.max(1, l_v1018_0.delay or 1);
            l_l_match_0_2 = l_l_match_0_2 + 1;
            if l_l_match_0_2 < v1481 then
                return;
            end;
        end;
        local v1482 = true;
        if l_v1018_0.options ~= nil and v10(l_v1018_0.options, "Randomize Jitter") ~= nil then
            v1482 = utils.random_int(0, 1) == 0;
        end;
        if l_v1018_0.invert_chance ~= nil and l_v1018_0.invert_chance < utils.random_int(0, 100) then
            v1482 = false;
        end;
        l_v877_1 = l_v877_1 + 1;
        if v1482 then
            l_v878_2 = not l_v878_2;
        end;
        l_l_match_0_2 = 0;
    end;
    v1397 = function()
        -- upvalues: l_v1018_0 (ref), l_v1017_0 (ref), l_v926_1 (ref), l_v927_1 (ref)
        local l_defensive_0 = l_v1018_0.defensive;
        local v1484 = 1;
        if l_defensive_0 ~= nil and l_defensive_0.delay ~= nil then
            v1484 = math.max(1, l_defensive_0.delay);
        end;
        l_v1017_0 = l_v1017_0 + 1;
        if l_v1017_0 < v1484 then
            return;
        else
            l_v926_1 = l_v926_1 + 1;
            l_v927_1 = not l_v927_1;
            l_v1017_0 = 0;
            return;
        end;
    end;
    v1400 = function()
        -- upvalues: l_v1018_0 (ref), l_v927_1 (ref), l_v926_1 (ref), l_v928_1 (ref)
        local l_defensive_1 = l_v1018_0.defensive;
        if l_defensive_1 == nil then
            return;
        else
            if l_defensive_1.pitch_offset ~= nil then
                rage.antiaim:override_hidden_pitch(l_defensive_1.pitch_offset);
            end;
            if l_defensive_1.yaw_offset ~= nil then
                local l_yaw_offset_2 = l_defensive_1.yaw_offset;
                if l_v1018_0.yaw_offset ~= nil then
                    l_yaw_offset_2 = l_yaw_offset_2 - l_v1018_0.yaw_offset;
                end;
                if l_defensive_1.yaw_left ~= nil and l_v927_1 == true then
                    l_yaw_offset_2 = l_yaw_offset_2 + l_defensive_1.yaw_left;
                end;
                if l_defensive_1.yaw_right ~= nil and l_v927_1 == false then
                    l_yaw_offset_2 = l_yaw_offset_2 + l_defensive_1.yaw_right;
                end;
                if l_defensive_1.yaw_modifier == "Offset" then
                    local l_modifier_offset_0 = l_defensive_1.modifier_offset;
                    if not l_v927_1 then
                        l_modifier_offset_0 = 0;
                    end;
                    l_yaw_offset_2 = l_yaw_offset_2 + l_modifier_offset_0;
                end;
                if l_defensive_1.yaw_modifier == "Center" then
                    local v1488 = l_defensive_1.modifier_offset * 0.5;
                    if not l_v927_1 then
                        v1488 = -v1488;
                    end;
                    l_yaw_offset_2 = l_yaw_offset_2 + v1488;
                end;
                if l_defensive_1.yaw_modifier == "Skitter" then
                    l_yaw_offset_2 = l_yaw_offset_2 + l_defensive_1.modifier_offset * l_v928_1[l_v926_1 % #l_v928_1 + 1];
                end;
                rage.antiaim:override_hidden_yaw_offset(-l_yaw_offset_2);
            end;
            return;
        end;
    end;
    local function v1490()
        -- upvalues: l_v1018_0 (ref)
        if l_v1018_0.yaw_left ~= nil and l_v1018_0.yaw_right ~= nil then
            local v1489 = l_v1018_0.yaw_offset or 0;
            if l_v1018_0.inverter == true then
                l_v1018_0.yaw_offset = v1489 + l_v1018_0.yaw_left;
            end;
            if l_v1018_0.inverter == false then
                l_v1018_0.yaw_offset = v1489 + l_v1018_0.yaw_right;
            end;
            return;
        else
            return;
        end;
    end;
    local function v1514()
        -- upvalues: l_v878_2 (ref), l_v1018_0 (ref), v374 (ref), l_v925_1 (ref), l_v924_0 (ref), l_v877_1 (ref), l_v928_1 (ref), v17 (ref)
        local l_l_v878_2_0 = l_v878_2;
        if l_v1018_0.delay_affects_modifier == false then
            l_l_v878_2_0 = bit.band(v374.sent_packets, 1) ~= 0;
        end;
        if l_v1018_0.yaw_modifier == "Angelic" then
            local v1492 = {
                [1] = "Offset", 
                [2] = "Random", 
                [3] = "Skitter", 
                [4] = "Center"
            };
            local l_modifier_offset_1 = l_v1018_0.modifier_offset;
            if globals.realtime - l_v925_1 > 0.15 then
                l_v925_1 = globals.realtime;
                l_v924_0 = v1492[math.random(1, #v1492)];
            end;
            local v1494 = globals.tickcount * 0.2;
            local l_l_v924_0_0 = l_v924_0;
            local v1496 = math.floor(math.sin(v1494) * l_modifier_offset_1);
            l_v1018_0.yaw_modifier = l_l_v924_0_0;
            l_v1018_0.modifier_offset = v1496;
        end;
        if l_v1018_0.yaw_modifier == "Offset" then
            local v1497 = l_v1018_0.yaw_offset or 0;
            local l_modifier_offset_2 = l_v1018_0.modifier_offset;
            l_v1018_0.yaw_modifier = "Off";
            l_v1018_0.modifier_offset = 0;
            l_v1018_0.yaw_offset = v1497 + (l_l_v878_2_0 and l_modifier_offset_2 or 0);
            return;
        elseif l_v1018_0.yaw_modifier == "Center" then
            local v1499 = l_v1018_0.yaw_offset or 0;
            local l_modifier_offset_3 = l_v1018_0.modifier_offset;
            if not l_l_v878_2_0 then
                l_modifier_offset_3 = -l_modifier_offset_3;
            end;
            l_v1018_0.yaw_modifier = "Off";
            l_v1018_0.modifier_offset = 0;
            l_v1018_0.yaw_offset = v1499 + l_modifier_offset_3 / 2;
            return;
        elseif l_v1018_0.yaw_modifier == "Skitter" then
            local v1501 = l_v928_1[l_v877_1 % #l_v928_1 + 1];
            local v1502 = l_v1018_0.yaw_offset or 0;
            local l_modifier_offset_4 = l_v1018_0.modifier_offset;
            l_v1018_0.yaw_modifier = "Off";
            l_v1018_0.modifier_offset = 0;
            l_v1018_0.yaw_offset = v1502 + l_modifier_offset_4 * v1501;
            return;
        elseif l_v1018_0.yaw_modifier == "Custom Ways" then
            local v1504 = l_v1018_0.yaw_offset or 0;
            local v1505 = 0;
            if l_v1018_0.way ~= nil then
                local v1506 = #l_v1018_0.way;
                local v1507 = l_v877_1 % v1506 + 1;
                local v1508 = l_v1018_0.way[v1507];
                if v1508 ~= nil then
                    v1505 = v1508;
                end;
            end;
            l_v1018_0.yaw_modifier = "Off";
            l_v1018_0.modifier_offset = 0;
            l_v1018_0.yaw_offset = v1504 + v1505;
            return;
        elseif l_v1018_0.yaw_modifier == "Spin" then
            local v1509 = globals.curtime * 3;
            local v1510 = l_v1018_0.yaw_offset or 0;
            local l_modifier_offset_5 = l_v1018_0.modifier_offset;
            l_v1018_0.yaw_modifier = "Off";
            l_v1018_0.modifier_offset = 0;
            l_v1018_0.yaw_offset = v1510 + v17.lerp(-l_modifier_offset_5, l_modifier_offset_5, v1509 % 1);
            return;
        elseif l_v1018_0.yaw_modifier == "Random" then
            local v1512 = l_v1018_0.yaw_offset or 0;
            local l_modifier_offset_6 = l_v1018_0.modifier_offset;
            l_v1018_0.yaw_modifier = "Off";
            l_v1018_0.modifier_offset = 0;
            l_v1018_0.yaw_offset = v1512 + utils.random_int(-l_modifier_offset_6, l_modifier_offset_6);
            return;
        else
            return;
        end;
    end;
    local function v1519()
        -- upvalues: l_v1018_0 (ref), l_v878_2 (ref)
        if l_v1018_0.options == nil then
            return;
        else
            local v1515 = false;
            local v1516 = {};
            for v1517 = 1, #l_v1018_0.options do
                local v1518 = l_v1018_0.options[v1517];
                if v1518 == "Jitter" then
                    v1515 = true;
                elseif v1518 ~= "Randomize Jitter" then
                    table.insert(v1516, v1518);
                end;
            end;
            if v1515 then
                l_v1018_0.inverter = l_v878_2;
            end;
            l_v1018_0.options = v1516;
            return;
        end;
    end;
    local function v1522(v1520)
        -- upvalues: v1117 (ref), v1103 (ref), l_l_angles_0_1 (ref), v1099 (ref), v1118 (ref), v1123 (ref), v1119 (ref), v1283 (ref), v1303 (ref), v1305 (ref), v1304 (ref), l_v1020_0 (ref)
        v1117:update(v1520);
        if v1103:update(v1520) then
            return;
        else
            l_l_angles_0_1:update(v1520);
            local v1521 = v1099:update();
            v1118:update(v1520);
            if v1123:update(v1520) then
                return;
            else
                v1119:update(v1520);
                if v1283:update(v1520) then
                    return;
                elseif v1303:update(v1520) then
                    return;
                elseif v1305:update(v1520) then
                    return;
                elseif v1304:update(v1520) then
                    return;
                else
                    if v1521 ~= nil and v1521.defensive ~= nil then
                        l_l_angles_0_1:apply(v1520, v1521.defensive);
                        l_v1020_0:update(v1520, v1521.defensive);
                    end;
                    return;
                end;
            end;
        end;
    end;
    local function v1524(v1523)
        -- upvalues: v1391 (ref), v1397 (ref), v1519 (ref), v1514 (ref), v1490 (ref), v1400 (ref)
        rage.antiaim:override_hidden_yaw_offset(0);
        if v1523.choked_commands == 0 then
            v1391();
            v1397();
        end;
        v1519();
        v1514();
        v1490();
        v1400();
    end;
    local function v1525()
        -- upvalues: v32 (ref), l_v1018_0 (ref)
        v32.ragebot.main.hide_shots[1]:override();
        v32.ragebot.main.double_tap[1]:override();
        l_v1018_0:unset();
    end;
    local function v1527(v1526)
        -- upvalues: v32 (ref), l_v1018_0 (ref), v1522 (ref), v1524 (ref)
        v32.ragebot.main.hide_shots[1]:override();
        v32.ragebot.main.double_tap[1]:override();
        l_v1018_0:clear();
        l_v1018_0:unset();
        v1522(v1526);
        v1524(v1526);
        l_v1018_0:set();
    end;
    local _ = nil;
    local l_antiaim_0 = v364.antiaim;
    local function v1532(v1530)
        -- upvalues: l_v1018_0 (ref), v32 (ref), v1525 (ref), v1527 (ref)
        local v1531 = v1530:get();
        if not v1531 then
            l_v1018_0:unset();
            v32.ragebot.main.hide_shots[2]:override();
            v32.ragebot.main.double_tap[2]:override();
        end;
        events.shutdown(v1525, v1531);
        events.createmove(v1527, v1531);
    end;
    l_antiaim_0.enabled:set_callback(v1532, true);
end;
v877 = nil;
v878 = nil;
v924 = v364.ragebot.aimtools;
v925 = 0;
v926 = 1;
v927 = 2;
v928 = 3;
l_match_0 = 4;
v1017 = 5;
v1018 = 6;
l_angles_0 = 7;
v1020 = 10;
v1030 = 1;
local v1533 = 5;
local l_aimtools_0 = v131.aimtools;
local v1535 = {};
local v1536 = {};
do
    local l_v924_1, l_v926_2, l_v928_2, l_v1018_1, l_l_angles_0_2, l_v1030_1, l_v1533_0, l_l_aimtools_0_0, l_v1535_0, l_v1536_0 = v924, v926, v928, v1018, l_angles_0, v1030, v1533, l_aimtools_0, v1535, v1536;
    local function v1548(v1547)
        -- upvalues: l_v1536_0 (ref)
        l_v1536_0[v1547] = {
            head_scale = ui.find("Aimbot", "Ragebot", "Selection", v1547, "Multipoint", "Head Scale"), 
            body_scale = ui.find("Aimbot", "Ragebot", "Selection", v1547, "Multipoint", "Body Scale"), 
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", v1547, "Hit Chance"), 
            body_aim = ui.find("Aimbot", "Ragebot", "Safety", v1547, "Body Aim"), 
            safe_points = ui.find("Aimbot", "Ragebot", "Safety", v1547, "Safe Points")
        };
    end;
    for v1549 = 1, #l_l_aimtools_0_0 do
        v1548(l_l_aimtools_0_0[v1549]);
    end;
    v1548 = function(v1550)
        -- upvalues: l_v1030_1 (ref), l_v1533_0 (ref)
        local v1551 = v1550:get_weapon_info();
        if v1551 == nil then
            return nil;
        else
            local l_weapon_type_1 = v1551.weapon_type;
            local v1553 = v1550:get_weapon_index();
            if l_weapon_type_1 == l_v1030_1 then
                if v1553 == 1 then
                    return "Desert Eagle";
                elseif v1553 == 64 then
                    return "R8 Revolver";
                else
                    return "Pistols";
                end;
            elseif l_weapon_type_1 == l_v1533_0 then
                if v1553 == 9 then
                    return "AWP";
                elseif v1553 == 40 then
                    return "SSG-08";
                else
                    return "AutoSnipers";
                end;
            else
                return nil;
            end;
        end;
    end;
    local function v1555(v1554)
        -- upvalues: l_v926_2 (ref), l_v928_2 (ref), l_v1018_1 (ref), l_l_angles_0_2 (ref)
        if v1554 == l_v926_2 then
            return 4;
        elseif v1554 == l_v928_2 then
            return 1.25;
        elseif v1554 == l_v1018_1 then
            return 0.75;
        elseif v1554 == l_l_angles_0_2 then
            return 0.75;
        else
            return 1;
        end;
    end;
    local function v1560(v1556, v1557, v1558, v1559)
        -- upvalues: v1555 (ref), l_v926_2 (ref)
        v1557 = v1557 * v1555(v1558);
        if v1556.m_ArmorValue > 0 then
            if v1558 == l_v926_2 then
                if v1556.m_bHasHelmet then
                    v1557 = v1557 * (v1559 * 0.5);
                end;
            else
                v1557 = v1557 * (v1559 * 0.5);
            end;
        end;
        return v1557;
    end;
    local function v1572(v1561, v1562, v1563, v1564, v1565)
        -- upvalues: v1560 (ref)
        local v1566 = v1562 - v1561;
        local l_damage_0 = v1565.damage;
        local l_armor_ratio_0 = v1565.armor_ratio;
        local l_range_0 = v1565.range;
        local l_range_modifier_0 = v1565.range_modifier;
        local v1571 = math.min(l_range_0, v1566:length());
        l_damage_0 = l_damage_0 * math.pow(l_range_modifier_0, v1571 * 0.002);
        return (v1560(v1563, l_damage_0, v1564, l_armor_ratio_0));
    end;
    local function v1577(v1573, v1574)
        local v1575 = v1573:get_origin();
        local v1576 = v1574:get_origin();
        return v1575.z - v1576.z > 53;
    end;
    local function v1581(v1578, v1579)
        local v1580 = v1578:get_origin();
        return v1579:get_origin().z - v1580.z > 53;
    end;
    local function v1587(v1582, v1583, v1584, v1585, v1586)
        -- upvalues: v1572 (ref)
        return v1572(v1582, v1583, v1584, v1585, v1586) >= v1584.m_iHealth;
    end;
    local function v1590()
        -- upvalues: l_l_aimtools_0_0 (ref), l_v1536_0 (ref)
        for v1588 = 1, #l_l_aimtools_0_0 do
            local v1589 = l_v1536_0[l_l_aimtools_0_0[v1588]];
            v1589.head_scale:override();
            v1589.body_scale:override();
            v1589.hit_chance:override();
            v1589.body_aim:override();
            v1589.safe_points:override();
        end;
    end;
    local function v1591()
        return {
            misses = 0, 
            force_safe = false, 
            prefer_body = false
        };
    end;
    local function v1593(v1592)
        -- upvalues: l_v1535_0 (ref)
        return l_v1535_0[v1592];
    end;
    local function v1596(v1594)
        -- upvalues: v1593 (ref), v1591 (ref), l_v1535_0 (ref)
        local v1595 = v1593(v1594);
        if v1595 == nil then
            v1595 = v1591();
            l_v1535_0[v1594] = v1595;
        end;
        return v1595;
    end;
    local function v1598(v1597)
        -- upvalues: l_v1535_0 (ref)
        l_v1535_0[v1597] = nil;
    end;
    local function v1600()
        -- upvalues: l_v1535_0 (ref), v1598 (ref)
        for v1599 in pairs(l_v1535_0) do
            v1598(v1599);
        end;
    end;
    local function v1611(v1601, v1602, v1603, v1604, v1605, v1606)
        -- upvalues: v1577 (ref), v1581 (ref), v1587 (ref)
        local v1607 = v1601:get_eye_position();
        local v1608 = v1603:get_hitbox_position(5);
        local v1609 = v1602:get_weapon_info();
        local v1610 = v1606.body_aim:get() ~= "Force" and (v1605.conditions:get("Higher than you") and v1577(v1603, v1601) or v1605.conditions:get("Lower than you") and v1581(v1603, v1601) or v1605.conditions:get("Lethal") and v1587(v1607, v1608, v1603, 3, v1609) or v1605.conditions:get("After X misses") and not (v1604.misses <= v1605.max_misses:get()) or v1605.conditions:get("HP lower than X") and v1603.m_iHealth < v1605.lower_hp:get());
        v1606.body_aim:override(v1610 and "Prefer" or nil);
        v1604.prefer_body = v1610;
    end;
    local function v1622(v1612, v1613, v1614, v1615, v1616, v1617)
        -- upvalues: v1577 (ref), v1581 (ref), v1587 (ref)
        local v1618 = v1612:get_eye_position();
        local v1619 = v1614:get_hitbox_position(5);
        local v1620 = v1613:get_weapon_info();
        local v1621 = v1616.conditions:get("Higher than you") and v1577(v1614, v1612) or v1616.conditions:get("Lower than you") and v1581(v1614, v1612) or v1616.conditions:get("Lethal") and v1587(v1618, v1619, v1614, 3, v1620) or v1616.conditions:get("After X misses") and v1615.misses > v1616.max_misses:get() or v1616.conditions:get("HP lower than X") and v1614.m_iHealth < v1616.lower_hp:get();
        v1617.safe_points:override(v1621 and "Force" or nil);
        v1615.force_safe = v1621;
    end;
    local function v1633(v1623, v1624, v1625, v1626, v1627, v1628)
        -- upvalues: v1577 (ref), v1581 (ref), v1587 (ref)
        local v1629 = v1623:get_eye_position();
        local v1630 = v1625:get_hitbox_position(5);
        local v1631 = v1624:get_weapon_info();
        local v1632 = v1627["Higher than you"].enabled:get() and v1577(v1625, v1623) and v1627["Higher than you"].value:get() or v1627["Lower than you"].enabled:get() and v1581(v1625, v1623) and v1627["Lower than you"].value:get() or v1627.Lethal.enabled:get() and v1587(v1629, v1630, v1625, 3, v1631) and v1627.Lethal.value:get() or v1627["After X misses"].enabled:get() and v1626.misses > v1627["After X misses"].max_misses:get() and v1627["After X misses"].value:get() or v1627["HP lower than X"].enabled:get() and v1625.m_iHealth < v1627["HP lower than X"].lower_hp:get() and v1627["HP lower than X"].value:get() or nil;
        v1628.hit_chance:override(v1632);
        v1626.hit_chance = v1632;
    end;
    local function v1644(v1634, v1635, v1636, v1637, v1638, v1639)
        -- upvalues: v1577 (ref), v1581 (ref), v1587 (ref)
        local v1640 = v1634:get_eye_position();
        local v1641 = v1636:get_hitbox_position(5);
        local v1642 = v1635:get_weapon_info();
        local v1643 = v1638["Higher than you"].enabled:get() and v1577(v1636, v1634) and v1638["Higher than you"].value:get() or v1638["Lower than you"].enabled:get() and v1581(v1636, v1634) and v1638["Lower than you"].value:get() or v1638.Lethal.enabled:get() and v1587(v1640, v1641, v1636, 3, v1642) and v1638.Lethal.value:get() or v1638["After X misses"].enabled:get() and v1637.misses > v1638["After X misses"].max_misses:get() and v1638["After X misses"].value:get() or v1638["HP lower than X"].enabled:get() and v1636.m_iHealth < v1638["HP lower than X"].lower_hp:get() and v1638["HP lower than X"].value:get() or nil;
        v1639.head_scale:override(v1643);
        v1639.body_scale:override(v1643);
        v1637.multipoints = v1643;
    end;
    local function v1652(v1645, v1646, v1647)
        -- upvalues: v1548 (ref), l_v924_1 (ref), l_v1536_0 (ref), v1596 (ref), v1611 (ref), v1622 (ref), v1633 (ref), v1644 (ref), v1590 (ref)
        local v1648 = v1548(v1647);
        local v1649 = l_v924_1[v1648];
        local v1650 = l_v1536_0[v1648];
        if v1646 ~= nil and v1649 ~= nil and v1650 ~= nil then
            local v1651 = v1596(v1646:get_index());
            v1611(v1645, v1647, v1646, v1651, v1649.prefer_body, v1650);
            v1622(v1645, v1647, v1646, v1651, v1649.force_safe, v1650);
            v1633(v1645, v1647, v1646, v1651, v1649.hit_chance, v1650);
            v1644(v1645, v1647, v1646, v1651, v1649.multipoints, v1650);
        else
            v1590();
        end;
    end;
    local function v1653()
        -- upvalues: v1590 (ref)
        v1590();
    end;
    local function v1656()
        -- upvalues: v1652 (ref)
        local v1654 = entity.get_local_player();
        if v1654 == nil then
            return;
        else
            local v1655 = v1654:get_player_weapon();
            if v1655 == nil then
                return;
            else
                v1652(v1654, entity.get_threat(), v1655);
                return;
            end;
        end;
    end;
    local function v1668()
        -- upvalues: v1548 (ref), v1593 (ref), l_play_0 (ref)
        local v1657 = entity.get_local_player();
        if v1657 == nil or not v1657:is_alive() then
            return;
        else
            local v1658 = v1657:get_player_weapon();
            if v1658 == nil then
                return;
            else
                local v1659 = entity.get_threat();
                local v1660 = v1548(v1658);
                if v1659 == nil or v1660 == nil then
                    return;
                else
                    local v1661 = v1593(v1659:get_index());
                    if v1661 == nil then
                        return;
                    else
                        local v1662 = {};
                        if v1661.prefer_body then
                            table.insert(v1662, "BODY");
                        end;
                        if v1661.force_safe then
                            table.insert(v1662, "SAFE");
                        end;
                        if v1661.multipoints ~= nil then
                            table.insert(v1662, v1661.multipoints);
                        end;
                        if v1661.hit_chance ~= nil then
                            table.insert(v1662, v1661.hit_chance .. "%");
                        end;
                        if #v1662 == 0 then
                            return;
                        else
                            local v1663 = v1659:get_bbox();
                            if v1663 == nil then
                                return;
                            else
                                local l_pos1_0 = v1663.pos1;
                                local l_pos2_0 = v1663.pos2;
                                local l_alpha_0 = v1663.alpha;
                                if l_pos1_0 == nil or l_pos2_0 == nil or l_alpha_0 == nil then
                                    return;
                                else
                                    local v1667 = vector((v1663.pos1.x + v1663.pos2.x) * 0.5, v1663.pos1.y - 20);
                                    l_play_0.text(1, v1667, color(255, 255, 255, 200 * l_alpha_0), "c", table.concat(v1662, " + "));
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v1673(v1669)
        -- upvalues: v1596 (ref)
        local l_state_1 = v1669.state;
        local l_target_0 = v1669.target;
        if l_state_1 == nil or l_target_0 == nil then
            return;
        else
            local v1672 = v1596(l_target_0:get_index());
            v1672.misses = v1672.misses + 1;
            return;
        end;
    end;
    local function v1677(v1674)
        -- upvalues: v1598 (ref)
        local v1675 = entity.get_local_player();
        local v1676 = entity.get(v1674.userid, true);
        if v1675 ~= entity.get(v1674.attacker, true) or v1675 == v1676 then
            return;
        else
            v1598(v1676:get_index());
            return;
        end;
    end;
    local function v1680(v1678)
        -- upvalues: v1598 (ref)
        local v1679 = entity.get(v1678.userid, true);
        if v1679 == nil then
            return;
        else
            v1598(v1679:get_index());
            return;
        end;
    end;
    local _ = nil;
    local function v1683(v1682)
        -- upvalues: v1668 (ref)
        events.render(v1668, v1682:get());
    end;
    do
        local l_v1683_0 = v1683;
        local function v1687(v1685)
            -- upvalues: v1590 (ref), v1600 (ref), l_v924_1 (ref), l_v1683_0 (ref), v1653 (ref), v1656 (ref), v1673 (ref), v1677 (ref), v1680 (ref)
            local v1686 = v1685:get();
            if not v1686 then
                v1590();
                v1600();
            end;
            if v1686 then
                l_v924_1.flag:set_callback(l_v1683_0, true);
            else
                l_v924_1.flag:unset_callback(l_v1683_0);
            end;
            events.shutdown(v1653, v1686);
            events.createmove(v1656, v1686);
            events.aim_ack(v1673, v1686);
            events.player_death(v1677, v1686);
            events.player_spawn(v1680, v1686);
        end;
        l_v924_1.enabled:set_callback(v1687, true);
    end;
end;
v924 = nil;
v925 = v364.ragebot.ai_peek;
v926 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v927 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v928 = {
    ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"), 
    ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
};
l_match_0 = ffi.typeof("float[3]");
v1017 = ffi.typeof("uint8_t[4]");
v1018 = nil;
l_angles_0 = ffi.typeof("                void(__thiscall*)(\n                    void*,\n                    float origin[3],\n                    float mins[3],\n                    float maxs[3],\n                    float angles[3],\n                    uint8_t face_color[4],\n                    uint8_t edge_color[4],\n                    float duration\n                )\n            ");
v1018 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, l_angles_0);
l_angles_0 = 1;
v1020 = 5;
v1030 = 0;
v1533 = 3;
l_aimtools_0 = 5;
v1535 = 7;
v1536 = 8;
local v1688 = 9;
local v1689 = 10;
local v1690 = 11;
local v1691 = 12;
local v1692 = 15;
local v1693 = 17;
local v1694 = {
    Head = {
        [1] = v1030
    }, 
    Chest = {
        [1] = l_aimtools_0
    }, 
    Stomach = {
        [1] = v1533
    }, 
    Arms = {
        [1] = v1693, 
        [2] = v1692
    }, 
    Legs = {
        [1] = v1536, 
        [2] = v1535, 
        [3] = v1689, 
        [4] = v1688
    }
};
local v1695 = 1;
local v1696 = 2;
local v1697 = 3;
local v1698 = 4;
local v1699 = 5;
local v1700 = 6;
local v1701 = 7;
local v1702 = {
    [v1030] = v1695, 
    [l_aimtools_0] = v1696, 
    [v1533] = v1697, 
    [v1536] = v1700, 
    [v1535] = v1701, 
    [v1691] = v1700, 
    [v1690] = v1701, 
    [v1693] = v1698, 
    [v1692] = v1699
};
local v1703 = nil;
v1703 = {};
do
    local l_v925_2, l_v926_3, l_v927_2, l_v928_3, l_l_match_0_3, l_v1017_1, l_v1018_2, l_l_angles_0_3, l_v1020_1, l_v1694_0, l_v1702_0, l_v1703_0 = v925, v926, v927, v928, l_match_0, v1017, v1018, l_angles_0, v1020, v1694, v1702, v1703;
    local function v1718(v1716, v1717)
        -- upvalues: l_v1703_0 (ref)
        l_v1703_0[v1716] = v1717;
    end;
    local function v1720(v1719)
        return {
            body_aim = ui.find("Aimbot", "Ragebot", "Safety", v1719, "Body Aim"), 
            safe_points = ui.find("Aimbot", "Ragebot", "Safety", v1719, "Safe Points"), 
            ensure_hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", v1719, "Ensure Hitbox Safety"), 
            min_damage = ui.find("Aimbot", "Ragebot", "Selection", v1719, "Min. Damage"), 
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", v1719, "Hit Chance"), 
            head_scale = ui.find("Aimbot", "Ragebot", "Selection", v1719, "Multipoint", "Head Scale"), 
            body_scale = ui.find("Aimbot", "Ragebot", "Selection", v1719, "Multipoint", "Body Scale")
        };
    end;
    v1718("AutoSnipers", v1720("AutoSnipers"));
    v1718("AWP", v1720("AWP"));
    v1718("SSG-08", v1720("SSG-08"));
    v1718("Desert Eagle", v1720("Desert Eagle"));
    v1718("R8 Revolver", v1720("R8 Revolver"));
    v1718("Pistols", v1720("Pistols"));
    v1718 = nil;
    v1720 = 0;
    local v1721 = nil;
    local function v1723(v1722)
        return v1722[0];
    end;
    local function v1724()
        -- upvalues: v1718 (ref), v1720 (ref), v1721 (ref)
        v1718 = nil;
        v1720 = 0;
        v1721 = nil;
    end;
    local function v1727()
        -- upvalues: l_v1703_0 (ref), l_v926_3 (ref), l_v928_3 (ref)
        for _, v1726 in pairs(l_v1703_0) do
            v1726.body_aim:override();
            v1726.safe_points:override();
            v1726.ensure_hitbox_safety:override();
            v1726.hit_chance:override();
            v1726.head_scale:override();
            v1726.body_scale:override();
        end;
        l_v926_3:override();
        l_v928_3[3]:override();
    end;
    local function v1732()
        -- upvalues: l_v925_2 (ref), l_v1703_0 (ref), l_v928_3 (ref)
        local v1728 = l_v925_2.hit_chance:get();
        local v1729 = l_v925_2.unsafe:get();
        for _, v1731 in pairs(l_v1703_0) do
            if v1729 then
                v1731.body_aim:override("Default");
                v1731.safe_points:override("Default");
                v1731.ensure_hitbox_safety:override({});
            end;
            if v1728 ~= 0 then
                v1731.hit_chance:override(v1728);
            end;
            v1731.head_scale:override(100);
            v1731.body_scale:override(100);
        end;
        l_v928_3[3]:override("On Shot");
    end;
    local function v1734(v1733)
        if v1733 == 1 then
            return 4;
        elseif v1733 == 3 then
            return 1.25;
        elseif v1733 == 6 or v1733 == 7 then
            return 0.75;
        else
            return 1;
        end;
    end;
    local function v1743(v1735, v1736, v1737, v1738, v1739)
        -- upvalues: v1734 (ref)
        local v1740 = v1737 - v1736;
        local v1741 = math.min(v1735.range, v1740:length());
        local v1742 = v1735.damage * math.pow(v1735.range_modifier, v1741 * 0.002) * v1734(v1739);
        if v1738.m_ArmorValue > 0 and (v1739 ~= 1 or v1738.m_bHasHelmet) then
            v1742 = v1742 * (v1735.armor_ratio / 2);
        end;
        return v1742;
    end;
    local function v1749()
        -- upvalues: l_v925_2 (ref), l_v1694_0 (ref)
        local v1744 = {};
        local v1745 = l_v925_2.hitboxes:get();
        for v1746 = 1, #v1745 do
            local v1747 = l_v1694_0[v1745[v1746]];
            for v1748 = 1, #v1747 do
                table.insert(v1744, v1747[v1748]);
            end;
        end;
        return v1744;
    end;
    local function v1754(v1750, v1751)
        -- upvalues: l_l_angles_0_3 (ref), l_v1020_1 (ref)
        local v1752 = v1750:get_weapon_index();
        local l_weapon_type_2 = v1751.weapon_type;
        if l_weapon_type_2 == l_l_angles_0_3 then
            if v1752 == 1 then
                return "Desert Eagle";
            elseif v1752 == 64 then
                return "R8 Revolver";
            else
                return "Pistols";
            end;
        elseif l_weapon_type_2 == l_v1020_1 then
            if v1752 == 9 then
                return "AWP";
            elseif v1752 == 40 then
                return "SSG-08";
            else
                return "AutoSnipers";
            end;
        else
            return nil;
        end;
    end;
    local function v1769(v1755, v1756, v1757, v1758, v1759)
        -- upvalues: l_v1702_0 (ref), v1743 (ref)
        local v1760 = {};
        local l_m_iHealth_2 = v1758.m_iHealth;
        local v1762 = v1756:get_eye_position();
        local v1763 = v1757:get_weapon_info();
        for v1764 = 1, #v1755 do
            local v1765 = v1755[v1764];
            local v1766 = l_v1702_0[v1765] or 0;
            local v1767 = v1758:get_hitbox_position(v1765);
            local v1768 = v1743(v1763, v1762, v1767, v1758, v1766);
            if v1759 <= v1768 or l_m_iHealth_2 <= v1768 then
                table.insert(v1760, v1767);
            end;
        end;
        return v1760;
    end;
    local function v1771(v1770)
        -- upvalues: v1723 (ref)
        if v1770 == nil or not pcall(v1723, v1770) then
            return false;
        else
            return true;
        end;
    end;
    local function v1777(v1772, v1773, v1774)
        if v1772 == nil or v1773 == nil then
            return false;
        else
            local v1775 = v1774.max_clip1 > 0 and v1773.m_iClip1 > 0;
            local v1776 = globals.curtime >= v1772.m_flNextAttack and globals.curtime >= v1773.m_flNextPrimaryAttack;
            return v1775 and v1776;
        end;
    end;
    local function v1782(v1778, v1779)
        -- upvalues: l_v925_2 (ref), v1720 (ref)
        local v1780 = l_v925_2.scan_frequency:get() * 0.01;
        if v1780 > 0 then
            v1720 = math.max(0, v1720 - globals.frametime);
            if v1720 > 0 then
                return false;
            else
                v1720 = v1780;
            end;
        end;
        if v1778.in_forward or v1778.in_back or v1778.in_moveleft or v1778.in_moveright then
            return false;
        else
            local l_m_fFlags_0 = v1779.m_fFlags;
            if bit.band(l_m_fFlags_0, 1) == 0 then
                return false;
            elseif v1779.m_vecVelocity:length2dsqr() > 480 then
                return false;
            else
                return true;
            end;
        end;
    end;
    local function v1785(v1783, v1784)
        return {
            ctx = v1783, 
            target = v1784, 
            simtime = 0, 
            retreat = -1, 
            teleport = 0
        };
    end;
    local function v1787(v1786)
        -- upvalues: l_v1018_2 (ref), l_l_match_0_3 (ref), l_v1017_1 (ref), l_v925_2 (ref)
        l_v1018_2(l_l_match_0_3(v1786.origin:unpack()), l_l_match_0_3(v1786.obb_mins:unpack()), l_l_match_0_3(v1786.obb_maxs:unpack()), l_l_match_0_3(), l_v1017_1(), l_v1017_1(l_v925_2.color:get():unpack()), globals.tickinterval * 2);
    end;
    local function v1789(v1788)
        v1788.in_forward = true;
        v1788.in_back = false;
        v1788.in_moveleft = false;
        v1788.in_moveright = false;
        v1788.in_duck = false;
        v1788.in_jump = false;
        v1788.in_speed = false;
    end;
    local function v1795(v1790, v1791, v1792)
        local function v1794(v1793)
            -- upvalues: v1790 (ref)
            if v1793 == v1790 then
                return false;
            elseif not v1793:is_enemy() then
                return false;
            else
                return true;
            end;
        end;
        return utils.trace_bullet(v1790, v1791, v1792, v1794);
    end;
    local function v1802(v1796, v1797)
        local _ = nil;
        local _ = nil;
        local v1800 = v1796:get_origin();
        local v1801 = (v1797:get_origin() - v1800):angles().y + 180;
        return v1801 - 90, v1801 + 90;
    end;
    local function v1814(v1803, v1804, v1805, v1806, v1807)
        -- upvalues: v1795 (ref)
        local l_m_iHealth_3 = v1805.m_iHealth;
        for v1809 = 1, #v1806 do
            local v1810 = v1806[v1809];
            local v1811 = v1795(v1803, v1804, v1810);
            local v1812 = v1807 <= v1811;
            local v1813 = l_m_iHealth_3 <= v1811;
            if v1812 or v1813 then
                return v1811;
            end;
        end;
        return nil;
    end;
    local function v1823(v1815, v1816, v1817, v1818, v1819, v1820, v1821)
        -- upvalues: v1814 (ref)
        v1815.view_angles.y = v1817;
        v1816:think(1);
        if bit.band(v1816.flags, 1) == 0 then
            return nil;
        else
            local v1822 = v1814(v1818, v1816.origin + vector(0, 0, v1816.view_offset), v1819, v1820, v1821);
            if v1822 ~= nil then
                v1816:think(1);
            end;
            return {
                ctx = v1816, 
                damage = v1822
            };
        end;
    end;
    local function v1838(v1824, v1825, v1826, v1827, v1828)
        -- upvalues: v1802 (ref), v1823 (ref), v1785 (ref)
        local v1829 = true;
        local v1830 = true;
        local v1831 = v1825:simulate_movement(nil, vector(), 1);
        local v1832 = v1825:simulate_movement(nil, vector(), 1);
        local v1833, v1834 = v1802(v1825, v1826);
        for _ = 1, 25 do
            if v1829 then
                local v1836 = v1823(v1824, v1831, v1833, v1825, v1826, v1827, v1828);
                if v1836 ~= nil and v1836.damage ~= nil then
                    return v1785(v1836.ctx, v1826);
                elseif v1836 == nil then
                    v1829 = false;
                end;
            end;
            if v1830 then
                local v1837 = v1823(v1824, v1832, v1834, v1825, v1826, v1827, v1828);
                if v1837 ~= nil and v1837.damage ~= nil then
                    return v1785(v1837.ctx, v1826);
                elseif v1837 == nil then
                    v1830 = false;
                end;
            end;
        end;
    end;
    local function v1851(v1839, v1840, v1841, v1842, v1843)
        -- upvalues: v1838 (ref)
        local v1844 = v1839.view_angles:clone();
        local l_forwardmove_0 = v1839.forwardmove;
        local l_sidemove_0 = v1839.sidemove;
        local l_in_duck_0 = v1839.in_duck;
        local l_in_jump_0 = v1839.in_jump;
        local l_in_speed_0 = v1839.in_speed;
        v1839.forwardmove = 450;
        v1839.sidemove = 0;
        v1839.in_duck = false;
        v1839.in_jump = false;
        v1839.in_speed = false;
        local v1850 = v1838(v1839, v1840, v1841, v1842, v1843);
        v1839.view_angles.y = v1844.y;
        v1839.forwardmove = l_forwardmove_0;
        v1839.sidemove = l_sidemove_0;
        v1839.in_duck = l_in_duck_0;
        v1839.in_jump = l_in_jump_0;
        v1839.in_speed = l_in_speed_0;
        return v1850;
    end;
    local function v1865(v1852, v1853, v1854)
        -- upvalues: l_v927_2 (ref), v1749 (ref), v1718 (ref), v1771 (ref), v1769 (ref), v1814 (ref), v1782 (ref), v1851 (ref)
        local v1855 = l_v927_2:get();
        local v1856 = v1749();
        if v1718 ~= nil and v1771(v1718.target) then
            local l_ctx_0 = v1718.ctx;
            local l_target_1 = v1718.target;
            local l_m_iHealth_4 = l_target_1.m_iHealth;
            if v1855 >= 100 then
                v1855 = v1855 - 100 + l_m_iHealth_4;
            end;
            local v1860 = v1769(v1856, v1853, v1854, l_target_1, v1855);
            if v1814(v1853, l_ctx_0.origin + vector(0, 0, l_ctx_0.view_offset), l_target_1, v1860, v1855) ~= nil then
                v1718.simtime = 0;
            end;
            v1718.simtime = v1718.simtime + globals.frametime;
            return true;
        elseif not v1782(v1852, v1853) then
            return false;
        else
            local v1861 = entity.get_threat();
            if v1861 == nil or v1861:is_dormant() then
                return false;
            else
                local l_m_iHealth_5 = v1861.m_iHealth;
                if v1855 >= 100 then
                    v1855 = v1855 - 100 + l_m_iHealth_5;
                end;
                local v1863 = v1769(v1856, v1853, v1854, v1861, v1855);
                if v1814(v1853, v1853:get_eye_position(), v1861, v1863, v1855) then
                    return false;
                else
                    local v1864 = v1851(v1852, v1853, v1861, v1863, v1855);
                    if v1864 ~= nil then
                        v1718 = v1864;
                    end;
                    return v1718 ~= nil;
                end;
            end;
        end;
    end;
    local function v1866()
        -- upvalues: l_v926_3 (ref)
        rage.exploit:force_teleport();
        l_v926_3:override(false);
    end;
    local function v1876(v1867, v1868, v1869)
        -- upvalues: v1789 (ref), v1732 (ref)
        local v1870 = 450;
        local v1871 = v1869 - v1868:get_origin();
        local v1872 = v1871:angles();
        local v1873 = v1871:length2dsqr();
        local v1874 = v1873 < 10;
        if v1874 then
            local l_m_vecVelocity_3 = v1868.m_vecVelocity;
            v1870 = -l_m_vecVelocity_3:length();
            v1872 = l_m_vecVelocity_3:angles();
        end;
        v1867.move_yaw = v1872.y;
        v1867.forwardmove = v1870;
        v1867.sidemove = 0;
        v1789(v1867);
        v1732();
        return v1874, v1873;
    end;
    local function v1888(v1877, v1878, v1879, v1880)
        -- upvalues: v1865 (ref), v1718 (ref), l_v925_2 (ref), v1721 (ref), v1876 (ref), v1787 (ref), v1777 (ref), v1724 (ref), v1866 (ref), v1727 (ref)
        local v1881 = v1865(v1877, v1878, v1879);
        if v1718 == nil then
            return;
        else
            if v1718.simtime > l_v925_2.simulation:get() * 0.01 then
                v1881 = false;
            end;
            if v1880.weapon_type == 5 and not v1878.m_bIsScoped then
                v1881 = false;
            end;
            if v1881 and v1718.retreat <= 0 then
                local l_ctx_1 = v1718.ctx;
                if v1721 == nil then
                    local v1883 = v1878:get_origin();
                    local v1884 = (l_ctx_1.origin - v1883):normalize();
                    local l_obb_mins_0 = l_ctx_1.obb_mins;
                    local l_obb_maxs_0 = l_ctx_1.obb_maxs;
                    v1721 = utils.trace_hull(v1883, l_ctx_1.origin - v1884 * 25, l_obb_mins_0, l_obb_maxs_0, v1878, 33636363, 0).end_pos;
                end;
                v1718.retreat = v1876(v1877, v1878, l_ctx_1.origin) and 1 or 0;
                v1787(l_ctx_1);
                return;
            elseif not v1777(v1878, v1879, v1880) then
                v1724();
                return;
            else
                if v1718.ctx ~= nil and v1718.retreat ~= -1 then
                    local v1887 = v1876(v1877, v1878, v1721);
                    if v1878.m_vecVelocity:length2dsqr() > 1600 then
                        v1866();
                    end;
                    v1718.retreat = v1718.retreat + 1;
                    if v1887 then
                        v1727();
                        v1724();
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v1894(v1889)
        -- upvalues: v1754 (ref), l_v928_3 (ref), l_v925_2 (ref), v1727 (ref), v1724 (ref), v1888 (ref)
        local v1890 = entity.get_local_player();
        if v1890 == nil then
            return;
        else
            local v1891 = v1890:get_player_weapon();
            if v1891 == nil then
                return;
            else
                local v1892 = v1891:get_weapon_info();
                if v1892 == nil then
                    return;
                else
                    local v1893 = v1754(v1891, v1892);
                    if not (l_v928_3[1]:get() and l_v925_2.weapons:get(v1893)) then
                        v1727();
                        v1724();
                        return;
                    else
                        v1888(v1889, v1890, v1891, v1892);
                        return;
                    end;
                end;
            end;
        end;
    end;
    local function v1895()
        -- upvalues: v1724 (ref)
        v1724();
    end;
    local _ = nil;
    local function v1899(v1897)
        -- upvalues: v1727 (ref), v1724 (ref), v1895 (ref), v1894 (ref)
        local v1898 = v1897:get();
        if not v1898 then
            v1727();
            v1724();
        end;
        events.aim_fire(v1895, v1898);
        events.createmove(v1894, v1898);
    end;
    l_v925_2.enabled:set_callback(v1899, true);
end;
v925 = nil;
v926 = v364.ragebot.logs;
v927 = string.upper(v16.name:sub(1, 1));
v928 = string.lower(v16.name);
l_match_0 = 7;
v1017 = 5;
v1018 = l_match_0;
l_angles_0 = {};
v1020 = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "left arm", 
    [5] = "right arm", 
    [6] = "left leg", 
    [7] = "right leg", 
    [8] = "neck", 
    [9] = nil, 
    [10] = "gear"
};
v1030 = {
    c4 = "bombed", 
    flashbang = "harmed", 
    smokegrenade = "harmed", 
    incgrenade = "harmed", 
    hegrenade = "naded", 
    molotov = "harmed", 
    inferno = "burned", 
    decoy = "decoyed", 
    knife = "knifed"
};
do
    local l_v926_4, l_v927_3, l_v928_4, l_l_match_0_4, l_v1017_2, l_v1018_3, l_l_angles_0_4, l_v1020_2, l_v1030_2, l_v1533_1, l_l_aimtools_0_1, l_v1535_1, l_v1536_1, l_v1688_0, l_v1689_0, l_v1690_0, l_v1691_0, l_v1692_0, l_v1693_0, l_v1694_1, l_v1695_0 = v926, v927, v928, l_match_0, v1017, v1018, l_angles_0, v1020, v1030, v1533, l_aimtools_0, v1535, v1536, v1688, v1689, v1690, v1691, v1692, v1693, v1694, v1695;
    l_v1533_1 = function(v1921)
        -- upvalues: l_v926_4 (ref)
        if not l_v926_4.output:get("Events") then
            return;
        else
            print_dev(v1921);
            return;
        end;
    end;
    l_l_aimtools_0_1 = function(v1922, v1923)
        -- upvalues: l_v926_4 (ref), l_l_angles_0_4 (ref)
        if not l_v926_4.output:get("Render") then
            return;
        else
            local v1924 = l_v926_4.duration:get();
            local v1925 = #l_l_angles_0_4 + 1;
            l_l_angles_0_4[v1925] = {
                alpha = 0, 
                text = v1923, 
                color = v1922, 
                time = v1924
            };
            return v1925;
        end;
    end;
    l_v1535_1 = function(v1926)
        -- upvalues: l_v926_4 (ref)
        if not l_v926_4.output:get("Console") then
            return;
        else
            print_raw(v1926);
            return;
        end;
    end;
    l_v1536_1 = function(v1927, v1928, v1929)
        local v1930 = string.gsub(v1927, "${(.-)}", string.format("\a%s%%1\a%s", v1928, v1929));
        if v1930:sub(1, 1) ~= "\a" then
            v1930 = "\a" .. v1929 .. v1930;
        end;
        return v1930;
    end;
    l_v1688_0 = function()
        -- upvalues: l_l_angles_0_4 (ref)
        for v1931 = 1, #l_l_angles_0_4 do
            l_l_angles_0_4[v1931] = nil;
        end;
    end;
    l_v1689_0 = function(v1932)
        -- upvalues: l_v927_3 (ref), l_v928_4 (ref)
        if v1932 == "Off" then
            return nil;
        elseif v1932 == "Icon" then
            return l_v927_3;
        elseif v1932 == "Text" then
            return l_v928_4;
        else
            return v1932;
        end;
    end;
    l_v1690_0 = function(v1933, v1934, v1935, v1936, v1937)
        -- upvalues: l_play_0 (ref), v15 (ref)
        local v1938 = 4;
        if v1936 > 0 then
            local v1939 = math.map(v1936, 0, 1.5, 0, 115, true);
            local v1940 = v1935:clone();
            v1940.a = v1939 * v1937;
            l_play_0.shadow(v1933, v1934, v1940, v15(8 * v1936), 0, v1938);
        end;
        local v1941 = v1935:clone();
        v1941.a = v1941.a * v1937;
        l_play_0.rect(v1933, v1934, v1941, v1938);
    end;
    l_v1691_0 = function()
        -- upvalues: l_v926_4 (ref), l_l_angles_0_4 (ref), l_play_0 (ref), l_v1689_0 (ref), v93 (ref), l_l_match_0_4 (ref), l_v1017_2 (ref), l_v1018_3 (ref), l_v1690_0 (ref), v15 (ref)
        local v1942 = l_v926_4.background_color:get();
        local l_frametime_0 = globals.frametime;
        local v1944 = #l_l_angles_0_4;
        local v1945 = l_play_0.screen_size() / 2;
        v1945.y = v1945.y + l_v926_4.offset:get() * 5;
        local v1946 = l_v926_4.logo:get();
        local v1947 = v1946 == "!";
        local v1948 = l_v1689_0(v1946);
        local v1949 = 4;
        local v1950 = "";
        local v1951 = l_play_0.measure_text(v1949, v1950, v1948);
        for v1952 = v1944, 1, -1 do
            local v1953 = l_l_angles_0_4[v1952];
            local v1954 = v1953.time > 0 and v1944 - v1952 < 6;
            v1953.alpha = v93.interp(v1953.alpha, v1954, 0.075);
            if not v1954 then
                if v1953.alpha <= 0 then
                    table.remove(l_l_angles_0_4, v1952);
                end;
            else
                v1953.time = v1953.time - l_frametime_0;
            end;
        end;
        local v1955 = 1;
        local v1956 = "";
        local v1957 = l_v926_4.glow:get() * 0.01;
        for v1958 = 1, #l_l_angles_0_4 do
            local v1959 = l_l_angles_0_4[v1958];
            local l_color_0 = v1959.color;
            local l_text_0 = v1959.text;
            local l_alpha_1 = v1959.alpha;
            if not v1947 then
                l_text_0 = l_text_0 .. " !";
            end;
            local v1963 = l_play_0.measure_text(v1955, v1956, l_text_0);
            local v1964 = v1963 + vector(l_l_match_0_4, l_v1017_2) * 2;
            if v1948 ~= nil then
                v1964.x = v1964.x + v1951.x + l_v1018_3;
            end;
            local v1965 = v1945 - v1964 / 2;
            local v1966 = v1965 + vector(l_l_match_0_4, l_v1017_2);
            local v1967 = vector(v1966.x, v1965.y + (v1964.y - v1951.y) / 2);
            l_v1690_0(v1965, v1965 + v1964, v1942, v1957, l_alpha_1);
            if v1948 ~= nil then
                local v1968 = l_color_0:clone();
                v1968.a = v1968.a * l_alpha_1;
                l_play_0.text(v1949, v1967, v1968, v1950, v1948);
                v1966.x = v1966.x + v1951.x + l_v1018_3;
            end;
            v1966.y = v1965.y + (v1964.y - v1963.y) / 2;
            local v1969 = color(255, 255, 255, 255 * l_alpha_1);
            l_play_0.text(v1955, v1966, v1969, v1956, l_text_0);
            v1945.y = v1945.y - v15((v1964.y + 5) * l_alpha_1);
        end;
    end;
    l_v1692_0 = function(v1970)
        -- upvalues: l_v926_4 (ref), l_v1020_2 (ref), l_v1536_1 (ref), l_v1533_1 (ref), l_v1535_1 (ref), l_l_aimtools_0_1 (ref)
        local l_target_2 = v1970.target;
        if l_target_2 == nil then
            return;
        else
            local v1972 = l_v926_4.hit_color:get();
            local v1973 = l_target_2:get_name();
            local l_m_iHealth_6 = l_target_2.m_iHealth;
            local l_backtrack_0 = v1970.backtrack;
            local l_hitchance_0 = v1970.hitchance;
            local v1977 = v1970.damage or 0;
            local v1978 = v1970.wanted_damage or 0;
            local v1979 = l_v1020_2[v1970.hitgroup] or "?";
            local v1980 = l_v1020_2[v1970.wanted_hitgroup] or "?";
            local v1981 = v1978 - v1977 > 10;
            local v1982 = v1980 ~= v1979;
            local v1983 = nil;
            v1983 = string.format("hit ${%s}'s ${%s} for ${%d} dmg", v1973, v1979, v1977);
            local v1984 = nil;
            local v1985 = {};
            table.insert(v1985, string.format("hit: ${%s}", v1973));
            if v1982 then
                table.insert(v1985, string.format("hb: ${%s}/%s", v1979, v1980));
            else
                table.insert(v1985, string.format("hb: ${%s}", v1979));
            end;
            if v1981 then
                table.insert(v1985, string.format("dmg: ${%d}/%d", v1977, v1978));
            else
                table.insert(v1985, string.format("dmg: ${%d}", v1977));
            end;
            table.insert(v1985, string.format("bt: ${%d}", l_backtrack_0));
            table.insert(v1985, string.format("hc: ${%d%%}", l_hitchance_0));
            if l_m_iHealth_6 <= 0 then
                table.insert(v1985, "rph: ${0} (dead)");
            else
                table.insert(v1985, string.format("rph: ${%d}", l_m_iHealth_6));
            end;
            v1984 = table.concat(v1985, "  ");
            v1983 = l_v1536_1(v1983, v1972:to_hex(), "c8c8c8ff");
            v1984 = l_v1536_1(v1984, v1972:to_hex(), "c8c8c8ff");
            l_v1533_1(v1984);
            l_v1535_1(v1984);
            l_l_aimtools_0_1(v1972, v1983);
            return;
        end;
    end;
    l_v1693_0 = function(v1986)
        -- upvalues: l_v926_4 (ref), l_v1020_2 (ref), l_v1536_1 (ref), l_v1533_1 (ref), l_v1535_1 (ref), l_l_aimtools_0_1 (ref)
        local l_target_3 = v1986.target;
        if l_target_3 == nil then
            return;
        else
            local v1988 = l_v926_4.miss_color:get();
            local v1989 = l_target_3:get_name();
            local l_state_2 = v1986.state;
            local l_hitchance_1 = v1986.hitchance;
            local l_backtrack_1 = v1986.backtrack;
            local v1993 = v1986.wanted_damage or 0;
            local v1994 = l_v1020_2[v1986.wanted_hitgroup] or "?";
            local v1995 = nil;
            v1995 = string.format("missed ${%s}'s ${%s} due to ${%s}", v1989, v1994, l_state_2);
            local v1996 = nil;
            local v1997 = {};
            table.insert(v1997, string.format("missed: ${%s}", v1989));
            table.insert(v1997, string.format("hb: ${%s}", v1994));
            table.insert(v1997, string.format("due: ${%s}", l_state_2));
            table.insert(v1997, string.format("dmg: ${%d}", v1993));
            table.insert(v1997, string.format("bt: ${%d}", l_backtrack_1));
            table.insert(v1997, string.format("hc: ${%d%%}", l_hitchance_1));
            v1996 = table.concat(v1997, "  ");
            v1995 = l_v1536_1(v1995, v1988:to_hex(), "c8c8c8ff");
            v1996 = l_v1536_1(v1996, v1988:to_hex(), "c8c8c8ff");
            l_v1533_1(v1996);
            l_v1535_1(v1996);
            l_l_aimtools_0_1(v1988, v1995);
            return;
        end;
    end;
    l_v1694_1 = function(v1998)
        -- upvalues: l_v1692_0 (ref), l_v1693_0 (ref)
        if v1998.state == nil then
            l_v1692_0(v1998);
        else
            l_v1693_0(v1998);
        end;
    end;
    l_v1695_0 = function(v1999)
        -- upvalues: l_v1030_2 (ref), l_v926_4 (ref), l_v1536_1 (ref), l_v1533_1 (ref), l_v1535_1 (ref), l_l_aimtools_0_1 (ref)
        local v2000 = entity.get_local_player();
        local v2001 = entity.get(v1999.userid, true);
        if entity.get(v1999.attacker, true) ~= v2000 or v2001 == v2000 then
            return;
        else
            local l_weapon_0 = v1999.weapon;
            local v2003 = l_v1030_2[l_weapon_0];
            if v2003 == nil then
                return;
            else
                local v2004 = l_v926_4.hit_color:get();
                local v2005 = v2001:get_name();
                local l_m_iHealth_7 = v2001.m_iHealth;
                local l_dmg_health_0 = v1999.dmg_health;
                local v2008 = nil;
                v2008 = string.format("%s ${%s} for ${%d} dmg", v2003, v2005, l_dmg_health_0);
                local v2009 = nil;
                local v2010 = {};
                table.insert(v2010, string.format("harmed: ${%s}", v2005));
                table.insert(v2010, string.format("dmg: ${%d}", l_dmg_health_0));
                if l_m_iHealth_7 <= 0 then
                    table.insert(v2010, "rph: ${0} (dead)");
                else
                    table.insert(v2010, string.format("rph: ${%d}", l_m_iHealth_7));
                end;
                table.insert(v2010, string.format("wep: ${%s}", l_weapon_0));
                v2009 = table.concat(v2010, "  ");
                v2008 = l_v1536_1(v2008, v2004:to_hex(), "c8c8c8ff");
                v2009 = l_v1536_1(v2009, v2004:to_hex(), "c8c8c8ff");
                l_v1533_1(v2009);
                l_v1535_1(v2009);
                l_l_aimtools_0_1(v2004, v2008);
                return;
            end;
        end;
    end;
    v1696 = nil;
    v1697 = function(v2011)
        -- upvalues: l_v1688_0 (ref), l_v1691_0 (ref)
        local v2012 = v2011:get("Render");
        if not v2012 then
            l_v1688_0();
        end;
        events.render(l_v1691_0, v2012);
    end;
    do
        local l_v1697_0 = v1697;
        v1698 = function(v2014)
            -- upvalues: l_v1688_0 (ref), l_v1691_0 (ref), l_v926_4 (ref), l_v1697_0 (ref), l_v1694_1 (ref), l_v1695_0 (ref)
            local v2015 = v2014:get();
            if not v2015 then
                l_v1688_0();
            end;
            if not v2015 then
                events.render(l_v1691_0, false);
            end;
            if v2015 then
                l_v926_4.output:set_callback(l_v1697_0, true);
            else
                l_v926_4.output:unset_callback(l_v1697_0);
            end;
            events.aim_ack(l_v1694_1, v2015);
            events.player_hurt(l_v1695_0, v2015);
        end;
        l_v926_4.enabled:set_callback(v1698, true);
    end;
end;
v926 = nil;
v927 = v364.ragebot.dormant_aimbot;
v928 = true;
l_match_0 = 5;
v1017 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v1018 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
l_angles_0 = nil;
v1020 = nil;
v1030 = nil;
v1533 = nil;
l_aimtools_0 = nil;
v1535 = false;
v1536 = false;
v1688 = 1;
v1689 = 0;
v1690 = {
    [0] = "Generic", 
    [1] = "Head", 
    [2] = "Chest", 
    [3] = "Stomach", 
    [4] = "Chest", 
    [5] = "Chest", 
    [6] = "Legs", 
    [7] = "Legs", 
    [8] = "Head", 
    [9] = nil, 
    [10] = "Gear"
};
v1691 = {
    [1] = {
        hitbox = "Stomach", 
        scale = 5, 
        vec = vector(0, 0, 40)
    }, 
    [2] = {
        hitbox = "Chest", 
        scale = 6, 
        vec = vector(0, 0, 50)
    }, 
    [3] = {
        hitbox = "Head", 
        scale = 3, 
        vec = vector(0, 0, 58)
    }, 
    [4] = {
        hitbox = "Legs", 
        scale = 4, 
        vec = vector(0, 0, 20)
    }
};
v1692 = function(v2016, v2017)
    for v2018 = 1, #v2016 do
        if v2016[v2018] == v2017 then
            return true;
        end;
    end;
    return false;
end;
v1693 = function(v2019)
    return v2019 >= 1 and v2019 <= 6;
end;
v1694 = function()
    local v2020 = {};
    local v2021 = entity.get_player_resource();
    for v2022 = 1, globals.max_players do
        local v2023 = entity.get(v2022);
        if v2023 ~= nil and v2021.m_bConnected[v2022] and v2023:is_enemy() and v2023:is_dormant() then
            table.insert(v2020, v2023);
        end;
    end;
    return v2020;
end;
v1695 = function(v2024, v2025, v2026)
    local v2027 = v2024:to(v2025):angles();
    local v2028 = math.rad(v2027.y + 90);
    local v2029 = vector(math.cos(v2028), math.sin(v2028), 0) * v2026;
    return {
        [1] = {
            text = "Middle", 
            vec = v2025
        }, 
        [2] = {
            text = "Left", 
            vec = v2025 + v2029
        }, 
        [3] = {
            text = "Right", 
            vec = v2025 - v2029
        }
    };
end;
v1696 = function(v2030, v2031, v2032, v2033)
    local v2034, v2035 = utils.trace_bullet(v2030, v2031, v2032, v2033);
    if v2035 ~= nil then
        local l_entity_1 = v2035.entity;
        if l_entity_1 == nil then
            return 0, v2035;
        elseif l_entity_1:is_player() and not l_entity_1:is_enemy() then
            return 0, v2035;
        end;
    end;
    return v2034, v2035;
end;
do
    local l_v927_4, l_v928_5, l_l_match_0_5, l_v1017_3, l_v1018_4, l_l_angles_0_5, l_v1020_3, l_v1030_3, l_v1533_2, l_l_aimtools_0_2, l_v1535_2, l_v1536_2, l_v1688_1, l_v1689_1, l_v1690_1, l_v1691_1, l_v1692_1, l_v1693_1, l_v1694_2, l_v1695_1, l_v1696_0, l_v1697_1, l_v1698_0, l_v1699_0, l_v1700_0 = v927, v928, l_match_0, v1017, v1018, l_angles_0, v1020, v1030, v1533, l_aimtools_0, v1535, v1536, v1688, v1689, v1690, v1691, v1692, v1693, v1694, v1695, v1696, v1697, v1698, v1699, v1700;
    l_v1697_1 = function(v2062)
        -- upvalues: l_v1017_3 (ref), l_v1689_1 (ref), l_v1693_1 (ref), l_v1694_2 (ref), l_v927_4 (ref), l_v1688_1 (ref), l_v1018_4 (ref), l_v1691_1 (ref), l_v1692_1 (ref), l_v1695_1 (ref), l_v1696_0 (ref), l_l_angles_0_5 (ref), l_v1030_3 (ref), l_v1533_2 (ref), l_v1020_3 (ref), l_l_aimtools_0_2 (ref), l_v928_5 (ref), l_l_match_0_5 (ref), l_v1536_2 (ref)
        l_v1017_3:override(false);
        local v2063 = entity.get_local_player();
        if v2063 == nil then
            return;
        else
            local v2064 = v2063:get_player_weapon();
            if v2064 == nil then
                return;
            else
                local v2065 = v2064:get_weapon_info();
                if v2065 == nil then
                    return;
                else
                    local v2066 = v2064:get_inaccuracy();
                    if v2066 == nil then
                        return;
                    else
                        local l_tickcount_2 = globals.tickcount;
                        local v2068 = v2063:get_eye_position();
                        local l_current_0 = v2063:get_simulation_time().current;
                        local v2070 = bit.band(v2063.m_fFlags, bit.lshift(1, 0)) ~= 0;
                        if l_tickcount_2 < l_v1689_1 then
                            return;
                        elseif v2062.in_jump and not v2070 then
                            return;
                        else
                            local l_weapon_type_3 = v2065.weapon_type;
                            if not l_v1693_1(l_weapon_type_3) or v2064.m_iClip1 <= 0 then
                                return false;
                            else
                                local v2072 = l_v1694_2();
                                local v2073 = l_v927_4.hitboxes:get();
                                if l_tickcount_2 % #v2072 ~= 0 then
                                    l_v1688_1 = l_v1688_1 + 1;
                                else
                                    l_v1688_1 = 1;
                                end;
                                local v2074 = v2072[l_v1688_1];
                                if v2074 == nil then
                                    return;
                                else
                                    local v2075 = v2074:get_bbox();
                                    local v2076 = v2074:get_origin();
                                    local l_m_flDuckAmount_0 = v2074.m_flDuckAmount;
                                    local v2078 = l_v927_4.alpha_modifier:get();
                                    local v2079 = l_v927_4.minimum_damage:get();
                                    if v2079 == 0 then
                                        v2079 = l_v1018_4:get();
                                    end;
                                    if v2079 >= 100 then
                                        v2079 = v2079 - 100 + v2074.m_iHealth;
                                    end;
                                    local v2080 = {};
                                    for v2081 = 1, #l_v1691_1 do
                                        local v2082 = l_v1691_1[v2081];
                                        local l_vec_0 = v2082.vec;
                                        local l_scale_0 = v2082.scale;
                                        local l_hitbox_0 = v2082.hitbox;
                                        if l_hitbox_0 == "Head" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                        end;
                                        if l_hitbox_0 == "Chest" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                        end;
                                        if #v2073 ~= 0 then
                                            if l_v1692_1(v2073, l_hitbox_0) then
                                                table.insert(v2080, {
                                                    vec = l_vec_0, 
                                                    scale = l_scale_0, 
                                                    hitbox = l_hitbox_0
                                                });
                                            end;
                                        else
                                            table.insert(v2080, 1, {
                                                vec = l_vec_0, 
                                                scale = l_scale_0, 
                                                hitbox = l_hitbox_0
                                            });
                                        end;
                                    end;
                                    if not (v2065.is_revolver and not (v2064.m_flNextPrimaryAttack >= l_current_0) or math.max(v2063.m_flNextAttack, v2064.m_flNextPrimaryAttack, v2064.m_flNextSecondaryAttack) < l_current_0) then
                                        return;
                                    else
                                        local v2086 = nil;
                                        local v2087 = nil;
                                        if math.floor(v2075.alpha * 100) + 5 <= v2078 then
                                            return;
                                        else
                                            for v2088 = 1, #v2080 do
                                                local v2089 = v2080[v2088];
                                                local v2090 = l_v1695_1(v2068, v2076 + v2089.vec, v2089.scale);
                                                for v2091 = 1, #v2090 do
                                                    local v2092 = v2090[v2091];
                                                    local l_vec_1 = v2092.vec;
                                                    local v2095, v2096 = l_v1696_0(v2063, v2068, l_vec_1, function(v2094)
                                                        -- upvalues: v2074 (ref)
                                                        return v2094 == v2074;
                                                    end);
                                                    if (v2096 == nil or not v2096:is_visible()) and v2095 ~= 0 and v2079 < v2095 then
                                                        v2086 = l_vec_1;
                                                        v2087 = v2095;
                                                        l_l_angles_0_5 = v2074;
                                                        l_v1030_3 = v2089.hitbox;
                                                        l_v1533_2 = v2095;
                                                        l_v1020_3 = v2092.text;
                                                        l_l_aimtools_0_2 = v2075.alpha;
                                                        break;
                                                    end;
                                                end;
                                                if v2086 and v2087 then
                                                    break;
                                                end;
                                            end;
                                            if not v2086 or not v2087 then
                                                return;
                                            else
                                                local v2097 = v2068:to(v2086):angles();
                                                v2062.block_movement = 1;
                                                if l_v928_5 then
                                                    local v2098 = not v2062.in_jump and v2070;
                                                    local v2099 = v2063.m_bIsScoped or v2063.m_bResumeZoom;
                                                    local v2100 = v2065.weapon_type == l_l_match_0_5;
                                                    if not v2099 and v2100 and v2098 then
                                                        v2062.in_attack2 = true;
                                                    end;
                                                end;
                                                if v2066 < 0.01 then
                                                    v2062.view_angles = v2097;
                                                    v2062.in_attack = true;
                                                    l_v1536_2 = true;
                                                end;
                                                return;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    l_v1698_0 = function(v2101)
        -- upvalues: l_v1536_2 (ref), l_v1535_2 (ref), l_l_angles_0_5 (ref), l_v1030_3 (ref), l_v1533_2 (ref), l_v1020_3 (ref), l_l_aimtools_0_2 (ref)
        utils.execute_after(0.03, function()
            -- upvalues: v2101 (ref), l_v1536_2 (ref), l_v1535_2 (ref), l_l_angles_0_5 (ref), l_v1030_3 (ref), l_v1533_2 (ref), l_v1020_3 (ref), l_l_aimtools_0_2 (ref)
            if entity.get(v2101.userid, true) == entity.get_local_player() then
                if l_v1536_2 and not l_v1535_2 then
                    events.dormant_miss:call({
                        userid = l_l_angles_0_5, 
                        aim_hitbox = l_v1030_3, 
                        aim_damage = l_v1533_2, 
                        aim_point = l_v1020_3, 
                        accuracy = l_l_aimtools_0_2
                    });
                end;
                l_v1535_2 = false;
                l_v1536_2 = false;
                l_l_angles_0_5 = nil;
                l_v1030_3 = nil;
                l_v1533_2 = nil;
                l_v1020_3 = nil;
                l_l_aimtools_0_2 = nil;
            end;
        end);
    end;
    l_v1699_0 = function(v2102)
        -- upvalues: l_v1536_2 (ref), l_v1535_2 (ref), l_v1690_1 (ref), l_v1020_3 (ref), l_v1030_3 (ref), l_v1533_2 (ref)
        local v2103 = entity.get_local_player();
        local v2104 = entity.get(v2102.userid, true);
        local v2105 = entity.get(v2102.attacker, true);
        if v2104 == nil or v2105 ~= v2103 then
            return;
        else
            local v2106 = v2104:get_bbox();
            if v2106 == nil then
                return;
            else
                if v2104:is_dormant() and l_v1536_2 == true then
                    l_v1535_2 = true;
                    events.dormant_hit:call({
                        userid = v2104, 
                        attacker = v2105, 
                        health = v2102.health, 
                        armor = v2102.armor, 
                        weapon = v2102.weapon, 
                        dmg_health = v2102.dmg_health, 
                        dmg_armor = v2102.dmg_armor, 
                        hitgroup = v2102.hitgroup, 
                        accuracy = v2106.alpha, 
                        hitbox = l_v1690_1[v2102.hitgroup], 
                        aim_point = l_v1020_3, 
                        aim_hitbox = l_v1030_3, 
                        aim_damage = l_v1533_2
                    });
                end;
                return;
            end;
        end;
    end;
    l_v1700_0 = function()
        -- upvalues: l_v1017_3 (ref)
        l_v1017_3:override();
    end;
    v1701 = nil;
    v1702 = function(v2107)
        -- upvalues: l_v1017_3 (ref), l_v1700_0 (ref), l_v1697_1 (ref), l_v1698_0 (ref), l_v1699_0 (ref)
        local v2108 = v2107:get();
        if not v2108 then
            l_v1017_3:override();
        end;
        events.shutdown(l_v1700_0, v2108);
        events.createmove(l_v1697_1, v2108);
        events.weapon_fire(l_v1698_0, v2108);
        events.player_hurt(l_v1699_0, v2108);
    end;
    l_v927_4.enabled:set_callback(v1702, true);
end;
v927 = nil;
v928 = v364.ragebot.force_shot;
l_match_0 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
v1017 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance", "Double Tap");
v1018 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points");
l_angles_0 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage", "Delay Shot");
v1020 = ui.find("Aimbot", "Ragebot", "Safety", "Ensure Hitbox Safety");
do
    local l_v928_6, l_l_match_0_6, l_v1017_4, l_v1018_5, l_l_angles_0_6, l_v1020_4, l_v1030_4 = v928, l_match_0, v1017, v1018, l_angles_0, v1020, v1030;
    l_v1030_4 = function()
        -- upvalues: l_v928_6 (ref), l_weapons_0 (ref), l_v1018_5 (ref), l_l_angles_0_6 (ref), l_v1020_4 (ref), l_l_match_0_6 (ref), l_v1017_4 (ref)
        if not l_v928_6.enabled:get() then
            return;
        else
            local v2116 = entity.get_local_player();
            if v2116 == nil then
                return;
            else
                local v2117 = v2116:get_player_weapon();
                if v2117 == nil then
                    return;
                else
                    local v2118 = l_weapons_0(v2117);
                    if v2118 == nil then
                        return;
                    else
                        local l_m_vecVelocity_4 = v2116.m_vecVelocity;
                        local l_m_fFlags_1 = v2116.m_fFlags;
                        local v2121 = l_m_vecVelocity_4:length();
                        local v2122 = bit.band(l_m_fFlags_1, 4) == 4;
                        l_v1018_5:override("Default");
                        l_l_angles_0_6:override(false);
                        l_v1020_4:override({});
                        local v2123 = math.floor(math.min(v2118.max_player_speed, v2118.max_player_speed_alt));
                        local v2124 = {
                            cur = math.floor(v2117:get_inaccuracy() * 100), 
                            stand = math.floor(math.min(v2118.inaccuracy_stand, v2118.inaccuracy_stand_alt) * 100), 
                            crouch = math.floor(math.min(v2118.inaccuracy_crouch, v2118.inaccuracy_crouch_alt) * 100), 
                            move = math.floor(math.min(v2118.inaccuracy_move, v2118.inaccuracy_move_alt) * 100)
                        };
                        local v2125 = v2122 and v2124.crouch or v2124.stand;
                        local v2126 = v2125 + (v2124.move - v2125) / v2123 * math.min(v2121, v2123 / 2);
                        if v2124.cur - v2126 <= 0 then
                            l_l_match_0_6:override(0);
                            l_v1017_4:override(0);
                        else
                            l_l_match_0_6:override(nil);
                            l_v1017_4:override(nil);
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    v1533 = nil;
    l_aimtools_0 = function(v2127)
        -- upvalues: l_l_match_0_6 (ref), l_v1017_4 (ref), l_v1018_5 (ref), l_l_angles_0_6 (ref), l_v1020_4 (ref), l_v1030_4 (ref)
        local v2128 = v2127:get();
        if not v2128 then
            l_l_match_0_6:override();
            l_v1017_4:override();
            l_v1018_5:override();
            l_l_angles_0_6:override();
            l_v1020_4:override();
        end;
        events.createmove:set(l_v1030_4, v2128);
    end;
    l_v928_6.enabled:set_callback(l_aimtools_0, true);
end;
v878 = nil;
v924 = nil;
v925 = v364.visuals.aspect_ratio;
v926 = cvar.r_aspectratio;
do
    local l_v925_3, l_v926_5, l_v927_5, l_v928_7, l_l_match_0_7 = v925, v926, v927, v928, l_match_0;
    l_v927_5 = function()
        -- upvalues: l_v926_5 (ref)
        l_v926_5:float(tonumber(l_v926_5:string()), true);
    end;
    l_v928_7 = function(v2134)
        -- upvalues: l_v926_5 (ref)
        l_v926_5:float(v2134, true);
    end;
    l_l_match_0_7 = function()
        -- upvalues: l_v927_5 (ref)
        l_v927_5();
    end;
    v1017 = nil;
    v1018 = function(v2135)
        -- upvalues: l_v928_7 (ref)
        l_v928_7(v2135:get() * 0.01);
    end;
    do
        local l_v1018_6 = v1018;
        l_angles_0 = function(v2137)
            -- upvalues: l_v927_5 (ref), l_v925_3 (ref), l_v1018_6 (ref), l_l_match_0_7 (ref)
            local v2138 = v2137:get();
            if not v2138 then
                l_v927_5();
            end;
            if v2138 then
                l_v925_3.value:set_callback(l_v1018_6, true);
            else
                l_v925_3.value:unset_callback(l_v1018_6);
            end;
            events.shutdown(l_l_match_0_7, v2138);
        end;
        l_v925_3.enabled:set_callback(l_angles_0, true);
    end;
end;
v925 = nil;
v926 = v364.visuals.viewmodel;
v927 = 0;
v928 = cvar.cl_righthand;
l_match_0 = cvar.viewmodel_fov;
v1017 = cvar.viewmodel_offset_x;
v1018 = cvar.viewmodel_offset_y;
l_angles_0 = cvar.viewmodel_offset_z;
v1020 = nil;
v1030 = function(v2139)
    return tonumber(v2139:string());
end;
do
    local l_v926_6, l_v927_6, l_v928_8, l_l_match_0_8, l_v1017_5, l_v1018_7, l_l_angles_0_7, l_v1020_5, l_v1030_5, l_v1533_3, l_l_aimtools_0_3, l_v1535_3, l_v1536_3, l_v1688_2 = v926, v927, v928, l_match_0, v1017, v1018, l_angles_0, v1020, v1030, v1533, l_aimtools_0, v1535, v1536, v1688;
    l_v1533_3 = function(v2154)
        -- upvalues: l_v928_8 (ref)
        if l_v928_8:string() == "1" then
            l_v928_8:int(v2154 and 0 or 1, true);
        else
            l_v928_8:int(v2154 and 1 or 0, true);
        end;
    end;
    l_l_aimtools_0_3 = function()
        -- upvalues: l_l_match_0_8 (ref), l_v1030_5 (ref), l_v1017_5 (ref), l_v1018_7 (ref), l_l_angles_0_7 (ref), l_v928_8 (ref)
        l_l_match_0_8:float(l_v1030_5(l_l_match_0_8), false);
        l_v1017_5:float(l_v1030_5(l_v1017_5), false);
        l_v1018_7:float(l_v1030_5(l_v1018_7), false);
        l_l_angles_0_7:float(l_v1030_5(l_l_angles_0_7), false);
        l_v928_8:int(l_v928_8:string() == "1" and 1 or 0, false);
    end;
    l_v1535_3 = function()
        -- upvalues: l_l_aimtools_0_3 (ref)
        l_l_aimtools_0_3();
    end;
    l_v1536_3 = function()
        -- upvalues: l_v1020_5 (ref), l_v927_6 (ref), l_v1533_3 (ref)
        local v2155 = entity.get_local_player();
        if v2155 == nil then
            return;
        else
            local v2156 = v2155:get_player_weapon();
            if v2156 == nil then
                return;
            else
                local v2157 = v2156:get_weapon_index();
                if l_v1020_5 ~= v2157 then
                    l_v1020_5 = v2157;
                    local v2158 = v2156:get_weapon_info();
                    if v2158 == nil then
                        return;
                    else
                        local v2159 = v2158.weapon_type == l_v927_6;
                        l_v1533_3(v2159);
                    end;
                end;
                return;
            end;
        end;
    end;
    l_v1688_2 = function(v2160)
        -- upvalues: l_l_aimtools_0_3 (ref), l_v1536_3 (ref), l_v1535_3 (ref)
        if not v2160 then
            l_l_aimtools_0_3();
        end;
        if not v2160 then
            events.pre_render(l_v1536_3, v2160);
        end;
        events.shutdown(l_v1535_3, v2160);
    end;
    v1689 = nil;
    v1690 = function(v2161)
        -- upvalues: l_l_match_0_8 (ref)
        l_l_match_0_8:float(v2161:get() * 0.01, true);
    end;
    v1691 = function(v2162)
        -- upvalues: l_v1017_5 (ref)
        l_v1017_5:float(v2162:get() * 0.01, true);
    end;
    v1692 = function(v2163)
        -- upvalues: l_v1018_7 (ref)
        l_v1018_7:float(v2163:get() * 0.01, true);
    end;
    v1693 = function(v2164)
        -- upvalues: l_l_angles_0_7 (ref)
        l_l_angles_0_7:float(v2164:get() * 0.01, true);
    end;
    v1694 = function(v2165)
        -- upvalues: l_v928_8 (ref), l_v1020_5 (ref), l_v1536_3 (ref)
        local v2166 = v2165:get();
        if not v2166 then
            l_v928_8:int(l_v928_8:string() == "1" and 1 or 0, false);
        else
            l_v1020_5 = nil;
        end;
        events.pre_render(l_v1536_3, v2166);
    end;
    do
        local l_v1690_2, l_v1691_2, l_v1692_2, l_v1693_2, l_v1694_3 = v1690, v1691, v1692, v1693, v1694;
        v1695 = function(v2172)
            -- upvalues: l_v926_6 (ref), l_v1690_2 (ref), l_v1691_2 (ref), l_v1692_2 (ref), l_v1693_2 (ref), l_v1694_3 (ref), l_v1688_2 (ref)
            local v2173 = v2172:get();
            if v2173 then
                l_v926_6.fov:set_callback(l_v1690_2, true);
                l_v926_6.offset_x:set_callback(l_v1691_2, true);
                l_v926_6.offset_y:set_callback(l_v1692_2, true);
                l_v926_6.offset_z:set_callback(l_v1693_2, true);
                l_v926_6.opposite_knife_hand:set_callback(l_v1694_3, true);
            else
                l_v926_6.fov:unset_callback(l_v1690_2);
                l_v926_6.offset_x:unset_callback(l_v1691_2);
                l_v926_6.offset_y:unset_callback(l_v1692_2);
                l_v926_6.offset_z:unset_callback(l_v1693_2);
                l_v926_6.opposite_knife_hand:unset_callback(l_v1694_3);
            end;
            l_v1688_2(v2173);
        end;
        l_v926_6.enabled:set_callback(v1695, true);
    end;
end;
v926 = nil;
v927 = v364.visuals.indicators;
v928 = {};
l_match_0 = {
    [1] = {
        [1] = "\226\156\166", 
        [2] = 0, 
        [3] = 10, 
        [4] = 0.5
    }, 
    [2] = {
        [1] = "\226\139\134", 
        [2] = -3, 
        [3] = 3, 
        [4] = 0.2
    }, 
    [3] = {
        [1] = "\226\152\133", 
        [2] = -1, 
        [3] = 8, 
        [4] = 0.4
    }, 
    [4] = {
        [1] = "\226\156\166", 
        [2] = 0, 
        [3] = 6, 
        [4] = 0.7
    }, 
    [5] = {
        [1] = "\226\139\134", 
        [2] = -2, 
        [3] = 2, 
        [4] = 0.3
    }, 
    [6] = {
        [1] = "\226\152\133", 
        [2] = 1, 
        [3] = 7, 
        [4] = 0.6
    }, 
    [7] = {
        [1] = "\226\139\134", 
        [2] = 0, 
        [3] = 3, 
        [4] = 0.2
    }, 
    [8] = {
        [1] = "\226\156\166", 
        [2] = 0, 
        [3] = 8, 
        [4] = 0.7
    }, 
    [9] = {
        [1] = "\226\139\134", 
        [2] = -2, 
        [3] = 7, 
        [4] = 0.2
    }
};
v1017 = 0;
v1018 = 0;
l_angles_0 = 0;
v1020 = 0;
v1030 = 0;
v1533 = function()
    -- upvalues: v374 (ref), v32 (ref)
    if not v374.is_onground then
        if v374.is_crouched then
            return "airc";
        else
            return "air";
        end;
    elseif v374.is_crouched then
        if v374.is_moving then
            return "sneak";
        else
            return "crouch";
        end;
    elseif v374.is_moving then
        if v32.antiaim.misc.slow_walk:get() then
            return "walk";
        else
            return "run";
        end;
    else
        return "stand";
    end;
end;
do
    local l_v927_7, l_v928_9, l_l_match_0_9, l_v1017_6 = v927, v928, l_match_0, v1017;
    do
        local l_l_l_match_0_9_0, l_l_v1017_6_0, l_v1018_8, l_l_angles_0_8, l_v1020_6, l_v1030_6, l_v1533_4, l_l_aimtools_0_4, l_v1535_4, l_v1536_4, l_v1688_3, l_v1689_2, l_v1690_3, l_v1691_3, l_v1692_3 = l_l_match_0_9, l_v1017_6, v1018, l_angles_0, v1020, v1030, v1533, l_aimtools_0, v1535, v1536, v1688, v1689, v1690, v1691, v1692;
        l_l_aimtools_0_4 = function(v2193, v2194)
            -- upvalues: l_l_l_match_0_9_0 (ref), l_play_0 (ref), v15 (ref), l_v1018_8 (ref)
            local l_realtime_0 = globals.realtime;
            local v2196 = {};
            local v2197 = #l_l_l_match_0_9_0;
            local v2198 = 0;
            local v2199 = 0;
            for v2200 = 1, v2197 do
                local v2201 = l_l_l_match_0_9_0[v2200];
                local v2202 = l_play_0.measure_text(1, "", v2201[1]);
                v2198 = v2198 + (v2202.x + v2201[2]);
                v2199 = math.max(v2199, v2202.y + v2201[3]);
                v2196[v2200] = v2202;
            end;
            local v2203 = v2193:clone();
            v2203.x = v15(v2203.x - v2198 * 0.5 * (1 - l_v1018_8));
            for v2204 = 1, v2197 do
                local v2205 = l_l_l_match_0_9_0[v2204];
                local v2206 = v2196[v2204];
                local v2207 = v2205[1];
                local v2208 = v2205[2];
                local v2209 = v2205[3];
                local v2210 = v2205[4];
                local v2211 = (math.sin(l_realtime_0 * v2210) * 0.5 + 0.5) * 0.7 + 0.3;
                local v2212 = v2194:clone();
                local v2213 = v2203:clone();
                v2213.x = v2213.x + v2208;
                v2213.y = v2213.y + v2209;
                v2212.a = v2212.a * v2211;
                l_play_0.text(1, v2213, v2212, "", v2207);
                v2203.x = v2203.x + (v2206.x + v2208);
            end;
            v2193.y = v2193.y + v2199 * 0.66;
        end;
        l_v1535_4 = function(v2214, v2215, v2216)
            -- upvalues: v16 (ref), l_play_0 (ref), v129 (ref), v15 (ref), l_v1018_8 (ref)
            local v2217 = 4;
            local l_name_1 = v16.name;
            local v2219 = "";
            local v2220 = l_play_0.measure_text(v2217, v2219, l_name_1);
            local v2221 = -globals.realtime * 1.25;
            l_name_1 = v129.gradient(l_name_1, v2221, v2215, v2216);
            local v2222 = v2214:clone();
            v2222.x = v15(v2222.x - v2220.x * 0.5 * (1 - l_v1018_8));
            l_play_0.text(v2217, v2222, v2215, v2219, l_name_1);
            v2214.y = v2214.y + v2220.y;
        end;
        l_v1536_4 = function(v2223, v2224, v2225)
            -- upvalues: l_v1533_4 (ref), l_play_0 (ref), v15 (ref), l_v1018_8 (ref)
            local v2226 = 1;
            local v2227 = l_v1533_4();
            local v2228 = "";
            local v2229 = l_play_0.measure_text(v2226, v2228, v2227);
            local v2230 = v2224:clone();
            local v2231 = v2223:clone();
            v2230.a = v2230.a * v2225;
            v2231.x = v15(v2231.x - v2229.x * 0.5 * (1 - l_v1018_8));
            l_play_0.text(v2226, v2231, v2230, v2228, v2227);
            v2223.y = v2223.y + v15(v2229.y);
        end;
        l_v1688_3 = function(v2232, v2233, v2234)
            -- upvalues: l_play_0 (ref), v15 (ref), l_v1018_8 (ref)
            local v2235 = 1;
            local v2236 = "dt";
            local v2237 = "";
            local v2238 = l_play_0.measure_text(v2235, v2237, v2236);
            local v2239 = v2233:clone();
            local v2240 = v2232:clone();
            local v2241 = rage.exploit:get();
            v2239 = v2239:lerp(color(255, 0, 50, 255), 1 - v2241 * v2241);
            v2239.a = v2239.a * v2234;
            v2240.x = v15(v2240.x - v2238.x * 0.5 * (1 - l_v1018_8));
            l_play_0.text(v2235, v2240, v2239, v2237, v2236);
            v2232.y = v2232.y + v15(v2238.y * v2234);
        end;
        l_v1689_2 = function(v2242, v2243, v2244)
            -- upvalues: l_play_0 (ref), v15 (ref), l_v1018_8 (ref)
            local v2245 = 1;
            local v2246 = "dmg";
            local v2247 = "";
            local v2248 = l_play_0.measure_text(v2245, v2247, v2246);
            local v2249 = v2243:clone();
            local v2250 = v2242:clone();
            v2249.a = v2249.a * v2244;
            v2250.x = v15(v2250.x - v2248.x * 0.5 * (1 - l_v1018_8));
            l_play_0.text(v2245, v2250, v2249, v2247, v2246);
            v2242.y = v2242.y + v15(v2248.y * v2244);
        end;
        l_v1690_3 = function(v2251, v2252, v2253)
            -- upvalues: l_play_0 (ref), v15 (ref), l_v1018_8 (ref)
            local v2254 = 1;
            local v2255 = "osaa";
            local v2256 = "";
            local v2257 = l_play_0.measure_text(v2254, v2256, v2255);
            local v2258 = v2252:clone();
            local v2259 = v2251:clone();
            v2258.a = v2258.a * v2253;
            v2259.x = v15(v2259.x - v2257.x * 0.5 * (1 - l_v1018_8));
            l_play_0.text(v2254, v2259, v2258, v2256, v2255);
            v2251.y = v2251.y + v15(v2257.y * v2253);
        end;
        l_v1691_3 = function(v2260)
            -- upvalues: v799 (ref), v32 (ref), l_l_v1017_6_0 (ref), v93 (ref), l_v1018_8 (ref), l_l_angles_0_8 (ref), l_v1020_6 (ref), l_v1030_6 (ref)
            local v2261 = v2260:is_alive();
            local l_m_bIsScoped_0 = v2260.m_bIsScoped;
            local v2263 = v799.get(v32.ragebot.selection.min_damage);
            local v2264 = v2263 ~= nil and (v2263.active or false);
            local v2265 = v32.ragebot.main.double_tap[1]:get();
            local v2266 = v32.ragebot.main.hide_shots[1]:get();
            l_l_v1017_6_0 = v93.interp(l_l_v1017_6_0, v2261, 0.05);
            l_v1018_8 = v93.interp(l_v1018_8, l_m_bIsScoped_0, 0.05);
            l_l_angles_0_8 = v93.interp(l_l_angles_0_8, v2265, 0.05);
            l_v1020_6 = v93.interp(l_v1020_6, v2264, 0.05);
            l_v1030_6 = v93.interp(l_v1030_6, v2266, 0.05);
        end;
        l_v1692_3 = function()
            -- upvalues: l_play_0 (ref), l_v927_7 (ref), v15 (ref), l_v1018_8 (ref), l_l_v1017_6_0 (ref), l_l_aimtools_0_4 (ref), l_v1535_4 (ref), l_v1536_4 (ref), l_v1688_3 (ref), l_l_angles_0_8 (ref), l_v1689_2 (ref), l_v1020_6 (ref), l_v1690_3 (ref), l_v1030_6 (ref)
            local v2267 = l_play_0.screen_size() * 0.5;
            local v2268 = l_v927_7.accent_color:get();
            local v2269 = l_v927_7.secondary_color:get();
            v2267.x = v2267.x + v15(10 * l_v1018_8);
            v2267.y = v2267.y + l_v927_7.offset:get();
            v2268.a = v2268.a * l_l_v1017_6_0;
            v2269.a = v2269.a * l_l_v1017_6_0;
            l_l_aimtools_0_4(v2267, v2268);
            l_v1535_4(v2267, v2268, v2269);
            l_v1536_4(v2267, color(255, 255, 255, 200), l_l_v1017_6_0);
            l_v1688_3(v2267, color(255, 255, 255, 200), l_l_angles_0_8 * l_l_v1017_6_0);
            l_v1689_2(v2267, color(255, 255, 255, 200), l_v1020_6 * l_l_v1017_6_0);
            l_v1690_3(v2267, color(255, 255, 255, 200 * (1 - l_l_angles_0_8 * 0.5)), l_v1030_6 * l_l_v1017_6_0);
        end;
        l_v928_9.on_render = function()
            -- upvalues: l_v1691_3 (ref), l_l_v1017_6_0 (ref), l_v1692_3 (ref)
            local v2270 = entity.get_local_player();
            if v2270 == nil then
                return;
            else
                l_v1691_3(v2270);
                if l_l_v1017_6_0 > 0 then
                    l_v1692_3();
                end;
                return;
            end;
        end;
    end;
    l_l_match_0_9 = {};
    l_v1017_6 = "";
    v1018 = 0;
    l_angles_0 = 0;
    v1020 = 0;
    v1030 = 0;
    v1533 = 0;
    l_aimtools_0 = 0;
    v1535 = function(v2271)
        local v2272 = v2271:get_player_weapon();
        if v2272 == nil then
            return false;
        else
            local v2273 = v2272:get_weapon_info();
            if v2273 == nil then
                return false;
            elseif v2273.type ~= 9 then
                return false;
            else
                return true;
            end;
        end;
    end;
    v1536 = function(v2274, v2275)
        -- upvalues: v17 (ref)
        local v2276 = globals.realtime * 3;
        local v2277 = math.abs(math.sin(v2276));
        return v17.lerp(v2274, v2275, v2277);
    end;
    v1688 = function()
        -- upvalues: v374 (ref), v32 (ref)
        if not v374.is_onground then
            return "-AIR-";
        elseif v374.is_crouched then
            return "-CROUCH-";
        elseif v374.is_moving then
            if v32.antiaim.misc.slow_walk:get() then
                return "-WALKING-";
            else
                return "-MOVING-";
            end;
        else
            return "-STANDING-";
        end;
    end;
    do
        local l_l_v1017_6_1, l_v1018_9, l_l_angles_0_9, l_v1020_7, l_v1030_7, l_v1533_5, l_l_aimtools_0_5, l_v1535_5, l_v1536_5, l_v1688_4, l_v1689_3, l_v1690_4, l_v1691_4, l_v1692_4, l_v1693_3, l_v1694_4, l_v1695_2, l_v1696_1 = l_v1017_6, v1018, l_angles_0, v1020, v1030, v1533, l_aimtools_0, v1535, v1536, v1688, v1689, v1690, v1691, v1692, v1693, v1694, v1695, v1696;
        l_v1689_3 = function()
            -- upvalues: v32 (ref), l_l_v1017_6_1 (ref)
            if v32.ragebot.main.double_tap[1]:get() then
                l_l_v1017_6_1 = "DT";
            elseif v32.ragebot.main.hide_shots[1]:get() then
                l_l_v1017_6_1 = "HIDE";
            end;
            return l_l_v1017_6_1, color(255, 255, 255, 255);
        end;
        l_v1690_4 = function(v2296)
            -- upvalues: v375 (ref)
            if v2296 == 0 then
                return "WAITING", color(255, 64, 64, 255);
            elseif v2296 == 1 then
                if v375.defensive_ticks > 0 then
                    return "ACTIVE", color(120, 255, 255, 255);
                else
                    return "READY", color(192, 255, 109, 255);
                end;
            else
                return "CHARGING", color(255, 64, 64, 255):lerp(color(192, 255, 109, 255), v2296);
            end;
        end;
        l_v1691_4 = function(v2297)
            -- upvalues: l_v1535_5 (ref), v799 (ref), v32 (ref), l_v1018_9 (ref), v93 (ref), l_l_angles_0_9 (ref), l_v1030_7 (ref), l_v1533_5 (ref), l_l_aimtools_0_5 (ref)
            local v2298 = v2297:is_alive();
            local l_m_bIsScoped_1 = v2297.m_bIsScoped;
            local v2300 = l_v1535_5(v2297);
            local v2301 = v799.get(v32.ragebot.selection.min_damage);
            local v2302 = v2301 ~= nil and (v2301.active or false);
            local v2303 = v32.ragebot.main.double_tap[1]:get();
            local v2304 = v32.ragebot.main.hide_shots[1]:get();
            local v2305 = 0;
            if v2298 then
                v2305 = v2300 and 0.5 or 1;
            end;
            l_v1018_9 = v93.interp(l_v1018_9, v2305, 0.05);
            l_l_angles_0_9 = v93.interp(l_l_angles_0_9, l_m_bIsScoped_1, 0.05);
            l_v1030_7 = v93.interp(l_v1030_7, v2303, 0.03);
            l_v1533_5 = v93.interp(l_v1533_5, v2302, 0.03);
            l_l_aimtools_0_5 = v93.interp(l_l_aimtools_0_5, v2304, 0.03);
        end;
        l_v1692_4 = function(v2306, v2307, v2308, v2309)
            -- upvalues: l_play_0 (ref), l_v1536_5 (ref), l_l_angles_0_9 (ref)
            local v2310 = 2;
            local v2311 = "";
            local v2312 = "ANGELIC";
            local v2313 = "YAW";
            local v2314 = l_play_0.measure_text(v2310, v2311, v2312);
            local v2315 = l_play_0.measure_text(v2310, v2311, v2313);
            local v2316 = v2314.x + v2315.x;
            local v2317 = math.max(v2314.y, v2315.y);
            local v2318 = v2306:clone();
            local v2319 = v2316 * 0.5;
            local v2320 = l_v1536_5(0.25, 1);
            local v2321 = v2307:clone();
            local v2322 = v2308:clone();
            v2321.a = v2321.a * v2309;
            v2322.a = v2322.a * v2309;
            v2321.a = v2321.a * v2320;
            v2318.x = v2318.x - v2319 * (1 - l_l_angles_0_9) + 1;
            l_play_0.text(v2310, v2318, v2322, v2311, v2312);
            v2318.x = v2318.x + v2314.x;
            l_play_0.text(v2310, v2318, v2321, v2311, v2313);
            v2306.y = v2306.y + (v2317 - 3);
        end;
        l_v1693_3 = function(v2323, _, v2325)
            -- upvalues: l_v1688_4 (ref), l_play_0 (ref), l_v1020_7 (ref), v93 (ref), l_l_angles_0_9 (ref)
            local v2326 = 2;
            local v2327 = "";
            local v2328 = l_v1688_4();
            local v2329 = l_play_0.measure_text(v2326, v2327, v2328);
            local l_x_1 = v2329.x;
            local l_y_0 = v2329.y;
            if l_v1020_7 < l_x_1 then
                l_v1020_7 = v93.interp(l_v1020_7, l_x_1, 0.05);
            else
                l_v1020_7 = l_x_1;
            end;
            local v2332 = v2323:clone();
            local v2333 = l_v1020_7 * 0.5;
            v2332.x = v2332.x - v2333 * (1 - l_l_angles_0_9) + 1;
            local v2334 = color(255, 255, 255, 255);
            v2334.a = v2334.a * v2325;
            l_play_0.push_clip_rect(v2332, v2332 + vector(l_v1020_7, l_y_0));
            l_play_0.text(v2326, v2332, v2334, v2327, v2328);
            l_play_0.pop_clip_rect();
            v2323.y = v2323.y + (l_y_0 - 3);
        end;
        l_v1694_4 = function(v2335, v2336, v2337)
            -- upvalues: l_v1689_3 (ref), l_v1690_4 (ref), l_play_0 (ref), l_l_angles_0_9 (ref)
            local v2338 = 2;
            local v2339 = "";
            local v2340 = rage.exploit:get();
            local v2341, v2342 = l_v1689_3();
            local v2343, v2344 = l_v1690_4(v2340);
            local v2345 = string.format("\a%s%s \a%s%s", v2342:to_hex(), v2341, v2344:to_hex(), v2343);
            local v2346 = l_play_0.measure_text(v2338, v2339, v2345);
            local l_x_2 = v2346.x;
            local l_y_1 = v2346.y;
            local v2349 = v2335:clone();
            local v2350 = l_x_2 * 0.5;
            v2349.x = v2349.x - v2350 * v2336 * (1 - l_l_angles_0_9) + 1;
            local v2351 = color(255, 255, 255, 255);
            v2351.a = v2351.a * v2337 * v2336;
            local v2352 = v2351:clone();
            v2352.a = v2352.a * 0.5;
            l_play_0.push_clip_rect(v2349, v2349 + vector(l_x_2 * v2336, l_y_1));
            l_play_0.text(v2338, v2349, v2352, v2339, v2345);
            l_play_0.pop_clip_rect();
            l_play_0.push_clip_rect(v2349, v2349 + vector(l_x_2 * v2336 * v2340, l_y_1));
            l_play_0.text(v2338, v2349, v2351, v2339, v2345);
            l_play_0.pop_clip_rect();
            v2335.y = v2335.y + (l_y_1 - 3) * v2336;
        end;
        l_v1695_2 = function(v2353, v2354, v2355)
            -- upvalues: l_play_0 (ref), l_l_angles_0_9 (ref)
            local v2356 = 2;
            local v2357 = "";
            local v2358 = "DMG";
            local v2359 = l_play_0.measure_text(v2356, v2357, v2358);
            local l_x_3 = v2359.x;
            local l_y_2 = v2359.y;
            local v2362 = v2353:clone();
            local v2363 = l_x_3 * 0.5;
            v2362.x = v2362.x - v2363 * v2354 * (1 - l_l_angles_0_9) + 1;
            local v2364 = color(255, 255, 255, 255);
            v2364.a = v2364.a * v2355 * v2354;
            l_play_0.push_clip_rect(v2362, v2362 + vector(l_x_3 * v2354, l_y_2));
            l_play_0.text(v2356, v2362, v2364, v2357, v2358);
            l_play_0.pop_clip_rect();
            v2353.y = v2353.y + (l_y_2 - 3) * v2354;
        end;
        l_v1696_1 = function()
            -- upvalues: l_play_0 (ref), l_v927_7 (ref), l_v1030_7 (ref), l_l_aimtools_0_5 (ref), v15 (ref), l_l_angles_0_9 (ref), l_v1692_4 (ref), l_v1018_9 (ref), l_v1693_3 (ref), l_v1694_4 (ref), l_v1695_2 (ref), l_v1533_5 (ref)
            local v2365 = l_play_0.screen_size() * 0.5;
            local v2366 = l_v927_7.accent_color:get();
            local v2367 = l_v927_7.secondary_color:get();
            local v2368 = math.max(l_v1030_7, l_l_aimtools_0_5);
            v2365.x = v2365.x + v15(10 * l_l_angles_0_9);
            v2365.y = v2365.y + l_v927_7.offset:get();
            l_v1692_4(v2365, v2366, v2367, l_v1018_9);
            l_v1693_3(v2365, color(255, 255, 255, 255), l_v1018_9);
            l_v1694_4(v2365, v2368, l_v1018_9);
            l_v1695_2(v2365, l_v1533_5, l_v1018_9);
        end;
        l_l_match_0_9.on_render = function()
            -- upvalues: l_v1691_4 (ref), l_v1018_9 (ref), l_v1696_1 (ref)
            local v2369 = entity.get_local_player();
            if v2369 == nil then
                return;
            else
                l_v1691_4(v2369);
                if l_v1018_9 > 0 then
                    l_v1696_1();
                end;
                return;
            end;
        end;
    end;
    l_v1017_6 = function(v2370)
        -- upvalues: l_v928_9 (ref), l_l_match_0_9 (ref)
        local v2371 = v2370 == 1;
        local v2372 = v2370 == 2;
        events.render(l_v928_9.on_render, v2371);
        events.render(l_l_match_0_9.on_render, v2372);
    end;
    v1018 = nil;
    l_angles_0 = function(v2373)
        -- upvalues: l_v1017_6 (ref)
        l_v1017_6(v2373:get());
    end;
    do
        local l_l_angles_0_10 = l_angles_0;
        v1020 = function(v2375)
            -- upvalues: l_v1017_6 (ref), l_v927_7 (ref), l_l_angles_0_10 (ref)
            local v2376 = v2375:get();
            if not v2376 then
                l_v1017_6(nil);
            end;
            if v2376 then
                l_v927_7.style:set_callback(l_l_angles_0_10, true);
            else
                l_v927_7.style:unset_callback(l_l_angles_0_10);
            end;
        end;
        l_v927_7.enabled:set_callback(v1020, true);
    end;
end;
v927 = nil;
v928 = v364.visuals.solus_ui;
l_match_0 = 5;
v1017 = 1;
v1018 = function(v2377, v2378)
    local v2379 = {};
    for v2380 = 1, v2378 do
        v2379[v2380] = v2377;
    end;
    return v2379;
end;
l_angles_0 = function(v2381, v2382, v2383)
    if v2383 or v2381[#v2381] ~= v2382 then
        table.insert(v2381, v2382);
        table.remove(v2381, 1);
    end;
end;
v1020 = function(v2384)
    local v2385 = 0;
    local v2386 = 0;
    for _, v2388 in pairs(v2384) do
        v2386 = v2386 + v2388;
        v2385 = v2385 + 1;
    end;
    return v2386 / v2385;
end;
v1030 = function()
    -- upvalues: l_play_0 (ref)
    return {
        draw = function(_, v2390, v2391, v2392, v2393, v2394, v2395)
            -- upvalues: l_play_0 (ref)
            local l_v2391_0 = v2391;
            local l_clr_1_0 = v2394.clr_1;
            v2391 = 0;
            v2392 = v2392 - l_v2391_0;
            v2394.h = v2394.h - v2394.thickness;
            if v2395 then
                l_play_0.rect_outline(vector(v2394.x, v2394.y), vector(v2394.x + v2394.w - 1, v2394.y + v2394.h - 1 + v2394.thickness), l_clr_1_0);
            end;
            if v2391 == v2392 then
                l_play_0.line(vector(v2394.x, v2394.y + v2394.h), vector(v2394.x + v2394.w, v2394.y + v2394.h), l_clr_1_0);
                return;
            else
                local v2398 = v2394.w / (v2393 - 1);
                local v2399 = v2392 - v2391;
                for v2400 = 1, v2393 - 1 do
                    local v2401 = vector((v2390[v2400] - l_v2391_0) / v2399, (v2390[v2400 + 1] - l_v2391_0) / v2399);
                    local v2402 = {
                        vector(v2394.x + v2398 * (v2400 - 1), v2394.y + v2394.h - v2394.h * v2401.x), 
                        vector(v2394.x + v2398 * v2400, v2394.y + v2394.h - v2394.h * v2401.y)
                    };
                    for v2403 = 1, v2394.thickness do
                        l_play_0.line(vector(v2402[1].x, v2402[1].y + v2403 - 1), vector(v2402[2].x, v2402[2].y + v2403 - 1), l_clr_1_0);
                    end;
                end;
                return;
            end;
        end, 
        draw_histogram = function(_, v2405, v2406, v2407, v2408, v2409, v2410)
            -- upvalues: l_play_0 (ref)
            local l_v2406_0 = v2406;
            v2406 = 0;
            v2407 = v2407 - l_v2406_0;
            if v2410 then
                l_play_0.rect_outline(vector(v2409.x, v2409.y), vector(v2409.x + v2409.w - 1, v2409.y + v2409.h - 1), color(255, 255, 255, 255));
            end;
            local v2412 = v2409.w / (v2408 - 1);
            local v2413 = v2407 - v2406;
            for v2414 = 1, v2408 - 1 do
                local v2415 = vector((v2405[v2414] - l_v2406_0) / v2413, (v2405[v2414 + 1] - l_v2406_0) / v2413);
                local v2416 = {
                    [1] = vector(math.floor(v2409.x + v2412 * (v2414 - 1)), math.floor(v2409.y + v2409.h - v2409.h * v2415.x)), 
                    [2] = vector(math.floor(v2409.x + v2412 * v2414), math.floor(v2409.y + v2409.h)), 
                    isZero = math.floor(v2409.y + v2409.h) == math.floor(v2409.y + v2409.h - v2409.h * v2415.x)
                };
                if v2409.draw_bar == "fill" then
                    l_play_0.rect(v2416[1], v2416[2], v2409.clr_1);
                elseif v2409.draw_bar == "gradient_fadeout" then
                    local v2417 = v2409.clr_1:clone();
                    local v2418 = v2409.clr_1:clone();
                    v2418.a = 0;
                    l_play_0.gradient(v2416[1], v2416[2], v2417, v2417, v2418, v2418);
                elseif v2409.draw_bar == "gradient_fadein" then
                    local v2419 = v2409.clr_1:clone();
                    local v2420 = v2409.clr_1:clone();
                    v2420.a = 0;
                    l_play_0.gradient(v2416[1], v2416[2], v2420, v2420, v2419, v2419);
                end;
                if v2409.draw_peeks and not v2416.isZero then
                    l_play_0.line(v2416[1], v2416[2], v2409.clr_2);
                end;
            end;
        end
    };
end;
v1533 = function(v2421, v2422, v2423, v2424, v2425, ...)
    -- upvalues: l_play_0 (ref)
    l_play_0.rect(vector(v2421, v2422), vector(v2421 + v2423, v2422 + v2424), v2425, ...);
end;
l_aimtools_0 = function(v2426, v2427, v2428, v2429, v2430, v2431, v2432, ...)
    -- upvalues: l_play_0 (ref)
    local v2433 = nil;
    local v2434 = nil;
    local v2435 = nil;
    local v2436 = nil;
    if v2432 then
        local l_v2430_0 = v2430;
        v2435 = v2430;
        v2433 = l_v2430_0;
        l_v2430_0 = v2431;
        v2436 = v2431;
        v2434 = l_v2430_0;
    else
        local l_v2430_1 = v2430;
        v2434 = v2430;
        v2433 = l_v2430_1;
        l_v2430_1 = v2431;
        v2436 = v2431;
        v2435 = l_v2430_1;
    end;
    l_play_0.gradient(vector(v2426, v2427), vector(v2426 + v2428, v2427 + v2429), v2433, v2434, v2435, v2436, ...);
end;
do
    local l_v928_10, l_l_match_0_10, l_v1017_7, l_l_angles_0_11, l_v1020_8, l_v1533_6, l_l_aimtools_0_6, l_v1535_6, l_v1536_6, l_v1688_5, l_v1689_4, l_v1690_5, l_v1691_5 = v928, l_match_0, v1017, l_angles_0, v1020, v1533, l_aimtools_0, v1535, v1536, v1688, v1689, v1690, v1691;
    l_v1535_6 = function(v2452, v2453, v2454, v2455)
        -- upvalues: l_play_0 (ref), l_l_match_0_10 (ref), l_v1533_6 (ref), l_v1017_7 (ref), l_l_aimtools_0_6 (ref)
        local l_x_4 = v2452.x;
        local l_y_3 = v2452.y;
        local v2458 = v2453.x - v2452.x;
        local v2459 = v2453.y - v2452.y;
        local v2460 = v2454:alpha_modulate(255 * v2455);
        local v2461 = v2454:alpha_modulate(50 * v2455);
        l_play_0.blur(v2452, v2453, 0.5, v2455, l_l_match_0_10);
        l_play_0.rect(v2452, v2453, color(17, 17, 17, v2454.a * v2455), l_l_match_0_10);
        l_v1533_6(l_x_4 + l_l_match_0_10, l_y_3, v2458 - l_l_match_0_10 * 2, l_v1017_7, v2460);
        l_v1533_6(l_x_4 + l_l_match_0_10, l_y_3 + v2459 - l_v1017_7, v2458 - l_l_match_0_10 * 2, l_v1017_7, v2461);
        l_play_0.circle_outline(vector(l_x_4 + l_l_match_0_10, l_y_3 + l_l_match_0_10), v2460, l_l_match_0_10 + 0.5, 180, 0.25, l_v1017_7);
        l_play_0.circle_outline(vector(l_x_4 + v2458 - l_l_match_0_10, l_y_3 + l_l_match_0_10), v2460, l_l_match_0_10 + 0.5, 270, 0.25, l_v1017_7);
        l_play_0.circle_outline(vector(l_x_4 + l_l_match_0_10, l_y_3 + v2459 - l_l_match_0_10), v2461, l_l_match_0_10 + 0.5, 90, 0.25, l_v1017_7);
        l_play_0.circle_outline(vector(l_x_4 + v2458 - l_l_match_0_10, l_y_3 + v2459 - l_l_match_0_10), v2461, l_l_match_0_10 + 0.5, 0, 0.25, l_v1017_7);
        l_l_aimtools_0_6(l_x_4, l_y_3 + l_l_match_0_10, l_v1017_7, v2459 - l_l_match_0_10 * 2, v2460, v2461, false);
        l_l_aimtools_0_6(l_x_4 + v2458 - l_v1017_7, l_y_3 + l_l_match_0_10, l_v1017_7, v2459 - l_l_match_0_10 * 2, v2460, v2461, false);
    end;
    l_v1536_6 = {};
    l_v1688_5 = 0;
    l_v1689_4 = function()
        -- upvalues: l_v928_10 (ref)
        return l_v928_10.enabled:get() and l_v928_10.select:get("Watermark");
    end;
    do
        local l_l_v1688_5_0, l_l_v1689_4_0 = l_v1688_5, l_v1689_4;
        l_v1536_6.draw = function(v2464)
            -- upvalues: l_l_v1688_5_0 (ref), v93 (ref), l_l_v1689_4_0 (ref), l_play_0 (ref), l_v1535_6 (ref), l_v928_10 (ref)
            local v2465 = v2464:clone();
            l_l_v1688_5_0 = v93.interp(l_l_v1688_5_0, l_l_v1689_4_0(), 0.05);
            if l_l_v1688_5_0 <= 0 then
                return;
            else
                local v2466 = {};
                local v2467 = utils.net_channel();
                local v2468 = common.get_system_time();
                table.insert(v2466, "angelwings");
                table.insert(v2466, common.get_username());
                if v2467 ~= nil then
                    table.insert(v2466, string.format("delay: %dms", v2467.latency[1] * 1000));
                end;
                if v2468 ~= nil then
                    table.insert(v2466, string.format("%02d:%02d:%02d", v2468.hours, v2468.minutes, v2468.seconds));
                end;
                v2467 = 1;
                v2468 = "";
                local v2469 = table.concat(v2466, " | ");
                local v2470 = l_play_0.measure_text(v2467, v2468, v2469);
                local v2471 = color(255, 255, 255, 255);
                local v2472 = v2470 + vector(10, 8);
                v2465.x = v2465.x - v2472.x;
                v2471.a = v2471.a * l_l_v1688_5_0;
                l_v1535_6(v2465, v2465 + v2472, l_v928_10.color:get(), l_l_v1688_5_0);
                l_play_0.text(v2467, v2465 + vector(5, 4), v2471, v2468, v2469);
                v2464.y = v2464.y + (v2472.y + 10) * l_l_v1688_5_0;
                return;
            end;
        end;
    end;
    l_v1688_5 = {};
    l_v1689_4 = {};
    l_v1690_5 = 0;
    l_v1691_5 = nil;
    v1692 = nil;
    v1693 = vector(400, 340);
    v1694 = vector(120, 20);
    v1695 = l_play_0.screen_size();
    v1692 = v121.new("spectators", v1693, v1694, {
        border = {
            vector(0, 0), 
            v1695:clone()
        }
    });
    do
        local l_l_v1689_4_1, l_l_v1690_5_0, l_l_v1691_5_0, l_v1692_5, l_v1693_4, l_v1694_5, l_v1695_3 = l_v1689_4, l_v1690_5, l_v1691_5, v1692, v1693, v1694, v1695;
        l_v1692_5.update = function()
            -- upvalues: l_l_v1690_5_0 (ref)
            return l_l_v1690_5_0;
        end;
        l_v1693_4 = function()
            -- upvalues: l_v928_10 (ref)
            return l_v928_10.enabled:get() and l_v928_10.select:get("Spectators");
        end;
        l_v1694_5 = function(v2480)
            local l_m_iObserverMode_0 = v2480.m_iObserverMode;
            if l_m_iObserverMode_0 == 4 or l_m_iObserverMode_0 == 5 then
                local l_m_hObserverTarget_0 = v2480.m_hObserverTarget;
                if l_m_hObserverTarget_0 ~= nil then
                    return l_m_hObserverTarget_0:get_spectators();
                end;
            end;
            return v2480:get_spectators();
        end;
        l_v1695_3 = function(v2483, v2484)
            -- upvalues: l_v1694_5 (ref), l_l_v1689_4_1 (ref), l_play_0 (ref), v93 (ref)
            local v2485 = entity.get_local_player();
            local v2486 = {};
            local v2487 = false;
            local v2488 = 0;
            if v2485 ~= nil then
                local v2489 = l_v1694_5(v2485) or {};
                for _, v2491 in pairs(v2489) do
                    local v2492 = v2491:get_index();
                    local v2493 = v2491:get_name();
                    local v2494 = v2491:get_steam_avatar();
                    v2487 = true;
                    v2486[v2492] = v2491;
                    l_l_v1689_4_1[v2492] = l_l_v1689_4_1[v2492] or {
                        name_width = 0, 
                        alpha = 0, 
                        name_height = 0, 
                        name = v2493, 
                        avatar = v2494
                    };
                    local v2495 = l_l_v1689_4_1[v2492];
                    local v2496 = l_play_0.measure_text(v2483, v2484, v2493);
                    v2495.name = v2493;
                    v2495.name_width = v2496.x;
                    v2495.name_height = v2496.y;
                end;
            end;
            for v2497, v2498 in pairs(l_l_v1689_4_1) do
                local v2499 = v2486[v2497] ~= nil;
                v2498.alpha = v93.interp(v2498.alpha, v2499, 0.05);
                if v2498.alpha <= 0.01 then
                    l_l_v1689_4_1[v2497] = nil;
                elseif (v2498.alpha > 0 or v2499) and v2488 < v2498.name_width then
                    v2488 = v2498.name_width;
                end;
            end;
            return l_l_v1689_4_1, v2487, v2488;
        end;
        l_v1688_5.draw = function()
            -- upvalues: l_v1695_3 (ref), l_v1693_4 (ref), l_l_v1690_5_0 (ref), v93 (ref), l_v1692_5 (ref), l_l_v1691_5_0 (ref), l_v1535_6 (ref), l_v928_10 (ref), l_play_0 (ref), v15 (ref)
            local v2500 = 1;
            local v2501 = "c";
            local v2502 = "spectators";
            local v2503, v2504, v2505 = l_v1695_3(v2500, v2501);
            local v2506 = l_v1693_4() and (v2504 or ui.get_alpha() > 0);
            l_l_v1690_5_0 = v93.interp(l_l_v1690_5_0, v2506, 0.05);
            if l_l_v1690_5_0 <= 0 then
                return;
            else
                local v2507 = l_v1692_5:get_drag_position():clone();
                local v2508 = math.max(66, v2505);
                local v2509 = vector(75 + v2508, 20);
                if l_l_v1691_5_0 == nil then
                    l_l_v1691_5_0 = v2509.x;
                end;
                l_l_v1691_5_0 = v93.interp(l_l_v1691_5_0, v2509.x, 0.033);
                v2509.x = math.floor(l_l_v1691_5_0);
                l_v1535_6(v2507, v2507 + v2509, l_v928_10.color:get(), l_l_v1690_5_0);
                l_play_0.text(v2500, v2507 + v2509 / 2 - vector(0, 1), color(255, 255 * l_l_v1690_5_0), v2501, v2502);
                local v2510 = 0;
                v2507.y = v2507.y + 3;
                for _, v2512 in pairs(v2503) do
                    local l_name_2 = v2512.name;
                    local l_avatar_0 = v2512.avatar;
                    local v2515 = color(255, 255, 255, 255);
                    local v2516 = l_l_v1690_5_0 * v2512.alpha;
                    v2515.a = v2515.a * v2516;
                    local v2517 = vector(v2512.name_height, v2512.name_height);
                    local v2518 = vector(v2507.x + 5, v2507.y + v2509.y);
                    local v2519 = vector(v2507.x + v2509.x - 5 - v2517.x, v2507.y + v2509.y);
                    l_play_0.text(v2500, v2518, v2515, "", l_name_2);
                    if l_avatar_0 ~= nil then
                        l_play_0.texture(l_avatar_0, v2519, v2517, v2515);
                    end;
                    v2510 = math.max(v2510, v2516);
                    v2509.y = v2509.y + v15(15 * v2516);
                end;
                v2509.y = v2509.y + v15(3 * v2510);
                l_v1692_5.size = v2509;
                l_v1692_5();
                return;
            end;
        end;
    end;
    l_v1689_4 = {};
    l_v1690_5 = {};
    l_v1691_5 = 0;
    v1692 = nil;
    v1693 = nil;
    v1694 = vector(400, 200);
    v1695 = vector(120, 20);
    v1696 = l_play_0.screen_size();
    v1693 = v121.new("hotkey_list", v1694, v1695, {
        border = {
            vector(0, 0), 
            v1696:clone()
        }
    });
    do
        local l_l_v1690_5_1, l_l_v1691_5_1, l_v1692_6, l_v1693_5, l_v1694_6, l_v1695_4, l_v1696_2, l_v1697_2 = l_v1690_5, l_v1691_5, v1692, v1693, v1694, v1695, v1696, v1697;
        l_v1693_5.update = function()
            -- upvalues: l_l_v1691_5_1 (ref)
            return l_l_v1691_5_1;
        end;
        l_v1694_6 = function()
            -- upvalues: l_v928_10 (ref)
            return l_v928_10.enabled:get() and l_v928_10.select:get("Hotkey List");
        end;
        l_v1695_4 = function(v2528, v2529)
            if next(v2529) == nil then
                v2529 = v2528:get();
                if next(v2529) == nil then
                    v2529 = v2528:list();
                end;
            end;
            local v2530 = {};
            for v2531 = 1, #v2529 do
                v2530[#v2530 + 1] = v2529[v2531]:sub(1, 1);
            end;
            return table.concat(v2530, ", ");
        end;
        l_v1696_2 = function(v2532, v2533, v2534)
            -- upvalues: l_v928_10 (ref), l_v1695_4 (ref)
            if type(v2534) == "boolean" or l_v928_10.only_key_state:get() then
                if v2533 == 1 then
                    return "Holding";
                elseif v2533 == 2 then
                    return "Toggled";
                else
                    return "Enabled";
                end;
            elseif type(v2534) == "table" then
                return l_v1695_4(v2532, v2534);
            else
                return tostring(v2534);
            end;
        end;
        l_v1697_2 = function(v2535, v2536)
            -- upvalues: l_v1696_2 (ref), l_l_v1690_5_1 (ref), l_play_0 (ref), v93 (ref)
            local v2537 = {};
            local v2538 = false;
            local v2539 = 0;
            local v2540 = 0;
            for _, v2542 in pairs(ui.get_binds()) do
                local v2543 = v2542.reference:id();
                local v2544 = string.format("[%s]", string.lower(l_v1696_2(v2542.reference, v2542.mode, v2542.value)));
                local l_name_3 = v2542.name;
                if v2542.active then
                    v2538 = true;
                    v2537[v2543] = v2542;
                end;
                l_l_v1690_5_1[v2543] = l_l_v1690_5_1[v2543] or {
                    height = 0, 
                    alpha = 0, 
                    name_width = 0, 
                    value_width = 0, 
                    name = l_name_3, 
                    mode = v2542.mode, 
                    value = v2542.value, 
                    reference = v2542.reference
                };
                local v2546 = l_l_v1690_5_1[v2543];
                local v2547 = l_play_0.measure_text(v2535, v2536, l_name_3);
                local v2548 = l_play_0.measure_text(v2535, v2536, v2544);
                v2546.name = l_name_3;
                v2546.value = v2544;
                v2546.mode = v2542.mode;
                v2546.reference = v2542.reference;
                v2546.height = math.max(v2547.y, v2548.y);
                v2546.name_width = v2547.x;
                v2546.value_width = v2548.x;
            end;
            for v2549, v2550 in pairs(l_l_v1690_5_1) do
                local v2551 = v2537[v2549] ~= nil;
                v2550.alpha = v93.interp(v2550.alpha, v2551, 0.05);
                if v2550.alpha <= 0.01 then
                    l_l_v1690_5_1[v2549] = nil;
                elseif v2550.alpha > 0 or v2551 then
                    if v2539 < v2550.name_width then
                        v2539 = v2550.name_width;
                    end;
                    if v2540 < v2550.value_width then
                        v2540 = v2550.value_width;
                    end;
                end;
            end;
            return l_l_v1690_5_1, v2538, v2539, v2540;
        end;
        l_v1689_4.draw = function()
            -- upvalues: l_v1697_2 (ref), l_v1694_6 (ref), l_l_v1691_5_1 (ref), v93 (ref), l_v1693_5 (ref), l_v1692_6 (ref), l_v1535_6 (ref), l_v928_10 (ref), l_play_0 (ref), v15 (ref)
            local v2552 = 1;
            local v2553 = "c";
            local v2554 = "keybinds";
            local v2555, v2556, v2557 = l_v1697_2(v2552, v2553);
            local v2558 = l_v1694_6() and (v2556 or ui.get_alpha() > 0);
            l_l_v1691_5_1 = v93.interp(l_l_v1691_5_1, v2558, 0.033);
            if l_l_v1691_5_1 <= 0 then
                return;
            else
                local v2559 = l_v1693_5:get_drag_position():clone();
                local v2560 = math.max(66, v2557);
                local v2561 = vector(75 + v2560, 20);
                if l_v1692_6 == nil then
                    l_v1692_6 = v2561.x;
                end;
                l_v1692_6 = v93.interp(l_v1692_6, v2561.x, 0.035);
                v2561.x = math.floor(l_v1692_6);
                l_v1535_6(v2559, v2559 + v2561, l_v928_10.color:get(), l_l_v1691_5_1);
                l_play_0.text(v2552, v2559 + v2561 / 2 - vector(0, 1), color(255, 255 * l_l_v1691_5_1), v2553, v2554);
                local v2562 = 0;
                v2559.y = v2559.y + 3;
                for _, v2564 in pairs(v2555) do
                    local l_v2564_0 = v2564;
                    local l_name_4 = l_v2564_0.name;
                    local l_value_0 = l_v2564_0.value;
                    local v2568 = color(255, 255, 255, 255);
                    local v2569 = l_v2564_0.alpha * l_l_v1691_5_1;
                    v2568.a = v2568.a * v2569;
                    local v2570 = vector(v2559.x + 5, v2559.y + v2561.y);
                    local v2571 = vector(v2559.x + v2561.x - 5, v2559.y + v2561.y);
                    l_play_0.text(v2552, v2570, v2568, "", l_name_4);
                    l_play_0.text(v2552, v2571, v2568, "r", l_value_0);
                    v2562 = math.max(v2562, l_v2564_0.alpha);
                    v2561.y = v2561.y + v15(15 * l_v2564_0.alpha);
                end;
                v2561.y = v2561.y + v15(3 * v2562);
                l_v1693_5.size = v2561;
                l_v1693_5();
                return;
            end;
        end;
    end;
    l_v1690_5 = {};
    l_v1691_5 = 0;
    v1692 = 0;
    v1693 = 0;
    v1694 = v1018(0, 2);
    v1695 = v1018(0, 3);
    v1696 = 0;
    v1697 = 0;
    v1698 = 0;
    v1699 = 0;
    v1700 = 0;
    v1701 = 0;
    v1702 = vector();
    v1703 = false;
    local v2572 = false;
    local function v2573()
        -- upvalues: l_v928_10 (ref)
        return l_v928_10.enabled:get() and l_v928_10.select:get("Anti-aimbot indication");
    end;
    local function v2578()
        local v2574 = rage.antiaim:get_max_desync();
        local v2575 = rage.antiaim:get_rotation(false);
        local v2576 = rage.antiaim:get_rotation(true);
        local v2577 = math.normalize_yaw(v2576 - v2575);
        return math.clamp(v2577, -v2574, v2574);
    end;
    do
        local l_l_v1691_5_2, l_v1692_7, l_v1693_6, l_v1694_7, l_v1695_5, l_v1696_3, l_v1697_3, l_v1698_1, l_v1699_1, l_v1700_1, l_v1701_0, l_v1702_1, l_v1703_1, l_v2572_0, l_v2573_0, l_v2578_0 = l_v1691_5, v1692, v1693, v1694, v1695, v1696, v1697, v1698, v1699, v1700, v1701, v1702, v1703, v2572, v2573, v2578;
        local function v2596()
            -- upvalues: l_v1699_1 (ref)
            local l_l_v1699_1_0 = l_v1699_1;
            if tonumber(l_l_v1699_1_0) < 10 then
                l_l_v1699_1_0 = "  " .. l_l_v1699_1_0;
            end;
            return string.format("FL: %s", l_l_v1699_1_0);
        end;
        local function v2599()
            -- upvalues: l_v1703_1 (ref), l_v1693_6 (ref), v93 (ref), l_v1692_7 (ref), l_v2572_0 (ref)
            if l_v1703_1 then
                l_v1693_6 = v93.interp(l_v1693_6, false, 0.05);
                local v2597 = l_v1693_6 <= 0.01;
                l_v1692_7 = v93.interp(l_v1692_7, v2597, 0.05);
                return;
            elseif l_v2572_0 then
                l_v1692_7 = v93.interp(l_v1692_7, false, 0.05);
                local v2598 = l_v1692_7 <= 0.01;
                l_v1693_6 = v93.interp(l_v1693_6, v2598, 0.05);
                return;
            else
                l_v1692_7 = v93.interp(l_v1692_7, false, 0.05);
                l_v1693_6 = v93.interp(l_v1693_6, false, 0.05);
                return;
            end;
        end;
        local function v2603(v2600)
            -- upvalues: l_v1702_1 (ref), l_v1701_0 (ref), l_l_angles_0_11 (ref), l_v1695_5 (ref), l_v1694_7 (ref), l_v2578_0 (ref), l_v1699_1 (ref), l_v1700_1 (ref), l_v1703_1 (ref), l_v2572_0 (ref), l_v1020_8 (ref)
            local v2601 = entity.get_local_player();
            if v2601 == nil then
                return;
            else
                if v2600.choked_commands == 0 then
                    local l_m_vecOrigin_1 = v2601.m_vecOrigin;
                    if l_v1702_1 ~= nil then
                        l_v1701_0 = (l_m_vecOrigin_1 - l_v1702_1):length2dsqr();
                        l_l_angles_0_11(l_v1695_5, l_v1701_0, true);
                    end;
                    l_l_angles_0_11(l_v1694_7, math.abs(l_v2578_0()), true);
                    l_v1699_1 = l_v1700_1;
                    l_v1702_1 = l_m_vecOrigin_1;
                end;
                l_v1703_1 = rage.exploit:get() == 1;
                l_v2572_0 = l_v1020_8(l_v1695_5) > 3200;
                l_v1700_1 = v2600.choked_commands;
                return;
            end;
        end;
        l_v1690_5.draw = function(v2604)
            -- upvalues: l_v2573_0 (ref), l_l_v1691_5_2 (ref), v93 (ref), v2599 (ref), l_v928_10 (ref), v2596 (ref), l_v1020_8 (ref), l_v1695_5 (ref), l_v1701_0 (ref), l_v1697_3 (ref), l_v1698_1 (ref), l_v1696_3 (ref), l_v2572_0 (ref), l_play_0 (ref), l_v1692_7 (ref), l_v1693_6 (ref), l_v1535_6 (ref), l_v1694_7 (ref)
            local v2605 = v2604:clone();
            local v2606 = entity.get_local_player();
            local v2607 = l_v2573_0() and v2606 ~= nil and v2606:is_alive();
            l_l_v1691_5_2 = v93.interp(l_l_v1691_5_2, v2607, 0.05);
            v2599();
            if l_l_v1691_5_2 <= 0 then
                return;
            else
                local v2608 = 1;
                local v2609 = "";
                local v2610 = l_v928_10.color:get();
                local v2611 = v2596();
                local v2612 = globals.frametime * 3.75;
                local v2613 = 1200 + math.max(0, l_v1020_8(l_v1695_5) - 3800);
                local v2614 = math.abs(math.min(l_v1701_0 - 3800, v2613) / v2613 * 100);
                if l_v1697_3 ~= v2614 and l_v1698_1 < globals.realtime then
                    l_v1698_1 = globals.realtime + 0.005;
                    l_v1697_3 = l_v1697_3 + (v2614 < l_v1697_3 and -1 or 1);
                end;
                l_v1696_3 = l_v1696_3 + (l_v2572_0 and v2612 or -v2612);
                l_v1696_3 = l_v1696_3 > 1 and 1 or l_v1696_3;
                l_v1696_3 = l_v1696_3 < 0 and 0 or l_v1696_3;
                local v2615 = " | SHIFTING";
                local v2616 = l_play_0.measure_text(v2608, v2609, v2615);
                local v2617 = " | dst: " .. string.rep(" ", 10);
                local v2618 = l_play_0.measure_text(v2608, v2609, v2617);
                local v2619 = l_play_0.measure_text(v2608, v2609, v2611);
                local v2620 = color(255, 255, 255, 255);
                local v2621 = vector(v2619.x + 8, 17);
                v2621.x = v2621.x + v2616.x * l_v1692_7;
                v2621.x = v2621.x + v2618.x * l_v1693_6;
                v2605.x = v2605.x - v2621.x;
                v2620.a = v2620.a * l_l_v1691_5_2;
                local v2622 = vector(v2605.x + 4, v2605.y + 2);
                l_v1535_6(v2605, v2605 + v2621, l_v928_10.color:get(), l_l_v1691_5_2);
                l_play_0.text(v2608, v2622, v2620, v2609, v2611);
                v2622.x = v2622.x + v2619.x;
                if l_v1692_7 > 0 then
                    local v2623 = v2620:clone();
                    v2623.a = v2623.a * math.map(l_v1692_7, 0.9, 1, 0, 1);
                    l_play_0.text(v2608, v2622, v2623, v2609, v2615);
                end;
                if l_v1693_6 > 0 then
                    local v2624 = v2620:clone();
                    local v2625 = math.map(l_v1693_6, 0.9, 1, 0, 1);
                    v2624.a = v2624.a * v2625;
                    local v2626 = l_play_0.measure_text(v2608, v2609, " | dst: ");
                    local v2627 = vector(v2622.x + v2626.x + 2, v2622.y + 4);
                    local v2628 = v2627 + vector(math.min(100, l_v1697_3) / 100 * 24, 5);
                    local v2629 = v2610:clone();
                    local v2630 = v2610:clone();
                    v2629.a = 220 * l_v1696_3 * v2625 * l_l_v1691_5_2;
                    v2630.a = 25 * l_v1696_3 * v2625 * l_l_v1691_5_2;
                    l_play_0.text(v2608, v2622, v2624, v2609, v2617);
                    l_play_0.gradient(v2627, v2628, v2629, v2630, v2629, v2630);
                end;
                local v2631 = string.format("FAKE (%.1f\194\176)", l_v1020_8(l_v1694_7));
                local v2632 = l_play_0.measure_text(v2608, v2609, v2631);
                local v2633 = vector(v2632.x + 8, 18);
                v2605.x = v2605.x - v2633.x - 4;
                l_v1535_6(v2605, v2605 + v2633, l_v928_10.color:get(), l_l_v1691_5_2);
                l_play_0.text(v2608, v2605 + vector(4, 2), v2620, v2609, v2631);
                v2604.y = v2604.y + (v2633.y + 10) * l_l_v1691_5_2;
                return;
            end;
        end;
        events.createmove(v2603);
    end;
    l_v1691_5 = {};
    v1692 = v1030();
    v1693 = function(v2634)
        if v2634 < 1 then
            return ("%.2f"):format(v2634);
        elseif v2634 < 10 then
            return ("%.1f"):format(v2634);
        else
            return ("%d"):format(v2634);
        end;
    end;
    pcall(ffi.cdef, "                bool EnumDisplaySettingsA(\n                    unsigned int  lpszDeviceName,\n                    unsigned long iModeNum,\n                    void*         lpDevMode\n                );\n            ");
    v1695 = ffi.typeof("                struct {\n                    char pad_0[120];\n                    unsigned long dmDisplayFrequency;\n                    char pad_1[32];\n                }\n            ")();
    ffi.C.EnumDisplaySettingsA(0, -1, v1695);
    v1696 = 0;
    v1697 = common.get_timestamp();
    v1698 = v1018(0, 90);
    v1699 = v1018(0, 30);
    v1700 = 0;
    v1701 = 0;
    v1702 = function()
        -- upvalues: l_v928_10 (ref)
        return l_v928_10.enabled:get() and l_v928_10.select:get("Frequency update information");
    end;
    do
        local l_v1692_8, l_v1693_7, l_v1695_6, l_v1696_4, l_v1697_4, l_v1698_2, l_v1699_2, l_v1700_2, l_v1701_1, l_v1702_2, l_v1703_2 = v1692, v1693, v1695, v1696, v1697, v1698, v1699, v1700, v1701, v1702, v1703;
        l_v1703_2 = function()
            -- upvalues: l_v1700_2 (ref), l_l_angles_0_11 (ref), l_v1699_2 (ref), l_v1701_1 (ref)
            l_v1700_2 = 0.9 * l_v1700_2 + 0.09999999999999998 * globals.absoluteframetime;
            l_l_angles_0_11(l_v1699_2, math.abs(l_v1701_1 - 1 / l_v1700_2), true);
            l_v1701_1 = 1 / l_v1700_2;
        end;
        v2572 = function()
            -- upvalues: l_v1697_4 (ref)
            l_v1697_4 = common.get_timestamp();
        end;
        v2573 = function()
            -- upvalues: l_v1697_4 (ref), l_l_angles_0_11 (ref), l_v1698_2 (ref)
            local v2646 = common.get_timestamp() - l_v1697_4;
            l_l_angles_0_11(l_v1698_2, v2646);
        end;
        l_v1691_5.draw = function(v2647)
            -- upvalues: l_v1703_2 (ref), l_v1702_2 (ref), l_v1696_4 (ref), v93 (ref), l_v928_10 (ref), l_v1020_8 (ref), l_v1698_2 (ref), l_v1695_6 (ref), l_v1693_7 (ref), l_play_0 (ref), l_v1535_6 (ref), l_v1699_2 (ref), l_v1692_8 (ref)
            l_v1703_2();
            local v2648 = v2647:clone();
            local v2649 = l_v1702_2();
            l_v1696_4 = v93.interp(l_v1696_4, v2649, 0.05);
            if l_v1696_4 <= 0 then
                return;
            else
                local v2650 = 1;
                local v2651 = "";
                local v2652 = l_v928_10.color:get();
                local v2653 = l_v1020_8(l_v1698_2);
                local v2654 = tonumber(l_v1695_6.dmDisplayFrequency);
                local v2655 = string.format("%sms / %dhz", l_v1693_7(v2653), v2654);
                local v2656 = l_play_0.measure_text(v2650, v2651, v2655);
                local v2657 = color(255, 255, 255, 255);
                local v2658 = vector(v2656.x + 8, 18);
                v2648.x = v2648.x - v2658.x;
                v2657.a = v2657.a * l_v1696_4;
                l_v1535_6(v2648, v2648 + v2658, l_v928_10.color:get(), l_v1696_4);
                l_play_0.text(v2650, vector(v2648.x + 4, v2648.y + 2), v2657, v2651, v2655);
                local v2659 = "IO | ";
                local v2660 = l_play_0.measure_text(v2650, v2651, v2659);
                local v2661 = v2659 .. "       ";
                local v2662 = l_play_0.measure_text(v2650, v2651, v2661);
                local v2663 = v2660.x + 4;
                local v2664 = vector(v2662.x + 8, 18);
                local v2665 = {
                    [1] = nil, 
                    [2] = 1, 
                    [3] = 3, 
                    [4] = nil, 
                    [5] = 0, 
                    [1] = v2653, 
                    [4] = l_v1020_8(l_v1699_2) / 4
                };
                local _ = math.min(unpack(v2665));
                local v2667 = math.max(unpack(v2665));
                v2648.x = v2648.x - v2664.x;
                local v2668 = vector(v2648.x - 4, v2648.y);
                l_v1535_6(v2668, v2668 + v2664, l_v928_10.color:get(), l_v1696_4);
                l_play_0.text(v2650, v2648 + vector(0, 2), v2657, v2651, v2661);
                l_v1692_8:draw_histogram(v2665, 0, v2667, #v2665, {
                    draw_peeks = false, 
                    draw_bar = "gradient_fadein", 
                    thickness = 1, 
                    x = v2648.x - 4 + v2663, 
                    y = v2648.y + 4, 
                    w = v2664.x - v2663 - 4, 
                    h = v2664.y - 8, 
                    clr_1 = v2652:alpha_modulate(255 * l_v1696_4), 
                    clr_2 = color(0, 127, 255, 255 * l_v1696_4)
                }, false);
                return;
            end;
        end;
        events.pre_render(v2572);
        events.post_render(v2573);
    end;
    v1692 = function()
        -- upvalues: l_play_0 (ref), l_v1536_6 (ref), l_v1688_5 (ref), l_v1689_4 (ref), l_v1690_5 (ref), l_v1691_5 (ref)
        local v2669 = l_play_0.screen_size();
        local v2670 = vector(v2669.x - 10, 10);
        l_v1536_6.draw(v2670);
        l_v1688_5.draw();
        l_v1689_4.draw();
        l_v1690_5.draw(v2670);
        l_v1691_5.draw(v2670);
    end;
    events.render(v1692);
end;
v928 = nil;
l_match_0 = v364.visuals.watermark;
v1017 = {};
v1018 = string.format("%s\a%%s.PINK", string.upper(v16.name));
l_angles_0 = string.format("VICTIM - %s [\a%%s%s\a%%s]", string.upper(v16.user), string.upper(v16.build));
do
    local l_l_match_0_11, l_v1017_8, l_v1018_10, l_l_angles_0_12 = l_match_0, v1017, v1018, l_angles_0;
    do
        local l_l_v1018_10_0, l_l_l_angles_0_12_0 = l_v1018_10, l_l_angles_0_12;
        l_v1017_8.on_render = function()
            -- upvalues: l_l_match_0_11 (ref), l_play_0 (ref), l_l_v1018_10_0 (ref), l_l_l_angles_0_12_0 (ref), v237 (ref)
            local v2677 = l_l_match_0_11.color:get():alpha_modulate(255);
            local v2678 = color();
            local v2679 = v2677:to_hex();
            local v2680 = v2678:to_hex();
            local v2681 = l_play_0.screen_size();
            local v2682 = 2;
            local v2683 = "";
            local v2684 = {
                string.format(l_l_v1018_10_0, v2679), 
                string.format(l_l_l_angles_0_12_0, v2679, v2680)
            };
            local v2685 = vector(8, v2681.y / 2);
            if v237.eva_small ~= nil then
                local v2686 = vector(35, 35);
                local v2687 = color(255, 255, 255);
                l_play_0.texture(v237.eva_small, v2685, v2686, v2687, "f");
                v2685.x = v2685.x + v2686.x - 4;
                v2685.y = v2685.y + v2686.y + 1;
            end;
            local v2688 = l_play_0.measure_text(v2682, v2683, v2684[1]);
            local v2689 = l_play_0.measure_text(v2682, v2683, v2684[2]);
            v2688.y = v2688.y - 2;
            v2689.y = v2689.y - 2;
            v2685.y = v2685.y - v2689.y;
            l_play_0.text(v2682, v2685, v2678, v2683, v2684[2]);
            v2685.y = v2685.y - (v2688.y - 2);
            l_play_0.text(v2682, v2685, v2678, v2683, v2684[1]);
        end;
    end;
    l_v1018_10 = {};
    l_l_angles_0_12 = 1;
    v1020 = 3;
    v1030 = 3;
    v1533 = 34;
    l_aimtools_0 = 5;
    v1535 = utils.get_vfunc("steamclient.dll", "SteamClient017", 2, "int(__thiscall*)(void*, int)");
    v1536 = utils.get_vfunc("steamclient.dll", "SteamClient017", 8, "int*(__thiscall*)(void*, int, int, const char*)");
    v1688 = utils.get_vfunc("steamclient.dll", "SteamClient017", 9, "int*(__thiscall*)(void*, int, const char*)");
    v1689 = utils.get_vfunc(35, "int(__thiscall*)(void*, uint64_t)");
    v1690 = utils.get_vfunc(5, "bool(__thiscall*)(void*, int, uint32_t*, uint32_t*)");
    v1691 = utils.get_vfunc(6, "bool(__thiscall*)(void*, int, unsigned char*, int)");
    v1693 = v1536(v1535(l_l_angles_0_12), l_l_angles_0_12, "SteamFriends015");
    v1694 = v1688(l_l_angles_0_12, "SteamUtils009");
    v1695 = string.format("\a%%s%s\a%%s.pink", string.lower(v16.name));
    v1696 = string.format("build: \a%%s%s", string.lower(v16.build));
    v1697 = string.format("user: \a%%s%s", v16.user);
    do
        local l_v1020_9, l_v1030_8, l_v1533_7, l_l_aimtools_0_7, l_v1689_5, l_v1690_6, l_v1691_6, l_v1693_8, l_v1694_8, l_v1695_7, l_v1696_5, l_v1697_5, l_v1700_3 = v1020, v1030, v1533, l_aimtools_0, v1689, v1690, v1691, v1693, v1694, v1695, v1696, v1697, v1700;
        l_v1700_3 = (function(v2703)
            -- upvalues: l_v1689_5 (ref), l_v1693_8 (ref), l_v1690_6 (ref), l_v1694_8 (ref), l_v1691_6 (ref), l_play_0 (ref)
            local v2704 = l_v1689_5(l_v1693_8, v2703);
            if v2704 <= 0 then
                return nil;
            else
                local v2705 = ffi.new("unsigned int[?]", 1);
                local v2706 = ffi.new("unsigned int[?]", 1);
                if not l_v1690_6(l_v1694_8, v2704, v2705, v2706) then
                    return nil;
                else
                    local v2707 = v2705[0] * v2706[0] * 4;
                    local v2708 = ffi.new("unsigned char[?]", v2707);
                    if not l_v1691_6(l_v1694_8, v2704, v2708, v2707) then
                        return nil;
                    else
                        local v2709 = ffi.string(v2708, v2707);
                        local v2710 = vector(v2705[0], v2706[0]);
                        return l_play_0.load_image_rgba(v2709, v2710), v2710;
                    end;
                end;
            end;
        end)((function()
            local l_MyPersonaAPI_0 = panorama.MyPersonaAPI;
            if l_MyPersonaAPI_0 == nil then
                return 0ULL;
            else
                local v2712 = l_MyPersonaAPI_0.GetXuid();
                return 76500000000000000ULL + tonumber(v2712:sub(4, -1));
            end;
        end)());
        l_v1018_10.on_render = function()
            -- upvalues: l_v1700_3 (ref), l_l_match_0_11 (ref), l_play_0 (ref), l_v1695_7 (ref), l_v1696_5 (ref), l_v1697_5 (ref), l_v1020_9 (ref), l_v1030_8 (ref), l_v1533_7 (ref), l_l_aimtools_0_7 (ref)
            if l_v1700_3 == nil then
                return;
            else
                local v2713 = l_l_match_0_11.color:get():alpha_modulate(255);
                local v2714 = color();
                local v2715 = v2713:to_hex();
                local v2716 = v2714:to_hex();
                local v2717 = l_play_0.screen_size();
                local v2718 = vector(v2717.x, 0);
                local v2719 = 4;
                local v2720 = "";
                local v2721 = string.format(l_v1695_7, v2715, v2716);
                local v2722 = 1;
                local v2723 = "";
                local v2724 = string.format(l_v1696_5, v2715);
                local v2725 = 1;
                local v2726 = "";
                local v2727 = string.format(l_v1697_5, v2715);
                local v2728 = l_play_0.measure_text(v2719, v2720, v2721);
                local v2729 = l_play_0.measure_text(v2722, v2723, v2724);
                local v2730 = l_play_0.measure_text(v2725, v2726, v2727);
                local v2731 = vector(l_v1020_9, l_v1030_8) * 2 + vector(math.max(v2728.x, v2729.x, v2730.x) + l_v1533_7 + l_l_aimtools_0_7, math.max(v2728.y + v2729.y + v2730.y, l_v1533_7));
                local v2732 = v2731 + vector(10, 0);
                local v2733 = v2718 + vector(-(l_v1020_9 + l_v1533_7), (v2731.y - l_v1533_7) / 2);
                local v2734 = v2718 + vector(-v2732.x, 0);
                l_play_0.gradient(v2734, v2734 + v2732, v2713:alpha_modulate(0), v2713:alpha_modulate(220), v2713:alpha_modulate(0), v2713:alpha_modulate(220));
                l_play_0.texture(l_v1700_3, v2733, vector(l_v1533_7, l_v1533_7), color(), "f");
                local v2735 = v2718 + vector(-v2731.x + l_v1020_9, l_v1030_8);
                l_play_0.text(v2719, v2735, v2714, v2720, v2721);
                v2735.y = v2735.y + v2728.y;
                l_play_0.text(v2722, v2735, v2714, v2723, v2724);
                v2735.y = v2735.y + v2729.y;
                l_play_0.text(v2725, v2735, v2714, v2726, v2727);
                v2735.y = v2735.y + v2730.y;
                return;
            end;
        end;
    end;
    l_l_angles_0_12 = function(v2736)
        -- upvalues: l_v1017_8 (ref), l_v1018_10 (ref)
        if v2736 == nil then
            v2736 = {};
        end;
        events.render(l_v1017_8.on_render, v2736.branded == true);
        events.render(l_v1018_10.on_render, v2736.corner == true);
    end;
    v1020 = nil;
    v1030 = function(v2737)
        -- upvalues: l_l_angles_0_12 (ref)
        l_l_angles_0_12({
            branded = v2737:get("Branded"), 
            corner = v2737:get("Corner")
        });
    end;
    do
        local l_v1030_9 = v1030;
        v1533 = function(v2739)
            -- upvalues: l_l_angles_0_12 (ref), l_l_match_0_11 (ref), l_v1030_9 (ref)
            local v2740 = v2739:get();
            if not v2740 then
                l_l_angles_0_12(nil);
            end;
            if v2740 then
                l_l_match_0_11.style:set_callback(l_v1030_9, true);
            else
                l_l_match_0_11.style:unset_callback(l_v1030_9);
            end;
        end;
        l_l_match_0_11.enabled:set_callback(v1533, true);
    end;
end;
l_match_0 = nil;
v1017 = v364.visuals.manual_arrows;
v1018 = v364.antiaim.settings.manual_yaw;
l_angles_0 = l_play_0.load_font("C:\\Windows\\Fonts\\verdana.ttf", vector(16, 16.5, 0), "a");
v1020 = l_play_0.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a");
v1030 = 0;
v1533 = 0;
l_aimtools_0 = function(v2741, v2742, v2743)
    return v2741 + v2742 * vector():angles(vector(0, v2743, 0));
end;
do
    local l_v1017_9, l_v1018_11, l_l_angles_0_13, l_v1020_10, l_v1030_10, l_v1533_8, l_l_aimtools_0_8, l_v1535_7, l_v1536_7, l_v1688_6, l_v1689_6 = v1017, v1018, l_angles_0, v1020, v1030, v1533, l_aimtools_0, v1535, v1536, v1688, v1689;
    l_v1535_7 = function()
        -- upvalues: l_v1017_9 (ref), l_play_0 (ref), l_l_aimtools_0_8 (ref)
        if not l_v1017_9.dynamic_mode:get() then
            return 0;
        else
            local v2755 = l_v1017_9.style:get();
            if v2755 ~= 1 and v2755 ~= 4 then
                return 0;
            else
                local v2756 = entity.get_local_player();
                local v2757 = entity.get_threat();
                if v2756 == nil or v2757 == nil then
                    return 0;
                else
                    local v2758 = l_play_0.camera_angles();
                    local l_m_angEyeAngles_0 = v2757.m_angEyeAngles;
                    local v2760 = v2756:get_origin();
                    local v2761 = v2757:get_origin();
                    local v2762 = l_l_aimtools_0_8(v2760, 50, v2758.y + 110);
                    local v2763 = l_l_aimtools_0_8(v2760, 30, v2758.y + 60);
                    local v2764 = l_l_aimtools_0_8(v2760, 50, v2758.y - 110);
                    local v2765 = l_l_aimtools_0_8(v2760, 30, v2758.y - 60);
                    local v2766 = l_l_aimtools_0_8(v2761, 40, l_m_angEyeAngles_0.y + 115);
                    local v2767 = l_l_aimtools_0_8(v2761, 20, l_m_angEyeAngles_0.y + 35);
                    local v2768 = l_l_aimtools_0_8(v2761, 40, l_m_angEyeAngles_0.y - 115);
                    local v2769 = l_l_aimtools_0_8(v2761, 20, l_m_angEyeAngles_0.y - 35);
                    local v2770 = utils.trace_bullet(v2757, vector(v2766.x, v2766.y, v2766.z + 70), v2762);
                    local v2771 = utils.trace_bullet(v2757, vector(v2767.x, v2767.y, v2767.z + 30), v2763);
                    local v2772 = utils.trace_bullet(v2757, vector(v2768.x, v2768.y, v2768.z + 70), v2764);
                    local v2773 = utils.trace_bullet(v2757, vector(v2769.x, v2769.y, v2769.z + 30), v2765);
                    local v2774 = 0;
                    if v2770 == 0 then
                        if v2773 > 0 then
                            v2774 = 2;
                        elseif v2772 > 0 then
                            v2774 = 1;
                        end;
                    end;
                    if v2772 == 0 then
                        if v2771 > 0 then
                            v2774 = -2;
                        elseif v2770 > 0 then
                            v2774 = -1;
                        end;
                    end;
                    return v2774;
                end;
            end;
        end;
    end;
    l_v1536_7 = function()
        -- upvalues: l_v1018_11 (ref)
        return l_v1018_11.select:get();
    end;
    l_v1688_6 = function()
        -- upvalues: l_v1533_8 (ref), l_v1535_7 (ref)
        l_v1533_8 = l_v1535_7();
    end;
    l_v1689_6 = function()
        -- upvalues: l_v1017_9 (ref), l_v1536_7 (ref), l_v1533_8 (ref), l_play_0 (ref), l_v1030_10 (ref), v93 (ref), l_v1020_10 (ref), v15 (ref), l_l_angles_0_13 (ref)
        local v2775 = entity.get_local_player();
        if v2775 == nil or not v2775:is_alive() then
            return;
        else
            local v2776 = l_v1017_9.style:get();
            local v2777 = l_v1017_9.offset:get();
            local v2778 = l_v1017_9.accent_color:get();
            local v2779 = l_v1017_9.secondary_color:get();
            local v2780 = l_v1536_7();
            local v2781 = rage.antiaim:inverter();
            local v2782 = v2780 == "Left" or l_v1533_8 < 0;
            local v2783 = v2780 == "Right" or l_v1533_8 > 0;
            local l_m_bIsScoped_2 = v2775.m_bIsScoped;
            local v2785 = l_play_0.screen_size();
            local v2786, v2787 = vector(v2785.x / 2, v2785.y / 2):unpack();
            local v2788 = v2780 ~= nil and v2780 ~= "Off";
            l_v1030_10 = v93.interp(l_v1030_10, l_m_bIsScoped_2 and l_v1017_9.animate_scope:get(), 0.05);
            if v2788 or l_v1533_8 ~= 0 then
                if v2776 == 1 then
                    local l_l_v1020_10_0 = l_v1020_10;
                    local v2790 = "+";
                    local v2791 = l_v1533_8 == -2 and "<<" or "<";
                    local v2792 = l_v1533_8 == 2 and ">>" or ">";
                    local v2793 = l_play_0.measure_text(l_l_v1020_10_0, v2790, v2791);
                    local v2794 = l_play_0.measure_text(l_l_v1020_10_0, v2790, v2792);
                    local v2795 = v2782 and v2778 or v2779;
                    local v2796 = v2783 and v2778 or v2779;
                    local v2797 = vector(v2786 - v2777, v2787 + 1 - v2793.y * 0.5);
                    local v2798 = vector(v2786 + v2777, v2787 + 1 - v2794.y * 0.5);
                    v2797.x = v2797.x - v2793.x;
                    l_play_0.text(l_l_v1020_10_0, v2797, v2795, v2790, v2791);
                    l_play_0.text(l_l_v1020_10_0, v2798, v2796, v2790, v2792);
                end;
                if v2776 == 3 then
                    local l_l_v1020_10_1 = l_v1020_10;
                    local v2800 = "+";
                    local v2801 = "\239\132\132";
                    local v2802 = "\239\132\133";
                    local v2803 = l_play_0.measure_text(l_l_v1020_10_1, v2800, v2801);
                    local v2804 = l_play_0.measure_text(l_l_v1020_10_1, v2800, v2802);
                    local v2805 = v2782 and v2778 or v2779;
                    local v2806 = v2783 and v2778 or v2779;
                    local v2807 = v15(20 * l_v1030_10);
                    local v2808 = v15(20 * l_v1030_10);
                    v2805.a = v2805.a - v2805.a * (0.4 * l_v1030_10);
                    v2806.a = v2806.a - v2806.a * (0.4 * l_v1030_10);
                    local v2809 = vector(v2786 - v2777 - v2807, v2787 - v2803.y * 0.4);
                    local v2810 = vector(v2786 + v2777 + v2808, v2787 - v2804.y * 0.4);
                    v2809.x = v2809.x - v2803.x;
                    l_play_0.text(l_l_v1020_10_1, v2809, v2805, v2800, v2801);
                    l_play_0.text(l_l_v1020_10_1, v2810, v2806, v2800, v2802);
                end;
                if v2776 == 4 then
                    local l_l_l_angles_0_13_0 = l_l_angles_0_13;
                    local v2812 = "";
                    local v2813 = l_v1533_8 == -2 and "\226\157\174\226\157\174" or "\226\157\174";
                    local v2814 = l_v1533_8 == 2 and "\226\157\175\226\157\175" or "\226\157\175";
                    local v2815 = l_play_0.measure_text(l_l_l_angles_0_13_0, v2812, v2813);
                    local v2816 = l_play_0.measure_text(l_l_l_angles_0_13_0, v2812, v2814);
                    local v2817 = v2782 and v2778 or v2779;
                    local v2818 = v2783 and v2778 or v2779;
                    local v2819 = vector(v2786 - v2777, v2787 - v2815.y * 0.5);
                    local v2820 = vector(v2786 + v2777, v2787 - v2816.y * 0.5);
                    v2819.x = v2819.x - v2815.x;
                    l_play_0.text(l_l_l_angles_0_13_0, v2819, v2817, v2812, v2813);
                    l_play_0.text(l_l_l_angles_0_13_0, v2820, v2818, v2812, v2814);
                end;
            end;
            if v2776 == 2 then
                local v2821 = 2;
                local v2822 = 13;
                local v2823 = 9;
                local v2824 = color(35, 35, 35, 150);
                local v2825 = v2782 and v2778 or v2824;
                local v2826 = v2783 and v2778 or v2824;
                local v2827 = v2781 == true and v2779 or v2824;
                local v2828 = v2781 == false and v2779 or v2824;
                local v2829 = v2786 - v2777 - v2822;
                local v2830 = v2786 + v2777 + v2822;
                local v2831 = vector(v2829 + v2821 + 2, v2787 - v2823);
                local v2832 = vector(v2830 - v2821 - 2, v2787 - v2823);
                local v2833 = vector(-v2821, v2823 * 2);
                local v2834 = vector(v2821, v2823 * 2);
                l_play_0.poly(v2825, vector(v2829 + 1 - v2822, v2787), vector(v2829 + 1, v2787 - v2823), vector(v2829 + 1, v2787 + v2823));
                l_play_0.poly(v2826, vector(v2830 + v2822, v2787), vector(v2830, v2787 - v2823), vector(v2830, v2787 + v2823));
                l_play_0.rect(v2831, v2831 + v2833, v2827);
                l_play_0.rect(v2832, v2832 + v2834, v2828);
            end;
            return;
        end;
    end;
    v1690 = nil;
    v1691 = function(v2835)
        -- upvalues: l_v1689_6 (ref), l_v1688_6 (ref)
        local v2836 = v2835:get();
        events.render(l_v1689_6, v2836);
        events.createmove(l_v1688_6, v2836);
    end;
    l_v1017_9.enabled:set_callback(v1691, true);
end;
v1017 = nil;
v1018 = v364.visuals.custom_scope;
l_angles_0 = 9.25925925925926E-4;
v1020 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
v1030 = 0;
do
    local l_v1018_12, l_l_angles_0_14, l_v1020_11, l_v1030_11, l_v1533_9, l_l_aimtools_0_9, l_v1535_8 = v1018, l_angles_0, v1020, v1030, v1533, l_aimtools_0, v1535;
    l_v1533_9 = function()
        -- upvalues: l_v1030_11 (ref), v93 (ref), l_play_0 (ref), l_v1018_12 (ref), l_l_angles_0_14 (ref), v15 (ref)
        local v2844 = entity.get_local_player();
        if v2844 == nil or not v2844:is_alive() then
            return;
        else
            local v2845 = v2844:get_player_weapon();
            if v2845 == nil then
                return;
            else
                l_v1030_11 = v93.interp(l_v1030_11, v2844.m_bIsScoped, 0.05);
                if l_v1030_11 == 0 then
                    return;
                else
                    local v2846 = l_play_0.screen_size();
                    local v2847 = v2846 * 0.5;
                    local v2848 = l_v1018_12.accent_color:get();
                    local v2849 = l_v1018_12.secondary_color:get();
                    local v2850 = l_v1018_12.offset:get() * v2846.y * l_l_angles_0_14;
                    local v2851 = l_v1018_12.position:get() * v2846.y * l_l_angles_0_14;
                    local v2852 = l_v1018_12.thickness:get();
                    local v2853 = l_v1018_12.extra_options:get("Rotate Angle");
                    if l_v1018_12.extra_options:get("Dynamic Offset") then
                        local v2854 = v2845:get_spread();
                        local v2855 = (v2845:get_inaccuracy() + v2854) * 360;
                        v2850 = v2850 + v2855;
                        v2851 = v2851 + v2855;
                    end;
                    v2850 = v15(v2850);
                    v2851 = v15(v2851);
                    v2848.a = v2848.a * l_v1030_11;
                    v2849.a = v2849.a * l_v1030_11;
                    if v2853 then
                        l_play_0.push_rotation(45);
                    end;
                    if not l_v1018_12.exclude_lines:get("Top") then
                        local v2856 = vector(v2847.x + 0.5 - v2852 * 0.5, v2847.y - v2850 + 1);
                        local v2857 = vector(v2847.x + 0.5 + v2852 * 0.5, v2847.y - v2851 + 1);
                        l_play_0.gradient(v2856, v2857, v2848, v2848, v2849, v2849);
                    end;
                    if not l_v1018_12.exclude_lines:get("Bottom") then
                        local v2858 = vector(v2847.x + 0.5 - v2852 * 0.5, v2847.y + v2850);
                        local v2859 = vector(v2847.x + 0.5 + v2852 * 0.5, v2847.y + v2851);
                        l_play_0.gradient(v2858, v2859, v2848, v2848, v2849, v2849);
                    end;
                    if not l_v1018_12.exclude_lines:get("Left") then
                        local v2860 = vector(v2847.x - v2850 + 1, v2847.y + 0.5 - v2852 * 0.5);
                        local v2861 = vector(v2847.x - v2851 + 1, v2847.y + 0.5 + v2852 * 0.5);
                        l_play_0.gradient(v2860, v2861, v2848, v2849, v2848, v2849);
                    end;
                    if not l_v1018_12.exclude_lines:get("Right") then
                        local v2862 = vector(v2847.x + v2850, v2847.y + 0.5 - v2852 * 0.5);
                        local v2863 = vector(v2847.x + v2851, v2847.y + 0.5 + v2852 * 0.5);
                        l_play_0.gradient(v2862, v2863, v2848, v2849, v2848, v2849);
                    end;
                    if v2853 then
                        l_play_0.pop_rotation();
                    end;
                    return;
                end;
            end;
        end;
    end;
    l_l_aimtools_0_9 = function()
        -- upvalues: l_v1020_11 (ref)
        l_v1020_11:override();
    end;
    l_v1535_8 = function(v2864)
        -- upvalues: l_v1020_11 (ref), l_v1533_9 (ref), l_l_aimtools_0_9 (ref)
        if not v2864 then
            l_v1020_11:override();
        end;
        events.render(l_v1533_9, v2864);
        events.shutdown(l_l_aimtools_0_9, v2864);
    end;
    v1536 = nil;
    v1688 = function(v2865)
        -- upvalues: l_v1020_11 (ref), l_v1535_8 (ref)
        local v2866 = v2865:get();
        if v2866 then
            l_v1020_11:override("Remove All");
        end;
        l_v1535_8(v2866);
    end;
    l_v1018_12.enabled:set_callback(v1688, true);
end;
v1018 = nil;
l_angles_0 = v364.visuals.damage_indicator;
v1020 = {
    Default = 1, 
    Alternative = 2
};
v1030 = function()
    -- upvalues: v32 (ref)
    local v2867 = v32.ragebot.selection.min_damage:get();
    if v2867 == 0 then
        return "A";
    elseif v2867 > 100 then
        return string.format("+%d", v2867 - 100);
    else
        return v2867;
    end;
end;
do
    local l_l_angles_0_15, l_v1020_12, l_v1030_12, l_v1533_10, l_l_aimtools_0_10 = l_angles_0, v1020, v1030, v1533, l_aimtools_0;
    l_v1533_10 = function()
        -- upvalues: v799 (ref), v32 (ref), l_l_angles_0_15 (ref), l_play_0 (ref), l_v1020_12 (ref), l_v1030_12 (ref)
        local v2873 = entity.get_local_player();
        if v2873 == nil or not v2873:is_alive() then
            return;
        else
            local v2874 = v799.get(v32.ragebot.selection.min_damage);
            if (v2874 == nil or not v2874.active) and l_l_angles_0_15.if_override:get() then
                return;
            else
                local v2875 = v2874 ~= nil and v2874.active and l_l_angles_0_15.active_color:get() or l_l_angles_0_15.inactive_color:get();
                local v2876 = (l_play_0.screen_size() / 2):clone();
                local v2877 = l_v1020_12[l_l_angles_0_15.font:get()];
                if v2877 == nil then
                    return;
                else
                    local v2878 = l_l_angles_0_15.offset:get();
                    local v2879 = "";
                    local v2880 = l_v1030_12();
                    local v2881 = l_play_0.measure_text(v2877, v2879, v2880);
                    v2876.x = v2876.x + v2878 + 2;
                    v2876.y = v2876.y - v2878;
                    v2876.y = v2876.y - v2881.y;
                    l_play_0.text(v2877, v2876, v2875, v2879, v2880);
                    return;
                end;
            end;
        end;
    end;
    l_l_aimtools_0_10 = function(v2882)
        -- upvalues: l_v1533_10 (ref)
        events.render(l_v1533_10, v2882);
    end;
    v1535 = nil;
    v1536 = function(v2883)
        -- upvalues: l_l_aimtools_0_10 (ref)
        l_l_aimtools_0_10(v2883:get());
    end;
    l_l_angles_0_15.enabled:set_callback(v1536, true);
end;
l_angles_0 = nil;
v1020 = v364.visuals.break_lc_indicator;
v1030 = l_play_0.load_font("Calibri", 11, "ad");
v1533 = 0;
l_aimtools_0 = 0;
v1535 = "lc status";
v1536 = color();
v1688 = 0;
v1689 = 0;
v1690 = 0;
v1691 = false;
v1692 = nil;
v1693 = l_play_0.screen_size();
v1694 = vector(60, 30);
v1695 = vector((v1693.x - v1694.x) / 2, v1693.y * 0.3475);
v1692 = v121.new("lc_indicator", v1695, v1694, {
    rulers = {
        [1] = {
            [1] = true, 
            [2] = vector(v1693.x / 2, 0), 
            [3] = v1693.y
        }
    }, 
    border = {
        vector(v1693.x * 0.5, 0), 
        vector(v1693.x * 0.5, v1693.y)
    }
});
v1693 = function()
    -- upvalues: v364 (ref), v374 (ref), v876 (ref)
    if not v364.antiaim.enabled:get() then
        return not v374.is_onground;
    else
        local v2884 = entity.get_local_player();
        if v2884 == nil then
            return;
        else
            local v2885 = v2884:get_player_weapon();
            if v2885 == nil then
                return;
            else
                local v2886 = v2885:get_weapon_info();
                if v2886 == nil then
                    return;
                else
                    local l_weapon_type_4 = v2886.weapon_type;
                    local v2888 = v2885:get_weapon_index();
                    local v2889 = l_weapon_type_4 == 9;
                    local v2890 = v2888 == 64;
                    if v2889 or v2890 then
                        return false;
                    else
                        local v2891 = v876.builder:get_old_items();
                        if v2891 == nil then
                            return false;
                        else
                            local l_defensive_2 = v2891.defensive;
                            if l_defensive_2 == nil then
                                return false;
                            else
                                return l_defensive_2.force_break_lc:get();
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v1694 = function(v2893)
    if v2893 <= 0 then
        return "failed", color(255, 64, 64);
    elseif v2893 <= 3 then
        return "bad", color(255, 175, 104);
    elseif v2893 <= 6 then
        return "ok", color(255, 255, 255);
    elseif v2893 <= 9 then
        return "good", color(205, 236, 142);
    elseif v2893 <= 11 then
        return "nice", color(122, 241, 182);
    elseif v2893 <= 12 then
        return "ideal lc", color(101, 213, 255);
    else
        return "angel lc", color(207, 145, 255);
    end;
end;
do
    local l_v1030_13, l_v1533_11, l_l_aimtools_0_11, l_v1535_9, l_v1536_8, l_v1688_7, l_v1689_7, l_v1690_7, l_v1691_7, l_v1692_9, l_v1693_9, l_v1694_9, l_v1695_8, l_v1696_6, l_v1697_6 = v1030, v1533, l_aimtools_0, v1535, v1536, v1688, v1689, v1690, v1691, v1692, v1693, v1694, v1695, v1696, v1697;
    l_v1695_8 = function()
        -- upvalues: l_v1692_9 (ref), l_l_aimtools_0_11 (ref), l_v1535_9 (ref), l_v1688_7 (ref), l_v1536_8 (ref), l_v1533_11 (ref), l_play_0 (ref), l_v1030_13 (ref)
        local v2909 = l_v1692_9:get_drag_position() + l_v1692_9:get_drag_size() / 2;
        local v2910 = ui.get_alpha();
        if v2910 > 0 then
            l_l_aimtools_0_11 = 1;
        end;
        if l_l_aimtools_0_11 <= 0 then
            return;
        else
            local v2911 = "";
            local l_l_v1535_9_0 = l_v1535_9;
            local v2913 = l_v1688_7 .. "t";
            local v2914 = l_v1536_8:clone();
            local v2915 = color(255, 255, 255, 128);
            if l_v1533_11 == 0 and v2910 > 0 then
                l_l_v1535_9_0 = "lc status";
                v2914 = color();
            end;
            v2915.a = v2915.a * l_l_aimtools_0_11;
            v2914.a = v2914.a * l_l_aimtools_0_11;
            local v2916 = l_play_0.measure_text(l_v1030_13, v2911, l_l_v1535_9_0);
            local v2917 = l_play_0.measure_text(l_v1030_13, v2911, v2913);
            v2909.y = v2909.y - (v2916.y + v2917.y + 1) / 2;
            local v2918 = v2909 + vector(-v2916.x * 0.5, 0);
            local v2919 = v2909 + vector(-v2917.x * 0.5, 0);
            v2919.y = v2919.y + (v2916.y + 1);
            l_play_0.text(l_v1030_13, v2918, v2914, v2911, l_l_v1535_9_0);
            l_play_0.text(l_v1030_13, v2919, v2915, v2911, v2913);
            l_v1533_11 = math.max(0, l_v1533_11 - globals.frametime);
            if l_v1533_11 == 0 then
                l_l_aimtools_0_11 = math.max(0, l_l_aimtools_0_11 - globals.frametime * 8);
            end;
            l_v1692_9();
            return;
        end;
    end;
    l_v1696_6 = function()
        -- upvalues: l_v1689_7 (ref), l_v1691_7 (ref), l_v1693_9 (ref), l_v1690_7 (ref), l_v1694_9 (ref), l_v1533_11 (ref), l_l_aimtools_0_11 (ref), l_v1536_8 (ref), l_v1535_9 (ref), l_v1688_7 (ref), v375 (ref)
        local v2920 = rage.exploit:get();
        local v2921 = v2920 - l_v1689_7;
        if v2921 > 0 then
            l_v1691_7 = true;
        end;
        if l_v1691_7 and v2921 < 0 then
            l_v1691_7 = false;
            if l_v1693_9() or l_v1690_7 > 0 then
                local v2922, v2923 = l_v1694_9(l_v1690_7);
                l_v1533_11 = 0.66;
                l_l_aimtools_0_11 = 1;
                l_v1536_8 = v2923;
                l_v1535_9 = v2922;
                l_v1688_7 = l_v1690_7;
            end;
        end;
        l_v1689_7 = v2920;
        l_v1690_7 = v375.defensive_ticks;
    end;
    l_v1697_6 = function(v2924)
        -- upvalues: l_v1695_8 (ref), l_v1696_6 (ref)
        events.render(l_v1695_8, v2924);
        events.createmove(l_v1696_6, v2924);
    end;
    v1698 = nil;
    v1699 = function(v2925)
        -- upvalues: l_v1697_6 (ref)
        l_v1697_6(v2925:get());
    end;
    v1020.enabled:set_callback(v1699, true);
end;
v1020 = nil;
v1030 = v364.visuals.velocity_warning;
v1533 = 0;
l_aimtools_0 = nil;
v1535 = l_play_0.screen_size();
v1536 = vector(130, 12);
v1688 = vector((v1535.x - v1536.x) / 2, v1535.y * 0.285);
l_aimtools_0 = v121.new("velocity_warning", v1688, v1536, {
    rulers = {
        [1] = {
            [1] = true, 
            [2] = vector(v1535.x / 2, 0), 
            [3] = v1535.y
        }
    }, 
    border = {
        vector(v1535.x * 0.5, 0), 
        vector(v1535.x * 0.5, v1535.y)
    }
});
do
    local l_v1030_14, l_v1533_12, l_l_aimtools_0_12, l_v1535_10, l_v1536_9 = v1030, v1533, l_aimtools_0, v1535, v1536;
    l_v1535_10 = function()
        -- upvalues: l_l_aimtools_0_12 (ref), l_v1030_14 (ref), l_v1533_12 (ref), v93 (ref), v129 (ref), l_play_0 (ref)
        local v2931 = entity.get_local_player();
        if v2931 == nil then
            return;
        else
            local v2932 = l_l_aimtools_0_12:get_drag_position():clone();
            local v2933 = l_l_aimtools_0_12:get_drag_size();
            local v2934 = -globals.realtime;
            local v2935 = v2931:is_alive();
            local v2936 = ui.get_alpha() > 0;
            local v2937 = l_v1030_14.color_accent:get();
            local v2938 = l_v1030_14.color_secondary:get();
            local l_m_flVelocityModifier_0 = v2931.m_flVelocityModifier;
            if not v2935 then
                l_m_flVelocityModifier_0 = 1;
            end;
            local v2940 = v2936 or v2935 and l_m_flVelocityModifier_0 < 1;
            l_v1533_12 = v93.interp(l_v1533_12, v2940, 0.05);
            if l_v1533_12 > 0 then
                v2937.a = v2937.a * l_v1533_12;
                v2938.a = v2938.a * l_v1533_12;
                local v2941 = v129.gradient(string.format("%d%%", l_m_flVelocityModifier_0 * 100), v2934, v2937, v2938);
                local v2942 = 1;
                local v2943 = "";
                local v2944 = string.format("velocity inflicted ~ %s", v2941);
                local v2945 = l_play_0.measure_text(v2942, v2943, v2944);
                v2932.x = v2932.x + (v2933.x - v2945.x) / 2 + 1;
                l_play_0.text(v2942, v2932, v2937, v2943, v2944);
            end;
            l_l_aimtools_0_12();
            return;
        end;
    end;
    l_v1536_9 = function(v2946)
        -- upvalues: l_v1535_10 (ref)
        events.render(l_v1535_10, v2946);
    end;
    v1688 = nil;
    v1689 = function(v2947)
        -- upvalues: l_v1536_9 (ref)
        l_v1536_9(v2947:get());
    end;
    l_v1030_14.enabled:set_callback(v1689, true);
end;
v1030 = nil;
v1533 = v364.visuals.grenade_radius;
l_aimtools_0 = cvar.mp_friendlyfire;
v1535 = {};
v1536 = {};
do
    local l_v1533_13, l_l_aimtools_0_13, l_v1535_11, l_v1536_10, l_v1688_8, l_v1689_8, l_v1690_8, l_v1691_8, l_v1692_10 = v1533, l_aimtools_0, v1535, v1536, v1688, v1689, v1690, v1691, v1692;
    l_v1688_8 = function(v2957)
        -- upvalues: l_l_aimtools_0_13 (ref)
        if l_l_aimtools_0_13:int() == 1 then
            return false;
        else
            local v2958 = entity.get_local_player();
            local l_m_hOwnerEntity_0 = v2957.m_hOwnerEntity;
            if l_m_hOwnerEntity_0 == nil or not l_m_hOwnerEntity_0:is_player() then
                return false;
            elseif v2958 == l_m_hOwnerEntity_0 or l_m_hOwnerEntity_0:is_enemy() then
                return false;
            else
                return true;
            end;
        end;
    end;
    l_v1689_8 = function(v2960)
        for v2961 in pairs(v2960) do
            v2960[v2961] = nil;
        end;
    end;
    l_v1690_8 = function()
        -- upvalues: l_v1535_11 (ref)
        local v2962 = entity.get_entities("CSmokeGrenadeProjectile");
        local v2963 = {};
        for v2964 = 1, #v2962 do
            local v2965 = v2962[v2964];
            if v2965.m_bDidSmokeEffect then
                local v2966 = v2965:get_index();
                if l_v1535_11[v2966] == nil then
                    local v2967 = v2965:get_origin();
                    l_v1535_11[v2966] = {
                        alpha = 0, 
                        radius = 125, 
                        index = v2966, 
                        origin = v2967
                    };
                end;
                v2963[v2966] = true;
            end;
        end;
        for v2968 in pairs(l_v1535_11) do
            if v2963[v2968] == nil then
                l_v1535_11[v2968] = nil;
            end;
        end;
    end;
    l_v1691_8 = function()
        -- upvalues: l_v1536_10 (ref), l_v1688_8 (ref)
        local v2969 = entity.get_entities("CInferno");
        local v2970 = {};
        for v2971 = 1, #v2969 do
            local v2972 = v2969[v2971];
            local l_m_fireCount_0 = v2972.m_fireCount;
            if l_m_fireCount_0 ~= 0 then
                local v2974 = v2972:get_index();
                if l_v1536_10[v2974] == nil then
                    local v2975 = v2972:get_origin();
                    local v2976 = l_v1688_8(v2972);
                    l_v1536_10[v2974] = {
                        fire_count = 0, 
                        alpha = 0, 
                        radius = 0, 
                        index = v2974, 
                        origin = v2975, 
                        friendly = v2976
                    };
                end;
                local v2977 = l_v1536_10[v2974];
                if v2977.fire_count < l_m_fireCount_0 then
                    v2977.fire_count = l_m_fireCount_0;
                    local v2978 = 0;
                    local v2979 = nil;
                    local v2980 = nil;
                    local v2981 = {};
                    local v2982 = 0;
                    local _ = v2972:get_origin();
                    for v2984 = 0, l_m_fireCount_0 - 1 do
                        if v2972.m_bFireIsBurning[v2984] then
                            local v2985 = vector(v2972.m_fireXDelta[v2984], v2972.m_fireYDelta[v2984], v2972.m_fireZDelta[v2984]);
                            v2982 = v2982 + 1;
                            v2981[v2982] = v2985;
                        end;
                    end;
                    for v2986 = 1, v2982 do
                        for v2987 = 1, v2982 do
                            local v2988 = v2981[v2986];
                            local v2989 = v2981[v2987];
                            local v2990 = (v2989 - v2988):lengthsqr();
                            if v2978 < v2990 then
                                v2978 = v2990;
                                v2979 = v2988;
                                v2980 = v2989;
                            end;
                        end;
                    end;
                    if v2979 ~= nil and v2980 ~= nil then
                        v2977.radius = math.sqrt(v2978) / 2 + 40;
                    end;
                end;
                v2970[v2974] = true;
            end;
        end;
        for v2991 in pairs(l_v1536_10) do
            if v2970[v2991] == nil then
                l_v1536_10[v2991] = nil;
            end;
        end;
    end;
    l_v1692_10 = function()
        -- upvalues: l_v1533_13 (ref), l_v1535_11 (ref), l_play_0 (ref), l_v1536_10 (ref)
        local l_frametime_1 = globals.frametime;
        local v2993 = l_v1533_13.smoke_color:get();
        local v2994 = l_v1533_13.molotov_color:get();
        for _, v2996 in pairs(l_v1535_11) do
            v2996.alpha = math.min(v2996.alpha + l_frametime_1 * 4, 1);
            local v2997 = v2996.radius * v2996.alpha;
            l_play_0.circle_3d_outline(v2996.origin, v2993, v2997, 0, 1, 1);
        end;
        for _, v2999 in pairs(l_v1536_10) do
            v2999.alpha = math.min(v2999.alpha + l_frametime_1 * 4, 1);
            local v3000 = v2999.radius * v2999.alpha;
            l_play_0.circle_3d_outline(v2999.origin, v2994, v3000, 0, 1, 1);
            local v3001 = l_play_0.world_to_screen(v2999.origin);
            if v3001 ~= nil then
                if v2999.teammate then
                    l_play_0.text(1, v3001, color(149, 184, 6, 255), "c", "\226\156\148");
                else
                    l_play_0.text(1, v3001, color(230, 21, 21, 255), "c", "\226\157\140");
                end;
            end;
        end;
    end;
    v1693 = nil;
    v1694 = function(v3002)
        -- upvalues: l_v1689_8 (ref), l_v1535_11 (ref), l_v1690_8 (ref)
        local v3003 = v3002:get();
        if not v3003 then
            l_v1689_8(l_v1535_11);
        end;
        events.net_update_start(l_v1690_8, v3003);
    end;
    v1695 = function(v3004)
        -- upvalues: l_v1689_8 (ref), l_v1536_10 (ref), l_v1691_8 (ref)
        local v3005 = v3004:get();
        if not v3005 then
            l_v1689_8(l_v1536_10);
        end;
        events.net_update_start(l_v1691_8, v3005);
    end;
    do
        local l_v1694_10, l_v1695_9 = v1694, v1695;
        v1696 = function(v3008)
            -- upvalues: l_v1689_8 (ref), l_v1535_11 (ref), l_v1536_10 (ref), l_v1690_8 (ref), l_v1691_8 (ref), l_v1533_13 (ref), l_v1694_10 (ref), l_v1695_9 (ref), l_v1692_10 (ref)
            local v3009 = v3008:get();
            if not v3009 then
                l_v1689_8(l_v1535_11);
                l_v1689_8(l_v1536_10);
                events.net_update_start(l_v1690_8, false);
                events.net_update_start(l_v1691_8, false);
            end;
            if v3009 then
                l_v1533_13.smoke:set_callback(l_v1694_10, true);
                l_v1533_13.molotov:set_callback(l_v1695_9, true);
            else
                l_v1533_13.smoke:unset_callback(l_v1694_10);
                l_v1533_13.molotov:unset_callback(l_v1695_9);
            end;
            events.render(l_v1692_10, v3009);
        end;
        l_v1533_13.enabled:set_callback(v1696, true);
    end;
end;
v1533 = nil;
l_aimtools_0 = v364.visuals.gamesense_indicators;
v1535 = 380;
v1536 = 8;
v1688 = 24;
v1689 = 4;
v1690 = 3;
v1691 = l_play_0.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a");
v1692 = {};
v1692.__index = v1692;
v1692.new = function(v3010, v3011, v3012)
    return setmetatable({
        id = v3011, 
        size = v3012
    }, v3010);
end;
v1692.draw = function(v3013, v3014, v3015, ...)
    -- upvalues: l_play_0 (ref)
    l_play_0.texture(v3013.id, v3014, v3013.size, v3015, ...);
end;
v1694 = {
    bomb_c4 = v1692:new(({
        bomb_c4 = l_play_0.load_image_from_file("materials\\panorama\\images\\icons\\ui\\bomb_c4.svg", vector(32, 32))
    }).bomb_c4, vector(32, 29))
};
v1695 = {};
v1696 = 100;
v1697 = 0;
v1698 = 0;
v1699 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v1700 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v1701 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v1702 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim");
v1703 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points");
local v3016 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
local v3017 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
local v3018 = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes");
local v3019 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
local v3020 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
local v3021 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
local l_feature_list_0 = l_aimtools_0.feature_list;
local function v3025(v3023)
    local v3024 = v3023:get_override();
    if v3024 ~= nil then
        return v3024;
    else
        return v3023:get();
    end;
end;
local function v3028(v3026)
    -- upvalues: v799 (ref)
    local v3027 = v799.get(v3026);
    return v3027 ~= nil and v3027.active;
end;
do
    local l_l_aimtools_0_14, l_v1535_12, l_v1536_11, l_v1688_9, l_v1689_9, l_v1690_9, l_v1691_9, l_v1694_11, l_v1695_10, l_v1696_7, l_v1697_7, l_v1698_3, l_v1699_3, l_v1700_4, l_v1701_2, l_v1702_3, l_v1703_3, l_v3016_0, l_v3017_0, l_v3018_0, l_v3019_0, l_v3020_0, l_v3021_0, l_l_feature_list_0_0, l_v3025_0, l_v3028_0 = l_aimtools_0, v1535, v1536, v1688, v1689, v1690, v1691, v1694, v1695, v1696, v1697, v1698, v1699, v1700, v1701, v1702, v1703, v3016, v3017, v3018, v3019, v3020, v3021, l_feature_list_0, v3025, v3028;
    local function v3056()
        -- upvalues: l_v1695_10 (ref)
        for v3055 = 1, #l_v1695_10 do
            l_v1695_10[v3055] = nil;
        end;
    end;
    local function v3061(v3057)
        -- upvalues: l_play_0 (ref), l_v1691_9 (ref), l_v1689_9 (ref), l_v1695_10 (ref), l_v1535_12 (ref), l_v1536_11 (ref)
        local v3058 = l_play_0.measure_text(l_v1691_9, nil, v3057.text);
        local v3059 = l_play_0.screen_size();
        v3058.y = v3058.y + l_v1689_9 * 2;
        local v3060 = next(l_v1695_10) == nil and v3059.y - (v3059.y - l_v1535_12) / 2 or l_v1695_10[#l_v1695_10].offset - l_v1536_11 - v3058.y;
        v3057.offset = v3060;
        v3057.text_size = v3058;
        table.insert(l_v1695_10, v3057);
        return v3060;
    end;
    local function v3064(v3062, v3063, ...)
        -- upvalues: v3061 (ref)
        v3063 = table.concat({
            v3063, 
            ...
        });
        return v3061({
            text = v3063, 
            color = v3062
        });
    end;
    local function v3070(v3065, v3066)
        local v3067 = 0.5;
        local v3068 = 0.5;
        if v3066 > 0 then
            local v3069 = v3065 * v3067;
            if v3066 < (v3065 - v3069) * v3068 then
                v3069 = v3065 - v3066 * (1 / v3068);
            end;
            v3065 = v3069;
        end;
        return v3065;
    end;
    local function v3079(v3071, v3072)
        -- upvalues: v3070 (ref)
        local v3073 = 1;
        local v3074 = 500;
        local v3075 = v3074 * 3.5;
        local v3076 = (v3072:get_origin() - v3071:get_eye_position()):length();
        local v3077 = v3075 / 3;
        local v3078 = v3074 * math.exp(-v3076 * v3076 / (2 * v3077 * v3077)) * v3073;
        return v3070(v3078, v3071.m_ArmorValue);
    end;
    local function v3108(_)
        -- upvalues: l_v3028_0 (ref), l_v3016_0 (ref), l_v3017_0 (ref), l_v3018_0 (ref), l_v3021_0 (ref), l_v3025_0 (ref), l_v3019_0 (ref), l_v3020_0 (ref), v364 (ref), l_v1702_3 (ref), l_v1703_3 (ref), l_v1700_4 (ref), l_v1701_2 (ref), l_v1699_3 (ref), v3064 (ref), l_l_feature_list_0_0 (ref), v374 (ref), v375 (ref), l_v1696_7 (ref)
        local v3081 = l_v3028_0(l_v3016_0);
        local v3082 = l_v3028_0(l_v3017_0);
        local v3083 = l_v3028_0(l_v3018_0);
        local v3084 = l_v3021_0:get() > 0;
        local v3085 = l_v3025_0(l_v3019_0);
        local v3086 = l_v3025_0(l_v3020_0) or v364.antiaim.settings.freestanding.enabled:get();
        local v3087 = l_v3025_0(l_v1702_3) == "Force";
        local v3088 = l_v3025_0(l_v1703_3) == "Force";
        local v3089 = l_v3025_0(l_v1700_4) and not v3085;
        local v3090 = l_v3025_0(l_v1701_2) and not v3085 and not v3089;
        local v3091 = l_v3025_0(l_v1699_3);
        if v364.ragebot.force_shot.enabled:get() and v364.ragebot.force_shot.show_indicator:get() then
            v3064(color(255, 255, 255, 200), "SHOT");
        end;
        if v3084 and l_l_feature_list_0_0:get("Fake Latency") then
            local v3092 = utils.net_channel();
            if v3092 ~= nil then
                local v3093 = nil;
                local v3094 = l_v3025_0(l_v3021_0);
                local v3095 = math.clamp(v3092.latency[0] + v3092.latency[1], 0.001, 0.2);
                local v3096 = math.clamp(v3094 * 0.001 + v3092.avg_latency[1], 0.001, 0.2);
                local v3097 = math.clamp(v3095 / v3096, 0, 1);
                if v3097 < 0.5 then
                    v3093 = color(250, 234, 232, 255):lerp(color(213, 197, 84, 255), v3097 * 2);
                else
                    v3093 = color(213, 197, 84, 255):lerp(color(143, 194, 21, 255), (v3097 - 0.5) * 2);
                end;
                v3064(v3093, "PING");
            end;
        end;
        if v3090 and l_l_feature_list_0_0:get("Hide Shots") then
            v3064(color(255, 255, 255, 200), "OSAA");
        end;
        if v3089 and l_l_feature_list_0_0:get("Double Tap") then
            local v3098 = color(255, 0, 50, 255);
            if rage.exploit:get() == 1 then
                v3098 = color(255, 255, 255, 200);
            end;
            v3064(v3098, "DT");
        end;
        if v3091 and l_l_feature_list_0_0:get("Dormant Aimbot") then
            v3064(color(255, 255, 255, 200), "DA");
        end;
        if v3085 and l_l_feature_list_0_0:get("Fake Duck") then
            v3064(color(255, 255, 255, 200), "DUCK");
        end;
        if v3088 and l_l_feature_list_0_0:get("Safe Points") then
            v3064(color(255, 255, 255, 200), "SAFE");
        end;
        if v3087 and l_l_feature_list_0_0:get("Body Aim") then
            v3064(color(255, 255, 255, 200), "BODY");
        end;
        if v3081 and l_l_feature_list_0_0:get("Damage Override") then
            v3064(color(255, 255, 255, 200), "MD");
        end;
        if v3082 and l_l_feature_list_0_0:get("Hitchance Override") then
            v3064(color(255, 255, 255, 200), "HITCHANCE OVR");
        end;
        if v3083 and l_l_feature_list_0_0:get("Hitbox Override") then
            v3064(color(255, 255, 255, 200), "HITBOX OVR");
        end;
        if v3086 and l_l_feature_list_0_0:get("Freestanding") then
            v3064(color(255, 255, 255, 200), "FS");
        end;
        if not v374.is_onground and l_l_feature_list_0_0:get("Lag Compensation") then
            local v3099 = 255;
            local v3100 = 0;
            local v3101 = 50;
            local v3102 = 255;
            if v375.defensive_ticks > 0 or v375.teleport_units_sqr > 4096 then
                local v3103 = 255;
                local v3104 = 255;
                local v3105 = 255;
                v3102 = 200;
                v3101 = v3105;
                v3100 = v3104;
                v3099 = v3103;
            end;
            v3064(color(v3099, v3100, v3101, v3102), "LC");
        end;
        if l_l_feature_list_0_0:get("Fake Angles") then
            local v3106 = rage.antiaim:get_max_desync();
            local v3107 = color(196, 15, 15):lerp(color(132, 196, 20), v3106 / 58);
            v3064(v3107, "FAKE");
        end;
        if l_l_feature_list_0_0:get("Hit/Miss") then
            v3064(color(255, 255, 255, 200), l_v1696_7 .. "%");
        end;
    end;
    local function v3118(v3109, v3110)
        -- upvalues: v3061 (ref), l_v1694_11 (ref)
        local v3111 = v3110:get_player_weapon();
        if v3111 == nil then
            return;
        elseif not v3111.m_bStartedArming then
            return;
        else
            local l_m_fArmedTime_0 = v3111.m_fArmedTime;
            if l_m_fArmedTime_0 == nil then
                return;
            else
                local v3113 = v3110:get_origin();
                local l_m_bombsiteCenterA_0 = v3109.m_bombsiteCenterA;
                local l_m_bombsiteCenterB_0 = v3109.m_bombsiteCenterB;
                local v3116 = v3113:distsqr(l_m_bombsiteCenterA_0) < v3113:distsqr(l_m_bombsiteCenterB_0) and "A" or "B";
                local v3117 = (l_m_fArmedTime_0 - globals.curtime) / 3;
                v3061({
                    text = v3116, 
                    color = color(252, 243, 105, 255), 
                    progress = 1 - v3117, 
                    draw_cmd = l_v1694_11.bomb_c4
                });
                return;
            end;
        end;
    end;
    local function v3133(v3119, v3120)
        -- upvalues: l_play_0 (ref), v3061 (ref), l_v1694_11 (ref), v3079 (ref), v3064 (ref)
        local l_m_bBombDefused_0 = v3120.m_bBombDefused;
        if not v3120.m_bBombTicking or l_m_bBombDefused_0 then
            return;
        else
            local l_curtime_0 = globals.curtime;
            local l_m_flC4Blow_0 = v3120.m_flC4Blow;
            local v3124 = l_m_flC4Blow_0 - l_curtime_0;
            if v3124 > 0 then
                if v3120.m_hBombDefuser ~= nil then
                    local v3125 = l_play_0.screen_size();
                    local l_m_flDefuseCountDown_0 = v3120.m_flDefuseCountDown;
                    local v3127 = (l_m_flDefuseCountDown_0 - l_curtime_0) / 10;
                    local v3128 = l_m_flC4Blow_0 < l_m_flDefuseCountDown_0 and color(235, 50, 75, 125) or color(50, 235, 75, 125);
                    local v3129 = (v3125.y - 2) * (1 - v3127);
                    l_play_0.rect(vector(0, 0), vector(20, v3125.y), color(0, 0, 0, 115));
                    l_play_0.rect(vector(1, 1 + v3129), vector(19, v3125.y - 1), v3128);
                end;
                local v3130 = string.format("%s - %.1fs", v3120.m_nBombSite == 1 and "B" or "A", v3124);
                v3061({
                    text = v3130, 
                    color = color(255, 255, 255, 200), 
                    draw_cmd = l_v1694_11.bomb_c4
                });
            end;
            local l_m_iHealth_8 = v3119.m_iHealth;
            local v3132 = v3079(v3119, v3120);
            v3132 = math.floor(v3132);
            if l_m_iHealth_8 <= v3132 then
                v3064(color(255, 0, 50, 255), "FATAL");
            elseif v3132 > 0 then
                v3064(color(252, 243, 105, 255), string.format("-%d HP", v3132));
            end;
            return;
        end;
    end;
    local function v3141(v3134)
        -- upvalues: v3118 (ref), v3133 (ref)
        local v3135 = entity.get_game_rules();
        if v3135 == nil then
            return;
        else
            local v3136 = entity.get_player_resource();
            if v3136 == nil then
                return;
            else
                local l_m_bBombPlanted_0 = v3135.m_bBombPlanted;
                local l_m_iPlayerC4_0 = v3136.m_iPlayerC4;
                if l_m_iPlayerC4_0 ~= nil and l_m_iPlayerC4_0 ~= 0 then
                    local v3139 = entity.get(l_m_iPlayerC4_0);
                    if v3139 ~= nil then
                        v3118(v3136, v3139);
                    end;
                end;
                if l_m_bBombPlanted_0 then
                    local v3140 = entity.get_entities("CPlantedC4")[1];
                    if v3140 ~= nil then
                        v3133(v3134, v3140);
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v3143()
        -- upvalues: v3108 (ref), l_l_feature_list_0_0 (ref), v3141 (ref)
        local v3142 = entity.get_local_player();
        if v3142 == nil then
            return;
        else
            if v3142:is_alive() then
                v3108(v3142);
            end;
            if l_l_feature_list_0_0:get("Bomb Info") then
                v3141(v3142);
            end;
            return;
        end;
    end;
    local function v3149(v3144, v3145)
        -- upvalues: l_play_0 (ref)
        local v3146 = (v3144 + v3145) / 2;
        local v3147 = color(0, 0, 0, 0);
        local v3148 = color(0, 0, 0, 50);
        l_play_0.gradient(v3144, vector(v3146.x, v3145.y), v3147, v3148, v3147, v3148);
        l_play_0.gradient(v3145, vector(v3146.x, v3144.y), v3147, v3148, v3147, v3148);
    end;
    local function v3156(v3150, v3151, v3152, v3153, v3154, v3155)
        -- upvalues: l_play_0 (ref)
        l_play_0.circle_outline(v3150, color(0, 0, 0, 255), v3152, v3153, 1, v3155);
        l_play_0.circle_outline(v3150, v3151, v3152 - 1, v3153, v3154, v3155 - 2);
    end;
    local function v3170()
        -- upvalues: l_v1695_10 (ref), l_v1690_9 (ref), l_v1688_9 (ref), l_v1689_9 (ref), v3149 (ref), l_play_0 (ref), l_v1691_9 (ref), v3156 (ref)
        for v3157 = 1, #l_v1695_10 do
            local v3158 = l_v1695_10[v3157];
            if v3158.color ~= nil then
                local v3159 = vector(l_v1690_9, v3158.offset);
                local v3160 = v3159 + vector(l_v1688_9, l_v1689_9);
                local v3161 = v3158.text_size + vector(50);
                local l_color_1 = v3158.color;
                local l_draw_cmd_0 = v3158.draw_cmd;
                local l_progress_0 = v3158.progress;
                v3160.y = v3160.y + 2;
                if l_draw_cmd_0 ~= nil then
                    v3161.x = v3161.x + l_draw_cmd_0.size.x + 5;
                end;
                if l_progress_0 ~= nil then
                    v3161.x = v3161.x + 30;
                end;
                v3149(v3159, v3159 + v3161);
                if l_draw_cmd_0 ~= nil then
                    local v3165 = v3159:clone();
                    v3165.x = v3165.x + l_v1688_9;
                    v3165.y = v3165.y + (v3161.y - l_draw_cmd_0.size.y) / 2;
                    l_draw_cmd_0:draw(v3165, l_color_1, "f");
                    v3160.x = v3160.x + l_draw_cmd_0.size.x + 5;
                end;
                l_play_0.text(l_v1691_9, v3160 + 1, color(0, 0, 0, 128), "", v3158.text);
                l_play_0.text(l_v1691_9, v3160, l_color_1, "", v3158.text);
                v3160.x = v3160.x + v3158.text_size.x;
                if l_progress_0 ~= nil then
                    local v3166 = v3160.x + 10 / 2 + 12;
                    local v3167 = v3159.y + v3161.y / 2;
                    local v3168 = vector(v3166, v3167);
                    local v3169 = color(255, 255, 255, 200);
                    v3156(v3168, v3169, 10, 0, l_progress_0, 5);
                end;
            end;
        end;
    end;
    local function v3178()
        -- upvalues: l_play_0 (ref)
        local v3171 = entity.get_local_player();
        if v3171 == nil then
            return;
        else
            local v3172 = v3171:get_spectators();
            if v3172 == nil then
                return;
            else
                local v3173 = l_play_0.screen_size();
                local v3174 = vector(v3173.x - 10, 5);
                for v3175 = 1, #v3172 do
                    local v3176 = v3172[v3175]:get_name();
                    local v3177 = color(255, 255, 255, 200);
                    l_play_0.text(1, v3174, v3177, "r", v3176);
                    v3174.y = v3174.y + 18;
                end;
                return;
            end;
        end;
    end;
    local function v3179()
        -- upvalues: v3143 (ref), v3170 (ref), v3056 (ref)
        if globals.is_in_game then
            v3143();
            v3170();
        end;
        v3056();
    end;
    local function v3181(v3180)
        -- upvalues: l_v1698_3 (ref), l_v1697_7 (ref), l_v1696_7 (ref)
        if v3180.state == "death" or not (v3180.state ~= "player death") or v3180.state == "unregistered shot" then
            return;
        else
            l_v1698_3 = l_v1698_3 + 1;
            if v3180.state == nil then
                l_v1697_7 = l_v1697_7 + 1;
            end;
            l_v1696_7 = math.floor(l_v1697_7 / math.max(1, l_v1698_3) * 100);
            return;
        end;
    end;
    local function v3183(v3182)
        -- upvalues: v3179 (ref), v3181 (ref)
        events.render(v3179, v3182);
        events.aim_ack(v3181, v3182);
    end;
    local _ = nil;
    local function v3186(v3185)
        -- upvalues: v3178 (ref)
        events.render(v3178, v3185:get());
    end;
    do
        local l_v3186_0 = v3186;
        local function v3190(v3188)
            -- upvalues: v3178 (ref), l_l_aimtools_0_14 (ref), l_v3186_0 (ref), v3183 (ref)
            local v3189 = v3188:get();
            if not v3189 then
                events.render(v3178, false);
            end;
            if v3189 then
                l_l_aimtools_0_14.spectator_list:set_callback(l_v3186_0, true);
            else
                l_l_aimtools_0_14.spectator_list:unset_callback(l_v3186_0);
            end;
            v3183(v3189);
        end;
        l_l_aimtools_0_14.enabled:set_callback(v3190, true);
    end;
end;
l_aimtools_0 = nil;
v1535 = v364.visuals.kibit_markers;
v1536 = {};
do
    local l_v1535_13, l_v1536_12, l_v1688_10, l_v1689_10 = v1535, v1536, v1688, v1689;
    l_v1688_10 = function()
        -- upvalues: l_v1536_12 (ref), l_play_0 (ref), l_v1535_13 (ref)
        if not globals.is_in_game then
            return;
        else
            local l_realtime_1 = globals.realtime;
            for v3196 = #l_v1536_12, 1, -1 do
                if l_v1536_12[v3196].time < l_realtime_1 then
                    table.remove(l_v1536_12, v3196);
                end;
            end;
            for v3197 = 1, #l_v1536_12 do
                local v3198 = l_v1536_12[v3197];
                local v3199 = 1;
                local v3200 = v3198.time - l_realtime_1;
                if v3200 < 0.7 then
                    v3199 = v3200 / 0.7;
                end;
                local v3201 = l_play_0.world_to_screen(v3198.point);
                if v3201 ~= nil then
                    local v3202 = 1;
                    local v3203 = 4 + v3202;
                    local v3204 = l_v1535_13.color_x:get();
                    local v3205 = l_v1535_13.color_y:get();
                    local v3206 = vector(v3201.x - v3202, v3201.y - v3203);
                    local v3207 = vector(v3201.x + v3202, v3201.y + v3203);
                    local v3208 = vector(v3201.x - v3203, v3201.y - v3202);
                    local v3209 = vector(v3201.x + v3203, v3201.y + v3202);
                    v3204.a = v3204.a * v3199;
                    v3205.a = v3205.a * v3199;
                    l_play_0.rect(v3208, v3209, v3204);
                    l_play_0.rect(v3206, v3207, v3205);
                end;
            end;
            return;
        end;
    end;
    l_v1689_10 = function(v3210)
        -- upvalues: l_v1535_13 (ref), l_v1536_12 (ref)
        local v3211 = globals.realtime + l_v1535_13.speed:get() / 10;
        table.insert(l_v1536_12, {
            time = v3211, 
            point = v3210.aim
        });
    end;
    v1690 = nil;
    v1691 = function(v3212)
        -- upvalues: l_v1536_12 (ref), l_v1688_10 (ref), l_v1689_10 (ref)
        local v3213 = v3212:get();
        if not v3213 then
            for v3214 = 1, #l_v1536_12 do
                l_v1536_12[v3214] = nil;
            end;
        end;
        events.render(l_v1688_10, v3213);
        events.aim_ack(l_v1689_10, v3213);
    end;
    l_v1535_13.enabled:set_callback(v1691, true);
end;
v1535 = nil;
v1536 = v364.visuals.static_watermark;
v1688 = v364.visuals.watermark;
v1689 = v364.visuals.indicators;
v1690 = v364.visuals.solus_ui;
v1691 = {};
v1692 = 0;
do
    local l_v1692_11, l_v1693_10, l_v1694_12 = v1692, v1693, v1694;
    l_v1693_10 = function()
        -- upvalues: l_v1692_11 (ref)
        if l_v1692_11 <= 0 then
            return;
        else
            local v3218 = globals.frametime * 1.66;
            l_v1692_11 = math.max(0, l_v1692_11 - v3218);
            return;
        end;
    end;
    l_v1694_12 = function()
        -- upvalues: l_play_0 (ref), v16 (ref), l_v1692_11 (ref)
        local v3219 = l_play_0.screen_size();
        local v3220 = vector(v3219.x * 0.5, v3219.y - 18);
        local v3221 = 4;
        local v3222 = "";
        local l_name_5 = v16.name;
        local v3224 = l_play_0.measure_text(v3221, v3222, l_name_5);
        local v3225 = color(255, 255, 255, 255);
        v3220.x = v3220.x - v3224.x * 0.5;
        v3220.y = v3220.y - v3224.y;
        l_play_0.text(v3221, v3220, v3225, v3222, l_name_5);
        if l_v1692_11 > 0 then
            local v3226 = "";
            local v3227 = 5;
            local v3228 = "\194\168\203\156\226\128\157*\194\176\226\128\162";
            local v3229 = "\226\128\162\194\176*\226\128\157\203\156\194\168";
            local v3230 = l_play_0.measure_text(v3221, v3226, v3228);
            local v3231 = vector(v3220.x - v3230.x - v3227, v3220.y);
            local v3232 = vector(v3220.x + v3224.x + v3227, v3220.y);
            local v3233 = v3225:clone();
            v3233.a = v3233.a * l_v1692_11;
            l_play_0.text(v3221, v3231, v3233, v3226, v3228);
            l_play_0.text(v3221, v3232, v3233, v3226, v3229);
        end;
    end;
    v1691.on_render = function()
        -- upvalues: l_v1693_10 (ref), l_v1694_12 (ref)
        l_v1693_10();
        l_v1694_12();
    end;
    v1691.on_player_death = function(v3234)
        -- upvalues: l_v1692_11 (ref)
        local v3235 = entity.get_local_player();
        local v3236 = entity.get(v3234.userid, true);
        if entity.get(v3234.attacker, true) ~= v3235 or v3236 == v3235 then
            return;
        else
            l_v1692_11 = 1;
            return;
        end;
    end;
end;
v1692 = {};
v1693 = 4;
v1694 = function(v3237, v3238)
    return v3237:gsub(".", "%1" .. v3238, #v3237 - 1);
end;
do
    local l_v1536_13, l_v1688_11, l_v1689_11, l_v1690_10, l_v1691_10, l_v1692_12, l_v1693_11 = v1536, v1688, v1689, v1690, v1691, v1692, v1693;
    do
        local l_l_v1693_11_0, l_v1694_13, l_v1695_11, l_v1696_8 = l_v1693_11, v1694, v1695, v1696;
        l_v1695_11 = function()
            -- upvalues: l_v1536_13 (ref), l_v1694_13 (ref), v129 (ref)
            local v3250 = "";
            local v3251 = "ANGEL";
            local v3252 = "WINGS";
            if not l_v1536_13.remove_spaces:get() then
                v3250 = " ";
                v3251 = l_v1694_13(v3251, v3250);
                v3252 = l_v1694_13(v3252, v3250);
            end;
            return v3251 .. v3250 .. v129.gradient(v3252, -globals.realtime, color(255, 255, 255, 255), color(55, 55, 55, 255));
        end;
        l_v1696_8 = function()
            -- upvalues: v16 (ref)
            return string.format("[%s]", v16.build:upper());
        end;
        l_v1692_12.on_render = function()
            -- upvalues: l_play_0 (ref), l_v1536_13 (ref), l_v1695_11 (ref), l_v1696_8 (ref), l_l_v1693_11_0 (ref)
            local v3253 = 1;
            local v3254 = "";
            local v3255 = l_play_0.screen_size();
            local v3256 = l_v1536_13.color:get();
            local v3257 = l_v1536_13.position:get();
            local v3258 = l_v1695_11();
            local v3259 = l_v1696_8();
            local v3260 = l_play_0.measure_text(v3253, v3254, v3258);
            local v3261 = l_play_0.measure_text(v3253, v3254, v3259);
            if v3257 == "Bottom" then
                local v3262 = vector(v3255.x * 0.5, v3255.y - 14);
                local v3263 = v3262 - vector(v3260.x * 0.5, v3260.y);
                v3262.y = v3262.y - v3260.y;
                v3262.y = v3262.y - l_l_v1693_11_0;
                local v3264 = v3262 - vector(v3261.x * 0.5, v3261.y);
                l_play_0.text(v3253, v3263, v3256, v3254, v3258);
                l_play_0.text(v3253, v3264, color(200, 69, 69), v3254, v3259);
                return;
            else
                local v3265 = vector(20, v3255.y * 0.5);
                local v3266 = v3260.x + v3261.x + l_l_v1693_11_0;
                local v3267 = math.max(v3260.y, v3261.y);
                if v3257 == "Right" then
                    v3265.x = v3255.x - v3265.x;
                    v3265.x = v3265.x - v3266 + 1;
                end;
                v3265.y = v3265.y - v3267 * 0.5;
                local v3268 = v3265:clone();
                local v3269 = v3265:clone();
                v3269.x = v3269.x + v3260.x;
                v3269.x = v3269.x + l_l_v1693_11_0;
                l_play_0.text(v3253, v3268, v3256, v3254, v3258);
                l_play_0.text(v3253, v3269, color(200, 69, 69), v3254, v3259);
                return;
            end;
        end;
    end;
    l_v1693_11 = function(v3270)
        -- upvalues: l_v1691_10 (ref), l_v1692_12 (ref)
        local v3271 = v3270 == 1;
        local v3272 = v3270 == 2;
        events.render(l_v1691_10.on_render, v3271);
        events.render(l_v1692_12.on_render, v3272);
        events.player_death(l_v1691_10.on_player_death, v3271);
    end;
    v1694 = nil;
    v1695 = function(v3273)
        -- upvalues: l_v1536_13 (ref), l_v1693_11 (ref)
        local v3274 = v3273:get();
        local v3275 = v3274 == 2;
        l_v1536_13.remove_spaces:visibility(v3275);
        l_v1536_13.position:visibility(v3275);
        l_v1536_13.color:visibility(v3275);
        l_v1693_11(v3274);
    end;
    do
        local l_v1695_12 = v1695;
        v1696 = function()
            -- upvalues: l_v1688_11 (ref), l_v1689_11 (ref), l_v1690_10 (ref), l_v1693_11 (ref), l_v1536_13 (ref), l_v1695_12 (ref)
            local v3277 = l_v1688_11.enabled:get() or l_v1689_11.enabled:get();
            local v3278 = l_v1690_10.enabled:get() and l_v1690_10.select:get("Watermark");
            local v3279 = v3277 or v3278;
            if v3279 then
                l_v1693_11(nil);
            end;
            if not v3279 then
                l_v1536_13.style:set_callback(l_v1695_12, true);
            else
                l_v1536_13.style:unset_callback(l_v1695_12);
            end;
        end;
        l_v1689_11.enabled:set_callback(v1696);
        l_v1688_11.enabled:set_callback(v1696);
        l_v1690_10.enabled:set_callback(v1696);
        l_v1690_10.select:set_callback(v1696);
        v1696();
    end;
end;
v924 = nil;
v925 = nil;
v926 = v364.misc.clantag;
v927 = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag");
v928 = 0;
l_match_0 = {
    [1] = "", 
    [2] = "a", 
    [3] = "an", 
    [4] = "ang", 
    [5] = "ange", 
    [6] = "angel", 
    [7] = "angelw", 
    [8] = "angelwi", 
    [9] = "angelwin", 
    [10] = "angelwing", 
    [11] = "angelwings", 
    [12] = "angelwings", 
    [13] = "angelwings", 
    [14] = "angelwings", 
    [15] = "angelwings", 
    [16] = "angelwings", 
    [17] = "angelwings", 
    [18] = "angelwings", 
    [19] = "angelwings", 
    [20] = "angelwings", 
    [21] = "angelwings", 
    [22] = "angelwings", 
    [23] = "angelwings", 
    [24] = "ngelwings", 
    [25] = "gelwings", 
    [26] = "elwings", 
    [27] = "lwings", 
    [28] = "wings", 
    [29] = "ings", 
    [30] = "ngs", 
    [31] = "gs", 
    [32] = "s", 
    [33] = ""
};
v1017 = function()
    -- upvalues: v15 (ref)
    return v15(globals.curtime * 4);
end;
do
    local l_v927_8, l_v928_11, l_l_match_0_12, l_v1017_10, l_v1018_13 = v927, v928, l_match_0, v1017, v1018;
    l_v1018_13 = function()
        -- upvalues: l_v1017_10 (ref), l_l_match_0_12 (ref), l_v928_11 (ref)
        if not globals.is_in_game then
            return;
        else
            local v3285 = l_v1017_10() % #l_l_match_0_12 + 1;
            if l_v928_11 ~= v3285 then
                l_v928_11 = v3285;
                common.set_clan_tag(l_l_match_0_12[v3285] or "");
            end;
            return;
        end;
    end;
    l_angles_0 = nil;
    v1020 = function(v3286)
        -- upvalues: l_v927_8 (ref), l_v1018_13 (ref)
        local v3287 = v3286:get();
        if not v3287 then
            common.set_clan_tag("");
        end;
        local l_l_v927_8_0 = l_v927_8;
        local l_l_l_v927_8_0_0 = l_l_v927_8_0;
        l_l_v927_8_0 = l_l_v927_8_0.override;
        if v3287 then

        end;
        l_l_v927_8_0(l_l_l_v927_8_0_0, nil);
        events.net_update_end(l_v1018_13, v3287);
    end;
    v926.enabled:set_callback(v1020, true);
end;
v926 = nil;
v927 = v364.misc.trashtalk;
v928 = 0;
l_match_0 = {};
v1017 = "https://cdn.hysteria.one/angelwings/trashtalk.txt";
do
    local l_v928_12, l_l_match_0_13, l_v1017_11 = v928, l_match_0, v1017;
    v1018 = function(v3293)
        -- upvalues: l_l_match_0_13 (ref)
        if not v3293 or string.find(v3293, "404") then
            return;
        else
            local v3294 = 0;
            for v3295 in string.gmatch(v3293, "(.-)\n") do
                v3294 = v3294 + 1;
                l_l_match_0_13[v3294] = v3295;
            end;
            return;
        end;
    end;
    network.get(l_v1017_11, nil, v1018);
    l_v1017_11 = function(v3296)
        -- upvalues: l_l_match_0_13 (ref), l_v928_12 (ref)
        local v3297 = entity.get_local_player();
        local v3298 = entity.get(v3296.userid, true);
        if entity.get(v3296.attacker, true) ~= v3297 or v3298 == v3297 then
            return;
        else
            local v3299 = #l_l_match_0_13;
            local v3300 = math.random(1, v3299);
            if v3300 == l_v928_12 then
                v3300 = v3300 + 1;
                if v3300 == v3299 then
                    v3300 = 1;
                end;
            end;
            utils.console_exec("say " .. l_l_match_0_13[v3300]);
            l_v928_12 = v3300;
            return;
        end;
    end;
    v1018 = nil;
    l_angles_0 = function(v3301)
        -- upvalues: l_v1017_11 (ref)
        events.player_death(l_v1017_11, v3301:get());
    end;
    v927.enabled:set_callback(l_angles_0, true);
end;
v927 = nil;
v928 = v364.misc.fast_ladder;
l_match_0 = 9;
v1017 = function(v3302)
    local v3303 = v3302:get_weapon_info();
    if v3303 == nil or v3303.weapon_type ~= 9 then
        return false;
    else
        local l_m_fThrowTime_0 = v3302.m_fThrowTime;
        if l_m_fThrowTime_0 == nil or l_m_fThrowTime_0 == 0 then
            return false;
        else
            return true;
        end;
    end;
end;
do
    local l_l_match_0_14, l_v1017_12, l_v1018_14 = l_match_0, v1017, v1018;
    l_v1018_14 = function(v3308)
        -- upvalues: l_l_match_0_14 (ref), l_v1017_12 (ref), v15 (ref), l_play_0 (ref)
        local v3309 = entity.get_local_player();
        if v3309 == nil then
            return;
        elseif v3309.m_MoveType ~= l_l_match_0_14 then
            return;
        else
            local v3310 = v3309:get_player_weapon();
            if v3310 == nil or l_v1017_12(v3310) then
                return;
            else
                v3308.view_angles.y = v15(v3308.view_angles.y);
                v3308.view_angles.z = 0;
                local l_m_vecLadderNormal_0 = v3309.m_vecLadderNormal;
                if l_m_vecLadderNormal_0:lengthsqr() == 0 then
                    return;
                else
                    local v3312 = l_play_0.camera_angles();
                    local v3313 = l_m_vecLadderNormal_0:angles();
                    local v3314 = v3313.y - v3312.y + 180;
                    local v3315 = v3313.x - v3312.x;
                    v3314 = math.normalize_yaw(v3314);
                    v3315 = math.clamp(v3315, -89, 89);
                    local v3316 = math.abs(v3314);
                    local v3317 = 89;
                    local v3318 = -90;
                    local v3319 = v3315 < -45;
                    local v3320 = v3314 > 0;
                    local v3321 = v3308.sidemove > 0;
                    local v3322 = v3308.forwardmove > 0;
                    if v3316 > 70 and v3316 < 135 then
                        if v3308.forwardmove ~= 0 or v3308.sidemove == 0 then
                            return;
                        else
                            if not v3320 then
                                v3318 = -v3318;
                            end;
                            if v3320 then
                                v3321 = not v3321;
                            end;
                            v3308.in_back = v3321;
                            v3308.in_forward = not v3321;
                            if v3320 then
                                v3321 = not v3321;
                            end;
                            v3308.in_moveleft = v3321;
                            v3308.in_moveright = not v3321;
                            v3308.view_angles.x = v3317;
                            v3308.view_angles.y = math.normalize_yaw(v3313.y + v3318);
                            return;
                        end;
                    elseif v3308.sidemove ~= 0 or v3308.forwardmove == 0 then
                        return;
                    else
                        if not v3320 then
                            v3318 = -v3318;
                        end;
                        if not v3319 then
                            v3322 = not v3322;
                        end;
                        v3308.in_back = not v3322;
                        v3308.in_forward = v3322;
                        if not v3320 then
                            v3322 = not v3322;
                        end;
                        v3308.in_moveleft = v3322;
                        v3308.in_moveright = not v3322;
                        v3308.view_angles.x = v3317;
                        v3308.view_angles.y = math.normalize_yaw(v3313.y + v3318);
                        return;
                    end;
                end;
            end;
        end;
    end;
    l_angles_0 = nil;
    v1020 = function(v3323)
        -- upvalues: l_v1018_14 (ref)
        events.createmove(l_v1018_14, v3323:get());
    end;
    v928.enabled:set_callback(v1020, true);
end;
v928 = nil;
l_match_0 = v364.misc.edge_stop;
v1017 = function(v3324)
    local v3325 = entity.get_local_player();
    if v3325 == nil then
        return;
    else
        local v3326 = v3325:simulate_movement();
        v3326:think(5);
        if v3326.velocity.z < 0 then
            v3324.block_movement = 2;
        end;
        return;
    end;
end;
v1018 = nil;
do
    local l_v1017_13 = v1017;
    l_angles_0 = function(v3328)
        -- upvalues: l_v1017_13 (ref)
        events.createmove(l_v1017_13, v3328:get());
    end;
    l_match_0.enabled:set_callback(l_angles_0, true);
end;
l_match_0 = nil;
v1017 = v364.misc.collision_air_duck;
v1018 = function(v3329)
    local v3330 = entity.get_local_player();
    if v3330 == nil then
        return;
    else
        local l_m_fFlags_2 = v3330.m_fFlags;
        if bit.band(l_m_fFlags_2, 1) ~= 0 then
            return;
        elseif v3329.in_duck then
            return;
        else
            local v3332 = false;
            local v3333 = v3330:simulate_movement();
            v3329.in_duck = true;
            v3333:think(1);
            v3332 = bit.band(v3333.flags, 1) == 0 and v3333.did_hit_collision;
            v3333 = false;
            local v3334 = v3330:simulate_movement();
            v3329.in_duck = false;
            v3334:think(1);
            v3333 = bit.band(v3334.flags, 1) == 0 and v3334.did_hit_collision;
            if not v3332 and v3333 then
                v3329.in_duck = true;
            end;
            return;
        end;
    end;
end;
l_angles_0 = nil;
do
    local l_v1018_15 = v1018;
    v1020 = function(v3336)
        -- upvalues: l_v1018_15 (ref)
        events.createmove(l_v1018_15, v3336:get());
    end;
    v1017.enabled:set_callback(v1020, true);
end;
v1017 = nil;
v1018 = v364.misc.no_fall_damage;
l_angles_0 = false;
v1020 = function(v3337, v3338)
    local v3339 = v3337:get_origin();
    for v3340 = 0, math.pi * 2, math.pi * 2 / 8 do
        local v3341 = math.sin(v3340);
        local v3342 = math.cos(v3340);
        local v3343 = v3339 + vector(10 * v3342, 10 * v3341, 0);
        local v3344 = v3343 - vector(0, 0, v3338);
        if utils.trace_line(v3343, v3344, v3337).fraction ~= 1 then
            return true;
        end;
    end;
    return false;
end;
do
    local l_l_angles_0_16, l_v1020_13, l_v1030_15 = l_angles_0, v1020, v1030;
    l_v1030_15 = function(v3348)
        -- upvalues: l_l_angles_0_16 (ref), l_v1020_13 (ref)
        local v3349 = entity.get_local_player();
        if v3349 == nil then
            return;
        else
            if v3349.m_vecVelocity.z >= -500 then
                l_l_angles_0_16 = false;
            elseif l_v1020_13(v3349, 15) then
                l_l_angles_0_16 = false;
            elseif l_v1020_13(v3349, 75) then
                l_l_angles_0_16 = true;
            end;
            if v3349.m_vecVelocity.z < -500 then
                v3348.in_duck = l_l_angles_0_16;
            end;
            return;
        end;
    end;
    v1533 = nil;
    l_aimtools_0 = function(v3350)
        -- upvalues: l_v1030_15 (ref)
        events.createmove(l_v1030_15, v3350:get());
    end;
    v1018.enabled:set_callback(l_aimtools_0, true);
end;
v1018 = nil;
l_angles_0 = v364.misc.super_toss;
v1020 = 0.3;
v1030 = function(v3351, v3352, v3353)
    if math.abs(v3351.x) > math.abs(v3351.y) then
        local v3354 = v3351.y / v3351.x;
        local v3355 = 1 + v3354 * v3354;
        local v3356 = -2 * v3352.x - 2 * v3354 * v3352.y;
        local v3357 = v3352:length2dsqr() - v3353 * v3353;
        local v3358 = v3356 * v3356 - 4 * v3355 * v3357;
        if v3358 < 0 then
            return v3352 + (v3351 * v3352:dot(v3351) - v3352):normalized() * v3353;
        elseif v3358 < 0.001 then
            local v3359 = -v3356 / (2 * v3355);
            local v3360 = v3354 * v3359;
            return vector(v3359, v3360);
        else
            local v3361 = math.sqrt(v3358);
            local v3362 = (-v3356 + v3361) / (2 * v3355);
            local v3363 = v3354 * v3362;
            local v3364 = vector(v3362, v3363);
            v3362 = (-v3356 - v3361) / (2 * v3355);
            v3363 = v3354 * v3362;
            local v3365 = vector(v3362, v3363);
            if v3351:dot(v3364) > v3351:dot(v3365) then
                return v3364;
            else
                return v3365;
            end;
        end;
    else
        local v3366 = v3351.x / v3351.y;
        local v3367 = 1 + v3366 * v3366;
        local v3368 = -2 * v3352.y - 2 * v3366 * v3352.x;
        local v3369 = v3352:length2dsqr() - v3353 * v3353;
        local v3370 = v3368 * v3368 - 4 * v3367 * v3369;
        if v3370 < 0 then
            return v3352 + (v3351 * v3352:dot(v3351) - v3352):normalized() * v3353;
        elseif v3370 < 0.001 then
            local v3371 = -v3368 / (2 * v3367);
            local v3372 = v3366 * v3371;
            return vector(v3372, v3371);
        else
            local v3373 = math.sqrt(v3370);
            local v3374 = (-v3368 + v3373) / (2 * v3367);
            local v3375 = v3366 * v3374;
            local v3376 = vector(v3375, v3374);
            v3374 = (-v3368 - v3373) / (2 * v3367);
            v3375 = v3366 * v3374;
            local v3377 = vector(v3375, v3374);
            if v3351:dot(v3376) > v3351:dot(v3377) then
                return v3376;
            else
                return v3377;
            end;
        end;
    end;
end;
do
    local l_v1020_14, l_v1030_16, l_v1533_14, l_l_aimtools_0_15, l_v1535_14, l_v1536_14 = v1020, v1030, v1533, l_aimtools_0, v1535, v1536;
    l_v1533_14 = function(v3384, v3385, v3386, v3387)
        -- upvalues: v17 (ref), l_v1020_14 (ref), l_v1030_16 (ref)
        local v3388 = vector():angles(v3384);
        local v3389 = vector():angles(v3384.x - (90 - math.abs(v3384.x)) * 10 / 90, v3384.y);
        local v3390 = v3389:dot(v3388) / v3388:length();
        local v3391 = math.clamp(v3386 * 0.9, 15, 750);
        local v3392 = math.clamp(v3387, 0, 1);
        v3391 = v3391 * v17.lerp(l_v1020_14, 1, v3392);
        v3384.y = (l_v1030_16(v3389, v3385 * 1.25, v3391 * v3390) - v3385 * 1.25):angles().y;
        v3384.x = math.clamp(v3384.x + math.clamp(v3385.z * 0.1, -20, 20), -89, 89);
    end;
    l_l_aimtools_0_15 = function(v3393, v3394)
        local v3395 = math.rad(v3394);
        local v3396 = math.cos(v3395);
        local v3397 = math.sin(v3395);
        local v3398 = v3396 * v3393.forwardmove + v3397 * v3393.sidemove;
        local v3399 = v3397 * v3393.forwardmove + v3396 * v3393.sidemove;
        v3393.forwardmove = v3398;
        v3393.sidemove = v3399;
    end;
    l_v1535_14 = function(v3400)
        -- upvalues: l_play_0 (ref), l_v1533_14 (ref), l_l_aimtools_0_15 (ref)
        local v3401 = entity.get_local_player();
        if v3401 == nil then
            return;
        else
            local v3402 = v3401:get_player_weapon();
            if v3402 == nil then
                return;
            else
                local v3403 = v3402:get_weapon_info();
                if v3403 == nil or v3403.weapon_type ~= 9 then
                    return;
                elseif v3402.m_fThrowTime == 0 then
                    return;
                elseif v3401.m_nTickBase * globals.tickinterval < v3402.m_fThrowTime and rage.exploit:get() ~= 1 then
                    return;
                else
                    local l_view_angles_0 = v3400.view_angles;
                    local l_y_4 = l_view_angles_0.y;
                    local v3406 = l_play_0.camera_angles();
                    if v3406.x ~= l_view_angles_0.x or v3406.y ~= l_view_angles_0.y then
                        return;
                    else
                        l_v1533_14(l_view_angles_0, v3401.m_vecVelocity, v3403.throw_velocity, v3402.m_flThrowStrength);
                        l_l_aimtools_0_15(v3400, math.normalize_yaw(l_y_4 - l_view_angles_0.y));
                        return;
                    end;
                end;
            end;
        end;
    end;
    l_v1536_14 = function(v3407)
        -- upvalues: l_v1533_14 (ref)
        local v3408 = entity.get_local_player();
        if v3408 == nil then
            return;
        else
            local v3409 = v3408:get_player_weapon();
            if v3409 == nil then
                return;
            else
                local v3410 = v3409:get_weapon_info();
                if v3410 ~= nil and v3410.weapon_type == 9 then
                    l_v1533_14(v3407.angles, v3407.velocity, v3410.throw_velocity, v3409.m_flThrowStrength);
                end;
                return;
            end;
        end;
    end;
    v1688 = nil;
    v1689 = function(v3411)
        -- upvalues: l_v1535_14 (ref), l_v1536_14 (ref)
        local v3412 = v3411:get();
        events.createmove(l_v1535_14, v3412);
        events.grenade_override_view(l_v1536_14, v3412);
    end;
    l_angles_0.enabled:set_callback(v1689, true);
end;
l_angles_0 = nil;
v1020 = v364.misc.grenade_release;
v1030 = nil;
do
    local l_v1020_15, l_v1030_17, l_v1533_15, l_l_aimtools_0_16, l_v1535_15 = v1020, v1030, v1533, l_aimtools_0, v1535;
    l_v1533_15 = function(v3418, v3419)
        -- upvalues: l_v1020_15 (ref)
        if v3418 == nil or v3419 == nil then
            return false;
        elseif v3418:get_weapon_index() == 45 then
            return v3419 > 0;
        else
            return l_v1020_15.damage:get() <= v3419;
        end;
    end;
    l_l_aimtools_0_16 = function(v3420)
        -- upvalues: l_v1533_15 (ref), l_v1030_17 (ref)
        local v3421 = entity.get_local_player();
        if v3421 == nil then
            return;
        else
            local v3422 = v3421:get_player_weapon();
            if v3422 == nil then
                return;
            elseif not v3422.m_bPinPulled then
                return;
            elseif v3422.m_flThrowStrength <= 0 then
                return;
            else
                if l_v1533_15(v3422, l_v1030_17) then
                    v3420.in_attack = false;
                    v3420.in_attack2 = false;
                end;
                l_v1030_17 = nil;
                return;
            end;
        end;
    end;
    l_v1535_15 = function(v3423)
        -- upvalues: l_v1030_17 (ref)
        l_v1030_17 = v3423.damage;
    end;
    v1536 = nil;
    v1688 = function(v3424)
        -- upvalues: l_l_aimtools_0_16 (ref), l_v1535_15 (ref)
        local v3425 = v3424:get();
        events.createmove(l_l_aimtools_0_16, v3425);
        events.grenade_prediction(l_v1535_15, v3425);
    end;
    l_v1020_15.enabled:set_callback(v1688, true);
end;
v1020 = nil;
v1030 = v364.misc.fps_optimize;
v1533 = false;
l_aimtools_0 = {};
v1535 = function(v3426)
    assert(type(v3426) == "table", "cmds must be a table");
    assert(type(v3426.set) == "function", "set must be a function");
    assert(type(v3426.unset) == "function", "unset must be a function");
    return {
        set = v3426.set, 
        unset = v3426.unset
    };
end;
do
    local l_v1535_16 = v1535;
    v1536 = function(v3428, v3429)
        -- upvalues: l_v1535_16 (ref)
        assert(type(v3428) == "userdata", "convar must be a userdata");
        assert(type(v3429) == "number", "value must be a number");
        local v3430 = nil;
        local l_v3429_0 = v3429;
        local function v3432()
            -- upvalues: v3430 (ref), v3428 (ref), l_v3429_0 (ref)
            if v3430 == nil then
                v3430 = v3428:int();
                v3428:int(l_v3429_0);
            end;
        end;
        local function v3433()
            -- upvalues: v3430 (ref), v3428 (ref)
            if v3430 ~= nil then
                v3428:int(v3430);
                v3430 = nil;
            end;
        end;
        return l_v1535_16({
            set = v3432, 
            unset = v3433
        });
    end;
    v1688 = function(v3434)
        -- upvalues: l_v1535_16 (ref)
        assert(type(v3434) == "function", "fn must be a function");
        local v3435 = {};
        v3434(v3435);
        return l_v1535_16(v3435);
    end;
    l_aimtools_0.Fog = {
        v1536(cvar.fog_enable, 0), 
        v1536(cvar.fog_enable_water_fog, 0)
    };
    l_aimtools_0.Blood = {
        v1536(cvar.violence_hblood, 0)
    };
    l_aimtools_0.Bloom = {
        v1536(cvar.mat_disable_bloom, 1)
    };
    l_aimtools_0.Decals = {
        v1536(cvar.r_drawdecals, 0)
    };
    l_aimtools_0.Shadows = {
        v1536(cvar.r_shadows, 0), 
        v1536(cvar.cl_csm_static_prop_shadows, 0), 
        v1536(cvar.cl_csm_shadows, 0), 
        v1536(cvar.cl_csm_world_shadows, 0), 
        v1536(cvar.cl_foot_contact_shadows, 0), 
        v1536(cvar.cl_csm_viewmodel_shadows, 0), 
        v1536(cvar.cl_csm_rope_shadows, 0), 
        v1536(cvar.cl_csm_sprite_shadows, 0), 
        v1536(cvar.cl_csm_translucent_shadows, 0), 
        v1536(cvar.cl_csm_entity_shadows, 0), 
        v1536(cvar.cl_csm_world_shadows_in_viewmodelcascade, 0)
    };
    l_aimtools_0.Sprites = {
        v1536(cvar.r_drawsprites, 0)
    };
    l_aimtools_0.Particles = {
        v1536(cvar.r_drawparticles, 0)
    };
    l_aimtools_0.Ropes = {
        v1536(cvar.r_drawropes, 0)
    };
    l_aimtools_0["Dynamic lights"] = {
        v1536(cvar.mat_disable_fancy_blending, 1)
    };
    l_aimtools_0["Map details"] = {
        v1536(cvar.func_break_max_pieces, 0), 
        v1536(cvar.props_break_max_pieces, 0)
    };
    l_aimtools_0["Weapon effects"] = {
        v1536(cvar.muzzleflash_light, 0), 
        v1536(cvar.r_drawtracers_firstperson, 0)
    };
    l_aimtools_0.Teammates = {
        v1688(function(v3436)
            local function v3441(v3437)
                local v3438 = entity.get_local_player();
                if v3438 == nil then
                    return;
                else
                    local v3439 = v3438:is_alive();
                    entity.get_players(false, true, function(v3440)
                        -- upvalues: v3438 (ref), v3437 (ref), v3439 (ref)
                        if v3440 ~= v3438 and not v3440:is_enemy() then
                            if v3437 or not v3439 then
                                v3440.m_nRenderMode = 0;
                            else
                                v3440.m_nRenderMode = 10;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
            local function v3442()
                -- upvalues: v3441 (ref)
                v3441(true);
            end;
            local function v3443()
                -- upvalues: v3441 (ref)
                v3441(false);
            end;
            local function v3444()
                -- upvalues: v3441 (ref), v3442 (ref), v3443 (ref)
                v3441(false);
                events.shutdown(v3442, true);
                events.net_update_end(v3443, true);
            end;
            local function v3445()
                -- upvalues: v3441 (ref), v3442 (ref), v3443 (ref)
                v3441(true);
                events.shutdown(v3442, false);
                events.net_update_end(v3443, false);
            end;
            v3436.set = v3444;
            v3436.unset = v3445;
        end)
    };
end;
do
    local l_v1030_18, l_v1533_16, l_l_aimtools_0_17, l_v1535_17, l_v1536_15, l_v1688_12, l_v1689_12, l_v1690_11 = v1030, v1533, l_aimtools_0, v1535, v1536, v1688, v1689, v1690;
    l_v1535_17 = function()
        -- upvalues: l_v1030_18 (ref), v374 (ref)
        if l_v1030_18.always_on:get() then
            return true;
        elseif v374.is_peeking and l_v1030_18.detections:get("Peeking") then
            return true;
        elseif v374.is_vulnerable and l_v1030_18.detections:get("Hit Flag") then
            return true;
        else
            return false;
        end;
    end;
    l_v1536_15 = function()
        -- upvalues: l_v1533_16 (ref), l_l_aimtools_0_17 (ref)
        if not l_v1533_16 then
            return;
        else
            for _, v3455 in pairs(l_l_aimtools_0_17) do
                for v3456 = 1, #v3455 do
                    v3455[v3456]:unset();
                end;
            end;
            l_v1533_16 = false;
            return;
        end;
    end;
    l_v1688_12 = function()
        -- upvalues: l_v1533_16 (ref), l_v1030_18 (ref), l_l_aimtools_0_17 (ref)
        if l_v1533_16 then
            return;
        else
            local v3457 = l_v1030_18.select:get();
            for v3458 = 1, #v3457 do
                local v3459 = l_l_aimtools_0_17[v3457[v3458]];
                for v3460 = 1, #v3459 do
                    v3459[v3460]:set();
                end;
            end;
            l_v1533_16 = true;
            return;
        end;
    end;
    l_v1689_12 = function()
        -- upvalues: l_v1536_15 (ref)
        l_v1536_15();
    end;
    l_v1690_11 = function()
        -- upvalues: l_v1535_17 (ref), l_v1536_15 (ref), l_v1688_12 (ref)
        if not l_v1535_17() then
            return l_v1536_15();
        else
            l_v1688_12();
            return;
        end;
    end;
    v1691 = nil;
    v1692 = function(_)
        -- upvalues: l_v1536_15 (ref), l_v1688_12 (ref)
        l_v1536_15();
        l_v1688_12();
    end;
    do
        local l_v1692_13 = v1692;
        v1693 = function(v3463)
            -- upvalues: l_v1030_18 (ref), l_v1692_13 (ref), l_v1536_15 (ref), l_v1689_12 (ref), l_v1690_11 (ref)
            local v3464 = v3463:get();
            if v3464 then
                l_v1030_18.select:set_callback(l_v1692_13, true);
            else
                l_v1030_18.select:unset_callback(l_v1692_13);
            end;
            if not v3464 then
                l_v1536_15();
            end;
            events.shutdown(l_v1689_12, v3464);
            events.net_update_end(l_v1690_11, v3464);
        end;
        l_v1030_18.enabled:set_callback(v1693, true);
    end;
end;
v1030 = nil;
v1533 = v364.misc.ping_unlocker;
l_aimtools_0 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
v1535 = cvar.sv_maxunlag;
do
    local l_v1533_17, l_l_aimtools_0_18, l_v1535_18, l_v1536_16, l_v1688_13, l_v1689_13 = v1533, l_aimtools_0, v1535, v1536, v1688, v1689;
    l_v1536_16 = function()
        -- upvalues: l_l_aimtools_0_18 (ref), l_v1535_18 (ref)
        l_l_aimtools_0_18:override();
        l_l_aimtools_0_18:disabled(false);
        l_v1535_18:float(tonumber(l_v1535_18:string()), true);
    end;
    l_v1688_13 = function(v3471)
        -- upvalues: l_l_aimtools_0_18 (ref), l_v1535_18 (ref)
        l_l_aimtools_0_18:override(v3471);
        l_l_aimtools_0_18:disabled(true);
        l_v1535_18:float(0.4, true);
    end;
    l_v1689_13 = function()
        -- upvalues: l_v1536_16 (ref)
        l_v1536_16();
    end;
    v1690 = nil;
    v1691 = function(v3472)
        -- upvalues: l_v1688_13 (ref)
        l_v1688_13(v3472:get());
    end;
    do
        local l_v1691_11 = v1691;
        v1692 = function(v3474)
            -- upvalues: l_v1536_16 (ref), l_v1533_17 (ref), l_v1691_11 (ref), l_v1689_13 (ref)
            local v3475 = v3474:get();
            if not v3475 then
                l_v1536_16();
            end;
            if v3475 then
                l_v1533_17.value:set_callback(l_v1691_11, true);
            else
                l_v1533_17.value:unset_callback(l_v1691_11);
            end;
            events.shutdown(l_v1689_13, v3475);
        end;
        l_v1533_17.enabled:set_callback(v1692, true);
    end;
end;
v1533 = nil;
l_aimtools_0 = v364.misc.animation_breaker;
v1535 = 2;
v1536 = 6;
v1688 = 12;
v1689 = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
v1690 = ffi.typeof("            struct {\n                float  m_flLayerAnimtime;\n                float  m_flLayerFadeOuttime;\n\n                // dispatch flags\n                void  *m_pDispatchedStudioHdr;\n                int    m_nDispatchedSrc;\n                int    m_nDispatchedDst;\n\n                int    m_nOrder;\n                int    m_nSequence;\n                float  m_flPrevCycle;\n                float  m_flWeight;\n                float  m_flWeightDeltaRate;\n\n                // used for automatic crossfades between sequence changes;\n                float  m_flPlaybackRate;\n                float  m_flCycle;\n                int    m_pOwner;\n                int    m_nInvalidatePhysicsBits;\n            } **\n        ");
do
    local l_l_aimtools_0_19, l_v1535_19, l_v1536_17, l_v1688_14, l_v1689_14, l_v1690_12, l_v1691_12, l_v1692_14, l_v1693_12, l_v1694_14, l_v1695_13, l_v1696_9 = l_aimtools_0, v1535, v1536, v1688, v1689, v1690, v1691, v1692, v1693, v1694, v1695, v1696;
    l_v1691_12 = function(v3488)
        -- upvalues: l_v1690_12 (ref)
        return ffi.cast(l_v1690_12, ffi.cast("uintptr_t", v3488[0]) + 10640)[0];
    end;
    l_v1692_14 = function(v3489)
        -- upvalues: v374 (ref), l_l_aimtools_0_19 (ref), l_v1689_14 (ref)
        if v374.is_onground then
            local v3490 = l_l_aimtools_0_19.ground_legs:get();
            if v3490 == "Static" then
                l_v1689_14:override("Sliding");
                v3489.m_flPoseParameter[0] = 0;
                return;
            elseif v3490 == "Jitter" then
                local l_tickcount_3 = globals.tickcount;
                local v3492 = l_l_aimtools_0_19.legs_offset_1:get();
                local v3493 = l_l_aimtools_0_19.legs_offset_2:get();
                local v3494 = 1 / (l_tickcount_3 % 8 >= 4 and 200 or 400);
                local v3495 = l_tickcount_3 % 4 >= 2 and v3492 or v3493;
                l_v1689_14:override("Sliding");
                v3489.m_flPoseParameter[0] = v3495 * v3494;
                return;
            elseif v3490 == "Allah" then
                l_v1689_14:override("Walking");
                v3489.m_flPoseParameter[7] = 0;
                return;
            elseif v3490 == "Kangaroo" then
                v3489.m_flPoseParameter[3] = math.random();
                v3489.m_flPoseParameter[6] = math.random();
                v3489.m_flPoseParameter[7] = math.random();
            end;
        end;
        l_v1689_14:override();
    end;
    l_v1693_12 = function(v3496, v3497)
        -- upvalues: l_l_aimtools_0_19 (ref), v374 (ref), l_v1536_17 (ref)
        local v3498 = l_l_aimtools_0_19.air_legs:get();
        if v3498 == "Disabled" then
            return;
        elseif v374.is_onground then
            return;
        elseif v3498 == "Static" then
            v3496.m_flPoseParameter[6] = 1;
            return;
        elseif v3498 == "kangaroo" then
            v3496.m_flPoseParameter[3] = math.random();
            v3496.m_flPoseParameter[6] = math.random();
            v3496.m_flPoseParameter[7] = math.random();
            return;
        elseif v3498 == "Haram" then
            if not v374.is_moving then
                return;
            else
                local v3499 = v3497[l_v1536_17];
                if v3499 == nil then
                    return;
                else
                    v3499.m_flWeight = 1;
                    return;
                end;
            end;
        else
            return;
        end;
    end;
    l_v1694_14 = function(v3500)
        -- upvalues: l_l_aimtools_0_19 (ref), l_v1688_14 (ref)
        local v3501 = l_l_aimtools_0_19.body_lean:get();
        if v3501 == -1 then
            return;
        else
            local v3502 = v3500[l_v1688_14];
            if v3502 == nil then
                return;
            else
                v3502.m_flWeight = v3501 * 0.1;
                return;
            end;
        end;
    end;
    l_v1695_13 = function(v3503, v3504)
        -- upvalues: l_l_aimtools_0_19 (ref), v374 (ref)
        if not l_l_aimtools_0_19.pitch_on_land:get() then
            return;
        elseif not v374.is_onground then
            return;
        elseif not v3504.landing then
            return;
        else
            v3503.m_flPoseParameter[12] = 0.5;
            return;
        end;
    end;
    l_v1696_9 = function(v3505)
        -- upvalues: l_v1691_12 (ref), l_v1535_19 (ref), l_v1692_14 (ref), l_v1693_12 (ref), l_v1695_13 (ref), l_v1694_14 (ref)
        local v3506 = entity.get_local_player();
        if v3506 == nil or v3505 ~= v3506 then
            return;
        else
            local v3507 = v3505:get_anim_state();
            if v3507 == nil then
                return;
            else
                local v3508 = l_v1691_12(v3505);
                if v3508 == nil then
                    return;
                else
                    if v3506.m_MoveType == l_v1535_19 then
                        l_v1692_14(v3506);
                        l_v1693_12(v3506, v3508);
                        l_v1695_13(v3506, v3507);
                    end;
                    l_v1694_14(v3508);
                    return;
                end;
            end;
        end;
    end;
    v1697 = nil;
    v1698 = function(v3509)
        -- upvalues: l_v1689_14 (ref), l_v1696_9 (ref)
        local v3510 = v3509:get();
        if not v3510 then
            l_v1689_14:override();
        end;
        events.post_update_clientside_animation(l_v1696_9, v3510);
    end;
    l_l_aimtools_0_19.enabled:set_callback(v1698, true);
end;
l_aimtools_0 = nil;
v1535 = v364.misc.fake_duck;
v1536 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v1688 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v1689 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
v1690 = {};
v1691 = 0;
do
    local l_v1536_18, l_v1688_15, l_v1689_15, l_v1690_13, l_v1691_13 = v1536, v1688, v1689, v1690, v1691;
    do
        local l_l_v1691_13_0, l_v1692_15, l_v1693_13, l_v1694_15, l_v1695_14, l_v1696_10 = l_v1691_13, v1692, v1693, v1694, v1695, v1696;
        l_v1692_15 = function()
            -- upvalues: l_l_v1691_13_0 (ref)
            if l_l_v1691_13_0 >= 14 then
                l_l_v1691_13_0 = 0;
            end;
            l_l_v1691_13_0 = l_l_v1691_13_0 + 1;
        end;
        l_v1693_13 = function()
            -- upvalues: l_v1536_18 (ref), l_v1688_15 (ref)
            l_v1536_18:override();
            l_v1688_15:override();
        end;
        l_v1694_15 = function()
            -- upvalues: l_v1693_13 (ref)
            l_v1693_13();
        end;
        l_v1695_14 = function(v3522)
            -- upvalues: l_v1689_15 (ref)
            if not l_v1689_15:get() then
                return;
            else
                local v3523 = entity.get_local_player();
                if v3523 == nil then
                    return;
                else
                    local v3524 = entity.get_game_rules();
                    if v3524 == nil or not v3524.m_bFreezePeriod then
                        return;
                    else
                        v3522.camera.z = v3523:get_origin().z + 64;
                        return;
                    end;
                end;
            end;
        end;
        l_v1696_10 = function(v3525)
            -- upvalues: l_v1689_15 (ref), l_v1693_13 (ref), l_v1692_15 (ref), l_l_v1691_13_0 (ref), l_v1536_18 (ref), l_v1688_15 (ref)
            if not l_v1689_15:get() then
                return l_v1693_13();
            else
                local v3526 = entity.get_game_rules();
                if v3526 == nil or not v3526.m_bFreezePeriod then
                    return;
                else
                    l_v1692_15();
                    v3525.in_duck = l_l_v1691_13_0 > 7;
                    v3525.send_packet = l_l_v1691_13_0 == 14;
                    l_v1536_18:override(false);
                    l_v1688_15:override(false);
                    return;
                end;
            end;
        end;
        l_v1690_13.update = function(v3527)
            -- upvalues: l_v1694_15 (ref), l_v1696_10 (ref), l_v1695_14 (ref)
            local v3528 = v3527:get("On Freezetime");
            events.shutdown(l_v1694_15, v3528);
            events.createmove(l_v1696_10, v3528);
            events.override_view(l_v1695_14, v3528);
        end;
    end;
    l_v1691_13 = {};
    v1692 = function(v3529)
        -- upvalues: l_v1689_15 (ref)
        if not l_v1689_15:get() then
            return;
        else
            local v3530 = vector(v3529.forwardmove, v3529.sidemove);
            if v3530:length2dsqr() < 25 then
                return;
            else
                v3530:normalize();
                v3529.forwardmove = v3530.x * 150;
                v3529.sidemove = v3530.y * 150;
                return;
            end;
        end;
    end;
    do
        local l_v1692_16 = v1692;
        l_v1691_13.update = function(v3532)
            -- upvalues: l_v1692_16 (ref)
            events.createmove_run(l_v1692_16, v3532:get("Unlock Speed"));
        end;
    end;
    v1692 = nil;
    v1693 = function(v3533)
        -- upvalues: l_v1690_13 (ref), l_v1691_13 (ref)
        l_v1690_13.update(v3533);
        l_v1691_13.update(v3533);
    end;
    v1535.options:set_callback(v1693, true);
end;
v1535 = nil;
v1536 = v364.misc.nickname_generator;
v1688 = cvar.name;
v1689 = nil;
v1690 = {
    [1] = "\208\177\208\187\209\143 \208\189\208\190\209\128\208\188\208\176\208\187\209\140\208\189\208\190 \208\189\208\176\208\178\208\176\209\133\209\131 \208\186\209\131\208\191\208\184\208\187", 
    [2] = "\209\143 \208\178\208\181\208\185\208\191 \208\186\209\131\208\191\208\184\208\187", 
    [3] = "\209\135\208\180? \208\186\208\180?", 
    [4] = "\209\143\208\186\209\131\208\177\208\190\208\178\209\135\208\184567", 
    [5] = "\208\177\208\187\208\181\208\186 \208\176\208\189\208\179\208\181\208\187 \209\131\208\177\208\184\208\178\209\136\208\186\208\17611", 
    [6] = "\209\130\208\176\209\128\208\176\208\186\208\176\208\189 \208\180\208\184\208\189\208\184\209\129", 
    [7] = "\208\182\209\131\208\187\209\140\208\178\208\181\209\128\208\184\208\186", 
    [8] = "\209\143\209\128\208\190\209\129\209\130\208\189\209\139\208\185 \208\188\208\184\208\189\208\181\209\128\208\187\209\140\208\189\209\139\208\185 \209\135\208\181\209\135\208\181\208\189\208\181\209\134 \208\186\208\176\208\182\209\141\209\131\208\176\208\187", 
    [9] = "\209\129\208\189\208\181\208\179\208\190\208\178\208\190\208\185 \208\176\208\178\208\191\208\186\208\184\208\189\208\179\209\131\208\187\209\143", 
    [10] = "mr \208\179\208\181\208\185\208\188\208\181\209\128300", 
    [11] = "\209\133\209\129\208\176\209\142 \208\178\208\178 \209\129 \208\191\208\181\209\128\208\178\208\190\208\185 \208\191\209\131", 
    [12] = "\208\186\209\131\208\180\208\176 \208\178 \209\133\209\131\208\185", 
    [13] = "hasbik style KZ", 
    [14] = "60G AJlTaUcKuX 7oP", 
    [15] = "4\208\181 \208\178 Xy\209\1437y", 
    [16] = "\209\133\209\129\208\176\209\142 \208\180\208\176\208\182\208\181 \208\189\208\176 \209\130\208\190\208\1874\208\186\208\181", 
    [17] = "OnlyBaim gang$", 
    [18] = "\208\177\209\139\208\187 \208\178\209\139\208\181\208\177\208\176\208\189 \208\186\208\184\208\183\208\176\209\128\209\131\209\133\208\178\209\133", 
    [19] = "9PoCtHblU KUnKoG", 
    [20] = "TTu3\208\180oH\209\142x", 
    [21] = "CTaPa\209\143 Ho OTTacHeH\209\140Ka\209\143", 
    [22] = "\209\143 \208\178\209\139\208\181\208\183\208\182\208\176\209\142 \208\189\208\190\209\129\208\190\208\191\209\139\209\128\208\186\208\184", 
    [23] = "\226\156\170FasTIK\226\156\170", 
    [24] = "\208\130\206\163\198\138O\197\129\226\136\134G\226\136\134", 
    [25] = "\239\184\187\227\131\135\226\149\144\228\184\128 \226\152\173 sniper", 
    [26] = "\208\147\209\131\208\161\208\181\208\153\208\189 \208\168\208\190\208\163", 
    [27] = "o\208\159 \208\175 \208\186\208\160\209\131\208\162\208\190\208\153 \208\144 \209\130\208\171 \208\165\209\131\208\153", 
    [28] = "\209\133\209\131\209\143\209\130\208\190\209\128\209\131\208\177\208\184\208\178\208\176\209\130\208\190\209\1286731", 
    [29] = "\226\153\149\239\189\129\239\189\146\239\189\148\239\189\133\239\189\141 \239\188\145\239\188\149\239\188\148", 
    [30] = "\209\129\209\128\208\181\208\179\208\176 \208\188\208\190\208\177\208\184\208\187\208\186\208\184\208\189", 
    [31] = "\208\188\208\176\209\130\208\178\208\181\208\185 \208\186\209\128\208\176\208\177\208\190\208\178", 
    [32] = "\208\186\208\190\208\185\209\132\208\190\208\178\208\176\209\143 \208\186\209\128\208\184\208\178\208\181\209\130\208\186\208\176 \208\181\208\177\208\187\208\176\208\189\208\184\209\137\208\181", 
    [33] = "\226\156\167*:\239\189\165\239\190\159\226\156\167 \240\157\144\133\240\157\144\148\240\157\144\130\240\157\144\138 \240\157\144\152\240\157\144\142\240\157\144\148 \226\156\167*:\239\189\165\239\190\159\226\156\167", 
    [34] = "SPASIBO ZA SKEET", 
    [35] = "\240\157\144\141\240\157\144\154\240\157\144\128\240\157\144\162\240\157\144\171\240\157\144\140\240\157\144\154\240\157\144\177", 
    [36] = "\208\177\209\131\208\185\208\189\209\139\208\185 \209\129\208\187\208\176\208\178\208\184\208\186 \208\179\208\176\208\183\208\190\208\187\208\184\209\128", 
    [37] = "\208\187\209\145\208\178\208\176 \209\130\208\176\209\128\208\176\208\186\208\176\208\189-56", 
    [38] = "yKpoTuTeJlb_6a6yweK", 
    [39] = "anatoly fakeyaw", 
    [40] = "\208\146\208\176\208\187\208\181\208\189\209\130\208\184\208\189", 
    [41] = "\208\161\209\131\208\191\208\181\209\128 \208\161\208\189\208\176\208\185\208\191\208\181\209\128228", 
    [42] = "\208\151\208\176\208\186\208\176\208\183\208\176\209\130\209\140 \208\191\208\181\208\180\208\190\209\132u\208\187\208\176", 
    [43] = "\208\160\208\176\208\188\208\183\208\176\208\189 \208\154\208\176\208\180\209\139\209\128\208\190\208\178", 
    [44] = "\208\191\209\128\208\190\208\178\208\181\209\128\208\186\208\176 \208\189\208\176 \209\135\208\184\209\130\209\139", 
    [45] = "main nick sanyaKiller228", 
    [46] = "\208\145\208\190\209\128\208\184\209\129 \208\150\208\184\208\178\208\190\209\130\208\189\208\190\208\181", 
    [47] = "bmw top", 
    [48] = "\208\148\208\184\208\188\208\176[RUS]2005", 
    [49] = "\208\184\209\129\208\187\208\176\208\188 \208\188\208\176\208\179\208\190\208\188\208\181\208\180\208\190\208\178", 
    [50] = "\208\162\208\152\208\156\208\144\208\162\208\152\208\165\208\146\208\165", 
    [51] = "eldoradohvh", 
    [52] = "\208\177\209\131\208\187\209\140\209\130\208\176\208\183\208\176\209\128", 
    [53] = "\209\143 \208\181\208\177\208\187\208\176\208\189 \208\177\208\184\208\179\208\184\209\130\208\184", 
    [54] = "pavlo.matvei98", 
    [55] = "www.CSGOSETTINGS.ru 111", 
    [56] = "\208\188\208\176\208\188\208\186\208\176\208\181\208\1772009", 
    [57] = "\209\132\209\131\208\179\208\176\209\129 \209\130\208\184\208\188\208\190\209\133\208\176", 
    [58] = "VLAD_\208\159\208\163\208\161\208\162\208\158\208\153", 
    [59] = "\208\146\208\181\208\187\208\184\208\188\208\184\209\128 (Not Cheater)", 
    [60] = "\208\158\208\191\208\144$\208\189\208\171\208\185 \208\188\208\176\209\129\209\130\208\181\209\128 \208\186\208\187\208\176\209\130\209\135\208\181\208\185 \208\187\208\181\209\133\208\176 \208\181\208\177\208\176\209\130\209\140", 
    [61] = "KirillMachine", 
    [62] = "THIS IS OMLEEEEEEET (\226\151\163\226\151\162)", 
    [63] = "soldier (\209\129\208\190\208\187\208\180\208\176\209\130)", 
    [64] = "-----= S.E.N.A.T.O.R =-----", 
    [65] = "*-\208\154\209\128Y\209\135E_\208\145\208\190\208\179\208\176_u_\208\166\208\176\208\160\209\143-*", 
    [66] = "\225\180\155\202\156\225\180\135\202\153\225\180\135s\225\180\155", 
    [67] = "\226\153\165\194\167\226\130\173\195\174\226\132\146\200\180\226\138\149\225\151\169\225\153\161\199\158\226\132\153\226\132\176\226\132\156\226\130\179\240\159\142\134", 
    [68] = "GloBal~BaNaN", 
    [69] = "Fucking.Ba[nn]Y...", 
    [70] = "d[oo]dLeZzzz...", 
    [71] = "VIP Sex Energy VIP", 
    [72] = "\240\159\165\145\240\157\149\146\240\157\149\167\240\157\149\146\240\157\149\148\240\157\149\146\240\157\149\149\240\157\149\160\240\159\165\145", 
    [73] = "\228\185\130...\240\157\148\161.\240\157\148\166.\240\157\148\168.\240\157\148\166.y...\228\185\130", 
    [74] = "\226\149\145\226\152\190 \196\166 \206\158 \226\136\128 \229\141\131 \206\163 \229\176\186\226\149\145", 
    [75] = "\229\189\161[\225\180\133\225\180\135\225\180\128\225\180\133 \225\180\139\201\170\202\159\202\159\225\180\135\202\128]\229\189\161", 
    [76] = "\202\128\225\180\135\225\180\152 \201\170\201\180s\225\180\128\201\180\225\180\135 \225\180\161\201\170\225\180\155\202\156 \225\180\128\225\180\161\225\180\152", 
    [77] = "\208\161\208\191\209\131\208\180\208\184 \208\156\209\131\208\189", 
    [78] = "\225\151\171\225\131\162\226\130\166\226\132\139\226\132\177\199\190\226\132\156", 
    [79] = "\226\152\162\196\142\226\130\179\195\145\199\164\196\146\226\132\159\226\152\162", 
    [80] = "\196\162\197\151\196\133\197\134\196\143_\226\130\165\196\133\239\174\144\197\167\206\190\197\151", 
    [81] = "F@$$$TiK...", 
    [82] = "...::::K[RAM]m[ER]::::...", 
    [83] = "\208\190\208\191\208\181\209\128 \208\190\208\186\208\176\209\143\208\189\208\189\209\139\208\185", 
    [84] = "\208\148\208\158\208\157\208\144\208\162 \208\161 PAYPAL", 
    [85] = "shelzi228", 
    [86] = "\209\132\208\176\209\128\209\136", 
    [87] = "\209\130\208\176\208\189\209\134\209\131\209\142 \208\187\208\181\208\183\208\179\208\184\208\189\208\186\209\131", 
    [88] = "OPER\209\131\208\191\208\190\208\187\208\189\208\190\208\188\208\190\209\135\208\181\208\189\208\189\209\139\208\185", 
    [89] = "2 \208\190\209\133\208\187\208\176\208\182\208\180\208\181\208\189\208\189\209\139\209\133 \209\143\208\185\209\134\208\176", 
    [90] = "\208\188\208\176\208\183\208\184\208\186 \208\190\208\186\208\176\209\143\208\189\208\189\209\139\208\185", 
    [91] = "Ballin' Maut", 
    [92] = "Balin`Shprot", 
    [93] = "MILLIONAR Balin", 
    [94] = "\208\154\208\160\208\144\208\168 \208\162\208\149\208\161\208\162 \208\156\208\144\208\160\208\154 2", 
    [95] = "\226\128\139HVH RACING", 
    [96] = "\208\186\208\187\209\131\208\177\208\189\208\184\209\135\208\189\208\190-\208\178\208\184\209\136\208\189\208\181\208\178\209\139\208\185 \209\129\208\187\208\190\208\189\209\143\209\128\208\176", 
    [97] = "\209\143\208\177\208\187\208\190\209\135\208\189\209\139\208\185 \208\179\208\184\208\191\208\190\208\191\208\190\209\130\208\176\208\188", 
    [98] = "\208\186\209\128\208\190\208\187 \209\128\208\182\208\176\209\135\208\189\209\139\208\185 \208\176\208\177\209\128\208\184\208\186\208\190\209\129\208\190\208\178\209\139\208\185", 
    [99] = "\208\144\208\179\209\128\208\181\209\129\209\129\208\184\208\178\208\189\209\139\208\185 \208\186\208\176\209\128\208\177\209\142\209\128\208\176\209\130\208\190\209\128", 
    [100] = "tw1x^zz1^aced1v1", 
    [101] = "s1mple", 
    [102] = "\234\167\129\226\132\179a\226\178\166\226\177\148\201\170\226\132\163a\225\186\149\226\177\148\201\170\226\156\158\234\167\130", 
    [103] = "\226\128\162\225\180\174\225\180\172\225\180\176\202\153\225\180\143\202\143\227\131\132", 
    [104] = "\234\167\129\224\166\148\224\167\163\226\152\172\226\156\158\240\157\147\147\240\157\150\148\240\157\150\147\226\156\158\226\152\172\224\166\148\224\167\163\234\167\130", 
    [105] = "\226\136\134\226\153\163\239\184\143JOKER\226\153\165\239\184\143\226\136\134", 
    [106] = "SpraY", 
    [107] = "\234\167\129\224\188\186\226\130\166\208\135\226\130\166\226\132\145\226\130\179\224\188\187\234\167\130", 
    [108] = "\226\158\162 I\225\180\141\225\180\141\225\180\143\202\128\225\180\155\225\180\128\202\159", 
    [109] = "\226\149\190\226\148\129\226\149\164\227\131\135\226\149\166\239\184\187 \226\130\179\226\130\173-\226\157\185\226\157\188 \240\157\147\176\240\157\147\184\240\157\147\173", 
    [110] = "\239\184\187\227\131\135\226\149\144\228\184\128GOD_SK", 
    [111] = "\240\159\133\188*\240\159\133\176\239\184\143*\240\159\134\133*\240\159\133\180*\240\159\134\129*\240\159\133\184*\240\159\133\178*\240\159\133\186", 
    [112] = "\224\188\186Le\205\165ge\205\163n\205\171d\224\188\187\225\180\179\225\181\146\225\181\136", 
    [113] = "\234\167\129\226\156\170\226\153\149BOT\226\153\149\226\156\170\234\167\130", 
    [114] = "\240\159\148\165\240\157\147\150\240\157\147\161\240\157\147\144\240\157\147\162\240\157\147\164\240\159\148\165", 
    [115] = "T\195\152XIC", 
    [116] = "\240\157\149\181\240\157\150\134\240\157\148\179\240\157\150\142\240\157\150\142 \226\156\170", 
    [117] = "\240\159\133\180\240\159\134\137\240\159\134\137 \240\159\133\189\240\159\133\190\239\184\143\240\159\133\190\239\184\143\240\159\133\177\239\184\143\240\159\134\130", 
    [118] = "\234\167\129\224\188\186J\204\189\205\147o\204\189\205\147s\204\189\205\147I\204\189\205\147\224\188\187\234\167\130", 
    [119] = "\226\153\161 AWP \226\128\147 senpai \226\151\149\226\128\191\226\151\149 [\227\131\132]", 
    [120] = "\227\131\133 [OnI-ChaN] FreSH[x]\226\152\170\239\184\143", 
    [121] = "\234\167\129\225\180\179\225\181\146\225\181\136Slayer\234\167\130", 
    [122] = "\224\188\186Le\205\165ge\205\163n\205\171d\224\188\187", 
    [123] = "\226\156\170\226\130\166\208\135\226\130\166\226\132\145\226\130\179\224\188\187\239\184\187\227\131\135\226\149\144\228\184\128", 
    [124] = ".S!ckBoY^", 
    [125] = "\240\157\149\190\240\157\150\153\240\157\150\154\240\157\150\151\240\157\150\146\240\157\149\189\240\157\150\138\240\157\150\135\240\157\150\138\240\157\150\145\240\157\150\145", 
    [126] = "\226\153\165\239\184\143\240\157\147\154\240\157\147\174\240\157\147\157\240\157\147\157\240\157\148\130\240\157\147\162\226\153\165\239\184\143", 
    [127] = "Snax", 
    [128] = "\234\167\129\224\166\148\224\167\163\226\152\172\226\156\158\240\157\147\181\240\157\147\174\240\157\147\176\240\157\147\174\240\157\147\183\240\157\147\173\203\161\225\181\146\225\181\155\225\181\137 \202\184\225\181\146\225\181\152\226\156\158\226\152\172\224\166\148\224\167\163\234\167\130", 
    [129] = "\226\153\149\209\149\208\189\209\148 \194\162\206\177\226\132\147\226\132\147 \208\188\209\148 \208\189\206\177\194\162", 
    [130] = "\226\156\170AnARcHY_", 
    [131] = "bl1tz", 
    [132] = "Carry Potter", 
    [133] = "\226\156\170TaCt1CaL", 
    [134] = "vk.com/vampire", 
    [135] = "\225\151\176E\225\151\176E \225\148\149E\225\145\142\225\148\149E", 
    [136] = "\226\128\157*\194\176\226\128\162.\226\152\133..Angel_Of_The_Night..\226\152\133.\226\128\162\194\176*\226\128\157\203\156", 
    [137] = "\195\177\198\164\195\188\206\178\194\163\207\175 \206\168\208\189\211\185\198\164\209\140 \207\175\194\163\225\131\156\209\143 \194\163\225\131\156\194\163\207\175 j\194\163\194\167\201\165\194\167", 
    [138] = "\196\153\206\178\195\163\197\130 \200\155\195\189\195\164 \226\136\154 \197\153\195\184\197\163", 
    [139] = "\229\191\141\227\129\179 1 \208\163\208\159\208\144\208\155 \227\129\179\229\191\141", 
    [140] = "MaJIeHkuu_Ho_OnacHekuu", 
    [141] = "\226\128\162\219\169\219\158\219\169[\204\178\204\133\208\159\204\178\204\133\208\190\204\178\204\133\208\155\204\178\204\133\208\174\204\178\204\133\208\177\204\178\204\133\208\144\204\178\204\133\208\161(\217\191)\204\178\204\133\208\167\204\178\204\133\208\184\204\133\208\162\204\178\204\178\208\144\208\154\204\178\204\133]\219\169\219\158\219\169\226\128\162", 
    [142] = "Y\208\177\208\152u\208\166\208\176_\208\154\209\128\208\152\208\191\208\149r\208\158\208\178", 
    [143] = "\208\162\208\181\208\191\208\181\209\128\209\140 \209\143 - \208\174\209\130\209\131\208\177\208\181\209\128 \208\158\208\188\208\187\208\181\209\130 (\226\151\163\226\151\162)", 
    [144] = "\226\146\182a\197\180\195\158 \239\184\187\227\131\135 \228\184\128 PUTIN", 
    [145] = "VAAAAAAAC \208\178 \209\135\208\176\209\130!!! (\227\129\165 \226\151\149\226\128\191\226\151\149 )", 
    [146] = "\227\129\165 \228\187\142\233\151\169\228\187\142\233\149\191\228\184\171 \228\187\168\228\186\148\233\151\169\228\186\186", 
    [147] = "+Yeb@shu_v_k@shu+", 
    [148] = "\194\163\225\131\156\195\191 \207\175\209\143", 
    [149] = "AHHAHAHHAHAHH LIFEHACK \226\153\165\239\184\143\226\153\165\239\184\143\226\153\165\239\184\143\226\153\165\239\184\143\226\153\165\239\184\143", 
    [150] = "\208\159\209\131\208\155\208\184_\208\158\209\130_\208\145\208\176\208\145\209\131\208\155\208\184", 
    [151] = "\208\159\208\176\208\160\208\181\208\157\209\140 \208\145\208\181\208\151 \209\129\208\162\209\128\208\144\209\133\208\144", 
    [152] = "\208\157.\208\149.\208\161.\208\158.\208\154.\208\160.\208\163.\208\168.\208\152.\208\156.\208\171.\208\153", 
    [153] = "KpyToI_4elOBeK", 
    [154] = "^^Stell^^::.[Pro_Game_Xom9k]", 
    [155] = "3Jlou_\208\151AdrOT", 
    [156] = "\195\177\195\188\209\171\194\164\198\164 \195\177\195\188\198\186\209\171\195\165 \207\175\195\191\198\186 \201\177\194\164\208\189\194\164\200\185\209\143", 
    [157] = "\209\143 \196\183\194\164\208\189\201\165\195\165\206\187 \207\175\206\178\194\164\194\163\195\188 \201\177\195\165\201\177\196\183\194\163 \206\178 \198\164\194\164\207\175", 
    [158] = "\226\146\182a\197\180\195\158 \239\184\187\227\131\135 \228\184\128", 
    [159] = "\208\186\208\190\208\188\209\129\208\190\208\188\208\190\208\187\209\140\209\129\208\186\208\184\208\185 \209\134\209\139\208\179\208\176\208\189", 
    [160] = "\208\189\208\190\209\129\208\176\209\130\209\139\208\185 \208\189\208\190\209\129 \209\128\208\176\208\185\208\183\208\181\208\189\208\176", 
    [161] = "\208\176\209\136\208\186\209\131\208\180\208\184\209\136\208\186\208\176 \209\129\208\190 \208\178\208\186\209\131\209\129\208\190\208\188 \209\131\209\133\208\176", 
    [162] = "pepper roni (\208\191\208\184\209\134\209\134\208\176) \209\129\208\190 \208\178\208\186\209\131\209\129\208\190\208\188 \209\129\208\188\208\181\209\130\208\176\208\189\209\139", 
    [163] = "METAN HVH", 
    [164] = "\208\168\208\146\208\149\208\148\208\161\208\154\208\152\208\153 \208\161\208\162\208\158\208\155 \208\147\208\160\208\152\208\147\208\158\208\160\208\152\208\175 \208\155\208\149\208\159\208\161\208\144", 
    [165] = "\208\144\208\144\208\144\208\144\208\144 \208\154\208\171\208\151\208\155\208\144\208\160 \208\154\208\163\208\162\208\144\208\154 \208\145\208\144\208\161 \208\144\208\168\208\144\208\155\208\144\208\156\208\144\208\157\208\144\208\144\208\144 \208\145\208\152\208\155\208\175\208\175\208\175 \208\173\208\163\208\163\208\163", 
    [166] = "Z V", 
    [167] = "\208\161\208\155\208\171\208\168\208\163 ZOV", 
    [168] = "\208\162\208\174\208\164\208\175\208\175\208\175\208\154 (\208\159\208\144\208\162\208\160\208\152\208\154)", 
    [169] = "GuGu_Zha_IIIagu", 
    [170] = "GyGaBait", 
    [171] = "ebaWu_V_KaWu (Z)", 
    [172] = "\208\156\208\144\208\156\208\152\208\157\208\158 \208\159\208\160\208\158\208\162\208\152\208\146\208\158\208\160\208\149\208\167\208\152\208\149", 
    [173] = "Nell\209\143\209\135\208\186\208\176 UwU", 
    [174] = "\208\164\208\184\208\187\209\140\208\188 \194\171\208\163\208\187\209\139\208\177\208\186\208\176\194\187", 
    [175] = "\208\154\208\190\209\130\208\187\208\181\209\130\208\190\209\129\209\139 \208\184\208\183 z\209\139\209\128\208\176", 
    [176] = "\208\154\208\176\208\186\208\176\208\190 \208\177\208\190\208\177\208\181\209\128", 
    [177] = "\208\164\208\176\208\187\209\140\209\136\208\184\208\178\208\176\209\143 \209\131\209\130\208\186\208\176", 
    [178] = "\208\160\209\139\209\129\208\186\208\176\208\189\208\184\208\181 \208\189\208\184\208\182\208\189\208\181\208\185 \209\135\208\176\209\129\209\130\208\184 \209\130\208\181\208\187\208\176", 
    [179] = "\208\179\209\131\209\129\208\181\208\185\208\189 \208\179\208\176\208\183", 
    [180] = "\209\130\209\131\208\176\208\187\208\181\209\130\208\189\209\139\208\185 \209\131\209\130\209\142\208\179", 
    [181] = "\208\147\208\176\208\183\208\190\208\178\208\176\208\189\208\184\209\143 \208\189\208\176 \209\131\208\180\208\176\209\135\209\131", 
    [182] = "\209\129\208\191\208\184\209\128\208\176\208\187\209\140 \208\188\208\176\208\189\209\139", 
    [183] = "\208\159\208\190\208\180\208\186\208\190\208\178\208\176 \209\129\209\128\208\176\208\186\208\190\209\130\208\176\208\189\208\176", 
    [184] = "\208\148\209\131\208\191\208\187\208\190 \209\133\208\190\208\188\209\143\208\186\208\176", 
    [185] = "\208\145\208\181\208\187\209\140\209\135\208\184\208\185 \208\176\209\131\208\187", 
    [186] = "\208\175\208\151\208\171\208\154 \208\162\208\149\208\155\208\144", 
    [187] = "\209\130\209\142\208\187\209\140\208\191\208\176\208\189\208\190\208\178\209\139\208\181 \208\179\208\190\209\128\209\139 \209\128\208\176\208\180\208\190\209\129\209\130\208\184", 
    [188] = "\208\161\209\139\209\128 \208\177\209\139\208\177 \209\128\209\139\209\128", 
    [189] = "\208\168\208\184\208\188\208\191\208\176\208\189Z\208\181 (\208\190\208\177\208\184\208\180\208\186\208\176)", 
    [190] = "\208\155\208\190\208\182\208\189\209\139\208\181 \208\190\209\130\209\129\209\130\208\176\208\178\208\176\208\189\208\184\209\143", 
    [191] = "\208\146\208\177\208\184\208\178 / \208\178\209\139\208\177\208\184\208\178 \208\183\209\131\208\177\208\190\208\178 \208\179.\208\163\209\128\209\142\208\191\208\184\208\189\209\129\208\186", 
    [192] = "\208\147\209\131\209\129\208\181\208\185\208\189 \208\179\208\176\208\183\209\131\208\185 \208\189\208\176\209\133", 
    [193] = "\208\151\208\181\208\189\208\184\209\134\208\176 \208\190\208\186\208\190", 
    [194] = "Zorix(csgo)", 
    [195] = "\208\159\208\184\208\180\208\181\209\128 \208\191\208\176\208\185\208\180\208\181\209\128", 
    [196] = "\208\151\209\131\208\177\209\139 \208\188\209\131\208\180\209\128\208\190\209\129\209\130\208\184", 
    [197] = "\208\169\208\181\208\186\208\190\209\130\208\189\208\190\208\181 \209\130\208\181\209\128\208\181\208\177\208\190\208\189\209\140\208\186\208\176\208\189\209\140\208\181", 
    [198] = "ZELTR1X", 
    [199] = "ZOLDY1337", 
    [200] = "K1neXj.", 
    [201] = "Evolvex", 
    [202] = "ANGELS HVH", 
    [203] = "\208\168\208\181\209\129\209\130\208\176\209\143 \208\191\209\143\209\130\208\186\208\176", 
    [204] = "\208\156\208\190\208\183\208\190\208\187\208\184\209\129\209\130\209\139\208\185 \209\136\208\176\208\187\208\190\208\191\208\176\208\185", 
    [205] = "\209\130\209\142\209\128\208\181\208\188\209\129\208\186\208\184\208\185 \209\131\208\183\209\131\209\128\208\191\208\176\209\130\208\190\209\128", 
    [206] = "\208\161\209\130\208\190\209\143\208\186 \208\191\209\139\209\133\209\130\209\131\208\189", 
    [207] = "\208\157\208\176\209\130\208\190\208\191\209\130\209\139\209\136\208\184", 
    [208] = "\208\157\208\176\208\177\209\128\208\176\208\187 \208\180\208\190\208\187\208\179\208\190\208\178", 
    [209] = "\208\151\208\176\208\177\208\184\208\178 \208\186\208\176\208\187\209\140\209\143\208\189\208\190\208\178", 
    [210] = "\208\162\209\131\209\128\208\189\208\184\209\135\208\186\208\190\208\178\208\176\209\143 \208\183\208\176\208\177\208\184\208\178\208\186\208\176", 
    [211] = "\208\162\209\128\208\181\208\189\208\184\209\128\208\190\208\178\208\186\208\176 \208\191\208\190\208\180 \208\180\208\190\208\182\208\180\208\181\208\188", 
    [212] = "\208\148\209\128\208\190\209\135\209\131 \209\129\209\130\208\190\209\143", 
    [213] = "\208\153\208\190\208\182\208\184\208\186 \208\182\209\131\209\133\208\187\209\139\208\185", 
    [214] = "\208\149\209\133\208\184\208\180\208\189\208\176\209\143 \209\133\208\176\209\128\209\143", 
    [215] = "\208\154\208\176\208\185\209\132\208\181\209\134\208\186\208\184\208\185 \208\186\209\131\208\188\208\176\209\128\209\135\208\184\208\186", 
    [216] = "\208\154\208\144\208\160\208\162\208\158\208\164\208\149\208\155\208\172", 
    [217] = "SANCHEZJ X FIPP", 
    [218] = "\208\147\208\149\208\158\208\160\208\147\208\152\208\153 \208\164\208\144\208\156\208\163\208\162\208\152\208\155\208\158\208\146", 
    [219] = "\208\144\208\151\208\144\208\151\208\144\208\151\208\144\208\151\208\144 \208\144\208\151\208\155\208\144\208\147\208\158\208\160", 
    [220] = "\208\160\208\181\208\177\208\181\208\189\208\190\208\186 \208\191\208\190\208\180\208\186\208\184\208\180\209\139\209\136\209\140", 
    [221] = "\208\148\208\149\208\162\208\152 \208\146 \208\159\208\158\208\148\208\146\208\144\208\155\208\149", 
    [222] = "\208\161\208\162\208\152\208\146\208\144\208\165\208\144", 
    [223] = "\208\164\209\128\208\190\209\129\209\130 \209\129\208\189\208\181\208\185\208\186 \208\184 \208\191\208\176\209\128\208\189\208\184\209\136\208\176", 
    [224] = "\208\162\208\152\208\156\208\158\208\164\208\149\208\153 \208\152 \208\149\208\147\208\158 \208\148\208\160\208\163\208\147 \208\159\208\172\208\175\208\157\208\171\208\153 \208\149\208\147\208\158\208\160", 
    [225] = "\208\151\208\176\208\177\208\187\208\190\208\186\208\184\209\128\208\190\208\178\208\176\208\189\208\189\209\139\208\185 \209\129\208\186\208\176\208\185\208\191", 
    [226] = "\208\148\208\158\208\154\208\162\208\158\208\160 \208\145\208\160\208\144\208\163\208\157? \209\129\208\187\209\131\209\136\208\176\209\142.", 
    [227] = "\208\144\208\160\208\158\208\156\208\144\208\162 \208\151\208\152\208\160\208\144\208\159\208\162\208\158\208\160\208\161\208\144 \208\161\208\161\208\171\208\162 \208\146 \208\160\208\144\208\154\208\158\208\146\208\152\208\157\208\163", 
    [228] = "\208\161\208\154\208\144\208\144\208\144\208\153", 
    [229] = "\208\148\208\190\208\186\209\130\208\190\209\128 \208\177\208\176\208\177\209\131\208\189", 
    [230] = "\208\189\208\184\209\130\209\128\208\176\209\130 \209\132\208\176\208\177\209\131\209\128\208\184\209\130\208\176", 
    [231] = "\209\135\208\181\209\128\208\189\208\190\208\179\208\190\208\187\208\190\208\178\208\186\208\176))", 
    [232] = "\208\161\209\129\209\139\208\186\208\176\208\189\209\140\208\181 \208\178 \209\130\208\176\208\183\208\184\208\186", 
    [233] = "\208\187\208\184\208\186\209\130\208\190\209\132\208\176\209\130 \208\189\208\176\209\130\209\128\208\184\209\143", 
    [234] = "\208\156\209\139\209\130\209\140\208\181 \208\178 \208\177\208\184\208\180\208\190\208\189\208\181", 
    [235] = "\208\189\208\184\208\191\208\190\209\128\209\130\208\176\208\188 \208\178 \209\128\208\176\208\186\208\190\208\178\208\184\208\189\208\181", 
    [236] = "\208\178\209\139\208\179\209\131\208\187\208\184\208\178\208\176\209\130\209\140 \208\186\208\190\208\187\208\177\208\176\209\129\209\131 \208\178\208\188\208\181\209\129\209\130\208\190 \209\129\208\190\208\177\208\176\208\186\208\184 \208\189\208\176 \208\177\208\176\208\187\208\186\208\190\208\189\208\181", 
    [237] = "\208\147\208\184\208\191\208\191\208\190\208\191\208\190\209\130\208\176\208\188 \209\129\209\139\209\128\208\189\209\139\208\185", 
    [238] = "\208\183\209\131\208\191\208\184\209\132\208\176\208\187\209\140\208\189\209\139\208\185 \208\189\208\176\208\183\208\176\208\187\209\140\208\189\209\139\208\185 \209\129\208\191\209\128\208\181\208\185 \208\180\208\187\209\143 \208\189\208\190\208\179\209\130\208\181\208\185", 
    [239] = "\208\159\208\184\208\180\208\190\209\128\209\129\208\186\208\184\208\181 \209\129\209\139\209\128\208\189\208\184\208\186\208\184", 
    [240] = "\208\179\208\190\208\179\208\184 \208\189\208\176 \209\131\209\128\208\190\208\179\208\184", 
    [241] = "GoGiMan777", 
    [242] = "\208\154\208\176\209\128\208\176\208\188\208\181\208\187\209\140\208\189\209\139\208\181 \208\189\208\190\208\179\208\190\209\130\208\190\209\135\208\186\208\184", 
    [243] = "\208\180\208\181\209\128\208\181\208\178\209\143\208\189\208\189\208\190\208\181 \209\143\208\177\208\187\208\190\208\186\208\190", 
    [244] = "\208\176\209\128\208\177\209\131\208\183\208\189\209\139\208\181 \209\129\208\187\208\176\208\189\209\134\209\139", 
    [245] = "hey? MACARENAA", 
    [246] = "\209\130\209\128\208\184\209\134\208\181\209\128\208\176\208\191\209\130\208\190\209\128\209\129", 
    [247] = "\208\165\208\190\209\128\208\190\209\136\208\176\209\143 \208\190\208\180\208\181\208\182\208\180\208\176", 
    [248] = "LXNER \209\128\208\181\208\191\208\184\209\128", 
    [249] = "\208\156\208\190\208\180\208\189\209\139\208\185 \208\191\209\128\208\184\208\179\208\190\208\178\208\190\209\128", 
    [250] = "\209\129\209\130\209\131\208\180\208\181\208\189\209\130", 
    [251] = "\208\160\208\181\208\187\208\184\208\183 sqwore", 
    [252] = "\209\133\208\176\208\185\208\191\208\181\209\128\208\191\208\190\208\191 \209\129\208\176\208\188\208\176\209\128\208\176", 
    [253] = "18\208\180\208\178\208\176\208\180\209\134\208\181\209\130\208\184\208\189", 
    [254] = "\208\166\208\184\209\130\209\128\209\131\209\129 \208\190\209\130 \208\183\209\131\208\180\208\176", 
    [255] = "\208\166\208\184\209\130\209\128\208\184\208\189\208\190\208\178\209\139\208\185 \208\186\208\176\209\136\208\181\208\187\209\140", 
    [256] = "\208\162\208\176\208\189\208\180\209\131\208\188 \208\178\208\181\209\128\208\180\208\181 \209\132\208\190\209\128\209\130\208\181", 
    [257] = "\208\162\208\144\208\145\208\163\208\157 \208\147\208\158\208\161\208\162\208\149\208\153", 
    [258] = "\208\158\208\155\208\149\208\147 \208\162\208\152\208\157\208\172\208\154\208\158\208\164\208\164", 
    [259] = "SAILOR MOON \208\160\208\158\208\145\208\149\208\160\208\162 \208\161 \208\144\208\160\208\145\208\163\208\151\208\158\208\156", 
    [260] = "\208\154\208\158\208\151\208\144\208\165\208\161\208\162\208\144\208\157 \208\171\208\171\208\171\208\171\208\171\208\144\208\144\208\144\208\144\208\144\208\144\208\144", 
    [261] = "\208\146\208\181\208\187\208\184\208\188\208\184\209\128 \209\129\208\191\208\184\209\128\208\184\208\180\208\190\208\189\208\190\208\178", 
    [262] = "\208\146\208\176\209\133\208\184\208\180 \208\177\208\176\208\177\208\181\208\178", 
    [263] = "\208\161\209\131\209\128\208\184\208\186\208\176\209\130\208\189\209\139\208\185 \209\130\209\131\209\136\208\186\208\176\208\189\209\135\208\184\208\186", 
    [264] = "\208\144\208\183\208\184\208\183 \209\136\208\176\208\178\208\181\209\128\209\136\209\143\208\189", 
    [265] = "\208\178\208\184\208\187\209\140\208\178\208\181\209\130\208\190\208\178\209\139\208\185 \208\190\209\129\209\140\208\188\208\184\208\189\208\190\208\179", 
    [266] = "\208\186\208\190\208\187\208\177\208\176\209\129\208\176 \209\129 \208\187\209\139\209\129\209\139\208\188 \208\188\209\131\208\182\208\184\208\186\208\190\208\188", 
    [267] = "\208\180\208\181\208\189\209\140\208\179\208\184 \208\184 \208\191\208\176\209\133\209\131\209\135\208\184\208\181 \208\189\208\190\208\179\208\184", 
    [268] = "\208\154\208\176\209\128\208\176\209\129\209\140 \209\129\208\190 \209\129\209\130\209\128\208\176\208\183\208\176\208\188\208\184", 
    [269] = "\208\160\208\171\208\145\208\144 \208\156\208\158\208\149\208\153 \208\156\208\149\208\167\208\162\208\152", 
    [270] = "\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\151\208\172", 
    [271] = "\208\162\209\131\208\189\208\181\209\134 \208\190\209\130 \209\133\208\176\208\187\208\184\208\186\208\184", 
    [272] = "\208\154\208\176\208\188\208\177\208\176\208\187\208\176 \208\178 \208\178\208\176\208\189\208\189\208\181", 
    [273] = "\208\186\208\176\208\187\209\140\209\143\208\189\208\184\208\183\208\176\209\134\208\184\209\143 \208\191\209\128\208\190\209\136\208\187\208\176 \209\131\209\129\208\191\208\181\209\136\208\189\208\190\240\159\140\185", 
    [274] = "\209\136\208\184\209\136\208\186\208\176 \208\178 \208\188\209\139\209\136\208\186\208\181", 
    [275] = "\208\159\208\187\208\190\209\130\208\189\208\190\208\181 \209\143\208\177\208\187\208\190\209\135\208\186\208\190", 
    [276] = "\208\187\208\190\208\191\208\176\209\129\209\130\208\184 \208\188\208\184\208\186\209\128\208\190\209\132\208\190\208\189\208\176", 
    [277] = "\208\154\209\131\208\188\208\176\209\128\208\189\208\176\209\143 \209\129\208\181\209\129\209\129\208\184\209\143", 
    [278] = "\208\186\208\187\208\176\208\178\208\184\208\176\209\130\209\131\209\128\208\176 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\130\208\184\208\186\208\176", 
    [279] = "\208\159\209\128\208\190\208\177\208\184\209\128\208\186\208\176 \208\177\208\184\208\190\208\187\208\190\208\179\208\184\209\135\208\186\208\184", 
    [280] = "\208\183\208\181\208\187\208\181\208\189\208\190\208\181 \208\189\208\181\208\177\208\190 \208\178 \208\183\208\176\208\186\208\176\209\130\208\181", 
    [281] = "\209\130\208\181\208\188\208\189\208\190\208\181 \208\190\208\183\208\176\209\128\208\181\208\189\208\184\208\181 \209\130\208\181\208\191\208\187\208\176", 
    [282] = "\208\191\208\181\208\189\209\143\209\137\208\181\208\181 \209\129\209\135\208\176\209\129\209\130\209\140\208\181", 
    [283] = "\209\129\208\190 \209\129\208\186\208\184\209\130\209\131\208\187\209\140\208\186\208\190\208\185 \208\178 \208\188\208\188\209\131\208\187\209\142", 
    [284] = "\208\177\208\190\208\179\208\176\209\130\209\139\208\181 \208\178\208\190\208\187\208\190\209\129\209\139 \208\186\208\184\209\128\208\186\208\190\209\128\208\190\208\178\208\176", 
    [285] = "\208\152\208\179\209\128\208\176\209\142 \208\186\208\176\208\186 fifty", 
    [286] = "\208\186\208\190\209\128\208\190\208\178\208\176 \209\128\208\184\208\188\208\183\208\176\208\186\209\129\208\176", 
    [287] = "\208\160\208\176\208\188\208\190\208\189\209\139 \208\190\209\130 \209\129\208\181\209\128\208\181\208\179\208\184", 
    [288] = "\208\191\209\131\209\130\208\184\208\187\209\140\209\132\208\176\209\130 \208\179\209\131\208\187\209\140\208\183\208\176\208\189\209\130\208\184\209\143 (\208\191\209\128\208\184\208\178\208\181\209\130)", 
    [289] = "\209\128\208\176\209\132\209\139 \208\190\209\130 Raffaello", 
    [290] = "\208\186\209\128\208\176\209\129\208\189\208\176\209\143 \208\188\208\176\209\136\208\184\208\189\208\176 \209\129 \208\180\208\181\209\128\208\181\208\178\208\190\208\188 \208\190\209\130 \208\191\208\184\209\130\208\190\208\187\209\140\208\180\209\139", 
    [291] = "\208\159\209\128\208\184\208\186\208\190\208\187\209\140\208\189\209\139\208\185 \208\191\209\131\208\180\208\184\208\189\208\179 \208\190\209\130 \208\191\208\190\208\189\209\135\208\184\208\186\208\176", 
    [292] = "\208\186\208\190\208\182\208\176\208\189\208\176\209\143 \209\129\209\130\208\181\208\189\208\176", 
    [293] = "\208\191\208\190\208\180\209\129\209\130\208\190\208\187\209\140\208\189\209\139\208\181 \208\191\208\190\208\187\209\131\208\191\208\190\208\186\208\181\209\128\209\139", 
    [294] = "\208\176\208\188\209\129\209\130\208\181\209\128\208\180\208\176\208\188 \208\179\208\184\208\187\209\140\208\179\208\190\208\189\208\176", 
    [295] = "\208\151\208\178\208\190\208\189\208\190\208\186 \208\189\208\176 \209\131\209\128\208\190\208\186", 
    [296] = "\208\162\208\176\208\177\209\131\209\128\208\181\209\130 \208\190\209\135\208\186\208\184 \209\131\209\129\209\139", 
    [297] = "\208\167\208\184\209\130\208\176\209\142 \209\128\208\181\208\191\209\135\208\176\208\179\209\131", 
    [298] = "\208\167\208\152\208\159\208\161\208\152 \208\158\208\162 \208\160\208\149\208\157\208\149\208\147\208\144\208\162\208\144 \208\162\208\144\208\162\208\144\208\160\208\161\208\154\208\158\208\147\208\158", 
    [299] = "\208\162\208\144\208\162\208\144\208\160\208\161\208\154\208\152\208\153 MALIK163ONMYNECK", 
    [300] = "\208\157\208\158\208\146\208\171\208\153 \208\160\208\149\208\159\208\152\208\160", 
    [301] = "\208\146\208\163\208\156\208\159\208\152\208\160", 
    [302] = "\208\189\208\190\209\129\208\176\209\130\208\190\208\181 \209\131\208\181\208\177\208\184\209\137\208\181", 
    [303] = "\209\136\208\181\209\129\209\130\208\190\208\181 \209\135\209\131\208\178\209\129\209\130\208\178\208\190", 
    [304] = "\208\182\208\190\208\191\208\189\209\139\208\185 \208\191\209\128\208\181\208\180\208\184\208\186\209\130", 
    [305] = "\208\167\208\152\208\162\208\149\208\160\208\171 \208\152\208\156\208\149\208\174\208\162 6 \208\167\208\163\208\146\208\162\208\161\208\146\208\158", 
    [306] = "\208\162\208\160\208\149\208\162\208\152\208\153 \208\147\208\155\208\144\208\151 \208\157\208\144 \208\159\208\160\208\144\208\146\208\158\208\153 \208\169\208\149\208\154\208\149", 
    [307] = "\208\159\208\158\208\148\208\145\208\158\208\160\208\158\208\148\208\158\208\154 \208\146 \208\160\208\144\208\151\208\146\208\144\208\155 \208\161 \208\157\208\158\208\161\208\158\208\160\208\158\208\147\208\158\208\156", 
    [308] = "\208\147\208\157\208\152\208\155\208\158\208\153 \208\163\208\162\208\174\208\147", 
    [309] = "\208\159\208\172\208\175\208\157\208\144\208\175 \208\148\208\171\208\157\208\175", 
    [310] = "\208\145\208\149\208\168\208\149\208\157\208\171\208\153 \208\154\208\144\208\160\208\162\208\158\208\164\208\149\208\155\208\172", 
    [311] = "\208\159\209\140\209\143\208\189\209\139\208\185 \208\191\209\139\208\187\208\181\209\129\208\190\209\129", 
    [312] = "UWU GANG", 
    [313] = "\208\153\208\190\208\177\208\189\209\131\209\130\208\184\208\185 \208\181\208\182\208\184\208\186", 
    [314] = "\208\149\208\182\208\184\208\186 \208\178 \209\130\209\131\208\188\208\176\208\189\208\181", 
    [315] = "\208\156\208\176\208\189\209\131\208\187 \208\178 \208\183\208\190\208\190\208\191\208\176\209\128\208\186\208\181", 
    [316] = "\209\130\208\181\208\188\208\189\209\139\208\185 \208\178\208\176\208\187\208\181\209\130", 
    [317] = "\208\189\209\142\209\133\208\189\209\131\208\187 \208\191\208\190\208\180\208\188\209\139\209\133\208\176\209\128\208\184\208\186", 
    [318] = "\209\131\209\136\208\176\209\129\209\130\208\190 \208\177\208\190\208\187\209\140\209\136\208\184\208\181 \208\177\209\128\208\190\208\178\208\184", 
    [319] = "\208\191\208\190\209\133\208\190\208\182\209\131 \208\189\208\176 \209\143\208\189\208\180\208\181\208\186\209\129 \208\177\209\128\208\176\209\131\208\183\208\181\209\128", 
    [320] = "\208\161\208\187\208\190\208\189 \208\189\208\176 \208\186\209\128\208\190\208\186\208\190\208\180\208\184\208\187\208\181", 
    [321] = "\208\184\208\189\208\180\209\142\208\186 \208\178 \208\188\208\176\209\129\208\187\208\181", 
    [322] = "\208\177\209\131\209\128\208\180\209\142\208\186 \209\129 \208\191\209\128\208\184\208\186\208\190\208\187\208\190\208\188", 
    [323] = "\208\186\208\184\208\181\208\178\209\129\208\186\208\176\209\143 \208\186\208\190\209\130\208\187\208\181\209\130\208\176", 
    [324] = "\209\136\208\184\208\187\208\190 \208\189\208\176 \208\188\209\139\208\187\208\190", 
    [325] = "\208\145\208\176\208\177\209\131 \208\189\208\176 \208\186\208\176\208\188\208\181\208\189\209\140", 
    [326] = "\209\134\209\131\208\186\208\181\209\128\208\177\208\181\209\128\208\179 \208\191\208\176\208\189\208\183\208\181\209\128\209\132\208\176\209\131\209\129\209\130 1337", 
    [327] = "\208\183\208\176\208\191\208\190\209\128\208\190\208\182\209\140\208\181 9000", 
    [328] = "\208\156\208\190\209\129\208\186\208\178\208\184\209\135 65", 
    [329] = "\209\143 \209\135\209\130\208\190 \208\191\208\190\209\133\208\190\208\182 \208\189\208\176 \208\176\208\177\208\190\208\189\208\181\208\189\209\130\208\176", 
    [330] = "\208\161\208\181\209\128\208\181\208\179\208\176 \208\180\209\131\209\128\208\189\209\139\208\185", 
    [331] = "\208\184\208\178\208\176\208\189 \208\189\208\176\208\178\208\184", 
    [332] = "\208\158\209\130\208\178\208\181\209\130 \208\189\208\176 \209\130\208\190\208\188 \208\186\208\190\208\189\209\134\208\181", 
    [333] = "\208\161\208\178\208\181\209\130 \208\178 \208\189\208\176\209\135\208\176\208\187\208\181 \208\181\208\187\208\186\208\184", 
    [334] = "\209\129\208\181\209\128\208\179\208\181\208\185 \209\132\208\176\208\186\208\181\208\187", 
    [335] = "\209\133\209\131\208\185\208\191\208\176\209\129\209\130\209\128\208\184\208\191\209\129", 
    [336] = "\209\133\209\131\208\185\208\191\208\176\209\135\208\184\208\191\209\129", 
    [337] = "\208\165\209\131\208\185\208\191\208\176\209\129\208\190\208\187\209\140", 
    [338] = "\208\165\209\131\208\185\208\191\208\176\208\177\209\131\209\128\208\179\208\181\209\128", 
    [339] = "\208\160\208\184\209\129 \209\129 \208\186\208\176\209\129\209\139\208\188\208\176\208\186\208\190\208\188", 
    [340] = "\208\161\208\186\208\176\208\187\208\181\208\189\208\176\209\136 \208\188\208\190\209\130\209\139\208\179\208\176", 
    [341] = "\208\161\208\186\208\176\208\187\208\181\208\189\208\176\209\136 \209\130\208\176\208\186\209\139\209\136", 
    [342] = "\209\135\208\184\209\132\208\184\209\128\208\190\208\186 \209\129 \208\179\208\190\209\128\209\143\209\137\208\184\208\188 \208\186\208\190\209\130\208\190\208\188", 
    [343] = "\208\158\208\189\208\176 \209\129 \208\154\208\176\208\183\208\176\209\133\209\129\209\130\208\176\208\189\208\176", 
    [344] = "\208\157\208\176\209\129\208\178\208\176\208\185 \208\189\208\181 \208\186\208\184\208\180\208\176\208\181\208\188 \209\141\209\130\208\190 \209\133\208\176\209\128\208\176\208\188 \209\133\208\176\209\128\208\176\208\188", 
    [345] = "\209\131\209\129\208\176\209\130\208\190\208\181 \208\191\208\190\208\183\208\190\209\128\208\184\209\137\208\181", 
    [346] = "\208\163\209\130\209\128\208\181\208\189\208\189\208\184\208\185 \208\189\208\176\208\188\208\176\208\183 \208\191\208\190\208\180 \208\186\208\176\208\189\209\131\208\189 \208\189\208\190\208\178\208\190\208\179\208\190 \208\179\208\190\208\180\208\176", 
    [347] = "\208\188\209\139 \208\189\208\181 \208\180\208\181\208\187\208\176\208\181\208\188 \209\130\209\128\208\176\208\191 \208\188\209\139 \208\180\208\181\208\187\208\176\208\181\208\188 \208\177\208\190\208\187\209\140\209\136\208\184\208\181 \208\189\208\190\208\179\209\130\208\184", 
    [348] = "\209\131\208\183\208\177\208\181\208\186 \209\128\209\131\209\129\209\129\208\186\208\184\208\185", 
    [349] = "\208\157\208\176 \208\189\208\190\209\129\209\131 \208\179\208\181\209\128\208\190\208\184\208\189", 
    [350] = "\208\151\208\176\208\178\208\184\209\129\208\184\208\188\209\139\208\185 \209\129\208\176\208\188\208\190\208\178\208\176\209\128", 
    [351] = "\209\129\208\184\208\189\208\184\208\181 \208\178\208\190\208\187\208\190\209\129\209\139 \208\191\208\190\208\186\208\190\209\128\208\184\208\187\208\184 \208\189\208\181\208\177\208\190", 
    [352] = "ZV \209\136\208\188\208\176\208\187\209\140 \208\178 \208\191\208\187\208\181\209\135\208\181", 
    [353] = "\208\148\208\181\209\132\208\181\208\186\209\130\208\189\209\139\208\185 \208\191\208\181\209\128\209\132\208\190\209\128\208\176\209\130\208\190\209\128", 
    [354] = "\209\129\208\176\208\188\208\190\208\178\209\139\209\128\208\176\208\182\208\176\209\142\209\137\208\184\208\185 \208\189\208\184\208\186\209\129\208\178\208\176\209\128", 
    [355] = "\208\189\208\176\209\129\209\130\208\190\209\143\209\137\208\184\208\185 \208\191\209\131\208\177\208\181\209\128\209\130\208\176\208\189\209\130", 
    [356] = "Gloria damn", 
    [357] = "\208\176\208\189\209\130\208\190\208\187\208\190\208\179\208\184\209\143 \208\176\208\189\209\130\208\190\208\189\208\176", 
    [358] = "gloria fuck", 
    [359] = "cocki \209\143\208\186\208\184", 
    [360] = "\208\186\208\184\209\130\208\176\208\185\209\129\208\186\208\184\208\185 \209\128\208\181\208\191", 
    [361] = "\209\134\209\131\209\132\208\176\208\189\208\183\209\142 \209\132\208\176\208\188\208\181\209\128\208\179\208\181 (\209\133\208\178\209\133)", 
    [362] = "\208\186\209\131\209\130\208\176\208\187\208\177\209\139\208\186 \209\136\209\131\209\128\208\176\208\177\208\183\208\184\208\186", 
    [363] = "\209\130\209\131\208\191\208\190\208\185 \209\131\209\128\208\190\208\180", 
    [364] = "\209\129\209\131\208\188\208\186\208\176 \209\129\208\190 \208\178\208\186\209\131\209\129\208\190\208\188 \208\178\208\184\209\130\208\176\208\187\209\140\208\186\208\184", 
    [365] = "\209\135\208\181\209\128\208\181\208\191\208\176 \208\178 \208\176\209\132\208\179\208\176\208\189\208\184\209\129\209\130\208\176\208\189\208\181 \208\191\209\140\209\142\209\130 \208\188\208\184\208\186\209\128\208\190\209\132\208\190\208\189", 
    [366] = "\208\191\208\184\209\130\209\140 \208\181\208\180\209\131 \208\181\209\129\209\130\209\140 \208\178\208\190\208\180\209\131", 
    [367] = "\208\182\208\181\208\187\209\130\208\190\208\178\208\190\208\187\208\190\209\129\209\139\208\185 \208\191\208\176\209\129\208\191\208\190\209\128\209\130", 
    [368] = "\208\191\208\184\208\183\208\180\208\181\209\134 \208\188\208\181\208\189\209\143 \209\128\208\176\209\129\208\191\208\181\209\128\208\187\208\190 \208\189\208\176\209\133\209\131\208\185 \209\135\208\181\208\187", 
    [369] = "\208\151\208\176\208\187\208\190\208\179 \209\131\209\129\208\191\208\181\209\133\208\190\208\178", 
    [370] = "\208\160\209\139\208\177\208\176 \208\178 \208\186\208\187\209\143\209\128\208\181", 
    [371] = "\208\147\209\128\208\190\208\188\208\190\209\132\208\190\208\189", 
    [372] = "\208\168\209\131\208\177\208\176 \208\191\208\190\208\180 \209\129\208\181\208\187\208\181\208\180\208\186\208\190\208\185", 
    [373] = "\208\156\208\176\208\189\209\131\208\176\208\187 \208\191\208\190 \208\188\208\176\208\189\209\131\208\187\208\176\208\188", 
    [374] = "\208\157\208\152\208\154\208\158\208\147\208\148\208\144 \208\157\208\149 \208\159\208\160\208\158\208\152\208\147\208\160\208\171\208\146\208\144\208\162\208\172", 
    [375] = "\208\159\209\143\209\130\209\140\208\180\208\181\209\129\209\143\209\130", 
    [376] = "\209\129\208\181\208\188\209\140\209\129\208\190\209\130 \208\180\208\181\209\129\209\143\209\130\209\140", 
    [377] = "\208\179\209\128\209\143\208\188 \208\176\209\128\208\177\209\131\209\129\208\176", 
    [378] = "\208\178\208\181\209\129 \209\133\208\176\209\135\208\176", 
    [379] = "1\209\133\208\177\208\181\209\130", 
    [380] = "yamete kudasai ^^", 
    [381] = "\208\159\209\128\208\184\208\181\209\133\208\176\208\187\208\176 \209\135\208\184\209\133\209\131\208\176\209\133\209\131\208\176", 
    [382] = "\209\135\208\184\209\133\208\189\209\131\208\187 \208\177\208\181\208\183 \209\129\208\187\208\181\208\183", 
    [383] = "\208\176\208\187\209\140\208\191\208\181\208\189\208\184\209\129\209\130 \208\178 \208\191\208\181\209\129\208\186\208\181", 
    [384] = "\208\145\208\176\208\189\208\176\208\189\208\190\208\178\209\139\208\185 \209\128\208\176\208\185", 
    [385] = "\208\150\208\181\208\187\209\130\208\190\208\186 \208\189\208\176 \209\135\208\184\208\187\208\184\208\191\208\184\208\183\208\180\209\128\208\184\208\186\208\181", 
    [386] = "\208\147\208\190\208\178\208\190\209\128\209\143\209\137\208\184\208\185 \208\191\208\190\209\128\209\130\209\129\208\184\208\179\208\176\209\128", 
    [387] = "\208\159\208\181\209\128\208\181\208\178\208\181\209\128\208\189\209\131\209\130\208\176\209\143 \208\186\208\176\208\189\208\176\209\128\208\181\208\185\208\186\208\176", 
    [388] = "\208\182\208\181\209\129\209\130\208\186\208\184\208\185 \208\186\208\184\208\189\208\190\209\130\208\181\208\176\209\130\209\128", 
    [389] = "\208\151\208\184\208\188\208\189\208\181\208\181 \208\187\208\181\209\130\208\190", 
    [390] = "\209\130\209\128\208\181\209\130\208\184\208\185 \208\191\208\190\208\180\208\177\208\190\209\128\208\190\208\180\208\190\208\186", 
    [391] = "\208\155\209\140\209\142 \208\187\208\184\208\188\208\190\208\189\208\176\208\180 \208\188\208\184\208\188\208\190 \209\128\209\130\208\176", 
    [392] = "\208\159\208\181\209\128\208\181\208\183\208\176\209\128\209\143\208\182\208\176\209\142 \208\186\208\181\209\132\208\184\209\128", 
    [393] = "\208\186\208\176\209\136\208\187\209\143\209\142 \209\133\209\141\209\136\208\181\208\188", 
    [394] = "\208\156\208\190\208\187\208\190\208\186\208\190 2 \208\187\208\184\209\130\209\128\208\176", 
    [395] = "\208\186\208\190\208\187\208\177\208\176\209\129\208\176 \209\129 \208\186\208\176\208\191\209\131\209\129\209\130\208\190\208\185 \208\180\208\176 \208\181\209\137\208\181 \208\184 \209\129 \208\191\208\181\209\135\208\181\208\189\209\140\208\181\208\188", 
    [396] = "\208\180\208\176 \208\184 \208\178 \208\191\209\128\208\184\208\186\209\131\209\129\208\186\209\131 cock\208\176 \208\186\208\190\208\187\208\176", 
    [397] = "\208\165\208\184\209\130\209\128\209\139\208\185 \208\186\209\129\208\184\208\188\208\184", 
    [398] = "\208\157\208\190\208\178\208\190\208\188\208\190\208\180\208\189\209\139\208\185 vertu", 
    [399] = "\208\184\208\189\209\130\208\181\209\128\208\189\208\181\209\130 \208\186\208\176\208\177\208\181\208\187\209\140", 
    [400] = "\208\162\208\181\208\187\208\181\209\132\208\190\208\189\208\189\209\139\208\185 \209\136\208\189\209\131\209\128", 
    [401] = "\209\136\208\189\209\131\209\128 \208\180\208\187\209\143 \208\177\209\128\208\184\209\130\209\140\209\143", 
    [402] = "\208\145\208\176\209\128\208\176\208\177\208\176\209\136\208\186\208\176 \208\177\208\181\208\183 \208\186\208\176\209\130\209\131\209\136\208\181\208\186", 
    [403] = "\208\156\208\190\208\186\209\128\208\190\208\181 \208\177\208\181\208\187\209\140\208\181", 
    [404] = "\209\143\208\185\209\134\208\190 \209\129\208\190 \209\129\209\130\209\128\208\184\208\191\209\129\208\190\208\188 \208\178 \209\131\209\133\208\181", 
    [405] = "\208\188\208\190\208\184 \208\188\209\139\209\129\208\187\208\181 \208\189\208\176 \208\188\209\139\208\187\208\181 \208\190\208\189\208\184 so low", 
    [406] = "\208\146 \208\167\208\149\208\160\208\157\208\158\208\156 \208\161\208\159\208\152\208\161\208\154\208\149", 
    [407] = "\209\130\208\184\208\186\208\184 \209\130\208\190\208\186\208\184 \208\190\209\130 \208\177\209\131\209\128\208\188\208\176\208\187\208\180\209\139", 
    [408] = "\209\131\209\136\208\176\209\129\209\130\209\139\208\185 \209\136\208\190\208\186\208\190\208\187\208\176\208\180", 
    [409] = "\208\188\209\139\209\136\208\186\208\176 \208\187\208\190\208\179\208\184YECH", 
    [410] = "MinYEAT", 
    [411] = "\208\156\208\152\208\157\208\172\208\149\208\162", 
    [412] = "\208\147\208\176\209\128\208\184\208\186 \208\180\208\190 \209\135\208\181\208\187\209\142\209\129\209\130\208\184", 
    [413] = "\208\158\208\177\208\184\208\180\209\135\208\181\208\178\209\139\208\185 \209\136\208\186\208\190\208\187\209\140\208\189\208\184\208\186", 
    [414] = "\208\159\208\144\208\145\208\144\208\154\208\144 \208\163\208\155\208\171\208\145\208\144\208\154\208\144", 
    [415] = "\208\163\208\165-\208\162\208\171-\208\150-\208\153\208\158!", 
    [416] = "\208\149\209\130\208\184\208\182\208\184 \208\191\208\176\209\129\209\129\208\176\209\130\208\184\208\182\208\184", 
    [417] = "\208\168\208\184\208\187\208\190 \208\178 \209\128\209\139\208\187\208\190", 
    [418] = "\208\155\208\176\208\185\209\132 \208\178 \208\186\208\176\208\185\209\132", 
    [419] = "\208\154\208\144\208\153\208\164 \208\155\208\144\208\153\208\164", 
    [420] = "Zahar bobr", 
    [421] = "\208\146\208\181\209\128\208\176 \208\178 \208\183\208\176\208\188\208\176\209\143", 
    [422] = "15 \208\179\208\190\208\180 \209\141\209\130\208\190 \208\178\208\176\208\182\208\189\208\190", 
    [423] = "\208\154\208\190\208\187\209\143 \209\133\208\181\208\185\209\130\208\181\209\128", 
    [424] = "\208\191\208\184\209\129\209\142\208\189\208\184\209\129\209\130\209\139\208\185 \209\132\208\176\208\186\209\131\208\187\209\140\209\130\208\181\209\130", 
    [425] = "\208\178\209\129\208\181\208\188 \209\129\208\191\208\176\209\130\209\140", 
    [426] = "\208\178\208\181\208\187\209\140\208\178\208\181\209\130\208\190\208\178\209\139\208\185 \208\190\209\129\209\140\208\188\208\184\208\189\208\190\208\179", 
    [427] = "\208\188\209\143\209\129\208\189\208\190\208\185 \208\188\208\181\208\180\208\178\208\181\208\180", 
    [428] = "first day with neverlose.cc", 
    [429] = "https://vk.com/avtopodborkazahstan", 
    [430] = "\208\163\209\129\208\191\208\181\209\136\208\189\209\139\208\185 \208\176\208\178\209\130\208\190\208\188\208\190\208\177\208\184\208\187\208\184\209\129\209\130", 
    [431] = "\208\176\208\178\209\130\208\190\208\191\208\190\208\180\208\177\208\190\209\128 KZ", 
    [432] = "\208\145\208\176\208\183\208\190\208\178\208\176\209\143 \208\184 \208\191\208\190\208\187\208\189\208\176\209\143", 
    [433] = "\208\188\208\176\208\185 \208\176\208\187\208\188\208\176\208\185\208\180\209\139!", 
    [434] = "\208\144\209\129\209\130\209\139 \209\130\208\176\208\183\208\176, \209\129\209\130\208\176\208\186\208\176\208\189\208\180\208\176\209\128\209\139 \209\129\208\176\209\131"
};
do
    local l_v1536_19, l_v1688_16, l_v1689_16, l_v1690_14, l_v1691_14, l_v1692_17 = v1536, v1688, v1689, v1690, v1691, v1692;
    l_v1691_14 = function()
        -- upvalues: l_v1689_16 (ref)
        if l_v1689_16 == nil then
            return;
        else
            common.set_name(l_v1689_16);
            l_v1689_16 = nil;
            return;
        end;
    end;
    l_v1692_17 = function()
        -- upvalues: l_v1691_14 (ref)
        l_v1691_14();
    end;
    v1693 = nil;
    v1694 = function()
        -- upvalues: l_v1689_16 (ref), l_v1688_16 (ref), l_v1536_19 (ref), l_v1692_17 (ref)
        if l_v1689_16 == nil then
            l_v1689_16 = l_v1688_16:string();
        end;
        common.set_name(l_v1536_19.input:get());
        events.shutdown(l_v1692_17, true);
    end;
    v1695 = function()
        -- upvalues: l_v1691_14 (ref), l_v1692_17 (ref)
        l_v1691_14();
        events.shutdown(l_v1692_17, false);
    end;
    v1696 = function()
        -- upvalues: l_v1690_14 (ref), l_v1536_19 (ref)
        local v3540 = l_v1690_14[math.random(1, #l_v1690_14)];
        l_v1536_19.input:set(v3540);
    end;
    l_v1536_19.set_button:set_callback(v1694);
    l_v1536_19.reset_button:set_callback(v1695);
    l_v1536_19.generate_button:set_callback(v1696);
end;
v925 = nil;
v926 = {
    [1] = "crash", 
    [2] = "flush", 
    [3] = "buildmodelforworld", 
    [4] = "envmap", 
    [5] = "demos", 
    [6] = "+mat_texture_list", 
    [7] = "cc_random", 
    [8] = "kdtree_test", 
    [9] = "spincycle", 
    [10] = "-mat_texture_list", 
    [11] = "ai_test_los", 
    [12] = "cl_soundscape_printdebuginfo"
};
for v3541 = 1, #v926 do
    v1018 = v926[v3541];
    do
        local l_v3541_0 = v3541;
        cvar[v1018]:set_callback(function()
            -- upvalues: l_v3541_0 (ref)
            print("\aFF4040FFerror CV" .. l_v3541_0);
            return false;
        end);
    end;
end;