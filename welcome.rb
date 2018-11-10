class Welcome
    def initialize
        @welcome_sign = [
            "                                                 o      o        8                              ooooo        ",
            "                                                 8      8        8                                8          ",
            "                                                 8      8 .oPYo. 8 .oPYo. .oPYo. ooYoYo. .oPYo.   8   .oPYo. ",
            "                                                 8  db  8 8oooo8 8 8    ' 8    8 8' 8  8 8oooo8   8   8    8 ",
            "                                                 `b.PY.d' 8.     8 8    . 8    8 8  8  8 8.       8   8    8 ",
            "                                                 `8   8'  `Yooo' 8 `YooP' `YooP' 8  8  8 `Yooo'   8   `YooP' ",
            "                                                                                                             ",
            "                                                 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::",
            "                                                 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
            ]

        @dpl_casino = [
            "        8 888888888o.      8 888888888o   8 8888                   ,o888888o.           .8.            d888888o.    8 8888 b.             8     ,o888888o.",     
            "        8 8888    `^888.   8 8888    `88. 8 8888                  8888     `88.        .888.         .`8888:' `88.  8 8888 888o.          8  . 8888     `88.   ",
            "        8 8888        `88. 8 8888     `88 8 8888               ,8 8888       `8.      :88888.        8.`8888.   Y8  8 8888 Y88888o.       8 ,8 8888       `8b  ",
            "        8 8888         `88 8 8888     ,88 8 8888               88 8888               . `88888.       `8.`8888.      8 8888 .`Y888888o.    8 88 8888        `8b ",
            "        8 8888          88 8 8888.   ,88' 8 8888               88 8888              .8. `88888.       `8.`8888.     8 8888 8o. `Y888888o. 8 88 8888         88 ",
            "        8 8888          88 8 888888888P'  8 8888               88 8888             .8`8. `88888.       `8.`8888.    8 8888 8`Y8o. `Y88888o8 88 8888         88 ",
            "        8 8888         ,88 8 8888         8 8888               88 8888            .8' `8. `88888.       `8.`8888.   8 8888 8   `Y8o. `Y8888 88 8888        ,8P ",
            "        8 8888        ,88' 8 8888         8 8888               `8 8888       .8' .8'   `8. `88888.  8b   `8.`8888.  8 8888 8      `Y8o. `Y8 `8 8888       ,8P  ",
            "        8 8888    ,o88P'   8 8888         8 8888                  8888     ,88' .888888888. `88888. `8b.  ;8.`8888  8 8888 8         `Y8o.`  ` 8888     ,88'   ",
            "        8 888888888P'      8 8888         8 888888888888          `8888888P'  .8'       `8. `88888. `Y8888P ,88P'  8 8888 8            `Yo     `8888888P' "
            ]   
        
        print_logos
        
    end
    def print_logos
        puts
        puts
        puts
        x = 15
        while x > 0
            sleep(0.1)
            puts
            x -= 1
        end
        @welcome_sign.each do | line | 
            sleep (0.1) 
            puts line.light_green
        end
        puts
        @dpl_casino.each do | line |
            sleep(0.1)
            puts line.magenta
        end
        puts
        puts
        puts
    end
end