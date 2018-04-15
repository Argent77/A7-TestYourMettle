// Modron Director

BEGIN ~a7#dmdr3~

IF ~Global("A7#ModronQIntro","GLOBAL",0)~ Intro
  SAY @3000 /* You see a cube with two arms, two legs, and two small wings sprouting from its sides. On the front of the cube is an animated face. As you approach, the creature focuses its eyes upon you. */
  IF ~~ DO ~SetGlobal("A7#ModronQIntro","GLOBAL",1)~ + Intro.Director
END

IF ~!Global("A7#ModronQIntro","GLOBAL",0)~ Intro.Director
  SAY @3500 /* Greetings */
  ++ @3503 /* I have some questions... */ + Questions
  + ~Global("A7#ModronQuest","GLOBAL",3) PartyHasItem("a7#ward") Global("A7#InvasionInfo","GLOBAL",0)~ 
    + @4000 /* I have found out the source of invasion. */ DO ~SetGlobal("A7#InvasionInfo","GLOBAL",1)~ + Invasion.Found
  + ~Global("A7#ModronQuest","GLOBAL",3) PartyHasItem("a7#cvtx")~ + @4001 /* I have returned the vortex cube. */ + VortexCube.Found
  ++ @4002 /* Never mind. Farewell. */ EXIT
END

