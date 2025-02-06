// Huge thanks to ate47 for weapon values, vehicle values, etc.
// [D-Pad Up] to open the menu. Shoot to scroll down, aim to scroll up.
init() {
    return true;
}

onPlayerConnect() {
    self.Developer = "SoCanKam";
    self.ShieldClient = true; // Change accordingly.
    level.MenuName = "Beta v1";

    //Every time you add a new menu to the main menu, do it here as well.
    level.MainMenuRegistry = []; // Main Menu
    level.MainMenuRegistry["Server Menu"] = &ServerMenu;
    level.MainMenuRegistry["Personal Menu"] = &PersonalMenu;
    level.MainMenuRegistry["Weapon Options"] = &WeaponsMenu;
    level.MainMenuRegistry["Vehicle Menu"] = &VehicleMenu;
    level.MainMenuRegistry["Zombies Menu"] = &ZombieMenu;
    level.MainMenuRegistry["Teleport Menu"] = &TeleportMenu;
    level.MainMenuRegistry["Character Menu"] = &CharacterMenu;
    level.MainMenuRegistry["All Players Menu"] = &AllPlayersMenu;
    return true;
}

onPlayerSpawned() {
    self endon("disconnect", "spawned_player");
    level endon("end_game", "game_ended");

    self.menu = undefined;

    for (i = 0; i < 75; i++) {
        self iprintln("");
    }

    self thread initializeMenu();
    self thread setupMenu();
    self thread monitorMenuInput();
}

initializeMenu() {
    if (!isDefined(self.menu)) {
        self.menu = [];
        self.menu["items"] = [];
        self.menu["menuParent"] = [];
        self.menu["currentIndex"] = 0;
        self.menu["menuIsOpen"] = false;
    }
}

runMenu(menuKey) {
    if (!isDefined(menuKey)) menuKey = "Main";
    if (!isDefined(self.menu["items"][menuKey])) {
        return;
    }

    if (self.menu["items"][menuKey]["menuIsOpen"]) {
        return;
    }

    if (isDefined(self.menu["currentMenu"]) && isDefined(self.menu["items"][self.menu["currentMenu"]])) {
        prevMenu = self.menu["currentMenu"];
        self.menu["items"][prevMenu]["menuIsOpen"] = false;

        if (!isDefined(self.menu["items"][menuKey]["parentMenu"])) {
            self.menu["items"][menuKey]["parentMenu"] = prevMenu;
        }
    }

    self.menu["items"][menuKey]["menuIsOpen"] = true;
    self.menu["currentMenu"] = menuKey;
    self.menu["currentIndex"] = 0;

    menu = self.menu["items"][menuKey];
    menu["startIndex"] = 0;
    menu["endIndex"] = 8;

    refreshMenuDisplay(menuKey);

    wait 0.1;
    refreshMenuDisplay(menuKey);

    while (self.menu["items"][menuKey]["menuIsOpen"]) {
        if (self AttackButtonPressed()) {
            self.menu["currentIndex"]++;
            if (self.menu["currentIndex"] >= menu["options"].size) {
                self.menu["currentIndex"] = 0;
            }
            wait 0.1;
            refreshMenuDisplay(menuKey);
        } else if (self ADSButtonPressed()) {
            self.menu["currentIndex"]--;
            if (self.menu["currentIndex"] < 0) {
                self.menu["currentIndex"] = menu["options"].size - 1;
            }
            wait 0.1;
            refreshMenuDisplay(menuKey);
        } else if (self MeleeButtonPressed()) {
            if (self.menu["currentMenu"] == "Main") {
                self CloseMenu();
                return;
            } else {
                if (isDefined(self.menu["items"][self.menu["currentMenu"]]["parentMenu"])) {
                    parentMenu = self.menu["items"][self.menu["currentMenu"]]["parentMenu"];

                    self.menu["items"][self.menu["currentMenu"]]["menuIsOpen"] = false;
                    self.menu["items"][self.menu["currentMenu"]]["parentMenu"] = undefined;

                    self runMenu(parentMenu);
                    return;
                }
            wait 0.1;
            }
        } else if (self UseButtonPressed()) {
            if (self.menu["currentIndex"] < menu["options"].size) {
                selectedOption = menu["options"][self.menu["currentIndex"]];

                if (isDefined(selectedOption[3])) {
                    self toggleBoolOption(menuKey);
                } else {
                    selectOption(menuKey);
                }
                wait 0.1;
                refreshMenuDisplay(menuKey);
            }
        }

        wait 0.02;
    }
}

