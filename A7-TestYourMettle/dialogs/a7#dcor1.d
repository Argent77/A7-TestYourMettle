// Cornugon Taskmaster

BEGIN ~a7#dcor1~

IF ~True()~ Intro
  SAY @6000 /* Ah, another clueless adventurer finds its way to the taskmaster. That is good. Guarding the portal is a privilege, but it gets tiresome after a while. */
  = @6001 /* But introductions first. I am Dogreth the Taskmaster, cornugon of the second circle and the master's right hand. I would ask for your name, but your soul will be mine soon. Then I will know all about you anyway. */
  ++ @6002 /* Are you responsible for the malfunctions of the dungeon maze? */ + Malfunction
  ++ @6003 /* Do you have the vortex cube in your possession? */ + Cube
  IF ~~ EXIT
END

IF ~~ Malfunction
  SAY @6004 /* The maze? It is of little use to us. But we can still take advantage of it, by keeping the annoying modrons at bay while we are busy with our task. My master certainly thinks so. */
  IF ~~ + Conclusion
END

IF ~~ Cube
  SAY @6005 /* So, you know about the vortex cube? Maybe we had a hand or two in its disappearance. The cube is a powerful tool in the right hands. And I can assure you that my master knows how to use it effectively. */
  IF ~~ + Conclusion
END

IF ~~ Conclusion
  SAY @6006 /* But that doesn't concern you. My master is safe behind powerful wards, and only I have the means to overcome them. You will be dead soon, after my servants had their fun with you. I'm certain your soul will make a good trophy for my master. */
  IF ~~ EXIT
END
