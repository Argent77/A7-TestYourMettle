// Gelugon Mastermind

BEGIN ~a7#dgelu~

IF ~True()~ Intro
  SAY @6500 /* You have come far, <CHARNAME>. Oh don't look so surprised. Did you really think you could take me unawares? */
  ++ @6501 /* Who are you? */ + Who
  ++ @6502 /* What do you want? */ + What.1
END

IF ~~ Who
  SAY @6503 /* My true name is not for the likes of you. You may call me "Mastermind". An apt title in a place where all entities are named by their function, don't you think? */
  ++ @6502 /* What do you want? */ + What.2
END

IF ~~ What.1
  SAY @6504 /* Straight to the point. Your directness is a refreshing change when one is surrounded by cunning and deceit. */
  IF ~~ + What.2
END

IF ~~ What.2
  SAY @6505 /* Power is our goal, <PRO_RACE>. Power enough to expand our dominion in the planes. The race of modrons is a force that can be tapped into. They are obedient creatures without emotions that could get in their way. */
  = @6506 /* Now imagine an endless stream of obedient modrons fighting to the death for our cause in the Blood War. To accomplish this we need control over the source of modrons on Mechanus. Taking over this construct is just a small step towards the realization of this plan. */
  + ~CheckStatLT(LastTalkedToBy,15,INT)~ + @6507 /* How do you plan to enter the plane of Mechanus? */ + What.3
  + ~CheckStatGT(LastTalkedToBy,14,INT)~ + @6508 /* Does the vortex cube play a role in your plan? */ + What.4
  ++ @6509 /* No more speeches. Prepare yourself! */ + What.5
END

IF ~~ What.3
  SAY @6510 /* This is not for you to know, mortal. */
  IF ~~ + Combat
END

IF ~~ What.4
  SAY @6511 /* You are very perceptive for a <PRO_RACE>. Yes, the vortex cube will be useful indeed when I have uncovered all of its secrets. */
  IF ~~ + Combat
END

IF ~~ What.5
  SAY @6512 /* Your empty threats don't impress me in the least. I have heard them from you mortals far too often. */
  IF ~~ + Combat
END

IF ~~ Combat
  SAY @6513 /* I have pondered a while what I would do when you finally reach me. You have fought through a host of my minions, and even defeated my first lieutenant. An impressive deed. You would have made it far in our service. */
  = @6514 /* Alas, you are too volatile for my purposes. It is best that you simply disappear. Perhaps I can put your soul to good use. */
  IF ~~ DO ~Enemy()~ EXIT
END
