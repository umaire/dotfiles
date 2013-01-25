import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


main = do
  dzenLeftBar  <- spawnPipe myXmonadBar
  dzenRightBar <- spawnPipe myStatusBar
  xmonad $ defaultConfig {
         manageHook = myManageHooks <+> manageHook defaultConfig,
         layoutHook = avoidStruts  $  layoutHook defaultConfig,
         terminal   = myTerminal,
         workspaces = myWorkspaces,
         logHook    = myLogHook dzenLeftBar >> fadeInactiveLogHook 0xdddddddd,
         normalBorderColor  = "#666666",
         focusedBorderColor = "#999999",
         borderWidth = 1
         }


myTerminal = "urxvt"

myWorkspaces = ["main", "web", "media", "dev", "design", "mail", "misc"]

myManageHook = composeAll
   [ className =? "Rhythmbox" --> doShift "="
   , className =? "Vlc"       --> doShift "media"
   , className =? "Chromium"  --> doFloat "web"
   , manageDocks
   ]


myXmonadBar = "dzen2 -x '0' -y '0' -h '24' -w '640' -ta 'l' -fg '#AAAAAA' -bg '#1A1A1A' -fn '-*-terminus-*-r-normal-*-*-96-*-*-*-*-iso8859-*'"
myStatusBar = "conky -c /home/umair/.xmonad/.conky_dzen | dzen2 -x '640' -w '640' -h '24' -ta 'r' -bg '#1A1A1A' -fg '#AAAAAA' -y '0' -fn '-*-terminus-*-r-normal-*-*-96-*-*-*-*-iso8859-*'"

myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP

    -- display current workspace as darkgrey on light grey (opposite of 
    -- default colors)
    { ppCurrent         = dzenColor "#303030" "#909090" . pad 

    -- display other workspaces which contain windows as a brighter grey
    , ppHidden          = dzenColor "#909090" "" . pad 

    -- display other workspaces with no windows as a normal grey
    , ppHiddenNoWindows = dzenColor "#606060" "" . pad 

    -- display the current layout as a brighter grey
    , ppLayout          = dzenColor "#909090" "" . pad 

    -- if a window on a hidden workspace needs my attention, color it so
    , ppUrgent          = dzenColor "#ff0000" "" . pad . dzenStrip

    -- shorten if it goes over 100 characters
    , ppTitle           = shorten 100  

    -- no separator between workspaces
    , ppWsSep           = ""

    -- put a few spaces between each object
    , ppSep             = "  "

    -- output to the handle we were given as an argument
    , ppOutput          = hPutStrLn h
    }
