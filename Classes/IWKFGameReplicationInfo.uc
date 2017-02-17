class IWKFGameReplicationInfo extends KFGameReplicationInfo;

simulated function OpenTrader(optional int time)
{
    NextTrader.OpenTrader();
}

simulated function CloseTrader()
{
    NextTrader.CloseTrader();
}


defaultproperties
{
    // With this, there will be an eerie quiet through all the waves
    TraderDialogManagerClass=class'InfiniteWaves.IWKFTraderDialogManager'
}



