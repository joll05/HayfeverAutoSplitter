# HayfeverAutoSplitter
An autosplitter for the game [Hayfever](https://playhayfever.com/), made with auto splitting language (asl) for [Livesplit](https://livesplit.org).

## Usage
To use it, please download the 'HayfeverAutoSplitter.asl' file and add a 'Scriptable Auto Splitter' component to your layout (located under the 'Control' tab). Then, in the settings for the scriptable auto splitter component specify the path of the 'HayfeverAutoSplitter.asl' file. Please note that when you run other games the autosplitter will not do anything.

Note: it will only work on version 1.0.2 of the game (latest version as I am writing this). I will get it to work on other versions in the future.

## Features
+ Pauses timer during loading screens (Togglable)
+ Automatic splitting
    + Decide if you want to split every day, week or month

### Future Additions
+ Automatic starting
    + Will be able to start either on entering a savefile or on entering a level
    + Will reset automatically on restart

## Settings
#### Remove load times
If this is enabled the timer will be paused during loading screens. The time with loads will still be saved in 'Real time', but the time without loads will be saved in 'Game time'.

#### Play levels in the right order
If this is enabled the levels will need to be played in order for it to split. For example, if you complete day 1, then day 2 it will split, but if you then jump straight to day 4 or back to day 1 again it won't split. If it is unchecked it will split whenever you touch Carlie on any level. Please note that you won't be able to select which levels to split on in that case.

#### Split every day
If this is enabled it will split on the end of every day. The tutorial does not count as a day (See [Split after tutorial](#split-after-tutorial)). [Play levels in the right order](#play-levels-in-the-right-order) needs to be enabled for this setting to work.

#### Split every week
If this is enabled it will split on the end of every week. If [Split every day](#split-every-day) is enabled this setting doesn't matter. [Play levels in the right order](#play-levels-in-the-right-order) needs to be enabled for this setting to work.

#### Split every month
If this is enabled it will split on the end of every month. If [Split every day](#split-every-day) or [Split every week](#split-every-week) is enabled this setting doesn't matter. [Play levels in the right order](#play-levels-in-the-right-order) needs to be enabled for this setting to work.

#### Split after tutorial
**This does not work yet!**
If this is enabled it will split after the tutorial is completed. [Play levels in the right order](#play-levels-in-the-right-order) needs to be enabled for this setting to work.

#### Split after Harvey
**This does not work yet!**
If this is enabled it will split after Harvey is completed. Please note that it will split on completing Hard Harvey no matter what. [Play levels in the right order](#play-levels-in-the-right-order) needs to be enabled for this setting to work.
