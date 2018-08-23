// Maze - Imp dialog

BEGIN ~a7#dimp~

IF ~Global("DevilNeutral","MYAREA",1)~ Neutral
  SAY @11102 /* Obeying orders I am, manling. Not attacking you, must I. */
  IF ~~ EXIT
END

IF ~True()~ Default
  SAY @11103 /* Not bothering me, manling! */
  IF ~~ EXIT
END
