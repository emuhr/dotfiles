import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.SpawnOnce
import System.IO
import XMonad.Hooks.SetWMName

--------------------------------------------------------------------------------
---- variables
--------------------------------------------------------------------------------
myTerminal :: String
myTerminal = "kitty"  -- sets the default terminal

myModMask :: KeyMask
myModMask = mod4Mask  -- sets modkey to the super key


--------------------------------------------------------------------------------
---- autostart
--------------------------------------------------------------------------------
myStartupHook :: X ()
myStartupHook = do
  setWMName "LG3D"
  spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x292d3e --height 18 &"  

--------------------------------------------------------------------------------
---- main
--------------------------------------------------------------------------------
main = do
    xmproc <- spawnPipe "xmobar /home/emanuel/.config/xmobar/xmobarrc"
    xmonad $ docks defaultConfig
        { layoutHook = avoidStruts  $  layoutHook defaultConfig
        , modMask = myModMask
        , terminal = myTerminal
        , logHook = dynamicLogWithPP xmobarPP
          { ppOutput = hPutStrLn xmproc
          , ppTitle = xmobarColor "#d0d0d0" "" . shorten 60     -- Title of active window in xmobar
          }
        , startupHook = myStartupHook
        }



