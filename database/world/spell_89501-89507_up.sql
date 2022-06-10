DELETE FROM `spell_dbc` WHERE `ID` IN (89501,89502,89503,89504,89505,89506, 89507);

INSERT INTO `spell_dbc` (`ID`,`Category`,`DispelType`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`AttributesEx7`,`ShapeshiftMask`,`unk_320_2`,`ShapeshiftExclude`,`unk_320_3`,`Targets`,`TargetCreatureType`,`RequiresSpellFocus`,`FacingCasterFlags`,`CasterAuraState`,`TargetAuraState`,`ExcludeCasterAuraState`,`ExcludeTargetAuraState`,`CasterAuraSpell`,`TargetAuraSpell`,`ExcludeCasterAuraSpell`,`ExcludeTargetAuraSpell`,`CastingTimeIndex`,`RecoveryTime`,`CategoryRecoveryTime`,`InterruptFlags`,`AuraInterruptFlags`,`ChannelInterruptFlags`,`ProcTypeMask`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`PowerType`,`ManaCost`,`ManaCostPerLevel`,`ManaPerSecond`,`ManaPerSecondPerLevel`,`RangeIndex`,`Speed`,`ModalNextSpell`,`CumulativeAura`,`Totem_1`,`Totem_2`,`Reagent_1`,`Reagent_2`,`Reagent_3`,`Reagent_4`,`Reagent_5`,`Reagent_6`,`Reagent_7`,`Reagent_8`,`ReagentCount_1`,`ReagentCount_2`,`ReagentCount_3`,`ReagentCount_4`,`ReagentCount_5`,`ReagentCount_6`,`ReagentCount_7`,`ReagentCount_8`,`EquippedItemClass`,`EquippedItemSubclass`,`EquippedItemInvTypes`,`Effect_1`,`Effect_2`,`Effect_3`,`EffectDieSides_1`,`EffectDieSides_2`,`EffectDieSides_3`,`EffectRealPointsPerLevel_1`,`EffectRealPointsPerLevel_2`,`EffectRealPointsPerLevel_3`,`EffectBasePoints_1`,`EffectBasePoints_2`,`EffectBasePoints_3`,`EffectMechanic_1`,`EffectMechanic_2`,`EffectMechanic_3`,`ImplicitTargetA_1`,`ImplicitTargetA_2`,`ImplicitTargetA_3`,`ImplicitTargetB_1`,`ImplicitTargetB_2`,`ImplicitTargetB_3`,`EffectRadiusIndex_1`,`EffectRadiusIndex_2`,`EffectRadiusIndex_3`,`EffectAura_1`,`EffectAura_2`,`EffectAura_3`,`EffectAuraPeriod_1`,`EffectAuraPeriod_2`,`EffectAuraPeriod_3`,`EffectMultipleValue_1`,`EffectMultipleValue_2`,`EffectMultipleValue_3`,`EffectChainTargets_1`,`EffectChainTargets_2`,`EffectChainTargets_3`,`EffectItemType_1`,`EffectItemType_2`,`EffectItemType_3`,`EffectMiscValue_1`,`EffectMiscValue_2`,`EffectMiscValue_3`,`EffectMiscValueB_1`,`EffectMiscValueB_2`,`EffectMiscValueB_3`,`EffectTriggerSpell_1`,`EffectTriggerSpell_2`,`EffectTriggerSpell_3`,`EffectPointsPerCombo_1`,`EffectPointsPerCombo_2`,`EffectPointsPerCombo_3`,`EffectSpellClassMaskA_1`,`EffectSpellClassMaskA_2`,`EffectSpellClassMaskA_3`,`EffectSpellClassMaskB_1`,`EffectSpellClassMaskB_2`,`EffectSpellClassMaskB_3`,`EffectSpellClassMaskC_1`,`EffectSpellClassMaskC_2`,`EffectSpellClassMaskC_3`,`SpellVisualID_1`,`SpellVisualID_2`,`SpellIconID`,`ActiveIconID`,`SpellPriority`,`Name_Lang_enUS`,`Name_Lang_enGB`,`Name_Lang_koKR`,`Name_Lang_frFR`,`Name_Lang_deDE`,`Name_Lang_enCN`,`Name_Lang_zhCN`,`Name_Lang_enTW`,`Name_Lang_zhTW`,`Name_Lang_esES`,`Name_Lang_esMX`,`Name_Lang_ruRU`,`Name_Lang_ptPT`,`Name_Lang_ptBR`,`Name_Lang_itIT`,`Name_Lang_Unk`,`Name_Lang_Mask`,`NameSubtext_Lang_enUS`,`NameSubtext_Lang_enGB`,`NameSubtext_Lang_koKR`,`NameSubtext_Lang_frFR`,`NameSubtext_Lang_deDE`,`NameSubtext_Lang_enCN`,`NameSubtext_Lang_zhCN`,`NameSubtext_Lang_enTW`,`NameSubtext_Lang_zhTW`,`NameSubtext_Lang_esES`,`NameSubtext_Lang_esMX`,`NameSubtext_Lang_ruRU`,`NameSubtext_Lang_ptPT`,`NameSubtext_Lang_ptBR`,`NameSubtext_Lang_itIT`,`NameSubtext_Lang_Unk`,`NameSubtext_Lang_Mask`,`Description_Lang_enUS`,`Description_Lang_enGB`,`Description_Lang_koKR`,`Description_Lang_frFR`,`Description_Lang_deDE`,`Description_Lang_enCN`,`Description_Lang_zhCN`,`Description_Lang_enTW`,`Description_Lang_zhTW`,`Description_Lang_esES`,`Description_Lang_esMX`,`Description_Lang_ruRU`,`Description_Lang_ptPT`,`Description_Lang_ptBR`,`Description_Lang_itIT`,`Description_Lang_Unk`,`Description_Lang_Mask`,`AuraDescription_Lang_enUS`,`AuraDescription_Lang_enGB`,`AuraDescription_Lang_koKR`,`AuraDescription_Lang_frFR`,`AuraDescription_Lang_deDE`,`AuraDescription_Lang_enCN`,`AuraDescription_Lang_zhCN`,`AuraDescription_Lang_enTW`,`AuraDescription_Lang_zhTW`,`AuraDescription_Lang_esES`,`AuraDescription_Lang_esMX`,`AuraDescription_Lang_ruRU`,`AuraDescription_Lang_ptPT`,`AuraDescription_Lang_ptBR`,`AuraDescription_Lang_itIT`,`AuraDescription_Lang_Unk`,`AuraDescription_Lang_Mask`,`ManaCostPct`,`StartRecoveryCategory`,`StartRecoveryTime`,`MaxTargetLevel`,`SpellClassSet`,`SpellClassMask_1`,`SpellClassMask_2`,`SpellClassMask_3`,`MaxTargets`,`DefenseType`,`PreventionType`,`StanceBarOrder`,`EffectChainAmplitude_1`,`EffectChainAmplitude_2`,`EffectChainAmplitude_3`,`MinFactionID`,`MinReputation`,`RequiredAuraVision`,`RequiredTotemCategoryID_1`,`RequiredTotemCategoryID_2`,`RequiredAreasID`,`SchoolMask`,`RuneCostID`,`SpellMissileID`,`PowerDisplayID`,`EffectBonusMultiplier_1`,`EffectBonusMultiplier_2`,`EffectBonusMultiplier_3`,`SpellDescriptionVariableID`,`SpellDifficultyID`) VALUES
(89501,0,0,0,128,268435456,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,101,0,0,0,1,21,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,6,0,3,1,0,1,0,0,0,19,0,29,0,0,0,1,0,0,0,0,0,0,0,0,133,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,207,0,50,'Increased Health','','','','','','','','',0,0,0,0,0,0,0,16712190,'','','','','','','','','',0,0,0,0,0,0,0,16712172,'','','','','','','','','',0,0,0,0,0,0,0,16712188,'$s1% increased health.','','','','','','','','',0,0,0,0,0,0,0,16712190,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0),
(89502,0,0,0,67108944,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,101,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,6,6,0,1,1,0,0,0,0,99,-51,0,0,0,0,1,1,0,0,0,0,0,0,0,87,79,0,0,0,0,0,0,0,0,0,0,0,0,0,127,127,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1761,0,0,'Hallucinatory Creature','','','','','','','','',0,0,0,0,0,0,0,16712190,'','','','','','','','','',0,0,0,0,0,0,0,16712190,'Damage taken increased by $s1%.\r\nDamage dealt reduced by $s2%.','','','','','','','','',0,0,0,0,0,0,0,16712190,'Damage taken increased by $s1%.\r\nDamage dealt reduced by $s2%.','','','','','','','','',0,0,0,0,0,0,0,16712190,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0),
(89503,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,101,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,6,6,6,1,1,1,0,0,0,7,7,7,0,0,0,1,1,0,0,0,0,0,0,0,137,166,167,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3783,0,0,'Shirt of Uber Aura','','','','','','','','',0,0,0,0,0,0,0,16712190,'','','','','','','','','',0,0,0,0,0,0,0,16712188,'Increases all statistics by 8% and all ratings by 130.','','','','','','','','',0,0,0,0,0,0,0,16712190,'','','','','','','','','',0,0,0,0,0,0,0,16712188,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0),
(89504,0,0,0,464,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,101,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,6,0,0,1,0,0,0,0,0,24,0,0,0,0,0,1,0,0,0,0,0,0,0,0,213,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1962,0,0,'Endless Rage','','','','','','','','',0,0,0,0,0,0,0,16712190,'','','','','','','','','',0,0,0,0,0,0,0,16712190,'You generate $s1% more rage from damage dealt.','','','','','','','','',0,0,0,0,0,0,0,16712190,'','','','','','','','','',0,0,0,0,0,0,0,16712190,0,0,0,0,4,1048576,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0),
(89505,0,0,0,746586496,136,0,1048576,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,21,0,0,0,0,0,1,0.0,0,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,6,0,0,0,0,0,0.0,0.0,0.0,-1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,108,0,0,0,0,0,-1.0,0.0,0.0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'ZoneDebuff SPELL_AURA_MOD_TARGET_ABSORB_SCHOOL pct',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0,0,0,0,0,0,127,0,0,0,0.0,0.0,0.0,0,0),
(85507,36,0,0,0,0,0,262144,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,101,0,0,0,0,0,0,0,0,0,0,37,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,6,0,0,1,0,0,0,0,0,99,0,0,0,0,0,6,0,0,0,0,0,0,0,0,87,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,876,0,130,0,0,'Increased Physical Damage Taken','','','','','','','','',0,0,0,0,0,0,0,16712190,'','','','','','','','','',0,0,0,0,0,0,0,16712190,'Increases the Physical damage taken by an enemy by $s1% for $d.','','','','','','','','',0,0,0,0,0,0,0,16712190,'Physical damage taken is increased by $s1%.','','','','','','','','',0,0,0,0,0,0,0,16712190,0,0,0,0,0,0,0,0,0,1,1,0,1,1,1,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0);

