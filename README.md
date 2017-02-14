An Endless Wave version of survival. However, you play till yer dead >;)

Changes to normal survival

* Wave spawn types progress as standard but get clamped at X/X difficulty
* There is no trader time. Trader is always open. When enemies in wave are killed, current trader closes and new one opens.
* 5% additional enemies cumulative each wave
* SpawnTimeMod gets reduced by 5% each wave (clamped to 50% reduction)

Put this directory into:

YOUR USERNAME\Documents\My Games\KillingFloor2\KFGame\src\InfiniteWaves

Then if you have the KF2 Editor.

Run:

KFEditor.exe make

To use the new game mode use:

KFEditor.exe KF-Outpost?Difficulty=3?game=InfiniteWaves.IWSurvival -useunpublished


