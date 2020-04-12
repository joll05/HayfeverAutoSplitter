state("Hayfever", "1.0.2")
{
  uint CurrentLevel : "GameAssembly.dll", 0x0408C858, 0xB8, 0x0, 0x20, 0x20, 0x10, 0x90, 0x6E8;
  bool LevelFinished : "GameAssembly.dll", 0x04088988, 0x4A0, 0x98, 0x488, 0xB8, 0x78, 0xB8, 0x378;
  bool Loading : "UnityPlayer.dll", 0x01519D50, 0x0, 0x1F8, 0x218, 0x2A0;
}

startup
{
  settings.Add("RemoveLoads", true, "Remove load times");
}

init
{
  version = "1.0.2"; //this is temporary, I will implement a version check at some point.
  vars.Progress = 0;
}

isLoading { return current.Loading && settings["RemoveLoads"]; }
