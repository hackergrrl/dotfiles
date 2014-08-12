-- Import
import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.CustomKeys
import XMonad.Util.Run(spawnPipe)

import qualified Data.Map as M


-- Terminal
myTerminal = "urxvt"

-- Mod mask
myModMask = mod4Mask

-- Workspaces
--myWorkspaces = ["main","web","chat","media","browse","dev","mail"]

-- Key bindings
-- myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
--   [
--     ((modm, xK_l), spawn "xlock")
--   ]

-- Run XMonad
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig {
    -- keys
    modMask = myModMask,
    -- keys = myKeys,

    -- apps
    terminal = myTerminal,

    -- workspaces
    --workspaces = myWorkspaces,

    -- hooks, layouts
    manageHook = manageDocks <+> manageHook defaultConfig,
    layoutHook = avoidStruts $ layoutHook defaultConfig
  }

