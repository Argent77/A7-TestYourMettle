// Maze - Dealing with Devils (Charname)

BEGIN ~a7#ddevl~

IF ~InPartySlot(LastTalkedToBy,0) Global("offer","MYAREA",1)~ Intro
  SAY @11000 /* Keep your weapons down, mortal, and hear me out. */
  IF ~OR(2) GlobalLT("chapter","GLOBAL",%bg2_chapter_4%) GlobalGT("chapter","GLOBAL",%bg2_chapter_7%)~ + Intro.1
  IF ~GlobalGT("chapter","GLOBAL",%bg2_chapter_3%) GlobalLT("chapter","GLOBAL",%bg2_chapter_8%)~ + Intro.2
END

IF ~~ Intro.1
  SAY @11050 /* You are powerful, <RACE>. I can sense the divine spark of your soul. */
  IF ~Global("A7#DevilOffer","GLOBAL",0)~ DO ~SetGlobal("offer","MYAREA",2) IncrementGlobal("A7#DevilOffer","GLOBAL",1)~ + Offer.1
  IF ~Global("A7#DevilOffer","GLOBAL",1)~ DO ~SetGlobal("offer","MYAREA",2) IncrementGlobal("A7#DevilOffer","GLOBAL",1)~ + Offer.2
  IF ~GlobalGT("A7#DevilOffer","GLOBAL",1)~ DO ~SetGlobal("offer","MYAREA",2) IncrementGlobal("A7#DevilOffer","GLOBAL",1)~ + Offer.3
END

IF ~~ Intro.2
  SAY @11051 /* You are powerful, <RACE>. I can sense traces of divinity in your soul. Most interesting. */
  IF ~Global("A7#DevilOffer","GLOBAL",0)~ DO ~SetGlobal("offer","MYAREA",2) IncrementGlobal("A7#DevilOffer","GLOBAL",1)~ + Offer.1
  IF ~Global("A7#DevilOffer","GLOBAL",1)~ DO ~SetGlobal("offer","MYAREA",2) IncrementGlobal("A7#DevilOffer","GLOBAL",1)~ + Offer.2
  IF ~GlobalGT("A7#DevilOffer","GLOBAL",1)~ DO ~SetGlobal("offer","MYAREA",2) IncrementGlobal("A7#DevilOffer","GLOBAL",1)~ + Offer.3
END

IF ~~ Offer.1
  SAY @11002 /* Let me offer you a deal. Adventurers such as you are always seeking riches, isn't that so? For a tiny bit of your divine essence I will grant you a fortune of gold. You can certainly afford it. What do you say? */
  + ~PartyGoldLT(5000)~ + @11003 /* Your offer is tempting. What exactly do you have in mind? */ DO ~SetGlobal("GiveGold","MYAREA",10000) SetToken("A7_GOLD_AMOUNT",@11031)~ FLAGS 0x200 + Offer.1a
  + ~PartyGoldGT(4999) PartyGoldLT(20000)~ + @11003 /* Your offer is tempting. What exactly do you have in mind? */ DO ~SetGlobal("GiveGold","MYAREA",25000) SetToken("A7_GOLD_AMOUNT",@11032)~ FLAGS 0x200 + Offer.1a
  + ~PartyGoldGT(19999)~ + @11003 /* Your offer is tempting. What exactly do you have in mind? */ DO ~SetGlobal("GiveGold","MYAREA",50000) SetToken("A7_GOLD_AMOUNT",@11033)~ FLAGS 0x200 + Offer.1a
  ++ @11004 /* No way! I don't make deals with devils. */ + Offer.Denied
END

IF ~~ Offer.1a
  SAY @11005 /* How does <A7_GOLD_AMOUNT> gold sound to you? In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
  ++ @11006 /* Sounds good to me. I accept. */ DO ~ClearAllActions() GiveObjectGoldGlobal("GiveGold","MYAREA",Player1) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02a",TRUE)~ EXIT
  ++ @11007 /* No, I don't think so. */ + Offer.Denied
END


