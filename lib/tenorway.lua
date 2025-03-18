--              PLANS
--  1. Написать всё в одном файле
--  2. Добиться полной независимости 
--   от других библиотек в будущем

local TenorionEnigne = {
    __NAME = "Tenorway";
    __DESCRIPTION = "The simple and very local lib for manipulating and playing specified tenori-on-like patterns for future games OSTs";
    __VERSION = "0.0.1";
    __AUTHOR = "HlebLegendarny";
    __LICENSE = [[None]];
}
local PatternExample = {
    name = "example song",
    author = "HlebLegendarny",
    description = "manual example of pattern",
    bpm = 120,
    beats = 1,
    loop = true,
    audio_data = {"hit-hat","clap","snare","kick"},
    audio_map =
    {
        {0,1,0,1},
        {1,0,1,0},
        {0,1,0,1},
        {1,0,1,0}
    }
}
PatternExample.duration = PatternExample.beats/PatternExample.bpm -- formula

return TenorionEnigne