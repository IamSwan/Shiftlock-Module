# **Shiftlock Module**

#### *This module adds a manual shiftlock to the game, allowing more freedom in the use of it.*

* * *

## ***List of functions***
---
    module:shiftlock(active) | return active
active : if this boolean is true, the shiftlock enables. If it's false, it disables shiftlock.
 
    module:isLocked() | return boolean (true for enabled | false for disabled)
this function tells you if the shiftlock is enabled or not.

---
***PUT THIS MODULE IN THE STARTERCHARACTERSCRIPT FOLDER***

---
## Example code:
    local uis = game:GetService("UserInputService")
    local shiftModule = require(game.Players.LocalPlayer.Character:WaitForChild("ShiftlockModule")

    shiftModule:shiftlock(false)
    --[[ MAKE SURE TO DISABLE IT BY DEFAULT ]]--
    uis.InputBegan:Connect(function(input, gpe)
        if input.KeyCode == Enum.KeyCode.F then
            if shiftModule:IsLocked() then
                shiftModule:shiftlock(false)
            else
                shiftModule:shiftlock(true)
            end
        end
    end)    
