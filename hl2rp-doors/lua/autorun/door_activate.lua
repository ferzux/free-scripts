--[[
    Sim

    door_usetype
    2 variants: darkrp or simple, 
    darkrp - only cps can activate combine doors
    simple - all people can activate combine doors
]]
local door_usetype = "test"


--
if (SERVER) then
    function DoorActivate(ply, key) 
        if key == IN_USE then 
            local kek = {} 
            kek.start = ply:GetPos() 
            kek.endpos = ply:GetShootPos() + ply:GetAimVector() * 64 
            kek.filter = ply 
            local trace = util.TraceLine(kek) 
            if trace.Entity and trace.Entity:IsValid() and (trace.Entity:GetClass() == "func_door" or trace.Entity:GetClass() == "prop_door_rotating" or trace.Entity:GetClass() == "prop_dynamic") then 
                if door_usetype == "darkrp" then
                    if ply:isCP() then  
                        trace.Entity:Fire("Open")
                    end
                else
                    trace.Entity:Fire("Open")
                end
            end 
        end 
    end 
    hook.Add( "KeyPress", "hl2rp_door_activate", DoorActivate )
end
