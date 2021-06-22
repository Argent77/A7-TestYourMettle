// Ancient Scholarly Notes

BEGIN ~a7#scrl2~

IF ~!PartyHasItemIdentified("a7#scrl2")~ Intro.Unknown
  SAY @10000 /* Strange symbols have been carefully penned onto the parchment. */
  + ~CheckStatGT(LastTalkedToBy,17,INT)~ + @10008 /* Examine the scroll more closely. */ + Intro.Unknown.Examine
  ++ @10009 /* Put the scroll away. */ EXIT
END

IF ~~ Intro.Unknown.Examine
  SAY @10001 /* This scroll is written in a language, that has been used by scholars of ancient Netheril. It contains complex formulae and charts, representing lost knowledge about time and space. */
  IF ~~ DO ~SetItemFlags("a7#scrl2",IDENTIFIED,TRUE)~ + Intro.Known.1
END

IF ~PartyHasItemIdentified("a7#scrl2")~ Intro.Known
  SAY @10002 /* This scroll is filled with complex formulae and charts, representing lost knowledge about time and space. */
  IF ~~ + Intro.Known.1
END

IF ~~ Intro.Known.1
  SAY @10003 /* One section appears to be written with a more practical application in mind. It describes how to create a gravitational field of considerable power for a limited period of time. An intelligent mage or wise priest may learn how to put this effect into an arcane formula. */
  + ~CheckStatLT(LastTalkedToBy,17,INT) OR(2) Class(LastTalkedToBy,MAGE_ALL) Class(LastTalkedToBy,BARD_ALL) !Class(LastTalkedToBy,SORCERER)~ + @10010 /* Turn this effect into a mage scroll. */ + Examine.Failed
  + ~OR(2) CheckStatLT(LastTalkedToBy,15,INT) LevelLT(LastTalkedToBy,16) Class(LastTalkedToBy,SORCERER)~ + @10010 /* Turn this effect into a mage scroll. */ + Examine.Failed
  + ~CheckStatLT(LastTalkedToBy,17,WIS) Class(LastTalkedToBy,CLERIC_ALL)~ + @10011 /* Memorize this effect as a priest spell. */ + Examine.Failed
  + ~CheckStatGT(LastTalkedToBy,16,INT) OR(2) Class(LastTalkedToBy,MAGE_ALL) Class(LastTalkedToBy,BARD_ALL) !Class(LastTalkedToBy,SORCERER)~ + @10010 /* Turn this effect into a mage scroll. */ + Scribe.Mage.Success
  + ~CheckStatGT(LastTalkedToBy,14,INT) LevelGT(LastTalkedToBy,15) Class(LastTalkedToBy,SORCERER) !HaveKnownSpellRES("a7#spw1")~ + @10013 /* Memorize this effect as a mage spell. */ + Learn.Sorcerer.Success
  + ~CheckStatGT(LastTalkedToBy,16,WIS) Class(LastTalkedToBy,CLERIC_ALL) !HaveKnownSpellRES("a7#spp1")~ + @10011 /* Memorize this effect as a priest spell. */ + Learn.Cleric.Success
  ++ @10009 /* Put the scroll away. */ EXIT
END

IF ~~ Intro.Known.2
  SAY @10004 /* This scroll describes how to create a gravitational field of considerable power for a limited period of time. An intelligent mage or wise priest may learn how to put this effect into an arcane formula. */
  + ~CheckStatLT(LastTalkedToBy,17,INT) OR(2) Class(LastTalkedToBy,MAGE_ALL) Class(LastTalkedToBy,BARD_ALL) !Class(LastTalkedToBy,SORCERER)~ + @10010 /* Turn this effect into a mage scroll. */ + Examine.Failed
  + ~OR(2) CheckStatLT(LastTalkedToBy,15,INT) LevelLT(LastTalkedToBy,16) Class(LastTalkedToBy,SORCERER)~ + @10010 /* Turn this effect into a mage scroll. */ + Examine.Failed
  + ~CheckStatLT(LastTalkedToBy,17,WIS) Class(LastTalkedToBy,CLERIC_ALL)~ + @10011 /* Memorize this effect as a priest spell. */ + Examine.Failed
  + ~CheckStatGT(LastTalkedToBy,16,INT) OR(2) Class(LastTalkedToBy,MAGE_ALL) Class(LastTalkedToBy,BARD_ALL) !Class(LastTalkedToBy,SORCERER)~ + @10010 /* Turn this effect into a mage scroll. */ + Scribe.Mage.Success
  + ~CheckStatGT(LastTalkedToBy,14,INT) LevelGT(LastTalkedToBy,15) Class(LastTalkedToBy,SORCERER) !HaveKnownSpellRES("a7#spw1")~ + @10013 /* Memorize this effect as a mage spell. */ + Learn.Sorcerer.Success
  + ~CheckStatGT(LastTalkedToBy,16,WIS) Class(LastTalkedToBy,CLERIC_ALL) !HaveKnownSpellRES("a7#spp1")~ + @10011 /* Memorize this effect as a priest spell. */ + Learn.Cleric.Success
  ++ @10009 /* Put the scroll away. */ EXIT
END

IF ~~ Examine.Failed
  SAY @10005 /* You try to make sense of the symbols, but have to give up eventually. The technical details are too complex for you to understand. */
  IF ~~ + Intro.Known.2
END

IF ~~ Scribe.Mage.Success
  SAY @10006 /* As you inspect the notes more closely, you can quickly make out a pattern. Using your own arcane knowledge you are able to transform it into a regular spell scroll without much effort. */
  IF ~~ DO ~SetGlobal("A7#SpacewarpMage","GLOBAL",1) TransformItem("a7#scrl2","a7#mscl2") DisplayString(LastTalkedToBy,@10012)~ EXIT
END

IF ~~ Learn.Sorcerer.Success
  SAY @10014 /* After committing the notes to memory you begin to understand the meaning behind the arcane theories. With this knowledge you are able to manipulate the weave well enough to cast this spell at will. */
  IF ~~ DO ~SetGlobal("A7#SpacewarpMage","GLOBAL",1) DestroyItem("a7#scrl2") AddSpecialAbility("a7#spw1") AddXPObject(LastTalkedToBy,7000)~ EXIT
END

IF ~~ Learn.Cleric.Success
  SAY @10007 /* After committing the notes to memory you begin to understand a higher logic behind the theories. With this newfound insight, you can easily bring it into accordance with your own beliefs. */
  IF ~~ DO ~SetGlobal("A7#SpacewarpPriest","GLOBAL",1) DestroyItem("a7#scrl2") AddSpecialAbility("a7#spp1") AddXPObject(LastTalkedToBy,7000)~ EXIT
END