IF ~~ Questions
  SAY @3507 /* State your question. */
  ++ @3508 /* Who are you? */ + Q.Modron.Who
  ++ @3509 /* What are you? */ + Q.Modron.What
  + ~GlobalLT("A7#ModronQuest","GLOBAL",2)~ + @3510 /* What is this place? */ + Q.Place.What
  + ~GlobalGT("A7#ModronQuest","GLOBAL",1)~ + @4003 /* What is this place again? */ + Q.Place.What
  + ~GlobalGT("A7#ModronQuest","GLOBAL",1)~ + @4004 /* Are there any dangers associated with Rubikon that I should be aware of? */ + Q.Place.Dangers
  + ~Global("A7#ModronQuest","GLOBAL",2)~ + @4005 /* May I take part in the Rubikon project? */ + Q.Place.Participate
  + ~Global("A7#ModronQuest","GLOBAL",3)~ + @4006 /* Can you tell me again how I can help you? */ + Q.Place.Help
  + ~GlobalGT("A7#ModronQuest","GLOBAL",1) PartyHasItem("a7#mcube")~ + @4007 /* What can you tell me about the cube-like toy creature in my possession? */ + Q.ModronCube
  + ~Global("A7#ModronQuest","GLOBAL",3) PartyHasItem("a7#ward") Global("A7#InvasionInfo","GLOBAL",0)~ 
    + @4000 /* I have found out the source of invasion. */ DO ~SetGlobal("A7#InvasionInfo","GLOBAL",1)~ + Invasion.Found
  + ~Global("A7#ModronQuest","GLOBAL",3) PartyHasItem("a7#cvtx")~ + @4001 /* I have returned the vortex cube. */ + VortexCube.Found
  ++ @4008 /* Never mind. I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Modron.Who
  SAY @3512 /* We are modron. */
  ++ @3513 /* Your name is modron? */ + Q.Modron.Who.1
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Modron.Who.1
  SAY @3514 /* We are modron. We do not have a name. We are modron. All that you see here are modron. We are one. */
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Modron.What
  SAY @3516 /* We are modron, we are quadrone. */
  ++ @3517 /* What is a modron? */ + Q.Modron.What.1
  ++ @3518 /* What is a quadrone? */ + Q.Modron.What.2
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Modron.What.1
  SAY @3519 /* We are modron. Our race is identified as such. */
  ++ @3520 /* Then what is a quadrone? */ + Q.Modron.What.2
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Modron.What.2
  SAY @3521 /* Within our race, we are identified as type quadrone. */
  ++ @3522 /* Then what is a modron? */ + Q.Modron.What.1
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.What
  SAY @4011 /* This is the Rubikon Dungeon Construct Project®. */
  + ~GlobalLT("A7#ModronQuest","GLOBAL",2)~ + @4012 /* What is the Rubikon Dungeon Construct Project®? */ DO ~SetGlobal("A7#ModronQuest","GLOBAL",2) EraseJournalEntry(@60011)~ UNSOLVED_JOURNAL @60012 + Q.Place.What.1
  + ~GlobalGT("A7#ModronQuest","GLOBAL",1)~ + @4013 /* Can you tell me again what is the Rubikon Dungeon Construct Project®? */ + Q.Place.What.1
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.What.1
  SAY @4014 /* Rubikon: Project goal is to determine the dynamics, both social and asocial, surrounding the environment commonly construed as a dungeon and to attempt to explain the aberrations that tend to occur in such environments. */
  ++ @4015 /* How do you do that? */ + Q.Place.What.2
  ++ @4016 /* What aberrations are you talking about? */ + Q.Place.What.3
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.What.2
  SAY @4017 /* Rubikon is capable of forming a series of rooms linked in such a fashion as to form what is commonly referred to as a *dungeon*. The dungeon is populated with monsters, traps and treasure. */
  = @4018 /* Each section of the dungeon is created dynamically on demand and adjusts difficulty based on the experience level of the adventurer who takes part in it. After creation the dungeon section can be fully explored. Treasure from the dungeon can be recycled in the dungeon entrance afterwards. */
  ++ @4019 /* Recycled? */ UNSOLVED_JOURNAL @60015 + Q.Place.What.Recycler
  ++ @4020 /* You said something about aberrations? */ + Q.Place.What.3
  ++ @4004 /* Are there any dangers associated with Rubikon that I should be aware of? */ + Q.Place.Dangers
  + ~GlobalLT("A7#ModronQuest","GLOBAL",3)~ + @4021 /* I am an adventurer. May I try out your dungeon experiment? */ + Q.Place.Participate
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.What.Recycler
  SAY @4022 /* The recycling device converts treasure from the Rubikon Dungeon Construct Project® into rewards for the participant of the dungeon experience. It can be accessed at the Entrance to Rubikon. Further instructions can be requested at the recycler console. The recycler console can be found in the northwest corner of the Entrance to Rubikon. */
  ++ @4020 /* You said something about aberrations? */ + Q.Place.What.3
  ++ @4004 /* Are there any dangers associated with Rubikon that I should be aware of? */ + Q.Place.Dangers
  + ~GlobalLT("A7#ModronQuest","GLOBAL",3)~ + @4021 /* I am an adventurer. May I try out your dungeon experiment? */ + Q.Place.Participate
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.What.3
  SAY @4023 /* Queries to be answered: What attracts people to dungeons? Why do people often seek to enter them if they are places of such danger? Why are dungeons there in the first place? What are the dynamics of a workable dungeon? We do not understand. */
  ++ @4004 /* Are there any dangers associated with Rubikon that I should be aware of? */ + Q.Place.Dangers
  + ~GlobalLT("A7#ModronQuest","GLOBAL",3)~ + @4024 /* Interesting. May I try out your dungeon experiment? */ + Q.Place.Participate
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Dangers
  SAY @4025 /* Yes. Do not become separated from any companions while in the maze. Each individual section of the maze is generated and reset on demand. Anyone left would be killed when the area is reset. */
  ++ @4026 /* I see... I will not leave anyone or anything behind. Anything else? */ + Q.Place.Dangers.1
  + ~GlobalLT("A7#ModronQuest","GLOBAL",3)~ + @4027 /* I'll keep that in mind. May I try out your dungeon experiment? */ + Q.Place.Participate
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Dangers.1
  SAY @4028 /* Yes. Do not drop items or equipment in the maze. It will be destroyed when the area of the maze is reset. */
  ++ @4029 /* I see... I will not drop anything of importance. If the area of the maze is reset, anything left would be destroyed. Anything else? */ + Q.Place.Dangers.2
  + ~GlobalLT("A7#ModronQuest","GLOBAL",3)~ + @4027 /* I'll keep that in mind. May I try out your dungeon experiment? */ + Q.Place.Participate
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Dangers.2
  SAY @4030 /* No... (The modron pauses for a moment.) No, there is nothing else. */
  + ~GlobalLT("A7#ModronQuest","GLOBAL",3)~ + @4031 /* I see. May I try out your dungeon experiment? */ + Q.Place.Participate
  ++ @4009 /* Alright. I have more questions... */ + Questions
  ++ @4010 /* I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Participate
  SAY @4032 /* (There is a significant pause before the modron answers you.) Request denied... Project is showing signs of abnormal behavior. */
  IF ~~ UNSOLVED_JOURNAL @60013 + Q.Place.Participate.1
END

IF ~~ Q.Place.Participate.1
  SAY @4033 /* (There is another pause before the modron continues.) We have lost partial control over the Rubikon Dungeon Construct Project®. */
  ++ @4034 /* How did you lose control? */ + Q.Place.Participate.2
  ++ @4035 /* I see. I have more questions... */ + Questions
  ++ @4036 /* Interesting. I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Participate.2
  SAY @4037 /* We do not know. Access to the dungeon construct has been restricted by an unknown force. A modron squad charged with the task to investigate the abnormality has not yet reported back. */
  = @4038 /* We... (The modron pauses again.) We have also lost our connection to Mechanus. Without further instructions from our superiors we are unable to solve the problem. */
  ++ @4039 /* Mechanus? */ + Q.Place.Participate.3
