class IWKFTraderDialogManager extends KFTraderDialogManager;


simulated function PlayDialog( int EventID, Controller C )
{
// We don't play no dialog
}

static function PlayGlobalDialog( int EventID, WorldInfo WI )
{
}

static function PlayGlobalWaveProgressDialog( int ZedsRemaining, int ZedsTotal, WorldInfo WI )
{
}

simulated function PlayOpenTraderDialog( int WaveNum, int WaveMax, Controller C )
{
}

simulated function PlayCloseTraderDialog( Controller C )
{
}

simulated function PlayObjectiveDialog( Controller C, int ObjDialogID )
{
}

simulated function PlaySelectItemDialog( Controller C, bool bTooExpensive, bool bTooHeavy )
{
}