IF ~~ Offer.2
  SAY @11008 /* Let me offer you a deal. For a small fraction of your divine essence I may grant you a powerful weapon. You can certainly afford it. What do you say? */
  + ~ClassLevelGT(LastTalkedToBy,WARRIOR,0) !ClassLevelGT(LastTalkedToBy,PRIEST,0) !Class(LastTalkedToBy,MONK)~ + @11003 /* Your offer is tempting. What exactly do you have in mind? */ + Offer.2a
  + ~ClassLevelGT(LastTalkedToBy,WIZARD,0) !ClassLevelGT(LastTalkedToBy,PRIEST,0) !ClassLevelGT(LastTalkedToBy,WARRIOR,0)~ + @11003 /* Your offer is tempting. What exactly do you have in mind? */ + Offer.2b
  + ~ClassLevelGT(LastTalkedToBy,PRIEST,0)~ + @11003 /* Your offer is tempting. What exactly do you have in mind? */ + Offer.2c
  + ~Class(LastTalkedToBy,MONK)~ + @11003 /* Your offer is tempting. What exactly do you have in mind? */ + Offer.2d
  + ~!ClassLevelGT(LastTalkedToBy,WARRIOR,0) !ClassLevelGT(LastTalkedToBy,PRIEST,0) !ClassLevelGT(LastTalkedToBy,WIZARD,0) !Class(LastTalkedToBy,MONK)~ + @11003 /* Your offer is tempting. What exactly do you have in mind? */ + Offer.2e
  ++ @11004 /* No way! I don't make deals with devils. */ + Offer.Denied
END

IF ~~ Offer.2a
  SAY @11009 /* You appear to be a fighter of no small skill, so I will offer you this powerful sword. It will cut your opponents sharper than any scream. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
  ++ @11006 /* Sounds good to me. I accept. */ DO ~ClearAllActions() GiveItemCreate("bdsw1h02",LastTalkedToBy,0,0,0) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02b",TRUE)~ EXIT
  ++ @11007 /* No, I don't think so. */ + Offer.Denied
END

IF ~~ Offer.2b
  SAY @11010 /* You appear to be skilled in the arts, so I will offer you this quarterstaff. It has the power to turn everything around you to ashes. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
  ++ @11006 /* Sounds good to me. I accept. */ DO ~ClearAllActions() GiveItemCreate("bdstaf03",LastTalkedToBy,0,2,0) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02b",TRUE)~ EXIT
  ++ @11007 /* No, I don't think so. */ + Offer.Denied
END

IF ~~ Offer.2c
  SAY @11011 /* You appear to follow a spiritual path, so I will offer you this enchanted club. May its enchantments bring peace of mind to your opponents. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
  ++ @11006 /* Sounds good to me. I accept. */ DO ~ClearAllActions() GiveItemCreate("a7#blun1",LastTalkedToBy,0,0,0) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02b",TRUE)~ EXIT
  ++ @11007 /* No, I don't think so. */ + Offer.Denied
END

IF ~~ Offer.2d
  SAY @11012 /* You seem to have mastered both mind and body, so I will offer you these gauntlets. They are most useful for a master of unarmed combat. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
  ++ @11006 /* Sounds good to me. I accept. */ DO ~ClearAllActions() GiveItemCreate("brac19",LastTalkedToBy,0,0,0) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02b",TRUE)~ EXIT
  ++ @11007 /* No, I don't think so. */ + Offer.Denied
END

IF ~~ Offer.2e
  SAY @11013 /* You appear to be a skilled <PRO_CLASS>, so I will offer you this deadly dagger. It contains most powerful magic to drain the very soul of your opponent. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
  ++ @11006 /* Sounds good to me. I accept. */ DO ~ClearAllActions() GiveItemCreate("dagg20",LastTalkedToBy,0,0,0) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02b",TRUE)~ EXIT
  ++ @11007 /* No, I don't think so. */ + Offer.Denied
END


