--******************************************************************************************************
--** Copyright (c) 2024 FAForever
--**
--** Permission is hereby granted, free of charge, to any person obtaining a copy
--** of this software and associated documentation files (the "Software"), to deal
--** in the Software without restriction, including without limitation the rights
--** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--** copies of the Software, and to permit persons to whom the Software is
--** furnished to do so, subject to the following conditions:
--**
--** The above copyright notice and this permission notice shall be included in all
--** copies or substantial portions of the Software.
--**
--** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--** SOFTWARE.
--******************************************************************************************************

do

    -- Nyan cat seasonal event
    -- For those living under a rock, see also: https://www.nyan.cat/

    local oldSDFChronatronCannon02 = SDFChronatronCannon02
    SDFChronatronCannon02 = Class(oldSDFChronatronCannon02) {

        PolyTrails = {},

        ---@param self SDFChronatronCannon02
        OnCreate = function(self)
            local vx, vy, vz, w = unpack(self:GetOrientation())
            if vz >= 0 then
                self.FxTrails = {
                    '/mods/fa-mod-nyan-cat/effects/emitters/nyan_trail.bp',
                    '/mods/fa-mod-nyan-cat/effects/emitters/nyan_01.bp'
                }
            else
                self.FxTrails = {
                    '/mods/fa-mod-nyan-cat/effects/emitters/nyan_trail.bp',
                    '/mods/fa-mod-nyan-cat/effects/emitters/nyan_02.bp'
                }
            end

            oldSDFChronatronCannon02.OnCreate(self)

            -- engine doesn't play this automagically for us
            self:PlaySound(self.Blueprint.Audio.ExistLoop)
        end,
    }

    TypeClass = SDFChronatronCannon02
end
