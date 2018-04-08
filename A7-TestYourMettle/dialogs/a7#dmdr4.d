// Modron Laborer

BEGIN ~a7#dmdr4~

IF ~Global("A7#ModronMIntro","GLOBAL",0)~ Intro
  SAY @3002 /* You see an orb with two arms and two legs sprouting from its sides. On the front of the orb you can make out a single eye. As you approach, the creature focuses its eye upon you. */
  IF ~CheckStatGT(LastTalkedToBy,15,INT)~ DO ~SetGlobal("A7#ModronMIntro","GLOBAL",1)~ + Understand
  IF ~CheckStatLT(LastTalkedToBy,16,INT) PartyHasItem("a7#mdjrn") GlobalGT("A7#MonodroneTalk","GLOBAL",1)~ DO ~SetGlobal("A7#ModronMIntro","GLOBAL",1)~ + Understand
  IF ~CheckStatLT(LastTalkedToBy,16,INT) PartyHasItem("a7#mdjrn") GlobalLT("A7#MonodroneTalk","GLOBAL",2)~ DO ~SetGlobal("A7#ModronMIntro","GLOBAL",1)~ + Understand.Notes
  IF ~CheckStatLT(LastTalkedToBy,16,INT) !PartyHasItem("a7#mdjrn")~ DO ~SetGlobal("A7#ModronMIntro","GLOBAL",1)~ + NotUnderstand
END

IF ~!Global("A7#ModronMIntro","GLOBAL",0) CheckStatLT(LastTalkedToBy,16,INT) PartyHasItem("a7#mdjrn") GlobalLT("A7#MonodroneTalk","GLOBAL",2)~ Understand.Notes
  SAY @5512 /* You prepare the scholarly notes about modron language codes, as the creature attempts to communicate with you. */
  IF ~~ DO ~SetGlobal("A7#MonodroneTalk","GLOBAL",2)~ + Understand
END

IF ~!Global("A7#ModronMIntro","GLOBAL",0) OR(2) CheckStatGT(LastTalkedToBy,15,INT) PartyHasItem("a7#mdjrn")~ Understand
  SAY @5501 /* 01011001 01100101 01110011? (Yes?) */
  ++ @5505 /* 01001110 01100001 01101101 01100101? (Who are you?) */ + Understand.1
  ++ @5507 /* 01001010 01101111 01100010? (What are you doing?) */ + Understand.2
  ++ @5503 /* 01000010 01111001 01100101. (Farewell.) */ EXIT
END

IF ~!Global("A7#ModronMIntro","GLOBAL",0) CheckStatLT(LastTalkedToBy,16,INT) !PartyHasItem("a7#mdjrn")~ NotUnderstand
  SAY @5502 /* 01011001 01100101 01110011? */
  ++ @5506 /* Who are you? */ + NotUnderstand.1
  ++ @5508 /* What do you do? */ + NotUnderstand.1
  + ~Global("A7#MonodroneTalk","GLOBAL",0)~ + @5504 /* Farewell. */ + NotUnderstand.2
  + ~!Global("A7#MonodroneTalk","GLOBAL",0)~ + @5504 /* Farewell. */ EXIT
END


IF ~~ Understand.1
  SAY @5509 /* 01001111 01101110 01100101. (We are one.) */
  ++ @5507 /* 01001010 01101111 01100010? (What are you doing?) */ + Understand.2
  ++ @5503 /* 01000010 01111001 01100101. (Farewell.) */ EXIT
END

IF ~~ Understand.2
  SAY @5510 /* 01010111 01101111 01110010 01101011. (We do work.) */
  ++ @5505 /* 01001110 01100001 01101101 01100101? (Who are you?) */ + Understand.1
  ++ @5503 /* 01000010 01111001 01100101. (Farewell.) */ EXIT
END


IF ~~ NotUnderstand.1
  SAY @5502 /* 01011001 01100101 01110011? */
  + ~Global("A7#MonodroneTalk","GLOBAL",0)~ + @5504 /* Farewell. */ + NotUnderstand.2
  + ~!Global("A7#MonodroneTalk","GLOBAL",0)~ + @5504 /* Farewell. */ EXIT
END

IF ~~ NotUnderstand.2
  SAY @5511 /* This modron speaks a language you can't comprehend. Maybe someone more knowledgeable can find a way to communicate with it. */
  IF ~~ DO ~SetGlobal("A7#MonodroneTalk","GLOBAL",1)~ EXIT
END
