// Maze - Dealing with Devils (Imoen)

CHAIN
  IF WEIGHT #0 ~Name("Imoen2",LastTalkedToBy) Global("InToB","GLOBAL",%IN_TOB%) Global("offer","MYAREA",1)~ THEN ~a7#ddevl~ ImoenIntro
  @11000 /* Keep your weapons down, mortal, and hear me out. */
  == ~a7#ddevl~ IF ~OR(2) !Global("BodhiDead","GLOBAL",0) GlobalGT("chapter","GLOBAL",%bg2_chapter_7%)~ THEN
      @11050 /* You are powerful, <RACE>. I can sense the divine spark of your soul. */
  == ~a7#ddevl~ IF ~Global("BodhiDead","GLOBAL",0) GlobalLT("chapter","GLOBAL",%bg2_chapter_8%)~ THEN
      @11051 /* You are powerful, <RACE>. I can sense traces of divinity in your soul. Most interesting. */
  END
  IF ~Global("A7#DevilOffer","GLOBAL",0)~ DO ~SetGlobal("offer","MYAREA",2) IncrementGlobal("A7#DevilOffer","GLOBAL",1)~ + ImoenOffer.1
  IF ~Global("A7#DevilOffer","GLOBAL",1)~ DO ~SetGlobal("offer","MYAREA",2) IncrementGlobal("A7#DevilOffer","GLOBAL",1)~ + ImoenOffer.2
  IF ~GlobalGT("A7#DevilOffer","GLOBAL",1)~ DO ~SetGlobal("offer","MYAREA",2) IncrementGlobal("A7#DevilOffer","GLOBAL",1)~ + ImoenOffer.3


CHAIN ~a7#ddevl~ ImoenOffer.1
  @11002 /* Let me offer you a deal. Adventurers such as you are always seeking riches, isn't that so? For a tiny bit of your divine essence I will grant you a fortune of gold. You can certainly afford it. What do you say? */
  == ~%IMOEN_JOINED%~ @11052 /* Huh? An offer for me? Er... how much would be a fortune? */
  END
  + ~RandomNum(4,1)~ + @11055 /* I sure hope you know what kind of "deal" you're getting involved in. */ DO ~SetGlobal("OfferAgreed","MYAREA",0)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.1.Interested1
  + ~RandomNumGT(4,1)~ + @11055 /* I sure hope you know what kind of "deal" you're getting involved in. */ DO ~SetGlobal("OfferAgreed","MYAREA",1)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.1.Interested1
  + ~RandomNum(4,1)~ + @11056 /* Are you serious, Imoen? Whatever the offer will be, the price is just too high. */ DO ~SetGlobal("OfferAgreed","MYAREA",1)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.1.Interested2
  + ~RandomNumGT(4,1)~ + @11056 /* Are you serious, Imoen? Whatever the offer will be, the price is just too high. */ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined1


CHAIN ~a7#ddevl~ ImoenOffer.2
  @11008 /* Let me offer you a deal. For a small fraction of your divine essence I may grant you a powerful weapon. You can certainly afford it. What do you say? */
  == ~%IMOEN_JOINED%~ @11053 /* Huh? An offer for me? Er... what kind of weapon do you have in mind? */
  END
  + ~RandomNum(4,1)~ + @11055 /* I sure hope you know what kind of "deal" you're getting involved in. */ DO ~SetGlobal("OfferAgreed","MYAREA",0)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.2.Interested1
  + ~RandomNumGT(4,1)~ + @11055 /* I sure hope you know what kind of "deal" you're getting involved in. */ DO ~SetGlobal("OfferAgreed","MYAREA",1)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.2.Interested1
  + ~RandomNum(4,1)~ + @11056 /* Are you serious, Imoen? Whatever the offer will be, the price is just too high. */ DO ~SetGlobal("OfferAgreed","MYAREA",1)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.2.Interested2
  + ~RandomNumGT(4,1)~ + @11056 /* Are you serious, Imoen? Whatever the offer will be, the price is just too high. */ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined1


