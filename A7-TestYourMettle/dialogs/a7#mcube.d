// Modron Cube dialog

BEGIN ~a7#mcube~

IF ~PartyHasItemIdentified("a7#mcube") !AreaType(A7_RUBIKON) OR(4) Global("Chapter","GLOBAL",%bg2_chapter_4%) GlobalGT("Chapter","GLOBAL",%bg2_chapter_9%) AreaCheck("AR4000") AreaCheck("AR4500")~ Intro.Denied.1
  SAY @9001 /* This small metal toy is a replica of a modron, a creature native to the plane of Mechanus. You notice that the item doesn't emit the low humming and buzzing sounds when you try to manipulate its appendages. There may be something in this location interfering with its operation. */
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~PartyHasItemIdentified("a7#mcube") !AreaType(A7_RUBIKON) Global("Chapter","GLOBAL",%bg2_chapter_7%) Global("EnteredAR2806","GLOBAL",1)~ Intro.Denied.2
  SAY @9001 /* This small metal toy is a replica of a modron, a creature native to the plane of Mechanus. You notice that the item doesn't emit the low humming and buzzing sounds when you try to manipulate its appendages. There may be something in this location interfering with its operation. */
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~!PartyHasItemIdentified("a7#mcube")~ Intro1
  SAY @9002 /* This small metal toy is a replica of a cube-like creature with huge eyes on one of its faces. The toy has two legs, two arms, two folding wings, and at least eighteen points of articulation. Maybe it's a collector's item. */
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~PartyHasItemIdentified("a7#mcube")~ Intro2
  SAY @9003 /* This small metal toy is a replica of a modron, a creature native to the plane of Mechanus. The intricacy of this artifact is incredible; its joints are composed of tiny gears, cogs, pulleys, and swivel joints, and there are even tiny springs on the legs that help support the feet. */
  + ~!ActuallyInCombat() !AreaType(A7_RUBIKON) Global("A7#KnowCubeRubikon","GLOBAL",0)~
    + @9004 /* Manipulate the toy and look for some sort of effect. */ + Manipulate.Rubikon
  + ~!ActuallyInCombat() !AreaType(A7_RUBIKON) Global("A7#KnowCubeRubikon","GLOBAL",1)~
    + @9005 /* Use the combination that activates transport to the Rubikon dungeon entrance. */ + ToRubikon
  + ~ActuallyInCombat() !AreaType(A7_RUBIKON) Global("A7#KnowCubeRubikon","GLOBAL",1)~
    + @9005 /* Use the combination that activates transport to the Rubikon dungeon entrance. */ + Combat.Active
  + ~!ActuallyInCombat() AreaType(A7_RUBIKON) Global("A7#LocationRubikon","GLOBAL",1) Global("A7#KnowCubePrime","GLOBAL",0)~
    + @9030 /* Try to figure out the combination for the transport back home. */ + Manipulate.Prime
  + ~ActuallyInCombat() AreaType(A7_RUBIKON) Global("A7#LocationRubikon","GLOBAL",1) Global("A7#KnowCubePrime","GLOBAL",0)~
    + @9030 /* Try to figure out the combination for the transport back home. */ + Combat.Active
  + ~!ActuallyInCombat() AreaType(A7_RUBIKON) !AreaCheck("A7#1FD") !AreaCheck("A7#1WZ") Global("A7#LocationRubikon","GLOBAL",1) Global("A7#KnowCubePrime","GLOBAL",1)~
    + @9007 /* Use the combination that activates transport back home. */ + ToPrime
  + ~!ActuallyInCombat() AreaType(A7_RUBIKON) !AreaCheck("A7#1FD") !AreaCheck("A7#1WZ") Global("A7#LocationRubikon","GLOBAL",0)~
    + @9007 /* Use the combination that activates transport back home. */ + ToPrime.Failsafe
  + ~!ActuallyInCombat() AreaType(A7_RUBIKON) OR(2) AreaCheck("A7#1FD") AreaCheck("A7#1WZ") Global("A7#KnowCubePrime","GLOBAL",1) Global("A7#KnowCubeWeakness","GLOBAL",0)~
    + @9007 /* Use the combination that activates transport back home. */ + Transport.Denied
  + ~!ActuallyInCombat() AreaType(A7_RUBIKON) OR(2) AreaCheck("A7#1FD") AreaCheck("A7#1WZ") Global("A7#KnowCubePrime","GLOBAL",1) Global("A7#KnowCubeWeakness","GLOBAL",1)~
    + @9007 /* Use the combination that activates transport back home. */ + Transport.Denied.Known
  + ~ActuallyInCombat() AreaType(A7_RUBIKON) Global("A7#KnowCubePrime","GLOBAL",1)~
    + @9007 /* Use the combination that activates transport back home. */ + Combat.Active
  + ~!ActuallyInCombat() AreaType(A7_RUBIKON) !AreaCheck("A7#1FD") !AreaCheck("A7#1WZ") !AreaCheck("A7#1FY") !AreaCheck("A7#1EN")~
    + @9006 /* Use the combination that activates transport back to the Rubikon dungeon entrance. */ + ToEntrance
  + ~!ActuallyInCombat() AreaType(A7_RUBIKON) OR(2) AreaCheck("A7#1FD") AreaCheck("A7#1WZ") Global("A7#LocationRubikon","GLOBAL",1) Global("A7#KnowCubeWeakness","GLOBAL",0)~
    + @9006 /* Use the combination that activates transport back to the Rubikon dungeon entrance. */ + Transport.Denied
  + ~!ActuallyInCombat() AreaType(A7_RUBIKON) OR(2) AreaCheck("A7#1FD") AreaCheck("A7#1WZ") Global("A7#LocationRubikon","GLOBAL",1) Global("A7#KnowCubeWeakness","GLOBAL",1)~
    + @9006 /* Use the combination that activates transport back to the Rubikon dungeon entrance. */ + Transport.Denied.Known
  + ~ActuallyInCombat() AreaType(A7_RUBIKON)~
    + @9006 /* Use the combination that activates transport back to the Rubikon dungeon entrance. */ + Combat.Active
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ Manipulate.Rubikon
  SAY @9008 /* You bend, twist and rotate the toy's various points of articulation, noting that the limbs often suddenly revert to their original position. Finally, as you bend its left knee, the toy makes an odd *pop!* and shudders in your hands... */
  ++ @9014 /* Rotate the left arm. */ + Manipulate.Rubikon.1
  ++ @9015 /* Rotate the right arm. */ + Manipulate.Rubikon.1
  ++ @9016 /* Extend the left wing. */ + Manipulate.Rubikon.3
  ++ @9017 /* Extend the right wing. */ + Manipulate.Rubikon.1
  ++ @9018 /* Bend the right knee. */ + Manipulate.Rubikon.1
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ Manipulate.Rubikon.1
  SAY @9009 /* The toy's limbs suddenly revert to their original positions with a soft *click*. */
  ++ @9014 /* Rotate the left arm. */ + Manipulate.Rubikon.1
  ++ @9015 /* Rotate the right arm. */ + Manipulate.Rubikon.1
  ++ @9016 /* Extend the left wing. */ + Manipulate.Rubikon.1
  ++ @9017 /* Extend the right wing. */ + Manipulate.Rubikon.1
  ++ @9019 /* Bend the left knee. */ + Manipulate.Rubikon.2
  ++ @9018 /* Bend the right knee. */ + Manipulate.Rubikon.1
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ Manipulate.Rubikon.2
  SAY @9010 /* The toy makes an odd *pop!* and shudders in your hands. */
  ++ @9014 /* Rotate the left arm. */ + Manipulate.Rubikon.1
  ++ @9015 /* Rotate the right arm. */ + Manipulate.Rubikon.1
  ++ @9016 /* Extend the left wing. */ + Manipulate.Rubikon.3
  ++ @9017 /* Extend the right wing. */ + Manipulate.Rubikon.1
  ++ @9018 /* Bend the right knee. */ + Manipulate.Rubikon.1
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ Manipulate.Rubikon.3
  SAY @9011 /* The toy makes a soft *whir* sound. */
  ++ @9014 /* Rotate the left arm. */ + Manipulate.Rubikon.1
  ++ @9015 /* Rotate the right arm. */ + Manipulate.Rubikon.1
  ++ @9017 /* Extend the right wing. */ + Manipulate.Rubikon.4
  ++ @9018 /* Bend the right knee. */ + Manipulate.Rubikon.1
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ Manipulate.Rubikon.4
  SAY @9012 /* The toy *hmmmms* slightly, growing warm to the touch. */
  ++ @9014 /* Rotate the left arm. */ + Manipulate.Rubikon.1
  ++ @9015 /* Rotate the right arm. */ DO ~SetGlobal("A7#KnowCubeRubikon","GLOBAL",1)~ + ToRubikon
  ++ @9018 /* Bend the right knee. */ + Manipulate.Rubikon.1
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ ToRubikon
  SAY @9013 /* There is a *whirrrr,* a *click,* then a blinding white light suddenly explodes in your hands... */
  + ~InPartySlot(LastTalkedToBy,0)~ + @9020 /* Wh...! */ DO ~SetGlobal("A7#LocationRubikon","GLOBAL",1) StorePartyLocations()
                  LeaveAreaLUAPanic("A7#1FY","",[452.502],SE)
                  LeaveAreaLUA("A7#1FY","",[452.502],SE)
                  ActionOverride(Player2,LeaveAreaLUA("A7#1FY","",[438.444],SE))
                  ActionOverride(Player3,LeaveAreaLUA("A7#1FY","",[386.498],SE))
                  ActionOverride(Player4,LeaveAreaLUA("A7#1FY","",[366.438],SE))
                  ActionOverride(Player5,LeaveAreaLUA("A7#1FY","",[404.390],SE))
                  ActionOverride(Player6,LeaveAreaLUA("A7#1FY","",[318.480],SE))~ EXIT
  + ~!InPartySlot(LastTalkedToBy,0)~ + @9020 /* Wh...! */ DO ~SetGlobal("A7#LocationRubikon","GLOBAL",1) StorePartyLocations()
                  ActionOverride(Player1,LeaveAreaLUAPanic("A7#1FY","",[452.502],SE))
                  ActionOverride(Player1,LeaveAreaLUA("A7#1FY","",[452.502],SE))
                  ActionOverride(Player2,LeaveAreaLUA("A7#1FY","",[438.444],SE))
                  ActionOverride(Player3,LeaveAreaLUA("A7#1FY","",[386.498],SE))
                  ActionOverride(Player4,LeaveAreaLUA("A7#1FY","",[366.438],SE))
                  ActionOverride(Player5,LeaveAreaLUA("A7#1FY","",[404.390],SE))
                  ActionOverride(Player6,LeaveAreaLUA("A7#1FY","",[318.480],SE))~ EXIT
