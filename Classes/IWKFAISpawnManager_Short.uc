//=============================================================================
// KFAISpawnManager_Short
//=============================================================================
// The KFAISpawnManager for a short length game
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
// Portions Copyright (C) 2017
// - Aki Mimoto
//=============================================================================

class IWKFAISpawnManager_Short extends IWKFAISpawnManager;

DefaultProperties
{
    EarlyWaveIndex=5

    // ---------------------------------------------
    // Wave settings
    // Normal
    DifficultyWaveSettings(0)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave1_Long_Norm',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave2_Long_Norm',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave3_Long_Norm',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave4_Long_Norm',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave5_Long_Norm',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave6_Long_Norm',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave7_Long_Norm',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave8_Long_Norm',
                                Waves[8]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave9_Long_Norm',
                                Waves[9]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Wave10_Long_Norm',
                                Waves[10]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Norm.ZED_Boss_Long_Norm')}

    // Hard
    DifficultyWaveSettings(1)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave1_Long_Hard',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave2_Long_Hard',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave3_Long_Hard',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave4_Long_Hard',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave5_Long_Hard',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave6_Long_Hard',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave7_Long_Hard',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave8_Long_Hard',
                                Waves[8]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave9_Long_Hard',
                                Waves[9]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Wave10_Long_Hard',
                                Waves[10]=KFAIWaveInfo'GP_Spawning_ARCH.Long.Hard.ZED_Boss_Long_Hard')}

    // Suicidal
    DifficultyWaveSettings(2)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave1_Long_Sui',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave2_Long_Sui',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave3_Long_Sui',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave4_Long_Sui',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave5_Long_Sui',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave6_Long_Sui',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave7_Long_Sui',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave8_Long_Sui',
                                Waves[8]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave9_Long_Sui',
                                Waves[9]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Wave10_Long_Sui',
                                Waves[10]=KFAIWaveInfo'GP_Spawning_ARCH.Long.SUI.ZED_Boss_Long_Sui')}

    // Hell On Earth
    DifficultyWaveSettings(3)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave1_Long_HOE',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave2_Long_HOE',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave3_Long_HOE',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave4_Long_HOE',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave5_Long_HOE',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave6_Long_HOE',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave7_Long_HOE',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave8_Long_HOE',
                                Waves[8]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave9_Long_HOE',
                                Waves[9]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Wave10_Long_HOE',
                                Waves[10]=KFAIWaveInfo'GP_Spawning_ARCH.Long.HOE.ZED_Boss_Long_HOE')}

    // Normal
    SoloWaveSpawnRateModifier(0)={(RateModifier[0]=1.65,     // Wave 1
                                   RateModifier[1]=1.65,     // Wave 2
                                   RateModifier[2]=1.65,     // Wave 3
                                   RateModifier[3]=1.65,     // Wave 4
                                   RateModifier[4]=1.65,     // Wave 5
                                   RateModifier[5]=1.65,     // Wave 6
                                   RateModifier[6]=1.65,     // Wave 7
                                   RateModifier[7]=1.65,     // Wave 8
                                   RateModifier[8]=1.65,     // Wave 9
                                   RateModifier[9]=1.65)}    // Wave 10


    // Hard
    SoloWaveSpawnRateModifier(1)={(RateModifier[0]=1.8,     // Wave 1
                                   RateModifier[1]=1.8,     // Wave 2
                                   RateModifier[2]=1.8,     // Wave 3
                                   RateModifier[3]=1.8,     // Wave 4
                                   RateModifier[4]=1.8,     // Wave 5
                                   RateModifier[5]=1.8,     // Wave 6
                                   RateModifier[6]=1.8,     // Wave 7
                                   RateModifier[7]=1.8,     // Wave 8
                                   RateModifier[8]=1.8,     // Wave 9
                                   RateModifier[9]=1.8)}    // Wave 10

    // Suicidal
    SoloWaveSpawnRateModifier(2)={(RateModifier[0]=1.8,     // Wave 1
                                   RateModifier[1]=1.8,     // Wave 2
                                   RateModifier[2]=1.8,     // Wave 3
                                   RateModifier[3]=1.8,     // Wave 4
                                   RateModifier[4]=1.8,     // Wave 5
                                   RateModifier[5]=1.8,     // Wave 6
                                   RateModifier[6]=1.8,     // Wave 7
                                   RateModifier[7]=1.8,     // Wave 8
                                   RateModifier[8]=1.8,     // Wave 9
                                   RateModifier[9]=1.8)}    // Wave 10

    // Hell On Earth
    SoloWaveSpawnRateModifier(3)={(RateModifier[0]=1.4,     // Wave 1
                                   RateModifier[1]=1.4,     // Wave 2
                                   RateModifier[2]=1.4,     // Wave 3
                                   RateModifier[3]=1.4,     // Wave 4
                                   RateModifier[4]=1.4,     // Wave 5
                                   RateModifier[5]=1.4,     // Wave 6
                                   RateModifier[6]=1.4,     // Wave 7
                                   RateModifier[7]=1.4,     // Wave 8
                                   RateModifier[8]=1.4,     // Wave 9
                                   RateModifier[9]=1.4)}    // Wave 10

}