CHAIN ~a7#ddevl~ ImoenOffer.3
  @11057 /* Let me offer you a deal. For an insignificant portion of your divine essence I will grant you a boost to an attribute of your choice. You can certainly afford it. What do you say? */
  == ~%IMOEN_JOINED%~ @11054 /* Huh? An offer for me? Er... you mean I can become even more perfect? */
  END
  + ~RandomNum(4,1)~ + @11055 /* I sure hope you know what kind of "deal" you're getting involved in. */ DO ~SetGlobal("OfferAgreed","MYAREA",0)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.3.Interested1
  + ~RandomNumGT(4,1)~ + @11055 /* I sure hope you know what kind of "deal" you're getting involved in. */ DO ~SetGlobal("OfferAgreed","MYAREA",1)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.3.Interested1
  + ~RandomNum(4,1)~ + @11056 /* Are you serious, Imoen? Whatever the offer will be, the price is just too high. */ DO ~SetGlobal("OfferAgreed","MYAREA",1)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.3.Interested2
  + ~RandomNumGT(4,1)~ + @11056 /* Are you serious, Imoen? Whatever the offer will be, the price is just too high. */ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined1


APPEND ~%IMOEN_JOINED%~

  IF ~~ ImoenOffer.1.Interested1
    SAY @11058 /* Just out of curiosity, what exactly does your deal involve? */
    IF ~PartyGoldLT(5000)~ DO ~SetGlobal("GiveGold","MYAREA",10000) SetToken("A7_GOLD_AMOUNT",@11031)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.1.Continued1
    IF ~PartyGoldGT(4999) PartyGoldLT(20000)~ DO ~SetGlobal("GiveGold","MYAREA",25000) SetToken("A7_GOLD_AMOUNT",@11032)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.1.Continued1
    IF ~PartyGoldGT(19999)~ DO ~SetGlobal("GiveGold","MYAREA",50000) SetToken("A7_GOLD_AMOUNT",@11033)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.1.Continued1
  END

  IF ~~ ImoenOffer.1.Interested2
    SAY @11059 /* It doesn't hurt to know the offer, does it? So what's up with your deal? */
    IF ~PartyGoldLT(5000)~ DO ~SetGlobal("GiveGold","MYAREA",10000) SetToken("A7_GOLD_AMOUNT",@11031)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.1.Continued1
    IF ~PartyGoldGT(4999) PartyGoldLT(20000)~ DO ~SetGlobal("GiveGold","MYAREA",25000) SetToken("A7_GOLD_AMOUNT",@11032)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.1.Continued1
    IF ~PartyGoldGT(19999)~ DO ~SetGlobal("GiveGold","MYAREA",50000) SetToken("A7_GOLD_AMOUNT",@11033)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.1.Continued1
  END

  IF ~~ ImoenOffer.1.Accept
    SAY @11060 /* Hmm, that much gold for a tiny bit of my soul? I think I can handle it. Agreed! */
    IF ~~ EXTERN ~a7#ddevl~ ImoenOffer.1.Continued2
  END


  IF ~~ ImoenOffer.2.Interested1
    SAY @11058 /* Just out of curiosity, what exactly does your deal involve? */
    IF ~ClassLevelGT(LastTalkedToBy,WARRIOR,0) !ClassLevelGT(LastTalkedToBy,PRIEST,0) !Class(LastTalkedToBy,MONK)~ EXTERN ~a7#ddevl~ ImoenOffer.2.Warrior
    IF ~ClassLevelGT(LastTalkedToBy,WIZARD,0) !ClassLevelGT(LastTalkedToBy,PRIEST,0) !ClassLevelGT(LastTalkedToBy,WARRIOR,0)~ EXTERN ~a7#ddevl~ ImoenOffer.2.Wizard
    IF ~ClassLevelGT(LastTalkedToBy,PRIEST,0)~ EXTERN ~a7#ddevl~ ImoenOffer.2.Priest
    IF ~Class(LastTalkedToBy,MONK)~ EXTERN ~a7#ddevl~ ImoenOffer.2.Monk
    IF ~!ClassLevelGT(LastTalkedToBy,WARRIOR,0) !ClassLevelGT(LastTalkedToBy,PRIEST,0) !ClassLevelGT(LastTalkedToBy,WIZARD,0) !Class(LastTalkedToBy,MONK)~ EXTERN ~a7#ddevl~ ImoenOffer.2.Rogue
  END

  IF ~~ ImoenOffer.2.Interested2
    SAY @11059 /* It doesn't hurt to know the offer, does it? So what's up with your deal? */
    IF ~ClassLevelGT(LastTalkedToBy,WARRIOR,0) !ClassLevelGT(LastTalkedToBy,PRIEST,0) !Class(LastTalkedToBy,MONK)~ EXTERN ~a7#ddevl~ ImoenOffer.2.Warrior
    IF ~ClassLevelGT(LastTalkedToBy,WIZARD,0) !ClassLevelGT(LastTalkedToBy,PRIEST,0) !ClassLevelGT(LastTalkedToBy,WARRIOR,0)~ EXTERN ~a7#ddevl~ ImoenOffer.2.Wizard
    IF ~ClassLevelGT(LastTalkedToBy,PRIEST,0)~ EXTERN ~a7#ddevl~ ImoenOffer.2.Priest
    IF ~Class(LastTalkedToBy,MONK)~ EXTERN ~a7#ddevl~ ImoenOffer.2.Monk
    IF ~!ClassLevelGT(LastTalkedToBy,WARRIOR,0) !ClassLevelGT(LastTalkedToBy,PRIEST,0) !ClassLevelGT(LastTalkedToBy,WIZARD,0) !Class(LastTalkedToBy,MONK)~ EXTERN ~a7#ddevl~ ImoenOffer.2.Rogue
  END

  IF ~~ ImoenOffer.2.Accept
    SAY @11061 /* Hmm, such a powerful weapon for a tiny bit of my soul? I've made worse decisions in the past. It's a deal! */
    IF ~~ EXTERN ~a7#ddevl~ ImoenOffer.2.Continued2
  END


  IF ~~ ImoenOffer.3.Interested1
    SAY @11058 /* Just out of curiosity, what exactly does your deal involve? */
    IF ~~ EXTERN ~a7#ddevl~ ImoenOffer.3.Continued1
  END

  IF ~~ ImoenOffer.3.Interested2
    SAY @11059 /* It doesn't hurt to know the offer, does it? So what's up with your deal? */
    IF ~~ EXTERN ~a7#ddevl~ ImoenOffer.3.Continued1
  END


  IF ~~ ImoenOffer.3.STR
    SAY @11062 /* I could always use some more brawn. Increase my strength. */
    IF ~~ DO ~SetGlobal("StatBonus","MYAREA",1)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.3.Continued2
  END

  IF ~~ ImoenOffer.3.DEX
    SAY @11063 /* I always wanted to be more agile. Increase my dexterity. */
    IF ~~ DO ~SetGlobal("StatBonus","MYAREA",2)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.3.Continued2
  END

  IF ~~ ImoenOffer.3.CON
    SAY @11064 /* I guess it doesn't hurt to become more resilient. Increase my constitution. */
    IF ~~ DO ~SetGlobal("StatBonus","MYAREA",3)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.3.Continued2
  END

  IF ~~ ImoenOffer.3.INT
    SAY @11065 /* Actually, I prefer to outwit everyone. Increase my intelligence. */
    IF ~~ DO ~SetGlobal("StatBonus","MYAREA",4)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.3.Continued2
  END

  IF ~~ ImoenOffer.3.WIS
    SAY @11066 /* I really should think twice before I agree to deals from devils in the future. Increase my wisdom. */
    IF ~~ DO ~SetGlobal("StatBonus","MYAREA",5)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.3.Continued2
  END

  IF ~~ ImoenOffer.3.CHA
    SAY @11067 /* I could talk my way out of trouble more easily if I was more convincing. Increase my charisma. */
    IF ~~ DO ~SetGlobal("StatBonus","MYAREA",6)~ FLAGS 0x200 EXTERN ~a7#ddevl~ ImoenOffer.3.Continued2
  END


  IF ~~ ImoenOffer.Declined1
    SAY @11068 /* Guess you're right. I'm not interested! */
    IF ~~ EXTERN ~a7#ddevl~ ImoenOffer.DeclinedResponse
  END

  IF ~~ ImoenOffer.Declined2
    SAY @11069 /* Of course not! I won't fall for your tricks, fiend. */
    IF ~~ EXTERN ~a7#ddevl~ ImoenOffer.DeclinedResponse
  END

