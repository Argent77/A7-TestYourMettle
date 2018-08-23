// Maze - Devils (default)

BEGIN ~a7#ddvl2~

IF ~Global("DevilNeutral","MYAREA",1)~ Neutral
  SAY @11100 /* Leave me be, mortal! I have nothing to say to your kind. */
  IF ~~ EXIT
END

IF ~True()~ Default
  SAY @11101 /* Your soul is mine! */
  IF ~~ EXIT
END
