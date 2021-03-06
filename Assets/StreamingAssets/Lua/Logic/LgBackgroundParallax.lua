--
-- Back ground parallax class.
--
-- @filename  LgBackgroundParallax.lua
-- @copyright Copyright (c) 2015 Yaukey/yaukeywang/WangYaoqi (yaukeywang@gmail.com) all rights reserved.
-- @license   The MIT License (MIT)
-- @author    Yaukey
-- @date      2015-09-02
--

local YwDeclare = YwDeclare
local YwClass = YwClass

local DLog = YwDebug.Log
local DLogWarn = YwDebug.LogWarning
local DLogError = YwDebug.LogError

local Vector3 = Vector3
local Time = Time

-- Register new class LgBackgroundParallax.
local strClassName = "LgBackgroundParallax"
local LgBackgroundParallax = YwDeclare(strClassName, YwClass(strClassName))

-- Member variables.

-- The c# class object.
LgBackgroundParallax.this = false

-- The transform.
LgBackgroundParallax.transform = false

-- The c# gameObject.
LgBackgroundParallax.gameObject = false

-- The background transforms.
LgBackgroundParallax.m_aBackgrounds = false

-- The parallax scale.
LgBackgroundParallax.m_fParallaxScale = 1.0

-- The parallax reduction factor.
LgBackgroundParallax.m_fParallaxReductionFactor = 1.0

-- The smoothing.
LgBackgroundParallax.m_fSmoothing = 0.1

-- The current camera transform.
LgBackgroundParallax.m_cCam = false

-- The previous camera pos.
LgBackgroundParallax.m_vPreviousCamPos = false

-- Constructor.
function LgBackgroundParallax:Constructor()
    --print("LgBackgroundParallax:Constructor")
    self.m_aBackgrounds = {}
    self.m_vPreviousCamPos = Vector3.zero
end

-- Destructor.
function LgBackgroundParallax:Destructor()
    --print("LgBackgroundParallax:Destructor")
    self.m_aBackgrounds = nil
end

-- Awake method.
function LgBackgroundParallax:Awake()
    --print("LgBackgroundParallax:Awake")

    -- Check variable.
    if (not self.this) or (not self.transform) or (not self.gameObject) then
        DLogError("Init error in LgBackgroundParallax!")
        return
    end

    self.m_cCam = Camera.main.transform
end

-- Start method.
function LgBackgroundParallax:Start()
    --print("LgBackgroundParallax:Start")
    -- The 'previous frame' had the current frame's camera position.
    self.m_vPreviousCamPos = self.m_cCam.position
end

-- Update method.
function LgBackgroundParallax:Update()
    --print("LgBackgroundParallax:Update")

    -- The parallax is the opposite of the camera movement since the previous frame multiplied by the scale.
    local fParallax = (self.m_vPreviousCamPos.x - self.m_cCam.position.x) * self.m_fParallaxScale

    -- For each successive background...
    local aBackgrounds = self.m_aBackgrounds
    for i = 1, #aBackgrounds do
        -- ... set a target x position which is their current position plus the parallax multiplied by the reduction.
        local fBackgroundTargetPosX = aBackgrounds[i].position.x + fParallax * (i * self.m_fParallaxReductionFactor + 1.0)

        -- Create a target position which is the background's current position but with it's target x position.
        local vBackgroundTargetPos = Vector3(fBackgroundTargetPosX, aBackgrounds[i].position.y, aBackgrounds[i].position.z)

        -- Lerp the background's position between itself and it's target position.
        aBackgrounds[i].position = Vector3.Lerp(aBackgrounds[i].position, vBackgroundTargetPos, self.m_fSmoothing * Time.deltaTime)
    end

    -- Set the previousCamPos to the camera's position at the end of this frame.
    self.m_vPreviousCamPos = self.m_cCam.position
end

-- Return this class.
return LgBackgroundParallax
