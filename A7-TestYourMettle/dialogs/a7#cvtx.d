BEGIN ~a7#cvtx~

IF ~!PartyHasItemIdentified("a7#cvtx") !Global("A7_RUBIKON","MYAREA",1)~ Unidentified.2
  SAY @8000 /* The cube is cold to the touch. Whatever magic it might contain, doesn't seem to work in this place. */
  ++ @8008 /* Put the cube away. */ EXIT
END

IF ~!PartyHasItemIdentified("a7#cvtx") Global("A7_RUBIKON","MYAREA",1)~ Unidentified.1
  SAY @8001 /* The cube vibrates slightly in your hands. You have no idea what it could be used for. */
  ++ @8008 /* Put the cube away. */ EXIT
END

IF ~PartyHasItemIdentified("a7#cvtx") !Global("A7_RUBIKON","MYAREA",1)~ Identified.1
  SAY @8002 /* The cube is cold to the touch. Even the swirling markings on the sides are barely changing anymore. The magic of the item doesn't seem to work in this place. */
  ++ @8008 /* Put the cube away. */ EXIT
END

IF ~PartyHasItemIdentified("a7#cvtx") Global("A7_RUBIKON","MYAREA",1)~ Identified.2
  SAY @8003 /* The cube vibrates slightly in your hands. It is made of an unusual material and has strange markings on each side. */
  ++ @8009 /* Examine the sides of the cube. */ + Teleport.1
  ++ @8008 /* Put the cube away. */ EXIT
END

IF ~~ Teleport.1
  SAY @8004 /* You inspect the swirling markings on the faces of the cube more closely. They resemble vortices and change their patterns constantly, but you can't determine what function they may serve. */
  ++ @8010 /* Reach into one of the vortices. */ + Teleport.2
  ++ @8008 /* Put the cube away. */ EXIT
END

IF ~~ Teleport.2
  SAY @8005 /* You have no idea what could happen when you reach into one of the vortices. It could throw you onto an alien plane or destroy you utterly. Do you really want to continue? */
  ++ @8011 /* No, it's too dangerous. */ + Teleport.Cancelled
  ++ @8012 /* Yes, let's do it! */ + Teleport.3
END

IF ~~ Teleport.3
  SAY @8006 /* When you reach into one of the vortices, you are immediately sucked in. For a brief moment there is total blackness to all your senses and you feel your life force being sucked away by the endless void, only to suffer the brutal impact of the outside world a short time later. The cube didn't survive the ride, and you almost didn't make it either. */
  IF ~~ DO ~SetGlobal("A7#LocationRubikon","GLOBAL",0) SetGlobal("A7#ModronQuest","GLOBAL",98) DestroyItem("a7#cvtx") RestorePartyLocations()
            ApplySpellRES("a7#spv1",Player1) ApplySpellRES("a7#spv1",Player2) ApplySpellRES("a7#spv1",Player3)
            ApplySpellRES("a7#spv1",Player4) ApplySpellRES("a7#spv1",Player5) ApplySpellRES("a7#spv1",Player6)
            EraseJournalEntry(@60012) EraseJournalEntry(@60013) EraseJournalEntry(@60014) EraseJournalEntry(@60015)
            EraseJournalEntry(@60016) EraseJournalEntry(@60017) EraseJournalEntry(@60018) EraseJournalEntry(@60020)~ SOLVED_JOURNAL @60101 EXIT
END

IF ~~ Teleport.Cancelled
  SAY @8007 /* You decide against tinkering with the cube and put it back into your pack. Discretion is the better part of valor after all. */
  IF ~~ EXIT
END
