//=============================================================================
// IWSurvival
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
// Portions Copyright (C) 2017
// - Aki Mimoto
//=============================================================================

class IWSurvival extends KFGameInfo_Survival;

var int                   WaveCount;
var IWKFAISpawnManager   MySpawnManager;
var array< class<IWKFAISpawnManager> >      IWSpawnManagerClasses;

// How many more Zeds are active any moent
var float ZedActiveRamping;

// How many more Zeds show up in addition every wave.
var float MaxZedRamping;

// How rapidly do the Zeds appear?
var float RateZedRamping;

// Now much time to delay between waves
var float WaveStartSpawnDelay;

/** Set up the spawning */
function InitSpawnManager()
{

    MySpawnManager = new(self) IWSpawnManagerClasses[GameLength];
    MySpawnManager.ZedActiveRamping = ZedActiveRamping;
    MySpawnManager.MaxZedRamping = MaxZedRamping;
    MySpawnManager.RateZedRamping = RateZedRamping;
    MySpawnManager.WaveStartSpawnDelay = WaveStartSpawnDelay;

    SpawnManager = MySpawnManager;
    SpawnManager.Initialize();
    WaveMax = SpawnManager.WaveSettings.Waves.Length;
    MyKFGRI.WaveMax = WaveMax;
}

function StartMatch()
{
    WaveNum = 0;
    WaveCount = 0;

    Super.StartMatch();

    if( class'KFGameEngine'.static.CheckNoAutoStart() || class'KFGameEngine'.static.IsEditor() )
    {
        GotoState('DebugSuspendWave');
    }
    else
    {
        GotoState( 'EndlessMode' );
    }
}

function StartWave()
{
    local KFPlayerController KFPC;
    //local KFPlayerReplicationInfo KFPRI;

    MySpawnManager.MySetupNextWave(WaveNum);

    WaveCount++;
    MyKFGRI.WaveNum = WaveNum + 1;
    NumAISpawnsQueued = 0;
    AIAliveCount = 0;

    WaveStarted();

    MyKFGRI.AIRemaining = SpawnManager.WaveTotalAI;
    MyKFGRI.WaveTotalAICount = SpawnManager.WaveTotalAI;

    // We don't want a message to say that the new wave is starting to come in
    // Without the wave start message, the feeling is quite eerie
    // BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_WaveStart);

    // Change Traders
    MyKFGRI.CloseTrader();
    SetupNextTrader();
    MyKFGRI.OpenTrader();

    if( WorldInfo.NetMode != NM_DedicatedServer && Role == ROLE_Authority )
    {
        MyKFGRI.UpdateHUDWaveCount();
        foreach WorldInfo.AllControllers( class'KFPlayerController', KFPC )
        {
            // These two lines put the waves widget into a mode
            // that shows "FINAL"
            KFPC.MyGFxHUD.WaveInfoWidget.SetInt("maxWaves", 1);
            KFPC.MyGFxHUD.WaveInfoWidget.SetInt("currentWave", 2);

            // Now, we override the "FINAL" string with the
            // number of waves the players have survived.
            //KFPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
            KFPC.MyGFxHUD.WaveInfoWidget.SetString(
                      "finalText",
                      string(WaveCount)
                  );
        }
    }

    ResetAllPickups();
}

function WaveEnded(EWaveEndCondition WinCondition)
{
    MyKFGRI.NotifyWaveEnded();
    `DialogManager.SetTraderTime( !MyKFGRI.IsFinalWave() );

    // IsPlayInEditor check was added to fix a scaleform crash that would call an actionscript function
    // as scaleform was being destroyed. This issue only occurs when playing in the editor
    if( WinCondition == WEC_TeamWipedOut && !class'WorldInfo'.static.IsPlayInEditor())
    {
        EndOfMatch(false);
    }
    else if( WinCondition == WEC_WaveWon )
    {
        RewardSurvivingPlayers();
        UpdateWaveEndDialogInfo();

        // Start new wave.
        WaveNum = Clamp(WaveNum + 1,0,WaveMax-1);
        MyKFGRI.SetWaveActive(TRUE, GetGameIntensityForMusic());

        GotoState('CleanupWave');
    }

    SetTimer( WorldInfo.DeltaSeconds, false, nameOf(Timer_FinalizeEndOfWaveStats) );
}


/***********************************************************************************/
/***  State: EndlessMode                                                         ***/
/***********************************************************************************/
State EndlessMode
{
    function BeginState( Name PreviousStateName )
    {
        StartWave();
    }

    function bool IsWaveActive()
    {
        return true;
    }

    function EndState( Name NextStateName ) {}

    function CloseTraderTimer() {}
}


/***********************************************************************************/
/***  State: PlayingWave                                                         ***/
/***********************************************************************************/
State PlayingWave
{
    function BeginState( Name PreviousStateName )
    {
        MyKFGRI.SetWaveActive(TRUE, GetGameIntensityForMusic());
        StartWave();
    }

    function bool IsWaveActive()
    {
        return true;
    }
}


/***********************************************************************************/
/***  State: CleanupWave                                                         ***/
/***********************************************************************************/
State CleanupWave
{
    function BeginState( Name PreviousStateName )
    {
        local KFPlayerController KFPC;

        MyKFGRI.SetWaveActive(FALSE, GetGameIntensityForMusic());

        ForEach WorldInfo.AllControllers(class'KFPlayerController', KFPC)
        {
            if( KFPC.GetPerk() != none )
            {
                KFPC.GetPerk().OnWaveEnded();
            }
            KFPC.ApplyPendingPerks();
        }

        // Restart players
        StartHumans();

        MyKFGRI.SetWaveActive(TRUE, GetGameIntensityForMusic());
        GotoState('EndlessMode');
    }
}


DefaultProperties
{

    GameReplicationInfoClass = class'InfiniteWaves.IWKFGameReplicationInfo'
    GameConductorClass = class'InfiniteWaves.IWKFGameConductor'

    IWSpawnManagerClasses(0)=class'InfiniteWaves.IWKFAISpawnManager_Short'
    IWSpawnManagerClasses(1)=class'InfiniteWaves.IWKFAISpawnManager_Normal'
    IWSpawnManagerClasses(2)=class'InfiniteWaves.IWKFAISpawnManager_Long'


    // Linear ramp increase of Zeds by 10% per wave
    MaxZedRamping = 0.10

    // Linear ramp increase of active Zeds on map by 2.5% per wave
    ZedActiveRamping = 0.025

    // Linear ramp increase of Zed spawns by 5% per wave
    RateZedRamping = 0.05

    // Now much time to delay between waves
    WaveStartSpawnDelay = 0.f
}