END

IF ~~ Manipulate.Prime
  SAY @9031 /* You bend, twist and rotate the toy's various points of articulation, noting that the limbs often suddenly revert to their original position. Finally, as you rotate its right arm, the toy makes an odd *pop!* and shudders in your hands... */
  ++ @9014 /* Rotate the left arm. */ + Manipulate.Prime.1
  ++ @9016 /* Extend the left wing. */ + Manipulate.Prime.1
  ++ @9017 /* Extend the right wing. */ + Manipulate.Prime.3
  ++ @9019 /* Bend the left knee. */ + Manipulate.Prime.1
  ++ @9018 /* Bend the right knee. */ + Manipulate.Prime.1
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ Manipulate.Prime.1
  SAY @9009 /* The toy's limbs suddenly revert to their original positions with a soft *click*. */
  ++ @9014 /* Rotate the left arm. */ + Manipulate.Prime.1
  ++ @9015 /* Rotate the right arm. */ + Manipulate.Prime.2
  ++ @9016 /* Extend the left wing. */ + Manipulate.Prime.1
  ++ @9017 /* Extend the right wing. */ + Manipulate.Prime.1
  ++ @9019 /* Bend the left knee. */ + Manipulate.Prime.1
  ++ @9018 /* Bend the right knee. */ + Manipulate.Prime.1
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ Manipulate.Prime.2
  SAY @9010 /* The toy makes an odd *pop!* and shudders in your hands. */
  ++ @9014 /* Rotate the left arm. */ + Manipulate.Prime.1
  ++ @9016 /* Extend the left wing. */ + Manipulate.Prime.1
  ++ @9017 /* Extend the right wing. */ + Manipulate.Prime.3
  ++ @9019 /* Bend the left knee. */ + Manipulate.Prime.1
  ++ @9018 /* Bend the right knee. */ + Manipulate.Prime.1
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ Manipulate.Prime.3
  SAY @9011 /* The toy makes a soft *whir* sound. */
  ++ @9014 /* Rotate the left arm. */ + Manipulate.Prime.1
  ++ @9016 /* Extend the left wing. */ + Manipulate.Prime.4
  ++ @9019 /* Bend the left knee. */ + Manipulate.Prime.1
  ++ @9018 /* Bend the right knee. */ + Manipulate.Prime.1
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ Manipulate.Prime.4
  SAY @9012 /* The toy *hmmmms* slightly, growing warm to the touch. */
  ++ @9014 /* Rotate the left arm. */ + Manipulate.Prime.1
  + ~!AreaCheck("A7#1FD") !AreaCheck("A7#1WZ")~ + @9019 /* Bend the left knee. */ DO ~SetGlobal("A7#KnowCubePrime","GLOBAL",1)~ + ToPrime
  + ~OR(2) AreaCheck("A7#1FD") AreaCheck("A7#1WZ")~ + @9019 /* Bend the left knee. */ DO ~SetGlobal("A7#KnowCubePrime","GLOBAL",1)~ + ToPrime.Denied
  ++ @9018 /* Bend the right knee. */ + Manipulate.Prime.1
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ ToPrime
  SAY @9013 /* There is a *whirrrr,* a *click,* then a blinding white light suddenly explodes in your hands... */
  ++ @9020 /* Wh...! */ DO ~SetGlobal("A7#LocationRubikon","GLOBAL",0) RestorePartyLocations()~ EXIT
