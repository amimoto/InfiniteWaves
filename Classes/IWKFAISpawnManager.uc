//=============================================================================
// IWKFAISpawnManager
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
// Portions Copyright (C) 2017
// - Aki Mimoto
//=============================================================================

class IWKFAISpawnManager extends KFAISpawnManager;

var int                   WaveCount;

// How many more Zeds are active any moent
var float ZedActiveRamping;

// How many more Zeds show up in addition every wave.
var float MaxZedRamping;

// How rapidly do the Zeds appear?
var float RateZedRamping;

// Now much time to delay between waves
var float WaveStartSpawnDelay;

function SetupNextWave(byte NextWaveIndex)
{
    `log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SetupNextWave was called. Not sure why, shouldn't be though. Blackholing anyways");
}

/** Next wave's basic setup */
function MySetupNextWave(int NextWaveCount)
{
    local KFGameReplicationInfo KFGRI;
    local byte NextWaveIndex;

    NextWaveIndex = Clamp(NextWaveCount,0,WaveSettings.Waves.Length-1);
    WaveCount = NextWaveCount;

    if( NextWaveIndex < WaveSettings.Waves.Length )
    {
        // Recycle special squads
        bRecycleSpecialSquad = true;

        // Clear out any leftover spawn squads from last wave
        LeftoverSpawnSquad.Length = 0;

        // Initialize the spawn list cycles
        NumSpawnListCycles=1;

        // Initialize our recycle number
        NumSpecialSquadRecycles = 0;

        // Scale the number of zeds if the wave can be recycled
        WaveTotalAI =   WaveSettings.Waves[NextWaveIndex].MaxAI *
                        DifficultyInfo.GetPlayerNumMaxAIModifier( GetNumHumanTeamPlayers() ) *
                        DifficultyInfo.GetDifficultyMaxAIModifier();

        // Scale the number of zeds as we grow into higher waves
        // Boost by MaxZedRamping*100% upon each wave
        WaveTotalAI = int(float(WaveTotalAI) * (1+WaveCount*MaxZedRamping));

        GetAvailableSquads(NextWaveIndex, true);

        WaveStartTime = WorldInfo.TimeSeconds;

        // We delay spawns upon new wave (default: 0s)
        TimeUntilNextSpawn = WaveStartSpawnDelay;

        // Reset the total waves active time on first wave
        if( NextWaveIndex == 0 )
        {
            TotalWavesActiveTime = 0;
        }

        KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
        if( KFGRI != none && (KFGRI.bDebugSpawnManager || KFGRI.bGameConductorGraphingEnabled) )
        {
            KFGRI.CurrentSineMod = GetSineMod();
            KFGRI.CurrentNextSpawnTime = TimeUntilNextSpawn;
            KFGRI.CurrentSineWavFreq = GetSineWaveFreq();
            KFGRI.CurrentNextSpawnTimeMod = GetNextSpawnTimeMod();
            KFGRI.CurrentTotalWavesActiveTime = TotalWavesActiveTime;
            KFGRI.CurrentMaxMonsters = GetMaxMonsters();
            KFGRI.CurrentTimeTilNextSpawn = TimeUntilNextSpawn;
        }
    }

    LastAISpawnVolume = none;

    `log("KFAISpawnManager.SetupNextWave() NextWave:" @ NextWaveIndex @ "WaveTotalAI:" @ WaveTotalAI, bLogAISpawning || bLogWaveSpawnTiming);
}


function int GetMaxMonsters()
{
    local int UsedMaxMonsters;

    if( WorldInfo.NetMode == NM_StandAlone && GetLivingPlayerCount() == 1 )
    {
        if( GameDifficulty < ArrayCount(MaxMonstersSolo) )
        {
           UsedMaxMonsters = MaxMonstersSolo[GameDifficulty];
        }
        else
        {
           UsedMaxMonsters = MaxMonstersSolo[ArrayCount(MaxMonstersSolo) - 1];
        }
    }
    else
    {
        UsedMaxMonsters = MaxMonsters;
    }

    UsedMaxMonsters = int(float(UsedMaxMonsters) * (1+WaveCount*ZedActiveRamping));

    return UsedMaxMonsters;
}



// Incrementally make things more difficult...
function float GetNextSpawnTimeMod()
{
    local float SpawnTimeMod;
    SpawnTimeMod = Super.GetNextSpawnTimeMod();
    SpawnTimeMod *= FClamp( (1-RateZedRamping*WaveCount), 0.05, 1.0 );
    return SpawnTimeMod;
}