CloseMenu() {
    if (self.ShieldClient) {
        ShieldClearHudElems();
     }

    self EnableWeapons();
    self EnableOffHandWeapons();
    for (i = 0; i < 9; i++) {
        self iPrintln("");
    }

    self.menu["currentMenu"] = "";
    self.menu["currentIndex"] = 0;

    foreach (key, menu in self.menu["items"]) {
        menu["menuIsOpen"] = false;
        menu["parentMenu"] = undefined;
        menu["screenCleared"] = false;
    }
}

refreshMenuDisplay(menuKey) {
    if (!isDefined(self.menu["items"][menuKey]) || !self.menu["items"][menuKey]["menuIsOpen"]) {
        return;
    }

    menu = self.menu["items"][menuKey];

    if (self.ShieldClient) {
        ShieldClearHudElems();
        ShieldHUDS();

        numOptions = menu["options"].size;
        itemsPerPage = 15;
        totalPages = int((numOptions + itemsPerPage - 1) / itemsPerPage);
        currentPage = int(self.menu["currentIndex"] / itemsPerPage) + 1;
        startIndex = (currentPage - 1) * itemsPerPage;
        endIndex = startIndex + itemsPerPage;

        if (endIndex > numOptions) endIndex = numOptions;

        for (i = startIndex; i < endIndex; i++) {
            option = menu["options"][i];
            str = "^5" + option[0];

            if (isDefined(option[3])) {
                str = str + " " + option[3];
            }

            if (i == self.menu["currentIndex"]) {
                str = "^9-> [ " + str + " ^9] <- ";
            }

            hudElemName = "MenuLine" + i;

            ShieldRegisterHudElem(
                hudElemName,
                "",
                0,
                self.Left, self.Top,
                2, 1,
                1, 1,
                0.5
            );

            ShieldHudElemSetText(hudElemName, str);
            self.Top += self.TextSize;
        }

        ShieldRegisterHudElem(
            #"Footer",
            "",
            0,
            self.Left, self.Bottom,
            2, 1,
            1, 1,
            0.5
        );
        ShieldHudElemSetText(#"Header", "^5Current Menu: ^9" + menu["title"]);
        ShieldHudElemSetText(#"Footer", "^8Page " + currentPage + " of " + totalPages + " | ^9" + level.MenuName);
    } 
    else {
        if (!isDefined(menu["screenCleared"]) || !menu["screenCleared"]) {
            for (i = 0; i < 9; i++) {
                self iPrintln("");
            }
            menu["screenCleared"] = true;
        }

        self iPrintln("^4[ ^6Current Menu: ^7" + menu["title"] + " ^4]");

        numOptions = menu["options"].size;
        itemsPerPage = 7;
        totalPages = int((numOptions + itemsPerPage - 1) / itemsPerPage);
        currentPage = int(self.menu["currentIndex"] / itemsPerPage) + 1;
        startIndex = (currentPage - 1) * itemsPerPage;
        endIndex = startIndex + itemsPerPage;

        if (endIndex > numOptions) endIndex = numOptions;

        for (i = startIndex; i < endIndex; i++) {
            option = menu["options"][i];
            str = option[0];

            if (isDefined(option[3])) {
                str = str + " " + option[3];
            }

            if (i == self.menu["currentIndex"]) {
                str = "^4| ^3" + str + "^4|";
            }

            self iPrintln(str);
        }

        self iPrintln("^4[Page " + currentPage + " of " + totalPages + "]");

        remainingLines = 8 - (endIndex - startIndex + 1);
        for (i = 0; i < remainingLines; i++) {
            self iPrintln("");
        }
    }
}

ShieldHUDS(){
        self.Top = -615;
        self.Bottom = 65;
        self.Left = -875 - 400;

        self.TextSize = 31;
        self.Size = 8;

        for (i = 0; i < 40; i++)
            ShieldRegisterHudElem(#"TitleBar" + i, "^8_", 0xFFFFC0EB,
            -199 + i * 10, 93,
            1, 0,
            0, 0,
            0.50
            );

        for (i = 0; i < 40; i++)
            ShieldRegisterHudElem(#"FooterBar" + i, "^8_", 0xFFFFC0EB,
            -199 + i * 10, 740,
            1, 0,
            0, 0,
            0.50
            );

        for (i = 0; i < 40; i++)
            ShieldRegisterHudElem(#"X1" + i, "^8_", 0xFFFFC0EB,
            -199 + i * 10, 85 - 40,
            1, 0,
            0, 0,
            0.50
            );

        for (i = 0; i < 40; i++)
            ShieldRegisterHudElem(#"X2" + i, "^8_", 0xFFFFC0EB,
            -199 + i * 10, 825 - 40,
            1, 0,
            0, 0,
            0.50
            );

        for (i = 0; i < 37; i++)
            ShieldRegisterHudElem(#"Y1" + i, "^8|", 0xFFFFC0EB,
            199, 105 + i * 20 - 40,
            1, 0,
            0, 0,
            0.50
            );

        for (i = 0; i < 37; i++)
            ShieldRegisterHudElem(#"Y2" + i, "^8|", 0xFFFFC0EB,
            -202, 105 + i * 20 - 40,
            1, 0,
            0, 0,
            0.50
            );

        ShieldRegisterHudElem(
            #"Header",
            "",
            0,
            self.Left, self.Top -15,
            2, 1,
            1, 1,
            0.6
        );

        self.Top += self.TextSize;

        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"TitleBar" + i, "^8_");
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"FooterBar" + i, "^8_");
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"X1" + i, "^8_");
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"X2" + i, "^8_");
        for (i = 0; i < 35; i++) ShieldHudElemSetText(#"Y1" + i, "^8|");
        for (i = 0; i < 35; i++) ShieldHudElemSetText(#"Y2" + i, "^8|");
}

CallFunction(function, params) {
    if (!isDefined(function))
        return;

    if (isString(params)) {
        return self thread [[function]](params);
    }

    numParams = params.size;
    if (numParams >= 6) {
        return self thread [[function]](params[0], params[1], params[2], params[3], params[4], params[5]);
    } else if (numParams >= 5) {
        return self thread [[function]](params[0], params[1], params[2], params[3], params[4]);
    } else if (numParams >= 4) {
        return self thread [[function]](params[0], params[1], params[2], params[3]);
    } else if (numParams >= 3) {
        return self thread [[function]](params[0], params[1], params[2]);
    } else if (numParams >= 2) {
        return self thread [[function]](params[0], params[1]);
    } else if (numParams >= 1) {
        return self thread [[function]](params[0]);
    }

    return self thread [[function]]();
}

selectOption(menuKey) {
    menu = self.menu["items"][menuKey];
    selectedOption = menu["options"][self.menu["currentIndex"]];

    if (isDefined(selectedOption[1])) {
        func = selectedOption[1];
        params = selectedOption[2];

        CallFunction(func, params);
    }
}

monitorMenuInput() {
    self endon("disconnect");

    while (true) {
        if (self ActionSlotOneButtonPressed()) {
            if (!isDefined(self.menu["items"]["Main"]["menuIsOpen"]) || !self.menu["items"]["Main"]["menuIsOpen"]) {
                self.menu["currentIndex"] = 0;
                self runMenu("Main");
            }
        }
        wait 0.2;
    }
}

createMenu(menuKey, title) {
    if (!isDefined(self.menu["items"][menuKey])) {
        self.menu["items"][menuKey] = [];
        self.menu["items"][menuKey]["title"] = title;
        self.menu["items"][menuKey]["options"] = [];
        self.menu["items"][menuKey]["menuIsOpen"] = false;
    }
}

addToggleOption(menuKey, name, func, initialState) {
    if (!isDefined(self.menu["items"][menuKey])) {
        return;
    }

    menu = self.menu["items"][menuKey];
    count = menu["options"].size;

    menu["options"][count] = [];
    menu["options"][count][0] = name;
    menu["options"][count][1] = func;
    menu["options"][count][2] = undefined;
    menu["options"][count][3] = initialState ? "^8[^2ON^8]" : "^8[^1OFF^8]";
    menu["options"][count][4] = initialState;

    if (!isDefined(self.menu["dynamicVars"])) {
        self.menu["dynamicVars"] = [];
    }

    if (!isDefined(self.menu["dynamicVars"][name])) {
        self.menu["dynamicVars"][name] = initialState;
    }
}

toggleBoolOption(menuKey) {
    menu = self.menu["items"][menuKey];
    if (!isDefined(menu)) {
        return;
    }

    selectedOption = menu["options"][self.menu["currentIndex"]];
    if (!isDefined(selectedOption)) {
        return;
    }

    optionName = selectedOption[0];
    if (!isDefined(optionName)) {
        return;
    }

    if (!isDefined(self.menu["dynamicVars"])) {
        self.menu["dynamicVars"] = [];
    }

    if (!isDefined(self.menu["dynamicVars"][optionName])) {
        self.menu["dynamicVars"][optionName] = selectedOption[4];
    }

    self.menu["dynamicVars"][optionName] = !self.menu["dynamicVars"][optionName];

    selectedOption[4] = self.menu["dynamicVars"][optionName];
    selectedOption[3] = selectedOption[4] ? "^8[^2ON^8]" : "^8[^1OFF^8]";

    //self iprintln(optionName + " is now " + selectedOption[3]);

    if (isDefined(selectedOption[1])) {
        func = selectedOption[1];
        self thread [[func]]();
    }

    refreshMenuDisplay(menuKey);
}

addOption(menuKey, name, func, params) {
    if (!isDefined(self.menu["items"][menuKey])) {
        return;
    }
    menu = self.menu["items"][menuKey];
    option = [];
    option[0] = name;
    option[1] = func;
    option[2] = params;
    menu["options"][menu["options"].size] = option;
}

setupMenu() {
    if (!isDefined(self.menu)) {
        self thread initializeMenu();
    } else {
         self.menu["items"] = [];
    }

    self createMenu("Main", "Main Menu");
    self addOption("Main", "Server Menu", &OpenSubMenu, "ServerMenu");
    self addOption("Main", "Personal Menu", &OpenSubMenu, "PersonalMenu");
    self addOption("Main", "Weapons Menu", &OpenSubMenu, "WeaponOptions");
    self addOption("Main", "Vehicle Menu", &OpenSubMenu, "VehicleMenu");
    self addOption("Main", "Zombies Menu", &OpenSubMenu, "ZombieMenu");
    self addOption("Main", "Teleport Menu", &OpenSubMenu, "TeleportMenu");
    self addOption("Main", "Character Menu", &OpenSubMenu, "CharacterMenu");
    self addOption("Main", "All Players Menu", &OpenSubMenu, "AllPlayersMenu");

    foreach (menuKey, initFunction in level.MainMenuRegistry) {
        self thread [[initFunction]]();
    }
}

OpenSubMenu(menuKey) {
    if (!isDefined(self.menu["items"][menuKey])) {
        return;
    }
    self runMenu(menuKey);

    refreshMenuDisplay(menuKey);
}

GoBack(parentMenu) {
    self runMenu(parentMenu);
}

CurrentMapName()
{
    return util::get_map_name();
}