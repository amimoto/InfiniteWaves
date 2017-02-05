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
        if( WaveSettings.Waves[NextWaveIndex].bRecycleWave )
        {
            WaveTotalAI =   WaveSettings.Waves[NextWaveIndex].MaxAI *
                            DifficultyInfo.GetPlayerNumMaxAIModifier( GetNumHumanTeamPlayers() ) *
                            DifficultyInfo.GetDifficultyMaxAIModifier();
        }
        else
        {
            WaveTotalAI =   WaveSettings.Waves[NextWaveIndex].MaxAI;
        }

        // Scale the number of zeds as we grow into higher waves
        // Boost by 5% each wave's count
        WaveTotalAI = int(float(WaveTotalAI) * (1+WaveCount*0.05));

        GetAvailableSquads(NextWaveIndex, true);

        WaveStartTime = WorldInfo.TimeSeconds;
        TimeUntilNextSpawn = 5.f;

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


// Incrementally make things more difficult...
function float GetNextSpawnTimeMod()
{
    local float SpawnTimeMod;
    SpawnTimeMod = Super.GetNextSpawnTimeMod();

    // Over the course of 100 waves, we'll make things progressively worse linearly.
    SpawnTimeMod *= FClamp( 100-WaveCount/WaveCount, 0.5, 1.0 );

    return SpawnTimeMod;
}


