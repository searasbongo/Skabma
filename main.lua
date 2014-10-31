-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- require the composer library
local composer = require "composer"

-- load mainscene
composer.gotoScene( "constellationsscene" )

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc)