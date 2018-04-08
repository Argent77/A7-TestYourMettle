// Modron Guard (identical with a7#dmdr2.d)

BEGIN ~a7#dmdr1~

IF ~Global("A7#ModronQIntro","GLOBAL",0)~ Intro.Q
  SAY @3000 /* You see a cube with two arms, two legs, and two small wings sprouting from its sides. On the front of the cube is an animated face. As you approach, the creature focuses its eyes upon you. */
  IF ~~ DO ~SetGlobal("A7#ModronQIntro","GLOBAL",1)~ + 1
END

IF ~!Global("A7#ModronQIntro","GLOBAL",0)~ 1
  SAY @3500 /* Greetings. */
  + ~GlobalLT("A7#ModronQuest","GLOBAL",3)~ + @3503 /* I have some questions... */ + 1.Q
  + ~GlobalGT("A7#ModronQuest","GLOBAL",2)~ + @3503 /* I have some questions... */ + 2.Q
  ++ @3504 /* Never mind, I must be going. Farewell. */ EXIT
END

IF ~~ 1.Q
  SAY @3501 /* Direct your questions to the director. */
  ++ @3505 /* Where do I find the director? */ + 1.Q.1
  ++ @3530 /* Thank you. Farewell. */ EXIT
END

IF ~~ 1.Q.1
  SAY @3502 /* You may find the director in the control center. */
  ++ @3530 /* Thank you. Farewell. */ EXIT
END

IF ~~ 2.Q
  SAY @3507 /* State your question. */
  ++ @3508 /* Who are you? */ + 2.Q.Modron.Who
  ++ @3509 /* What are you? */ + 2.Q.Modron.What
  ++ @3510 /* What is this place? */ + 2.Q.Place.What
  ++ @3511 /* What are you doing here? */ + 2.Q.Place.Do
  ++ @3504 /* Never mind, I must be going. Farewell. */ EXIT
END

IF ~~ 2.Q.Modron.Who
  SAY @3512 /* We are modron. */
  ++ @3513 /* Your name is modron? */ + 2.Q.Modron.Who.1
  ++ @3503 /* I have some questions... */ + 2.Q
  ++ @3506 /* I must be going now. Farewell. */ EXIT
END

IF ~~ 2.Q.Modron.Who.1
  SAY @3514 /* We are modron. We do not have a name. We are modron. All that you see here are modron. We are one. */
  ++ @3515 /* Alright. I have more questions... */ + 2.Q
  ++ @3506 /* I must be going now. Farewell. */ EXIT
END

IF ~~ 2.Q.Modron.What
  SAY @3516 /* We are modron, we are quadrone. */
  ++ @3517 /* What is a modron? */ + 2.Q.Modron.What.1
  ++ @3518 /* What is a quadrone? */ + 2.Q.Quadrone
  ++ @3515 /* Alright. I have more questions... */ + 2.Q
  ++ @3506 /* I must be going now. Farewell. */ EXIT
END

IF ~~ 2.Q.Modron.What.1
  SAY @3519 /* We are modron. Our race is identified as such. */
  ++ @3520 /* Then what is a quadrone? */ + 2.Q.Quadrone
  ++ @3515 /* Alright. I have more questions... */ + 2.Q
  ++ @3506 /* I must be going now. Farewell. */ EXIT
END

IF ~~ 2.Q.Quadrone
  SAY @3521 /* Within our race, we are identified as type quadrone. */
  ++ @3522 /* Then what is a modron? */ + 2.Q.Modron.What.1
  ++ @3515 /* Alright. I have more questions... */ + 2.Q
  ++ @3506 /* I must be going now. Farewell. */ EXIT
END

IF ~~ 2.Q.Place.What
  SAY @3523 /* Rubikon dungeon construct. */
  ++ @3524 /* What exactly is that? */ + 2.Q.Director
  ++ @3515 /* Alright. I have more questions... */ + 2.Q
  ++ @3506 /* I must be going now. Farewell. */ EXIT
END

IF ~~ 2.Q.Director
  SAY @3525 /* Address your query to the director. */
  ++ @3505 /* Where do I find the director? */ + 2.Q.Director.1
  ++ @3515 /* Alright. I have more questions... */ + 2.Q
  ++ @3506 /* I must be going now. Farewell. */ EXIT
END

IF ~~ 2.Q.Director.1
  SAY @3502 /* You may find the director in the control center. */
  ++ @3515 /* Alright. I have more questions... */ + 2.Q
  ++ @3506 /* I must be going now. Farewell. */ EXIT
END

IF ~~ 2.Q.Place.Do
  SAY @3526 /* Awaiting instructions. */
  ++ @3527 /* ~Instructions for what? */ + 2.Q.Place.Do.1
  ++ @3515 /* Alright. I have more questions... */ + 2.Q
  ++ @3506 /* I must be going now. Farewell. */ EXIT
END

IF ~~ 2.Q.Place.Do.1
  SAY @3528 /* Instructions for what tasks need to be performed. */
  ++ @3529 /* What tasks? Just what is it that you are doing here? */ + 2.Q.Director
  ++ @3515 /* Alright. I have more questions... */ + 2.Q
  ++ @3506 /* I must be going now. Farewell. */ EXIT
END
