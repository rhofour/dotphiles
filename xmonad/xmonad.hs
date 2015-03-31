{-# LANGUAGE PackageImports #-}
import System.Posix.Env (getEnv)
import System.Taffybar.XMonadLog
import Data.Maybe (maybe)
import "dbus" DBus.Client

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import qualified XMonad.StackSet as W
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.NoBorders
import XMonad.Layout.ToggleLayouts
import XMonad.Util.Run
import XMonad.Util.EZConfig

import Graphics.X11.ExtraTypes.XF86
import Graphics.X11.ExtraTypes.XorgDefault

myModMask = mod4Mask
myLayouts = smartBorders $ toggleLayouts Full $ tiled ||| Mirror tiled
  where
      tiled   = Tall nmaster delta ratio
      nmaster = 1
      ratio   = 1/2
      delta   = 1/26
myManageHook = composeAll
  [ className =? "Firefox-bin"  --> doShift "1"
  , stringProperty "WM_WINDOW_ROLE" =? "IRC"  --> doShift "2"
  , className =? "Thunderbird"  --> doShift "3"
  , className =? "Pavucontrol"  --> doShift "7"
  , title     =? "Liquid Earth" --> doFloat
  , title     =? "glxgears" --> doFloat
  , resource  =? "sun-awt-X11-XFramePeer" --> doFloat
  ]
myWorkspaces = map show $ [1 .. 9 :: Int] ++ [0]

main = do
     session <- getEnv "DESKTOP_SESSION"
     client <- connectSession
     xmonad  $ withUrgencyHook NoUrgencyHook $ defaultConfig
      { terminal   = "terminator"
      , modMask    = myModMask
      , workspaces = myWorkspaces
      , normalBorderColor = "green" -- Make focused window stand out more
      , focusedBorderColor = "red" -- Make focused window stand out more
      , borderWidth = 2
      , handleEventHook = docksEventHook
      , manageHook = manageDocks <+> myManageHook 
      , layoutHook = avoidStruts $ myLayouts
      , logHook    = dbusLogWithPP (client :: DBus.Client.Client) taffybarPP
        { ppCurrent = taffybarColor "yellow" "" . wrap "[" "]"
        , ppTitle = taffybarColor "green" "" . shorten 50
        , ppUrgent = taffybarColor "yellow" "red"
        , ppLayout = const "" -- to disable the layout info
        }
      --, startupHook = setWMName "LG3D" -- Warning: this can break GTK3 stuff
      } `additionalKeys`
      [ ((myModMask, xK_0), windows $ W.greedyView $ last myWorkspaces)
      , ((myModMask, xK_d), sendMessage ToggleStruts) -- Toggle docks
      , ((myModMask, xK_f), sendMessage ToggleLayout) -- Toggle fullscreen
      , ((myModMask .|. shiftMask, xK_l), safeSpawn "xscreensaver-command" ["--lock"])
      , ((0, xF86XK_Sleep), do
          safeSpawn "xscreensaver-command" ["--lock"]
          spawn "dbus-send --system --print-reply --dest=\"org.freedesktop.UPower\" /org/freedesktop/UPower org.freedesktop.UPower.Suspend")
      , ((0, xF86XK_AudioPlay), spawn "mpc toggle") -- Enable media keys for MPD
      , ((0, xF86XK_AudioStop), spawn "mpc stop")
      , ((0, xF86XK_AudioNext), spawn "mpc next")
      , ((0, xF86XK_AudioPrev), spawn "mpc prev")
      , ((0, xF86XK_AudioRaiseVolume), safeSpawn "amixer" ["set", "Master", "2500+"])
      , ((0, xF86XK_AudioLowerVolume), safeSpawn "amixer" ["set", "Master", "2500-"])
      , ((0, xF86XK_AudioMute), safeSpawn "amixer" ["set", "Master", "toggle"])
      ]
