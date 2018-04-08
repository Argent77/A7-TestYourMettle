// Modron Guide

BEGIN ~a7#dmdr5~

IF ~Global("A7#ModronQIntro","GLOBAL",0)~ Intro
  SAY @3000 /* You see a cube with two arms, two legs, and two small wings sprouting from its sides. On the front of the cube is an animated face. As you approach, the creature focuses its eyes upon you. */
  IF ~GlobalLT("A7#ModronQuest","GLOBAL",3)~ DO ~SetGlobal("A7#ModronQIntro","GLOBAL",1)~ + 1
  IF ~GlobalGT("A7#ModronQuest","GLOBAL",2)~ DO ~SetGlobal("A7#ModronQIntro","GLOBAL",1)~ + 2
END

IF ~!Global("A7#ModronQIntro","GLOBAL",0) GlobalLT("A7#ModronQuest","GLOBAL",3)~ 1
  SAY @5001 /* Greetings, adventurer. Welcome to the Rubikon Dungeon Construct Project®. You may request access to Rubikon from the director. */
  ++ @5004 /* What is Rubikon? */ + 1.1
  ++ @5005 /* What is a dungeon simulator? */ + 1.2
  ++ @5006 /* Where can I find the director? */ + 1.3
  ++ @5007 /* Thanks. I'll do that. Farewell. */ EXIT
END

IF ~~ 1.1
  SAY @5014 /* The creature stares at you without answering. */
  ++ @5005 /* What is a dungeon simulator? */ + 1.2
  ++ @5006 /* Where can I find the director? */ + 1.3
  ++ @5008 /* Nevermind. I've got to go. Farewell. */ EXIT
END

IF ~~ 1.2
  SAY @5013 /* The creature blinks at you but gives no indication it has heard your question. */
  ++ @5004 /* What is Rubikon? */ + 1.1
  ++ @5006 /* Where can I find the director? */ + 1.3
  ++ @5008 /* Nevermind. I've got to go. Farewell. */ EXIT
END

IF ~~ 1.3
  SAY @5003 /* You may find the director in the control center. */
  ++ @5009 /* Where is the control center? */ + 1.4
  ++ @5008 /* Nevermind. I've got to go. Farewell. */ EXIT
END

IF ~~ 1.4
  SAY @5002 /* The creature stares at you blankly. */
  ++ @5010 /* Nevermind. I'll find it on my own. Farewell. */ EXIT
END

IF ~!Global("A7#ModronQIntro","GLOBAL",0) GlobalGT("A7#ModronQuest","GLOBAL",2)~ 2
  SAY @5012 /* Greetings, adventurer. Welcome to the Rubikon Dungeon Construct Project®. You may access Rubikon through this door. Please enjoy yourself! */
  ++ @5004 /* What is Rubikon? */ + 2.1
  ++ @5005 /* What is a dungeon simulator? */ + 2.2
  ++ @5011 /* Thanks. I'll do that. */ EXIT
END

IF ~~ 2.1
  SAY @5014 /* The creature stares at you without answering. */
  ++ @5005 /* What is a dungeon simulator? */ + 2.2
  ++ @5008 /* Nevermind. I've got to go. Farewell. */ EXIT
END

IF ~~ 2.2
  SAY @5013 /* The creature blinks at you but gives no indication it has heard your question. */
  ++ @5004 /* What is Rubikon? */ + 2.1
  ++ @5008 /* Nevermind. I've got to go. Farewell. */ EXIT
END
