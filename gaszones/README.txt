All config variables for this plugin can be adjusted in-game.
These includes the tickTime, which determines how often it runs (running more often = more work = more chance for lag),
how much damage per second it should do (this is per second, not per tickTime!) and
how much it should drain from filters (default is 1 filterQuality per second)

To add gaszones, simply do /gaszoneadd in one corner, /gaszoneadd <scale> in the opposite corner.
It will create a rectangular area parallel with the map's axis in which players will be considered in a gaszone.
The scale determines the damage and filter drain this zone will cause. Higher scale = more damage/more filter drain.
The scale can be any number bigger than zero. Bigger scale zones take priority (aka it'll always use a zone the player is in with the highest scale).
/gaszoneremove can be used to remove a zone.

The same can be done with /nogaszoneadd, except no scale is needed. Any player in a nogaszone won't take gasdamage.
Even if the nogaszone is inside a gaszone!
/nogaszoneremove can be used to remove a zone.

Note that a lot of gaszones/nogaszones is the main reason for lag. I've done as much as I can to optimize everything.
This plugin has been tested with a decent amount of zones on a 60-80 player server and ran fine, just don't throw 100's of zones at it.
Try to use a few large zones instead of a lot of small ones, they go through walls etc. so no need to give each room it's own.
Keeping gaszones to one specific part of the map also helps (e.g. one building, below the ground, one side of the map, etc.).

In order for a player to be protected from a gaszone, he needs to have a suit equipped with either:
-ITEM.hasGasmask = true; on it, in which case he'll also need filterQuality on his character data.
-ITEM.hasRebreather = true; in which case he is safe.
You can check my armor plugin out if you want an example of how to do this.