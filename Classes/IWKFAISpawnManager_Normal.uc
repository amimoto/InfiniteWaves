//=============================================================================
// IWKFAISpawnManager_Normal
//=============================================================================
// The IWKFAISpawnManager for a normal length game
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
// Modified 2017 by Aki Mimoto
//=============================================================================

class IWKFAISpawnManager_Normal extends IWKFAISpawnManager;

DefaultProperties
{

    EarlyWaveIndex=4

    // ---------------------------------------------
    // Wave settings
    // Normal
    DifficultyWaveSettings(0)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave1_Med_Norm',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave2_Med_Norm',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave3_Med_Norm',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave4_Med_Norm',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave5_Med_Norm',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave6_Med_Norm',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave7_Med_Norm',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Boss_Med_Norm')}

    // Hard
    DifficultyWaveSettings(1)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave1_Med_Hard',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave2_Med_Hard',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave3_Med_Hard',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave4_Med_Hard',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave5_Med_Hard',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave6_Med_Hard',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave7_Med_Hard',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Boss_Med_Hard')}

    // Suicidal
    DifficultyWaveSettings(2)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave1_Med_SUI',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave2_Med_SUI',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave3_Med_SUI',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave4_Med_SUI',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave5_Med_SUI',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave6_Med_SUI',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave7_Med_SUI',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Boss_Med_SUI')}

    // Hell On Earth
    DifficultyWaveSettings(3)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave1_Med_HOE',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave2_Med_HOE',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave3_Med_HOE',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave4_Med_HOE',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave5_Med_HOE',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave6_Med_HOE',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave7_Med_HOE',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Boss_Med_HOE')}

    // ---------------------------------------------
    // Solo Spawn Rates
    // Normal
    SoloWaveSpawnRateModifier(0)={(RateModifier[0]=1.65,     // Wave 1
                                   RateModifier[1]=1.65,     // Wave 2
                                   RateModifier[2]=1.65,     // Wave 3
                                   RateModifier[3]=1.65,     // Wave 4
                                   RateModifier[4]=1.65,     // Wave 5
                                   RateModifier[5]=1.65,     // Wave 6
                                   RateModifier[6]=1.65)}    // Wave 7

    // Hard
    SoloWaveSpawnRateModifier(1)={(RateModifier[0]=1.8,     // Wave 1
                                   RateModifier[1]=1.8,     // Wave 2
                                   RateModifier[2]=1.8,     // Wave 3
                                   RateModifier[3]=1.8,     // Wave 4
                                   RateModifier[4]=1.8,     // Wave 5
                                   RateModifier[5]=1.8,     // Wave 6
                                   RateModifier[6]=1.8)}    // Wave 7

    // Suicidal
    SoloWaveSpawnRateModifier(2)={(RateModifier[0]=1.8,     // Wave 1
                                   RateModifier[1]=1.8,     // Wave 2
                                   RateModifier[2]=1.8,     // Wave 3
                                   RateModifier[3]=1.8,     // Wave 4
                                   RateModifier[4]=1.8,     // Wave 5
                                   RateModifier[5]=1.8,     // Wave 6
                                   RateModifier[6]=1.8)}    // Wave 7

    // Hell On Earth
    SoloWaveSpawnRateModifier(3)={(RateModifier[0]=1.4,     // Wave 1
                                   RateModifier[1]=1.4,     // Wave 2
                                   RateModifier[2]=1.4,     // Wave 3
                                   RateModifier[3]=1.4,     // Wave 4
                                   RateModifier[4]=1.4,     // Wave 5
                                   RateModifier[5]=1.4,     // Wave 6
                                   RateModifier[6]=1.4)}    // Wave 7
}

