state("Hayfever", "1.0.2")
{
  //These pointers are for version 1.0.2, I will implement a version check at some point
  /* uint Level : "GameAssembly.dll", 0x0408C858, 0xB8, 0x0, 0x20, 0x20, 0x10, 0x90, 0x6E8;
  bool LevelFinished : "GameAssembly.dll", 0x04088988, 0x4A0, 0x98, 0x488, 0xB8, 0x78, 0xB8, 0x378; */

  //version 1.0.3 pointers
  uint Level : "GameAssembly.dll", 0x040734F8, 0x50, 0x28, 0x30, 0x150, 0xB0, 0x118, 0x58;
  bool LevelFinished : "GameAssembly.dll", 0x04075708, 0x60, 0x40, 0x60, 0x50, 0x40, 0xB8, 0x8;

  bool Loading : "UnityPlayer.dll", 0x01519D50, 0x0, 0x1F8, 0x218, 0x2A0;
}

startup
{
  settings.Add("RemoveLoads", true, "Remove load times");
  settings.SetToolTip("RemoveLoads", "Removes load time from 'Game Time'. Note that 'Real Time' should still be used when submitting to the leaderboards.");

  settings.Add("PlayInOrder", true, "Play levels in the right order");
  settings.SetToolTip("PlayInOrder", "Weather the levels have to be played in order or not. If this is unchecked, it will split on every level completion.");
  settings.Add("SplitDaily", false, "Split every day", "PlayInOrder");
  settings.Add("SplitWeekly", true, "Split every week", "PlayInOrder");
  settings.Add("SplitMonthly", false, "Split every month", "PlayInOrder");
  settings.Add("SplitAfterTutorial", false, "Split after tutorial (NOT FUNCTIONAL YET)", "PlayInOrder");
  settings.Add("SplitAfterHarvey", true, "Split after Harvey", "PlayInOrder");
}

init
{
  version = "1.0.3"; //this is temporary, I will implement a version check at some point.
  vars.Progress = -1;
  vars.TutorialCompleted = false;
}

split
{
  if(current.LevelFinished && !old.LevelFinished)
  {
    if(settings["PlayInOrder"])
    {
      //Splitting after the tutorial does not work yet.
      /*if(current.Level == unchecked((uint)-1)) //If the level is finished but the level id is -1, you are in the tutorial
      {
        if(settings["SplitAfterTutorial"] && !vars.TutorialCompleted)
        {
          vars.TutorialCompleted = true;
          return true;
        }
      }

      else*/ if(current.Level == vars.Progress + 1)
      {
        vars.Progress++;

        if(settings["SplitDaily"])
          return true;
        else if(settings["SplitWeekly"])
          return (current.Level + 1) % 7 == 0;
        else if(settings["SplitMonthly"])
          return (current.Level + 1) % 28 == 0;
        else if(settings["SplitAfterHarvey"] && current.Level == 111)
          return true;
        else if(current.Level == 139)
          return true;
      }
    }
    else
    {
      return true;
    }
  }
}

start
{
  //Todo - Detect when the timer should start and set the correct starting day
  vars.Progress = -1;
}

isLoading
{
  return current.Loading && settings["RemoveLoads"];
}