IF ~~ Offer.3
  SAY @11014 /* Let me offer you a deal. For an insignificant portion of your divine essence I will grant you a boost to an attribute of your choice. It will surely come in handy on your path to godhood. You can certainly afford it. What do you say? */
  ++ @11003 /* Your offer is tempting. What exactly do you have in mind? */ + Offer.3a
  ++ @11004 /* No way! I don't make deals with devils. */ + Offer.Denied
END

IF ~~ Offer.3a
  SAY @11015 /* I have the power to increase your strength, dexterity, constitution, intelligence, wisdom or charisma. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
  + ~CheckStatLT(LastTalkedToBy,25,STR)~ + @11017 /* Yes, we have. Please increase my strength. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_STR_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,STR)~ + @11017 /* Yes, we have. Please increase my strength. */ + Offer.3b
  + ~CheckStatLT(LastTalkedToBy,25,DEX)~ + @11018 /* Yes, we have. Please increase my dexterity. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_DEX_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,DEX)~ + @11018 /* Yes, we have. Please increase my dexterity. */ + Offer.3b
  + ~CheckStatLT(LastTalkedToBy,25,CON)~ + @11019 /* Yes, we have. Please increase my constitution. */DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_CON_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,CON)~ + @11019 /* Yes, we have. Please increase my constitution. */ + Offer.3b
  + ~CheckStatLT(LastTalkedToBy,25,INT)~ + @11020 /* Yes, we have. Please increase my intelligence. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_INT_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,INT)~ + @11020 /* Yes, we have. Please increase my intelligence. */ + Offer.3b
  + ~CheckStatLT(LastTalkedToBy,25,WIS)~ + @11021 /* Yes, we have. Please increase my wisdom. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_WIS_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,WIS)~ + @11021 /* Yes, we have. Please increase my wisdom. */ + Offer.3b
  + ~CheckStatLT(LastTalkedToBy,25,CHR)~ + @11022 /* Yes, we have. Please increase my charisma. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_CHA_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,CHR)~ + @11022 /* Yes, we have. Please increase my charisma. */ + Offer.3b
  ++ @11007 /* No, I don't think so. */ + Offer.Denied
END

IF ~~ Offer.3b
  SAY @11016 /* Your chosen attribute appears to be of godlike proportions already. I cannot increase it further. Anything else? */
  + ~CheckStatLT(LastTalkedToBy,25,STR)~ + @11023 /* Yes. Please increase my strength. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_STR_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,STR)~ + @11023 /* Yes. Please increase my strength. */ + Offer.3b
  + ~CheckStatLT(LastTalkedToBy,25,DEX)~ + @11024 /* Yes. Please increase my dexterity. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_DEX_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,DEX)~ + @11024 /* Yes. Please increase my dexterity. */ + Offer.3b
  + ~CheckStatLT(LastTalkedToBy,25,CON)~ + @11025 /* Yes. Please increase my constitution. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_CON_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,CON)~ + @11025 /* Yes. Please increase my constitution. */ + Offer.3b
  + ~CheckStatLT(LastTalkedToBy,25,INT)~ + @11026 /* Yes. Please increase my intelligence. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_INT_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,INT)~ + @11026 /* Yes. Please increase my intelligence. */ + Offer.3b
  + ~CheckStatLT(LastTalkedToBy,25,WIS)~ + @11027 /* Yes. Please increase my wisdom. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_WIS_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,WIS)~ + @11027 /* Yes. Please increase my wisdom. */ + Offer.3b
  + ~CheckStatLT(LastTalkedToBy,25,CHR)~ + @11028 /* Yes. Please increase my charisma. */ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_CHA_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02c",TRUE)~ EXIT
  + ~CheckStatGT(LastTalkedToBy,24,CHR)~ + @11028 /* Yes. Please increase my charisma. */ + Offer.3b
  ++ @11007 /* No, I don't think so. */ + Offer.Denied
END


IF ~~ Offer.Denied
  SAY @11029 /* That is unfortunate. Then I have no choice but to take your soul by force. */
  IF ~~ DO ~Enemy()~ EXIT
END


IF ~True()~ Default
  SAY @11030 /* Leave me be, mortal! I have nothing more to say. */
  IF ~~ EXIT
END