END

IF ~~ Q.Place.Participate.3
  SAY @4040 /* Mechanus is a plane of perfect law and order. It is our home. Without the vortex cube we are unable to establish a connection to Mechanus. */
  ++ @4041 /* Vortex cube? */ + Q.Place.Participate.4
END

IF ~~ Q.Place.Participate.4
  SAY @4042 /* The vortex cube enables us to keep a stable connection to Mechanus. Without the vortex cube we are unable to perform our assigned task or return home after completing the task. */
  ++ @4043 /* How did you lose the cube? */ + Q.Place.Participate.5
  ++ @4044 /* I see. I have more questions though... */ + Questions
  ++ @4036 /* Interesting. I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Participate.5
  SAY @4045 /* The vortex cube has been taken by an unknown force. It is highly probable that the same force is also responsible for the malfunctions in the Rubikon Dungeon Construct Project®. */
  ++ @4046 /* Can I do something to help you? */ + Q.Place.Help.1
  ++ @4044 /* I see. I have more questions though... */ + Questions
  ++ @4036 /* Interesting. I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Help
  SAY @4047 /* We require help with the following tasks. Determine the nature of the intruders. Restore control over the Rubikon Dungeon Construct Project®. Return the vortex cube to us. */
  ++ @4048 /* Any idea where I can find the intruders? */ + Q.Place.Help.3
  ++ @4049 /* How do I restore control over the Rubikon Dungeon Construct Project®? */ + Q.Place.Help.4
  ++ @4050 /* Where can I find the vortex cube? */ + Q.Place.Help.5
  ++ @4051 /* I see what I can do. I have more questions though... */ + Questions
  ++ @4052 /* Understood. I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Help.1
  SAY @4053 /* (The room is suddenly filled with a buzzing sound that just as suddenly subsides.) Assistance is welcome. You are granted access to the dungeon construct. */
  IF ~~ DO ~SetGlobal("A7#ModronQuest","GLOBAL",3) SetGlobal("A7#MazeActive","GLOBAL",1)~ UNSOLVED_JOURNAL @60014 + Q.Place.Help.2
END

IF ~~ Q.Place.Help.2
  SAY @4054 /* We request your help for the following tasks. Determine the nature of the intruders. Restore control over the Rubikon Dungeon Construct Project®. Return the vortex cube to us. */
  ++ @4048 /* Any idea where I can find the intruders? */ + Q.Place.Help.3
  ++ @4049 /* How do I restore control over the Rubikon Dungeon Construct Project®? */ + Q.Place.Help.4
  ++ @4050 /* Where can I find the vortex cube? */ + Q.Place.Help.5
  ++ @4051 /* I see what I can do. I have more questions though... */ + Questions
  ++ @4052 /* Understood. I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Help.3
  SAY @4055 /* The intruders have been located in the dungeon construct. We do not know the nature of the intruders. We do not know the source of intrusion. */
  ++ @4049 /* How do I restore control over the Rubikon Dungeon Construct Project®? */ + Q.Place.Help.4
  ++ @4050 /* Where can I find the vortex cube? */ + Q.Place.Help.5
  ++ @4051 /* I see what I can do. I have more questions though... */ + Questions
  ++ @4052 /* Understood. I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Help.4
  SAY @4056 /* We do not have enough information to answer your query. */
  ++ @4048 /* Any idea where I can find the intruders? */ + Q.Place.Help.3
  ++ @4050 /* Where can I find the vortex cube? */ + Q.Place.Help.5
  ++ @4051 /* I see what I can do. I have more questions though... */ + Questions
  ++ @4052 /* Understood. I must be going now. Farewell. */ EXIT
END

IF ~~ Q.Place.Help.5
  SAY @4057 /* The vortex cube has been taken by an unknown force. It is likely that the vortex cube is still in possession of the force. The current whereabouts of this force is not known to us. */
  ++ @4048 /* Any idea where I can find the intruders? */ + Q.Place.Help.3
  ++ @4049 /* How do I restore control over the Rubikon Dungeon Construct Project®? */ + Q.Place.Help.4
  ++ @4051 /* I see what I can do. I have more questions though... */ + Questions
  ++ @4052 /* Understood. I must be going now. Farewell. */ EXIT
END

