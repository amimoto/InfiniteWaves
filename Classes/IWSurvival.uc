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

/** Set up the spawning */
function InitSpawnManager()
{

    MySpawnManager = new(self) IWSpawnManagerClasses[GameLength];
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
    local KFPlayerReplicationInfo KFPRI;

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
    MyKFGRI.NextTrader.CloseTrader();
    SetupNextTrader();
    MyKFGRI.NextTrader.OpenTrader();

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
            KFPRI = KFPlayerReplicationInfo(KFPC.PlayerReplicationInfo);
            KFPC.MyGFxHUD.WaveInfoWidget.SetString(
                      "finalText",
                      string(WaveCount)
                  );
        }
    }

    ResetAllPickups();
}

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

    function EndState( Name NextStateName )
    {
    }

    function CloseTraderTimer()
    {
    }
}


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

        // Start new wave?
        WaveNum = (WaveNum + 1) % (WaveMax - 1);
        MyKFGRI.SetWaveActive(TRUE, GetGameIntensityForMusic());

        GotoState('CleanupWave');
    }

    SetTimer( WorldInfo.DeltaSeconds, false, nameOf(Timer_FinalizeEndOfWaveStats) );
}

State CleanupWave
{
    function BeginState( Name PreviousStateName )
    {
        local KFPlayerController KFPC;

        // FIXME: Always mid-intensity for music
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

        // FIXME: Always mid-intensity for music
        MyKFGRI.SetWaveActive(TRUE, GetGameIntensityForMusic());
        GotoState('EndlessMode');
    }
}


DefaultProperties
{
    IWSpawnManagerClasses(0)=class'InfiniteWaves.IWKFAISpawnManager_Short'
    IWSpawnManagerClasses(1)=class'InfiniteWaves.IWKFAISpawnManager_Normal'
    IWSpawnManagerClasses(2)=class'InfiniteWaves.IWKFAISpawnManager_Long'
}