END // APPEND


APPEND ~a7#ddevl~

  IF ~~ ImoenOffer.1.Continued1
    SAY @11005 /* How does <A7_GOLD_AMOUNT> gold sound to you? In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
    IF ~!Global("OfferAgreed","MYAREA",0)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.1.Accept
    IF ~Global("OfferAgreed","MYAREA",0)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
  END

  IF ~~ ImoenOffer.1.Continued2
    SAY @11070 /* You won't be disappointed. */
    IF ~~ DO ~ClearAllActions() GiveObjectGoldGlobal("GiveGold","MYAREA",LastTalkedToBy) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02d",TRUE)~ EXIT
  END


  IF ~~ ImoenOffer.2.Warrior
    SAY @11009 /* You appear to be a fighter of no small skill, so I will offer you this powerful sword. It will cut your opponents sharper than any scream. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
    IF ~!Global("OfferAgreed","MYAREA",0)~ DO ~SetGlobal("WeaponType","LOCALS",1)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.2.Accept
    IF ~Global("OfferAgreed","MYAREA",0)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
  END

  IF ~~ ImoenOffer.2.Wizard
    SAY @11010 /* You appear to be skilled in the arts, so I will offer you this quarterstaff. It has the power to turn everything around you to ashes. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
    IF ~!Global("OfferAgreed","MYAREA",0)~ DO ~SetGlobal("WeaponType","LOCALS",2)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.2.Accept
    IF ~Global("OfferAgreed","MYAREA",0)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
  END

  IF ~~ ImoenOffer.2.Priest
    SAY @11011 /* You appear to follow a spiritual path, so I will offer you this enchanted club. May its enchantments bring peace of mind to your opponents. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
    IF ~!Global("OfferAgreed","MYAREA",0)~ DO ~SetGlobal("WeaponType","LOCALS",3)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.2.Accept
    IF ~Global("OfferAgreed","MYAREA",0)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
  END

  IF ~~ ImoenOffer.2.Monk
    SAY @11012 /* You seem to have mastered both mind and body, so I will offer you these gauntlets. They are most useful for a master of unarmed combat. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
    IF ~!Global("OfferAgreed","MYAREA",0)~ DO ~SetGlobal("WeaponType","LOCALS",4)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.2.Accept
    IF ~Global("OfferAgreed","MYAREA",0)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
  END

  IF ~~ ImoenOffer.2.Rogue
    SAY @11071 /* You appear to be a skilled adventurer, so I will offer you this deadly dagger. It contains most powerful magic to drain the very soul of your opponent. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
    IF ~!Global("OfferAgreed","MYAREA",0)~ DO ~SetGlobal("WeaponType","LOCALS",0)~ FLAGS 0x200 EXTERN ~%IMOEN_JOINED%~ ImoenOffer.2.Accept
    IF ~Global("OfferAgreed","MYAREA",0)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
  END

  IF ~~ ImoenOffer.2.Continued2
    SAY @11070 /* You won't be disappointed. */
    IF ~Global("WeaponType","LOCALS",1)~ DO ~ClearAllActions() GiveItemCreate("bdsw1h02",LastTalkedToBy,0,0,0) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02e",TRUE)~ EXIT
    IF ~Global("WeaponType","LOCALS",2)~ DO ~ClearAllActions() GiveItemCreate("bdstaf03",LastTalkedToBy,0,2,0) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02e",TRUE)~ EXIT
    IF ~Global("WeaponType","LOCALS",3)~ DO ~ClearAllActions() GiveItemCreate("a7#blun1",LastTalkedToBy,0,0,0) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02e",TRUE)~ EXIT
    IF ~Global("WeaponType","LOCALS",4)~ DO ~ClearAllActions() GiveItemCreate("brac19",LastTalkedToBy,0,0,0) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02e",TRUE)~ EXIT
    IF ~OR(2) GlobalLT("WeaponType","LOCALS",1) GlobalGT("WeaponType","LOCALS",4)~ DO ~ClearAllActions() GiveItemCreate("dagg20",LastTalkedToBy,0,0,0) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02e",TRUE)~ EXIT
  END


  IF ~~ ImoenOffer.3.Continued1
    SAY @11015 /* I have the power to increase your strength, dexterity, constitution, intelligence, wisdom or charisma. In addition I will grant you free passage through this part of the maze. None of my subordinates will bother you while you are here. Do we have a deal? */
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatLT(LastTalkedToBy,25,STR) RandomNum(10,1)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.3.STR
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatGT(LastTalkedToBy,24,STR) RandomNum(10,1)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatLT(LastTalkedToBy,25,DEX) OR(2) RandomNum(10,2) RandomNum(10,3)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.3.DEX
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatGT(LastTalkedToBy,24,DEX) OR(2) RandomNum(10,2) RandomNum(10,3)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatLT(LastTalkedToBy,25,CON) RandomNum(10,4)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.3.CON
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatGT(LastTalkedToBy,24,CON) RandomNum(10,4)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatLT(LastTalkedToBy,25,INT) OR(3) RandomNum(10,5) RandomNum(10,6) RandomNum(10,7)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.3.INT
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatGT(LastTalkedToBy,24,INT) OR(3) RandomNum(10,5) RandomNum(10,6) RandomNum(10,7)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatLT(LastTalkedToBy,25,WIS) RandomNum(10,8)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.3.WIS
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatGT(LastTalkedToBy,24,WIS) RandomNum(10,8)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatLT(LastTalkedToBy,25,CHR) OR(2) RandomNum(10,9) RandomNum(10,10)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.3.CHA
    IF ~!Global("OfferAgreed","MYAREA",0) CheckStatGT(LastTalkedToBy,24,CHR) OR(2) RandomNum(10,9) RandomNum(10,10)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
    IF ~Global("OfferAgreed","MYAREA",0)~ EXTERN ~%IMOEN_JOINED%~ ImoenOffer.Declined2
  END

  IF ~~ ImoenOffer.3.Continued2
    SAY @11070 /* You won't be disappointed. */
    IF ~Global("StatBonus","MYAREA",1)~ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_STR_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02f",TRUE)~ EXIT
    IF ~Global("StatBonus","MYAREA",2)~ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_DEX_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02f",TRUE)~ EXIT
    IF ~Global("StatBonus","MYAREA",3)~ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_CON_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02f",TRUE)~ EXIT
    IF ~Global("StatBonus","MYAREA",4)~ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_INT_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02f",TRUE)~ EXIT
    IF ~Global("StatBonus","MYAREA",5)~ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_WIS_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02f",TRUE)~ EXIT
    IF ~OR(2) GlobalLT("StatBonus","MYAREA",1) GlobalGT("StatBonus","MYAREA",5)~ DO ~ClearAllActions() ReallyForceSpell(LastTalkedToBy,GAIN_ONE_CHA_PERMANENT) SetGlobal("DevilNeutral","MYAREA",1) SetGlobalTimer("AmbushTimer","MYAREA",3600000) StartCutSceneMode() StartCutSceneEx("a7#ct02f",TRUE)~ EXIT
  END


  IF ~~ ImoenOffer.DeclinedResponse
    SAY @11029 /* That is unfortunate. Then I have no choice but to take your soul by force. */
    IF ~~ DO ~Enemy()~ EXIT
  END

END // APPEND