END

IF ~~ ToPrime.Denied
  SAY @9032 /* There is a *whirrrr,* a *click,* then energy builds up for a moment. But it is quickly absorbed by the surrounding matter. It looks like this area interferes with the magic of the cube. You may have to try again somewhere else. */
  ++ @9000 /* Put the cube away. */ DO ~SetGlobal("A7#KnowCubeWeakness","GLOBAL",1)~ EXIT
END

IF ~~ ToEntrance
  SAY @9013 /* There is a *whirrrr,* a *click,* then a blinding white light suddenly explodes in your hands... */
  + ~InPartySlot(LastTalkedToBy,0)~ + @9020 /* Wh...! */ DO ~
          LeaveAreaLUAPanic("A7#1FY","",[452.502],SE) LeaveAreaLUA("A7#1FY","",[452.502],SE)
          ActionOverride(Player2,LeaveAreaLUA("A7#1FY","",[438.444],SE)) ActionOverride(Player3,LeaveAreaLUA("A7#1FY","",[386.498],SE))
          ActionOverride(Player4,LeaveAreaLUA("A7#1FY","",[366.438],SE)) ActionOverride(Player5,LeaveAreaLUA("A7#1FY","",[404.390],SE))
          ActionOverride(Player6,LeaveAreaLUA("A7#1FY","",[318.480],SE))~ EXIT
  + ~!InPartySlot(LastTalkedToBy,0)~ + @9020 /* Wh...! */ DO ~
          ActionOverride(Player1,LeaveAreaLUAPanic("A7#1FY","",[452.502],SE)) ActionOverride(Player1,LeaveAreaLUA("A7#1FY","",[452.502],SE))
          ActionOverride(Player2,LeaveAreaLUA("A7#1FY","",[438.444],SE)) ActionOverride(Player3,LeaveAreaLUA("A7#1FY","",[386.498],SE))
          ActionOverride(Player4,LeaveAreaLUA("A7#1FY","",[366.438],SE)) ActionOverride(Player5,LeaveAreaLUA("A7#1FY","",[404.390],SE))
          ActionOverride(Player6,LeaveAreaLUA("A7#1FY","",[318.480],SE))~ EXIT
