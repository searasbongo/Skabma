---------------------------------------------------------------------------------
--
-- Constellation scene
--
-- Bakground: sky with starts image
-- Data: file with star coordinates, file with constellations
--
-- Screen content:
-- * Background with stars (static)
-- * Constellations drawn as lines betwween stars (on or off)
-- * A text field with name of constellation
-- * Close button
--
-- Interaction:
-- 1. Click on contstellation area: show lines, play sound of name, and display name in text field
-- 2. Click again on consetallation: hide lines
-- 3. Swipe (left or right) in text field: display name of new constellation, and show it's lines
-- 4. Close button: go to main scene
---------------------------------------------------------------------------------

local sceneName = ...

local composer = require( "composer" )

-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------

-- Close button is placed among the stars
local closeButton
-- Name label is placed at bottom of the screen
local nameText
-- Table sounds played when constellations are clicked
local soundTable

-- All drawn lines belong to this group
local starGroup

function scene:create( event )
    local sceneGroup = self.view

    -- Called when the scene's view does not exist
    -- 
    -- INSERT code here to initialize the scene
    -- e.g. add display objects to 'sceneGroup', add touch listeners, etc

    local background = display.newImageRect( "images/himmel-stjerner.png", 1920, 1080 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    if background then
        sceneGroup:insert( background )
    else
        print "Could not insert background"
    end

    nameText = display.newText( "Hello World!", display.contentCenterX,  display.contentHeight - 50, native.systemFont, 56 )

    starGroup = display.newGroup()
    --local myLine = starGroup.newLine( 0, -110, 27, -35 )

    --Load entire sound file to memory
    soundTable = {
--
--    chimeSound = audio.loadSound( "chime.wav" ),
--    bellSound = audio.loadSound( "bell.wav" ),
--    buzzSound = audio.loadSound( "buzz.aac" ),
--    clickSound = audio.loadSound( "click.aac" )
   }
    --audio.play( soundTable["chimeSound" )

end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is still off screen and is about to move on screen
        --nameLabel = self:getObjectByTag( "nameLbl" )
        --nameLabel.x = display.contentWidth / 2
        --nameLabel.y = display.contentHeight - 50
        --nameLabel.size = display.contentWidth / 2
    elseif phase == "did" then
        -- Called when the scene is now on screen
        -- 
        -- INSERT code here to make the scene come alive
        -- e.g. start timers, begin animation, play audio, etc
        --closeButton = self:getObjectByTag( "closeBtn" )
        if closeButton then
            -- touch listener for the close button
            function closeButton:touch ( event )
                local phase = event.phase
                if "ended" == phase then
                    composer.gotoScene( "mainscene", { effect = "fade", time = 300 } )
                end
            end
            -- add the touch event listener to the button
            closeButton:addEventListener( "touch", closeButton )
        end

        --nameLabel = self:getObjectByTag( "nameLbl" )
        if nameText then
            -- swipe listener for the close button
            function nameText:swipe ( event )
                -- TODO
            end
            -- add the touch event listener to the button
            nameText:addEventListener( "swipe", nameText )
        end
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        -- Called when the scene is on screen and is about to move off screen
        --
        -- INSERT code here to pause the scene
        -- e.g. stop timers, stop animation, unload sounds, etc.)
    elseif phase == "did" then
        -- Called when the scene is now off screen
        if closeButton then
            closeButton:removeEventListener( "touch", closeButton )
        end
    end
end


function scene:destroy( event )
    local sceneGroup = self.view

    -- Called prior to the removal of scene's "view" (sceneGroup)
    -- 
    -- INSERT code here to cleanup the scene
    -- e.g. remove display objects, remove touch listeners, save state, etc

    --TODO: dispose audio files

    display.remove ( closeButton )
    closeButton = nil
    display.remove ( nameText )
    nameText = nil
    display.remove ( starGroup )
    starGroup = nil



    audio.stop()

    for s,v in pairs( soundTable ) do
        audio.dispose( soundTable[s] )
        soundTable[s] = nil
    end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