INSERT INTO `spell_dbc` (`ID`,`DispelType`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`AttributesEx7`,`ShapeshiftMask`,`ShapeshiftExclude`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcTypeMask`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`CumulativeAura`,`EquippedItemClass`,`EquippedItemSubclass`,`EquippedItemInvTypes`,`Effect_1`,`Effect_2`,`Effect_3`,`EffectDieSides_1`,`EffectDieSides_2`,`EffectDieSides_3`,`EffectRealPointsPerLevel_1`,`EffectRealPointsPerLevel_2`,`EffectRealPointsPerLevel_3`,`EffectBasePoints_1`,`EffectBasePoints_2`,`EffectBasePoints_3`,`EffectMechanic_1`,`EffectMechanic_2`,`EffectMechanic_3`,`ImplicitTargetA_1`,`ImplicitTargetA_2`,`ImplicitTargetA_3`,`ImplicitTargetB_1`,`ImplicitTargetB_2`,`ImplicitTargetB_3`,`EffectRadiusIndex_1`,`EffectRadiusIndex_2`,`EffectRadiusIndex_3`,`EffectAura_1`,`EffectAura_2`,`EffectAura_3`,`EffectAuraPeriod_1`,`EffectAuraPeriod_2`,`EffectAuraPeriod_3`,`EffectMultipleValue_1`,`EffectMultipleValue_2`,`EffectMultipleValue_3`,`EffectItemType_1`,`EffectItemType_2`,`EffectItemType_3`,`EffectMiscValue_1`,`EffectMiscValue_2`,`EffectMiscValue_3`,`EffectMiscValueB_1`,`EffectMiscValueB_2`,`EffectMiscValueB_3`,`EffectTriggerSpell_1`,`EffectTriggerSpell_2`,`EffectTriggerSpell_3`,`EffectSpellClassMaskA_1`,`EffectSpellClassMaskA_2`,`EffectSpellClassMaskA_3`,`EffectSpellClassMaskB_1`,`EffectSpellClassMaskB_2`,`EffectSpellClassMaskB_3`,`EffectSpellClassMaskC_1`,`EffectSpellClassMaskC_2`,`EffectSpellClassMaskC_3`,`MaxTargetLevel`,`SpellClassSet`,`SpellClassMask_1`,`SpellClassMask_2`,`SpellClassMask_3`,`MaxTargets`,`DefenseType`,`PreventionType`,`EffectChainAmplitude_1`,`EffectChainAmplitude_2`,`EffectChainAmplitude_3`,`RequiredAreasID`,`SchoolMask`,`Name_Lang_enUS`) VALUES
(89506,0,0,746586496,136,0,1048576,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,21,1,100,-1,0,0,6,0,0,0,0,0,0.0,0.0,0.0,-1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,118,0,0,0,0,0,-1.0,0.0,0.0,0,0,0,127,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0,127,'ZoneDebuff SPELL_AURA_MOD_HEALING_PCT pct');
