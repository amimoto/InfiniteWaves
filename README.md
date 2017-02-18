# Infinite Waves Mod for KF2

## Introduction

An Endless Wave version of survival. However, you play till yer dead >;)

## What's different?

Changes to standard survival

* Wave spawn types progress as standard but get clamped at X/X difficulty
* There is no trader time. Trader is always open. When all zeds in wave are killed, current trader closes and new one opens.
* 10% additional zeds cumulative each wave
* 5% increase in allowed active zeds per wave
* SpawnTimeMod gets reduced by 5% each wave (clamped to 50% reduction)
* There is no spawn delay when a wave starts
* Trader is silent

## How do I install this?

Download the compiled binary file from here:

https://github.com/amimoto/InfiniteWaves/raw/master/InfiniteWaves.u

This should give you the file **InfiniteWaves.u**

Take the InfiniteWaves.u and drop the file off into:

     steamapps/common/killingfloor2/KFgame/BrewedPC
     	
## How do I use this

First, install the mod. (See above)

Then, start Killing Floor 2 and run from console (hit the "~" tilde key)

     open  KF-Outpost?Difficulty=3?game=InfiniteWaves.IWSurvival

## Compiling this code

You will need the KF2 SDK.

### Download and install source

Get or close the repo:

Put this directory into:

     ...\YOURUSERNAME\Documents\My Games\KillingFloor2\KFGame\src\InfiniteWaves
     
 Edit KFEditor.ini file, located at:
 
      ...\YOURUSERNAME\Documents\My Games\KillingFloor2\KFGame\Config\KFEditor.ini
      
 Look for the section called ** [ModPackages] ** and add InfiniteWaves there. It should look vaguely like thisL
 
    [ModPackages]
    ModPackagesInPath=..\..\KFGame\Src
    ModOutputDir=..\..\KFGame\Unpublished\BrewedPC\Script
    ModPackages=InfiniteWaves

### To compile:

    KFEditor.exe make

To use the new game mode or test your changes, use:

    KFEditor.exe KF-Outpost?Difficulty=3?game=InfiniteWaves.IWSurvival -useunpublished
    
 For release, the following command can be used:
 
    kfeditor brewcontent -platform=PC InfiniteWaves
    
 More information can be found below:
 
 https://tripwireinteractive.atlassian.net/wiki/display/KF2SW/KF2+Code+Modding+How-to


## Notes

If you're here to see this code as an example on how to make KF2 mods, here's a better resource:

 Tripwire Wiki: https://tripwireinteractive.atlassian.net/wiki/display/KF2SW/KF2+Code+Modding+How-to
 
 Mutators: http://forums.tripwireinteractive.com/forum/killing-floor-2/killing-floor-2-modifications/code/115335-mutator-not-being-loaded-because-it-can-t-find-it-s-class
 
 Note that this mod is actually a custom game-type so the forum post isn't quite the same thing but I found it quite useful.
 
 
 