END

IF ~~ Transport.Denied
  SAY @9021 /* You manipulate the toy's appendages to activate the portal magic. Before the magic can take effect, it is quickly absorbed by the surrounding however. It looks like this area interferes with the magic of the cube. You may have to try again somewhere else. */
  ++ @9000 /* Put the cube away. */ DO ~SetGlobal("A7#KnowCubeWeakness","GLOBAL",1)~ EXIT
END

IF ~~ Transport.Denied.Known
  SAY @9022 /* The special nature of the current area interferes with the portal magic of the cube. */
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ ToPrime.Failsafe
  SAY @9023 /* For some reason the cube failed to transport you back to the prime material plane the last time. You try again and focus on places that may be more safe to travel to. */
  + ~GlobalGT("Chapter","GLOBAL",%bg2_chapter_1%) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%) !Global("Chapter","GLOBAL",%bg2_chapter_5%) Global("KickedOutSphere","GLOBAL",0)~
    + @9024 /* To the Planar Sphere in Athkatlas's Slums. */
    DO ~ActionOverride(Player1,LeaveAreaLUAPanic("AR0411","",[2912.2670],NW)) ActionOverride(Player1,LeaveAreaLUA("AR0411","",[2912.2670],NW))
        ActionOverride(Player2,LeaveAreaLUA("AR0411","",[2997.2657],NW)) ActionOverride(Player3,LeaveAreaLUA("AR0411","",[2929.2740],NW))
        ActionOverride(Player4,LeaveAreaLUA("AR0411","",[3016.2735],NW)) ActionOverride(Player5,LeaveAreaLUA("AR0411","",[3068.2684],NW))
        ActionOverride(Player6,LeaveAreaLUA("AR0411","",[2996.2800],NW))~ EXIT
  + ~GlobalGT("Chapter","GLOBAL",%bg2_chapter_1%) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%) !Global("Chapter","GLOBAL",%bg2_chapter_5%) Global("PowerObsidianSphere","GLOBAL",1)~
    + @9025 /* To Athkatlas's Slums. */
    DO ~ActionOverride(Player1,LeaveAreaLUAPanic("AR0400","",[2962.2873],NW)) ActionOverride(Player1,LeaveAreaLUA("AR0400","",[2962.2873],NW))
       ActionOverride(Player2,LeaveAreaLUA("AR0400","",[3045.2888],NW)) ActionOverride(Player3,LeaveAreaLUA("AR0400","",[2942.2950],NW))
       ActionOverride(Player4,LeaveAreaLUA("AR0400","",[3036.2969],NW)) ActionOverride(Player5,LeaveAreaLUA("AR0400","",[3137.2949],NW))
       ActionOverride(Player6,LeaveAreaLUA("AR0400","",[2974.3033],NW))~ EXIT
  + ~GlobalGT("Chapter","GLOBAL",%bg2_chapter_4%) GlobalLT("Chapter","GLOBAL",%bg2_chapter_8%) Global("PowerObsidianSphere","GLOBAL",1)~
    + @9026 /* To the Underdark. */
    DO ~ActionOverride(Player1,LeaveAreaLUAPanic("AR2100","",[322.3389],E)) ActionOverride(Player1,LeaveAreaLUA("AR2100","",[322.3389],E))
        ActionOverride(Player2,LeaveAreaLUA("AR2100","",[256.3340],E)) ActionOverride(Player3,LeaveAreaLUA("AR2100","",[265.3440],E))
        ActionOverride(Player4,LeaveAreaLUA("AR2100","",[212.3390],E)) ActionOverride(Player5,LeaveAreaLUA("AR2100","",[163.3333],E))
        ActionOverride(Player6,LeaveAreaLUA("AR2100","",[174.3454],E))~ EXIT
  + ~Global("Chapter","GLOBAL",%bg2_chapter_8%) Global("EnteredArea5203","GLOBAL",0) Global("PowerObsidianSphere","GLOBAL",1)~
    + @9027 /* To Saradush. */
    DO ~ActionOverride(Player1,LeaveAreaLUAPanic("AR5000","",[2250.1105],SW)) ActionOverride(Player1,LeaveAreaLUA("AR5000","",[2250.1105],SW))
        ActionOverride(Player2,LeaveAreaLUA("AR5000","",[2237.1037],SW)) ActionOverride(Player3,LeaveAreaLUA("AR5000","",[2329.1096],SW))
        ActionOverride(Player4,LeaveAreaLUA("AR5000","",[2314.1033],SW)) ActionOverride(Player5,LeaveAreaLUA("AR5000","",[2307.965],SW))
        ActionOverride(Player6,LeaveAreaLUA("AR5000","",[2397.1034],SW))~ EXIT
  + ~GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%) Global("PPlaneEscape","GLOBAL",1)~
    + @9028 /* To the wilderness near Saradush. */
    DO ~ActionOverride(Player1,LeaveAreaLUAPanic("AR6400","",[220.1320],SE)) ActionOverride(Player1,LeaveAreaLUA("AR6400","",[220.1320],SE))
        ActionOverride(Player2,LeaveAreaLUA("AR6400","",[201.1234],SE)) ActionOverride(Player3,LeaveAreaLUA("AR6400","",[125.1323],SE))
        ActionOverride(Player4,LeaveAreaLUA("AR6400","",[111.1243],SE)) ActionOverride(Player5,LeaveAreaLUA("AR6400","",[100.1160],SE))
        ActionOverride(Player6,LeaveAreaLUA("AR6400","",[39.1300],SE))~ EXIT
  + ~Global("Chapter","GLOBAL",%bg2_chapter_9%)~
    + @9029 /* To Amkethran. */
    DO ~ActionOverride(Player1,LeaveAreaLUAPanic("AR5500","",[393.2455],NW)) ActionOverride(Player1,LeaveAreaLUA("AR5500","",[393.2455],NW))
        ActionOverride(Player2,LeaveAreaLUA("AR5500","",[487.2456],NW)) ActionOverride(Player3,LeaveAreaLUA("AR5500","",[381.2538],NW))
        ActionOverride(Player4,LeaveAreaLUA("AR5500","",[469.2537],NW)) ActionOverride(Player5,LeaveAreaLUA("AR5500","",[557.2540],NW))
        ActionOverride(Player6,LeaveAreaLUA("AR5500","",[466.2612],NW))~ EXIT
  ++ @9000 /* Put the cube away. */ EXIT
END

IF ~~ Combat.Active
  SAY @9033 /* You try to focus on manipulating the toy's various appendages, but are too distracted by the combat noise around you. */
  ++ @9000 /* Put the cube away. */ EXIT
END