IF ~~ Q.ModronCube
  SAY @4058 /* This object is a portal cube. The user is to position the appendages of the portal cube in such manner that it will activate. Once activated, the portal cube will transport the user to whatever destination it was tuned to during its creation. */
  + ~Global("KnowCube","LOCALS",0)~ + @4059 /* What's the proper position to activate this one? */ DO ~SetGlobal("KnowCube","LOCALS",1) SetGlobal("A7#KnowCubePrime","GLOBAL",1)~ + Q.ModronCube.1
  + ~Global("KnowCube","LOCALS",1)~ + @4060 /* Can you tell me again the proper position to activate this one? */ + Q.ModronCube.1
  ++ @4044 /* I see. I have more questions though... */ + Questions
  ++ @4036 /* Interesting. I must be going now. Farewell. */ EXIT
END

IF ~~ Q.ModronCube.1
  SAY @4061 /* The cube is tuned to the following two destinations: Entrance to the Rubikon Dungeon Construct Project®, user's place of origin. */
  = @4062 /* To activate transport to the Entrance of the Rubikon Dungeon Construct Project®, bend the left knee until the leg forms a fifteen-degree angle, unfold both wings to maximum extension, then rotate the right arm 180 degrees in its socket. */
  = @4063 /* To activate transport to the user's place of origin, rotate the right arm 180 degrees to its socket, unfold both wings to maximum extension, then bend the left knee until the leg forms a fifteen-degree angle. */
  ++ @4044 /* I see. I have more questions though... */ + Questions
  ++ @4036 /* Interesting. I must be going now. Farewell. */ EXIT
END

IF ~~ Invasion.Found
  SAY @4064 /* Your knowledge about the nature of the intruders is appreciated. (Again the room is filled with a buzzing sound that subsides as quickly as it came.) Our analysis shows that destroying the leader of the baatezu force allows us to regain control over the Rubikon Dungeon Construct Project®. This task is given to you. */
  ++ @4065 /* Why me? */ + Invasion.Found.1
  ++ @4066 /* Sure, why not? I'll do it. */ UNSOLVED_JOURNAL @60017 + Invasion.Found.2
  ++ @4067 /* I'm not interested. Especially if it involves fighting the leader of a devil army. */ + Invasion.Found.Refused
END

IF ~~ Invasion.Found.1
  SAY @4068 /* You are capable of completing the given task. At present there is no alternative available. */
  ++ @4069 /* I suppose I have no other choice? I'll do it. */ UNSOLVED_JOURNAL @60017 + Invasion.Found.2
  ++ @4070 /* I'm not interested. You have to solve it by yourself. */ + Invasion.Found.Refused
END

IF ~~ Invasion.Found.2
  SAY @4071 /* Your help is appreciated. To support you in your task, we have devised a tool that provides protection from the threat constructs of the Rubikon Dungeon Construct Project®. */
  ++ @4072 /* Thank you. Anything else? */ DO ~AddexperienceParty(10000) GiveItemCreate("a7#dclk",LastTalkedToBy,16,16,0)~ + Invasion.Found.3
  ++ @4052 /* Understood. I must be going now. Farewell. */ DO ~AddexperienceParty(10000) GiveItemCreate("a7#dclk",LastTalkedToBy,16,16,0)~ EXIT
END

IF ~~ Invasion.Found.3
  SAY @4073 /* We assume that the vortex cube is in possession of the baatezu leader. */
  ++ @4052 /* Understood. I must be going now. Farewell. */ EXIT
END

IF ~~ Invasion.Found.Refused
  SAY @4074 /* Your decision has been noted. We will further analyze data to find potential errors in our conclusion. */
  IF ~~ EXIT
END

IF ~~ VortexCube.Found
  SAY @4075 /* We are grateful. A reward is given to you in exchange for the vortex cube. */
  IF ~~ DO ~AddexperienceParty(15000) GiveItemCreate("a7#rod1",LastTalkedToBy,16,0,0)~ + VortexCube.Found.1
END

IF ~~ VortexCube.Found.1
  SAY @4076 /* (The modron pauses for a moment and there is the buzzing sound again.) Connection with Mechanus has been established. Rubikon Dungeon Construct Project® is on hold until further instructions are given. We will now return home. Farewell, adventurer. */
  IF ~~ DO ~ClearAllActions() SetGlobal("A7#ModronQuest","GLOBAL",99) SetGlobal("A7#MazeAbandoned","GLOBAL",1) 
            EraseJournalEntry(@60012) EraseJournalEntry(@60013) EraseJournalEntry(@60014) EraseJournalEntry(@60015) 
            EraseJournalEntry(@60016) EraseJournalEntry(@60017) EraseJournalEntry(@60018)
            StartCutSceneMode() StartCutScene("a7#ctm1")~ SOLVED_JOURNAL @60100 EXIT
END

