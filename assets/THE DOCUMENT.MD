###    tenori_on project

 Вместо экспорта в аудио формат(.ogg, .mp3, .flac, .wav, etc.) я решил что будет удобнее и проще экспортировать в некоторый объект паттерна, 
 который будет загружаться и использоваться/звучать благодаря моей tenori-on бибилиотеки, т.е. любая придуманная в этом приложении композиция сможет быть сыграна в любой другой игре
 при поддерки местной tenori_on библиотеки и соответствующей реализации её.
 Более визуальный пример:

     【0】【0】【0】【0】       {1,1,1,1}
     【 】【 】【 】【0】 = 》  {0,0,0,1} => pattern
     【 】【0】【 】【 】 = 》  {0,1,0,0} =>   map
     【0】【 】【 】【 】       {1,0,0,0}



## Structure of pattern:
    (main) author = "HlebLegendarny",
    ^ as always :)

    (main) name = "Name of song",
    
    (main) description = "description of song",
    
    (main) bpm = 69,
    (main) beats = 120,
    (main) duration = beats/bpm,

    (main) loop = true,
    
    (main) audio_data = {data,data1,data2,data3}, 
    ^ data for each track(for example there are four tracks)
    
    (main) audio_map = 
            {
                {1,1,1,1},
                {0,0,0,1},
                {0,1,0,0},
                {1,0,0,0}
            },
    
    (opt) metre = "4/4",
    ^ for offset reasons(??? like перекрёстный ритм)
    
    (opt) automotation_data = {effect, effect1, effect2, effect3},
    ^ none or banch of numerous effects like 1 is reverb 2 is echo etc.
    (opt) automatation_map = {2,0,1,3} 
    ^ using automotation_data to maping tracks

на данный момент у меня на эксперимент 7 бибилиотек и 1 непосредственна для разработки:
            
        общие:
            * class - собственный микро-класс для ООП с поддержкой вывода в дебаг
            ^ lib/common/class.lua

            * scenery - менеджер сцен
            ^ https://github.com/paltze/scenery

            * tick - простой тайминг-менеджер 
            ^ (Возможна замена на knife) https://github.com/rxi/tick
        аудио:
            * lovebpm - для синхронизации с BPM аудио 
            ^ (Возможно пригодится) https://github.com/rxi/lovebpm

            * ripple - аудио-менеджер с тегами, что позволяет гибко крутить аудио в сценах. Вдобавок ко всему включает в себя функционал различных эффектов 
            ^ (Скорее всего не потребуется -- все эффекты включены в love.audio) https://github.com/tesselode/ripple
            
            * wave - бибилиотека с парсингом звука что позволяет манипулировать визуалом относительно проигрываемого трека
            ^ https://github.com/Ulydev/wave

        основная:
            * tenorway - собственно плеер тенорионских паттернов
            ^ lib/tenorway.lua

        для визуала:
            * gooi - удобная ui библиотека с самопровозглашенной поддержкой мобильных устройств 
            ^ https://github.com/gustavostuff/gooi/wiki