CharacterMenu(){
    init_characters();
    init_outfits();

    self createMenu("CharacterMenu", "Character Menu");
    self addOption("CharacterMenu", "Change Character", &OpenSubMenu, "ChangeCharacter");
    if(Multiplayer() || Blackout()){
        self addOption("CharacterMenu", "Change Outfit", &OpenSubMenu, "ChangeOutfit");
    }

    self createMenu("ChangeCharacter", "Character Menu");
    if(Multiplayer()){
        self addOption("ChangeCharacter", "John Doe", &SetCharacter, "JohnDoe");
        self addOption("ChangeCharacter", "Jane Doe", &SetCharacter, "JaneDoe");
        self addOption("ChangeCharacter", "Ajax", &SetCharacter, "Ajax");
        self addOption("ChangeCharacter", "Battery", &SetCharacter, "Battery");
        self addOption("ChangeCharacter", "Crash", &SetCharacter, "Crash");
        self addOption("ChangeCharacter", "Firebreak", &SetCharacter, "Firebreak");
        self addOption("ChangeCharacter", "Nomad", &SetCharacter, "Nomad");
        self addOption("ChangeCharacter", "Prophet", &SetCharacter, "Prophet");
        self addOption("ChangeCharacter", "Recon", &SetCharacter, "Recon");
        self addOption("ChangeCharacter", "Ruin", &SetCharacter, "Ruin");
        self addOption("ChangeCharacter", "Seraph", &SetCharacter, "Seraph");
        self addOption("ChangeCharacter", "Torque", &SetCharacter, "Torque");
        self addOption("ChangeCharacter", "Zero", &SetCharacter, "Zero");
        self addOption("ChangeCharacter", "Outrider", &SetCharacter, "Outrider");
        self addOption("ChangeCharacter", "Spectre", &SetCharacter, "Spectre");
        self addOption("ChangeCharacter", "Reaper", &SetCharacter, "Reaper");
    }
    if(Zombies()) {
        self addOption("ChangeCharacter", "Scarlett", &SetCharacter, "Scarlett");
        self addOption("ChangeCharacter", "Bruno", &SetCharacter, "Bruno");
        self addOption("ChangeCharacter", "Diego", &SetCharacter, "Diego");
        self addOption("ChangeCharacter", "Shaw", &SetCharacter, "Shaw");
        self addOption("ChangeCharacter", "Richtofen (Primis)", &SetCharacter, "Richtofen_Primis");
        self addOption("ChangeCharacter", "Dempsey (Primis)", &SetCharacter, "Dempsey_Primis");
        self addOption("ChangeCharacter", "Nikolai (Primis)", &SetCharacter, "Nikolai_Primis");
        self addOption("ChangeCharacter", "Takeo (Primis)", &SetCharacter, "Takeo_Primis");
        self addOption("ChangeCharacter", "Christina Fowler", &SetCharacter, "ChristinaFowler");
        self addOption("ChangeCharacter", "Jonathan Warwick", &SetCharacter, "JonathanWarwick");
        self addOption("ChangeCharacter", "Gideon Jones", &SetCharacter, "GideonJones");
        self addOption("ChangeCharacter", "Godfrey", &SetCharacter, "Godfrey");
        self addOption("ChangeCharacter", "Bruno (IX)", &SetCharacter, "Bruno_IX");
        self addOption("ChangeCharacter", "Diego (IX)", &SetCharacter, "Diego_IX");
        self addOption("ChangeCharacter", "Scarlett (IX)", &SetCharacter, "Scarlett_IX");
        self addOption("ChangeCharacter", "Shaw (IX)", &SetCharacter, "Shaw_IX");
        self addOption("ChangeCharacter", "Dempsey (Ultimis)", &SetCharacter, "Dempsey_Ultimis");
        self addOption("ChangeCharacter", "Nikolai (Ultimis)", &SetCharacter, "Nikolai_Ultimis");
        self addOption("ChangeCharacter", "Richtofen (Ultimis)", &SetCharacter, "Richtofen_Ultimis");
        self addOption("ChangeCharacter", "Takeo (Ultimis)", &SetCharacter, "Takeo_Ultimis");
        self addOption("ChangeCharacter", "Dempsey (Ultimis/AO)", &SetCharacter, "Dempsey_Ultimis_AO");
        self addOption("ChangeCharacter", "Nikolai (Ultimis/AO)", &SetCharacter, "Nikolai_Ultimis_AO");
        self addOption("ChangeCharacter", "Richtofen (Ultimis/AO)", &SetCharacter, "Richtofen_Ultimis_AO");
        self addOption("ChangeCharacter", "Takeo (Ultimis/AO)", &SetCharacter, "Takeo_Ultimis_AO");
        self addOption("ChangeCharacter", "Russman", &SetCharacter, "Russman");
        self addOption("ChangeCharacter", "Misty (Abigail Briarton)", &SetCharacter, "Misty_Abigail");
        self addOption("ChangeCharacter", "Marlton Johnson", &SetCharacter, "MarltonJohnson");
        self addOption("ChangeCharacter", "Samuel Stuhlinger", &SetCharacter, "SamuelStuhlinger");
        self addOption("ChangeCharacter", "Richtofen 2", &SetCharacter, "Richtofen2");
    }
    if(Blackout()) {
        self addOption("ChangeCharacter", "Ajax", &SetCharacter, "bo_Ajax");
        self addOption("ChangeCharacter", "Battery", &SetCharacter, "bo_Battery");
        self addOption("ChangeCharacter", "Crash", &SetCharacter, "bo_Crash");
        self addOption("ChangeCharacter", "Firebreak", &SetCharacter, "bo_Firebreak");
        self addOption("ChangeCharacter", "Nomad", &SetCharacter, "bo_Nomad");
        self addOption("ChangeCharacter", "Prophet", &SetCharacter, "bo_Prophet");
        self addOption("ChangeCharacter", "Recon", &SetCharacter, "bo_Recon");
        self addOption("ChangeCharacter", "Ruin", &SetCharacter, "bo_Ruin");
        self addOption("ChangeCharacter", "Seraph", &SetCharacter, "bo_Seraph");
        self addOption("ChangeCharacter", "Torque", &SetCharacter, "bo_Torque");
        self addOption("ChangeCharacter", "Dempsey (Ultimis)", &SetCharacter, "bo_Dempsey_Ultimis");
        self addOption("ChangeCharacter", "Nikolai (Ultimis)", &SetCharacter, "bo_Nikolai_Ultimis");
        self addOption("ChangeCharacter", "Richtofen (Ultimis)", &SetCharacter, "bo_Richtofen_Ultimis");
        self addOption("ChangeCharacter", "Takeo (Ultimis)", &SetCharacter, "bo_Takeo_Ultimis");
        self addOption("ChangeCharacter", "Dempsey (Primis)", &SetCharacter, "bo_Dempsey_Primis");
        self addOption("ChangeCharacter", "Nikolai (Primis)", &SetCharacter, "bo_Nikolai_Primis");
        self addOption("ChangeCharacter", "Richtofen (Primis)", &SetCharacter, "bo_Richtofen_Primis");
        self addOption("ChangeCharacter", "Takeo (Primis)", &SetCharacter, "bo_Takeo_Primis");
        self addOption("ChangeCharacter", "Shadow Man", &SetCharacter, "bo_Shadowman");
        self addOption("ChangeCharacter", "Bruno", &SetCharacter, "bo_Bruno");
        self addOption("ChangeCharacter", "Diego", &SetCharacter, "bo_Diego");
        self addOption("ChangeCharacter", "Scarlett", &SetCharacter, "bo_Scarlett");
        self addOption("ChangeCharacter", "Shaw", &SetCharacter, "bo_Shaw");
        self addOption("ChangeCharacter", "Bruno (IX)", &SetCharacter, "bo_Bruno_IX");
        self addOption("ChangeCharacter", "Diego (IX)", &SetCharacter, "bo_Diego_IX");
        self addOption("ChangeCharacter", "Scarlett (IX)", &SetCharacter, "bo_Scarlett_IX");
        self addOption("ChangeCharacter", "Shaw (IX)", &SetCharacter, "bo_Shaw_IX");
        self addOption("ChangeCharacter", "Reznov", &SetCharacter, "bo_Reznov");
        self addOption("ChangeCharacter", "Mason", &SetCharacter, "bo_Mason");
        self addOption("ChangeCharacter", "Woods", &SetCharacter, "bo_Woods");
        self addOption("ChangeCharacter", "Menendez", &SetCharacter, "bo_Menendez");
        self addOption("ChangeCharacter", "Player Man 1", &SetCharacter, "bo_PlayerMan1");
        self addOption("ChangeCharacter", "Player Man 2", &SetCharacter, "bo_PlayerMan2");
        self addOption("ChangeCharacter", "Player Man 3", &SetCharacter, "bo_PlayerMan3");
        self addOption("ChangeCharacter", "Player Man 4", &SetCharacter, "bo_PlayerMan4");
        self addOption("ChangeCharacter", "Player Woman 1", &SetCharacter, "bo_PlayerWoman1");
        self addOption("ChangeCharacter", "Player Woman 2", &SetCharacter, "bo_PlayerWoman2");
        self addOption("ChangeCharacter", "Player Woman 3", &SetCharacter, "bo_PlayerWoman3");
        self addOption("ChangeCharacter", "Player Woman 4", &SetCharacter, "bo_PlayerWoman4");
        self addOption("ChangeCharacter", "Hudson", &SetCharacter, "bo_Hudson");
        self addOption("ChangeCharacter", "Player Level 20", &SetCharacter, "bo_Player_Lvl20");
        self addOption("ChangeCharacter", "Player Level 40", &SetCharacter, "bo_Player_Lvl40");
        self addOption("ChangeCharacter", "Player Level 60", &SetCharacter, "bo_Player_Lvl60");
        self addOption("ChangeCharacter", "Player Level 80", &SetCharacter, "bo_Player_Lvl80");
        self addOption("ChangeCharacter", "Player Level 81", &SetCharacter, "bo_Player_Lvl81");
        self addOption("ChangeCharacter", "Zero", &SetCharacter, "bo_Zero");
        self addOption("ChangeCharacter", "Reaper (Classic)", &SetCharacter, "bo_Reaper_Classic");
        self addOption("ChangeCharacter", "Outrider", &SetCharacter, "bo_Outrider");
        self addOption("ChangeCharacter", "Misty (Abigail Briarton)", &SetCharacter, "bo_Misty");
        self addOption("ChangeCharacter", "Warden", &SetCharacter, "bo_Warden");
        self addOption("ChangeCharacter", "Cosmo", &SetCharacter, "bo_Cosmo");
        self addOption("ChangeCharacter", "Mason (Kid)", &SetCharacter, "bo_Mason_Kid");
        self addOption("ChangeCharacter", "John Doe", &SetCharacter, "bo_ZombieJoe");
        self addOption("ChangeCharacter", "Hudson (Cool)", &SetCharacter, "bo_Hudson_Cool");
        self addOption("ChangeCharacter", "Jane Doe", &SetCharacter, "bo_ZombieJane");
        self addOption("ChangeCharacter", "The Replacer", &SetCharacter, "bo_Replacer");
        self addOption("ChangeCharacter", "Spectre", &SetCharacter, "bo_Spectre");
        self addOption("ChangeCharacter", "Blackjack", &SetCharacter, "bo_Blackjack");
        self addOption("ChangeCharacter", "Sergei", &SetCharacter, "bo_Sergei");
        self addOption("ChangeCharacter", "Sarah Hall", &SetCharacter, "bo_SarahHall");
        self addOption("ChangeCharacter", "Woods (Old)", &SetCharacter, "bo_Woods_Old");
        self addOption("ChangeCharacter", "Menendez (Top1)", &SetCharacter, "bo_Menendez_Top1");
        self addOption("ChangeCharacter", "The Replacer (Green)", &SetCharacter, "bo_Replacer_Green");
        self addOption("ChangeCharacter", "Trejo", &SetCharacter, "bo_Trejo");
        self addOption("ChangeCharacter", "Russman", &SetCharacter, "bo_Russman");
        self addOption("ChangeCharacter", "M. Shadows", &SetCharacter, "bo_MShadows");
        self addOption("ChangeCharacter", "Reaper", &SetCharacter, "bo_Reaper");
        self addOption("ChangeCharacter", "Price (Classic)", &SetCharacter, "bo_Price_Classic");
        self addOption("ChangeCharacter", "T.E.D.D.", &SetCharacter, "bo_TEDD");
        self addOption("ChangeCharacter", "Weaver", &SetCharacter, "bo_Weaver");
        self addOption("ChangeCharacter", "Pentagon Thief", &SetCharacter, "bo_Pentagon_Thief");
        self addOption("ChangeCharacter", "Stuhlinger", &SetCharacter, "bo_Stuhlinger");
        self addOption("ChangeCharacter", "Marlton", &SetCharacter, "bo_Marlton");
    }

    self createMenu("ChangeOutfit", "Outfit Menu");
    self addOption("ChangeOutfit", "Ajax Outfits", &OpenSubMenu, "AjaxOutfits");
    self addOption("ChangeOutfit", "Battery Outfits", &OpenSubMenu, "BatteryOutfits");
    self addOption("ChangeOutfit", "Crash Outfits", &OpenSubMenu, "CrashOutfits");
    self addOption("ChangeOutfit", "Firebreak Outfits", &OpenSubMenu, "FirebreakOutfits");
    self addOption("ChangeOutfit", "Nomad Outfits", &OpenSubMenu, "NomadOutfits");
    self addOption("ChangeOutfit", "Outrider Outfits", &OpenSubMenu, "OutriderOutfits");
    self addOption("ChangeOutfit", "Prophet Outfits", &OpenSubMenu, "ProphetOutfits");
    self addOption("ChangeOutfit", "Reaper Outfits", &OpenSubMenu, "ReaperOutfits");
    self addOption("ChangeOutfit", "Recon Outfits", &OpenSubMenu, "ReconOutfits");
    self addOption("ChangeOutfit", "Ruin Outfits", &OpenSubMenu, "RuinOutfits");
    self addOption("ChangeOutfit", "Seraph Outfits", &OpenSubMenu, "SeraphOutfits");
    self addOption("ChangeOutfit", "Spectre Outfits", &OpenSubMenu, "SpectreOutfits");
    self addOption("ChangeOutfit", "Torque Outfits", &OpenSubMenu, "TorqueOutfits");
    self addOption("ChangeOutfit", "Zero Outfits", &OpenSubMenu, "ZeroOutfits");

    self createMenu("AjaxOutfits", "Ajax Outfits");
    self addOption("AjaxOutfits", "Chef", &SetOutfit, "Ajax_Chef");
    self addOption("AjaxOutfits", "Heist", &SetOutfit, "Ajax_Heist");
    self addOption("AjaxOutfits", "Money", &SetOutfit, "Ajax_Money");
    self addOption("AjaxOutfits", "Number", &SetOutfit, "Ajax_Number");
    self addOption("AjaxOutfits", "Twitch", &SetOutfit, "Ajax_Twitch");

    self createMenu("BatteryOutfits", "Battery Outfits");
    self addOption("BatteryOutfits", "Aviator", &SetOutfit, "Battery_Aviator");
    self addOption("BatteryOutfits", "Criminal", &SetOutfit, "Battery_Criminal");
    self addOption("BatteryOutfits", "Number", &SetOutfit, "Battery_Number");
    self addOption("BatteryOutfits", "Money", &SetOutfit, "Battery_Money");
    self addOption("BatteryOutfits", "Twitter", &SetOutfit, "Battery_Twitter");

    self createMenu("CrashOutfits", "Crash Outfits");
    self addOption("CrashOutfits", "Banana", &SetOutfit, "Crash_Banana");
    self addOption("CrashOutfits", "Magnum", &SetOutfit, "Crash_Magnum");
    self addOption("CrashOutfits", "Money", &SetOutfit, "Crash_Money");
    self addOption("CrashOutfits", "Number", &SetOutfit, "Crash_Number");
    self addOption("CrashOutfits", "Rambo", &SetOutfit, "Crash_Rambo");
    self addOption("CrashOutfits", "Rigor Mortis", &SetOutfit, "Crash_RigorMortis");
    self addOption("CrashOutfits", "Spectre", &SetOutfit, "Crash_Spectre");
    self addOption("CrashOutfits", "Twitch", &SetOutfit, "Crash_Twitch");

    self createMenu("FirebreakOutfits", "Firebreak Outfits");
    self addOption("FirebreakOutfits", "Money", &SetOutfit, "Firebreak_Money");
    self addOption("FirebreakOutfits", "Number", &SetOutfit, "Firebreak_Number");
    self addOption("FirebreakOutfits", "Rabbit", &SetOutfit, "Firebreak_Rabbit");
    self addOption("FirebreakOutfits", "Silverfish", &SetOutfit, "Firebreak_Silverfish");

    self createMenu("NomadOutfits", "Nomad Outfits");
    self addOption("NomadOutfits", "80", &SetOutfit, "Nomad_80");
    self addOption("NomadOutfits", "Elvis", &SetOutfit, "Nomad_Elvis");
    self addOption("NomadOutfits", "Money", &SetOutfit, "Nomad_Money");
    self addOption("NomadOutfits", "Number", &SetOutfit, "Nomad_Number");
    self addOption("NomadOutfits", "Twitch", &SetOutfit, "Nomad_Twitch");
    self addOption("NomadOutfits", "Pirate", &SetOutfit, "Nomad_Pirate");
    self addOption("NomadOutfits", "Werewolf", &SetOutfit, "Nomad_Werewolf");
    self addOption("NomadOutfits", "Zombie", &SetOutfit, "Nomad_Zombie");

    self createMenu("OutriderOutfits", "Outrider Outfits");
    self addOption("OutriderOutfits", "Blank", &SetOutfit, "Outrider_Blank");
    self addOption("OutriderOutfits", "Cheerleader", &SetOutfit, "Outrider_Cheerleader");
    self addOption("OutriderOutfits", "Heroes", &SetOutfit, "Outrider_Heroes");
    self addOption("OutriderOutfits", "Money", &SetOutfit, "Outrider_Money");
    self addOption("OutriderOutfits", "Number", &SetOutfit, "Outrider_Number");
    self addOption("OutriderOutfits", "Pirate", &SetOutfit, "Outrider_Pirate");

    self createMenu("ProphetOutfits", "Prophet Outfits");
    self addOption("ProphetOutfits", "Money", &SetOutfit, "Prophet_Money");
    self addOption("ProphetOutfits", "Number", &SetOutfit, "Prophet_Number");
    self addOption("ProphetOutfits", "Pirate", &SetOutfit, "Prophet_Pirate");
    self addOption("ProphetOutfits", "Plague", &SetOutfit, "Prophet_Plague");
    self addOption("ProphetOutfits", "Space", &SetOutfit, "Prophet_Space");
    self addOption("ProphetOutfits", "Twitch", &SetOutfit, "Prophet_Twitch");

    self createMenu("ReaperOutfits", "Reaper Outfits");
    self addOption("ReaperOutfits", "Spectre", &SetOutfit, "Reaper_Spectre");
    self addOption("ReaperOutfits", "Punk", &SetOutfit, "Reaper_Punk");
    self addOption("ReaperOutfits", "Number", &SetOutfit, "Reaper_Number");

    self createMenu("ReconOutfits", "Recon Outfits");
    self addOption("ReconOutfits", "Money", &SetOutfit, "Recon_Money");
    self addOption("ReconOutfits", "Number", &SetOutfit, "Recon_Number");
    self addOption("ReconOutfits", "Fish", &SetOutfit, "Recon_Fish");
    self addOption("ReconOutfits", "Snake", &SetOutfit, "Recon_Snake");
    self addOption("ReconOutfits", "Twitch", &SetOutfit, "Recon_Twitch");

    self createMenu("RuinOutfits", "Ruin Outfits");
    self addOption("RuinOutfits", "Biker", &SetOutfit, "Ruin_Biker");
    self addOption("RuinOutfits", "Hero", &SetOutfit, "Ruin_Hero");
    self addOption("RuinOutfits", "Money", &SetOutfit, "Ruin_Money");
    self addOption("RuinOutfits", "Muertos", &SetOutfit, "Ruin_Muertos");
    self addOption("RuinOutfits", "Number", &SetOutfit, "Ruin_Number");
    self addOption("RuinOutfits", "Police", &SetOutfit, "Ruin_Police");
    self addOption("RuinOutfits", "Twitch", &SetOutfit, "Ruin_Twitch");
    self addOption("RuinOutfits", "Zombie", &SetOutfit, "Ruin_Zombie");

    self createMenu("SeraphOutfits", "Seraph Outfits");
    self addOption("SeraphOutfits", "Heist", &SetOutfit, "Seraph_Heist");
    self addOption("SeraphOutfits", "Hero", &SetOutfit, "Seraph_Hero");
    self addOption("SeraphOutfits", "Money", &SetOutfit, "Seraph_Money");
    self addOption("SeraphOutfits", "Number", &SetOutfit, "Seraph_Number");
    self addOption("SeraphOutfits", "Police", &SetOutfit, "Seraph_Police");
    self addOption("SeraphOutfits", "Twitch", &SetOutfit, "Seraph_Twitch");
    self addOption("SeraphOutfits", "Vampire", &SetOutfit, "Seraph_Vampire");

    self createMenu("SpectreOutfits", "Spectre Outfits");
    self addOption("SpectreOutfits", "Apocalypse Z", &SetOutfit, "Spectre_ApocalypseZ");
    self addOption("SpectreOutfits", "Hero", &SetOutfit, "Spectre_Hero");
    self addOption("SpectreOutfits", "Japan", &SetOutfit, "Spectre_Japan");
    self addOption("SpectreOutfits", "Number", &SetOutfit, "Spectre_Number");
    self addOption("SpectreOutfits", "Twitch", &SetOutfit, "Spectre_Twitch");

    self createMenu("TorqueOutfits", "Torque Outfits");
    self addOption("TorqueOutfits", "Money", &SetOutfit, "Torque_Money");
    self addOption("TorqueOutfits", "Number", &SetOutfit, "Torque_Number");
    self addOption("TorqueOutfits", "Twitch", &SetOutfit, "Torque_Twitch");
    self addOption("TorqueOutfits", "Zombie Killer", &SetOutfit, "Torque_ZombieKiller");

    self createMenu("ZeroOutfits", "Zero Outfits");
    self addOption("ZeroOutfits", "Dark", &SetOutfit, "Zero_Dark");
    self addOption("ZeroOutfits", "Hero", &SetOutfit, "Zero_Hero");
    self addOption("ZeroOutfits", "Money", &SetOutfit, "Zero_Money");
    self addOption("ZeroOutfits", "Number", &SetOutfit, "Zero_Number");
    self addOption("ZeroOutfits", "Pirate", &SetOutfit, "Zero_Pirate");
    self addOption("ZeroOutfits", "Twitch", &SetOutfit, "Zero_Twitch");
    self addOption("ZeroOutfits", "Water", &SetOutfit, "Zero_Water");
    self addOption("ZeroOutfits", "Zombie", &SetOutfit, "Zero_Zombie");
}

init_characters(){
    self.Characters = undefined;

    // Multiplayer
    self.Characters["JohnDoe"] = 15;
    self.Characters["JaneDoe"] = 16;
    self.Characters["Ajax"] = 1;
    self.Characters["Battery"] = 2;
    self.Characters["Crash"] = 3;
    self.Characters["Firebreak"] = 4;
    self.Characters["Nomad"] = 5;
    self.Characters["Prophet"] = 6;
    self.Characters["Recon"] = 7;
    self.Characters["Ruin"] = 8;
    self.Characters["Seraph"] = 9;
    self.Characters["Torque"] = 10;
    self.Characters["Zero"] = 11;
    self.Characters["Outrider"] = 12;
    self.Characters["Spectre"] = 13;
    self.Characters["Reaper"] = 14;

    // Zombies
    self.Characters["Scarlett"] = 1;
    self.Characters["Bruno"] = 2;
    self.Characters["Diego"] = 3;
    self.Characters["Shaw"] = 4;
    self.Characters["Richtofen_Primis"] = 5;
    self.Characters["Dempsey_Primis"] = 6;
    self.Characters["Nikolai_Primis"] = 7;
    self.Characters["Takeo_Primis"] = 8;
    self.Characters["ChristinaFowler"] = 9;
    self.Characters["JonathanWarwick"] = 10;
    self.Characters["GideonJones"] = 11;
    self.Characters["Godfrey"] = 12;
    self.Characters["Bruno_IX"] = 13;
    self.Characters["Diego_IX"] = 14;
    self.Characters["Scarlett_IX"] = 15;
    self.Characters["Shaw_IX"] = 16;
    self.Characters["Dempsey_Ultimis"] = 17;
    self.Characters["Nikolai_Ultimis"] = 18;
    self.Characters["Richtofen_Ultimis"] = 19;
    self.Characters["Takeo_Ultimis"] = 20;
    self.Characters["Dempsey_Ultimis_AO"] = 21;
    self.Characters["Nikolai_Ultimis_AO"] = 22;
    self.Characters["Richtofen_Ultimis_AO"] = 23;
    self.Characters["Takeo_Ultimis_AO"] = 24;
    self.Characters["Russman"] = 25;
    self.Characters["Misty_Abigail"] = 26;
    self.Characters["MarltonJohnson"] = 27;
    self.Characters["SamuelStuhlinger"] = 28;
    self.Characters["Richtofen2"] = 29;

    // Blackout
    self.Characters["bo_Ajax"] = 1;
    self.Characters["bo_Battery"] = 2;
    self.Characters["bo_Crash"] = 3;
    self.Characters["bo_Firebreak"] = 4;
    self.Characters["bo_Nomad"] = 5;
    self.Characters["bo_Prophet"] = 6;
    self.Characters["bo_Recon"] = 7;
    self.Characters["bo_Ruin"] = 8;
    self.Characters["bo_Seraph"] = 9;
    self.Characters["bo_Torque"] = 10;
    self.Characters["bo_Dempsey_Ultimis"] = 11;
    self.Characters["bo_Nikolai_Ultimis"] = 12;
    self.Characters["bo_Richtofen_Ultimis"] = 13;
    self.Characters["bo_Takeo_Ultimis"] = 14;
    self.Characters["bo_Dempsey_Primis"] = 15;
    self.Characters["bo_Nikolai_Primis"] = 16;
    self.Characters["bo_Richtofen_Primis"] = 17;
    self.Characters["bo_Takeo_Primis"] = 18;
    self.Characters["bo_Shadowman"] = 19;
    self.Characters["bo_Bruno"] = 20;
    self.Characters["bo_Diego"] = 21;
    self.Characters["bo_Scarlett"] = 22;
    self.Characters["bo_Shaw"] = 23;
    self.Characters["bo_Bruno_IX"] = 24;
    self.Characters["bo_Diego_IX"] = 25;
    self.Characters["bo_Scarlett_IX"] = 26;
    self.Characters["bo_Shaw_IX"] = 27;
    self.Characters["bo_Reznov"] = 28;
    self.Characters["bo_Mason"] = 29;
    self.Characters["bo_Woods"] = 30;
    self.Characters["bo_Menendez"] = 31;
    self.Characters["bo_PlayerMan1"] = 32;
    self.Characters["bo_PlayerMan2"] = 33;
    self.Characters["bo_PlayerMan3"] = 34;
    self.Characters["bo_PlayerMan4"] = 35;
    self.Characters["bo_PlayerWoman1"] = 36;
    self.Characters["bo_PlayerWoman2"] = 37;
    self.Characters["bo_PlayerWoman3"] = 38;
    self.Characters["bo_PlayerWoman4"] = 39;
    self.Characters["bo_Hudson"] = 40;
    self.Characters["bo_Player_Lvl20"] = 41;
    self.Characters["bo_Player_Lvl40"] = 42;
    self.Characters["bo_Player_Lvl60"] = 43;
    self.Characters["bo_Player_Lvl80"] = 44;
    self.Characters["bo_Player_Lvl81"] = 45;
    self.Characters["bo_Zero"] = 46;
    self.Characters["bo_Reaper_Classic"] = 47;
    self.Characters["bo_Outrider"] = 48;
    self.Characters["bo_Misty"] = 49;
    self.Characters["bo_Warden"] = 50;
    self.Characters["bo_Cosmo"] = 51;
    self.Characters["bo_Mason_Kid"] = 52;
    self.Characters["bo_ZombieJoe"] = 53;
    self.Characters["bo_Hudson_Cool"] = 54;
    self.Characters["bo_ZombieJane"] = 55;
    self.Characters["bo_Replacer"] = 56;
    self.Characters["bo_Spectre"] = 57;
    self.Characters["bo_Blackjack"] = 58;
    self.Characters["bo_Sergei"] = 59;
    self.Characters["bo_SarahHall"] = 60;
    self.Characters["bo_Woods_Old"] = 61;
    self.Characters["bo_Menendez_Top1"] = 62;
    self.Characters["bo_Replacer_Green"] = 63;
    self.Characters["bo_Trejo"] = 64;
    self.Characters["bo_Russman"] = 65;
    self.Characters["bo_MShadows"] = 66;
    self.Characters["bo_Reaper"] = 67;
    self.Characters["bo_Price_Classic"] = 68;
    self.Characters["bo_TEDD"] = 69;
    self.Characters["bo_Weaver"] = 70;
    self.Characters["bo_Pentagon_Thief"] = 71;
    self.Characters["bo_Stuhlinger"] = 72;
    self.Characters["bo_Marlton"] = 73;
}

init_outfits(){
    self.Outfits = undefined;

    self.Outfits["Ajax_Chef"] = 25;
    self.Outfits["Ajax_Heist"] = 24;
    self.Outfits["Ajax_Money"] = 16;
    self.Outfits["Ajax_Number"] = 14;
    self.Outfits["Ajax_Twitch"] = 19;

    self.Outfits["Battery_Aviator"] = 25;
    self.Outfits["Battery_Criminal"] = 21;
    self.Outfits["Battery_Number"] = 14;
    self.Outfits["Battery_Money"] = 16;
    self.Outfits["Battery_Twitter"] = 19;

    self.Outfits["Crash_Banana"] = 30;
    self.Outfits["Crash_Magnum"] = 19;
    self.Outfits["Crash_Money"] = 16;
    self.Outfits["Crash_Number"] = 14;
    self.Outfits["Crash_Rambo"] = 20;
    self.Outfits["Crash_RigorMortis"] = 29;
    self.Outfits["Crash_Spectre"] = 28;
    self.Outfits["Crash_Twitch"] = 21;

    self.Outfits["Firebreak_Money"] = 17;
    self.Outfits["Firebreak_Number"] = 14;
    self.Outfits["Firebreak_Rabbit"] = 15;
    self.Outfits["Firebreak_Silverfish"] = 9;

    self.Outfits["Nomad_80"] = 16;
    self.Outfits["Nomad_Elvis"] = 17;
    self.Outfits["Nomad_Money"] = 15;
    self.Outfits["Nomad_Number"] = 13;
    self.Outfits["Nomad_Twitch"] = 20;
    self.Outfits["Nomad_Pirate"] = 23;
    self.Outfits["Nomad_Werewolf"] = 31;
    self.Outfits["Nomad_Zombie"] = 27;

    self.Outfits["Outrider_Blank"] = 19;
    self.Outfits["Outrider_Cheerleader"] = 14;
    self.Outfits["Outrider_Heroes"] = 18;
    self.Outfits["Outrider_Money"] = 3;
    self.Outfits["Outrider_Number"] = 4;
    self.Outfits["Outrider_Pirate"] = 10;

    self.Outfits["Prophet_Money"] = 16;
    self.Outfits["Prophet_Number"] = 14;
    self.Outfits["Prophet_Pirate"] = 22;
    self.Outfits["Prophet_Plague"] = 20;
    self.Outfits["Prophet_Space"] = 28;
    self.Outfits["Prophet_Twitch"] = 19;

    self.Outfits["Reaper_Spectre"] = 1;
    self.Outfits["Reaper_Punk"] = 2;
    self.Outfits["Reaper_Number"] = 4;

    self.Outfits["Recon_Money"] = 16;
    self.Outfits["Recon_Number"] = 14;
    self.Outfits["Recon_Fish"] = 22;
    self.Outfits["Recon_Snake"] = 20;
    self.Outfits["Recon_Twitch"] = 19;

    self.Outfits["Ruin_Biker"] = 17;
    self.Outfits["Ruin_Hero"] = 30;
    self.Outfits["Ruin_Money"] = 14;
    self.Outfits["Ruin_Muertos"] = 6;
    self.Outfits["Ruin_Number"] = 15;
    self.Outfits["Ruin_Police"] = 16;
    self.Outfits["Ruin_Twitch"] = 21;
    self.Outfits["Ruin_Zombie"] = 26;

    self.Outfits["Seraph_Heist"] = 17;
    self.Outfits["Seraph_Hero"] = 30;
    self.Outfits["Seraph_Money"] = 18;
    self.Outfits["Seraph_Number"] = 14;
    self.Outfits["Seraph_Police"] = 16;
    self.Outfits["Seraph_Twitch"] = 21;
    self.Outfits["Seraph_Vampire"] = 24;

    self.Outfits["Spectre_ApocalypseZ"] = 8;
    self.Outfits["Spectre_Hero"] = 12;
    self.Outfits["Spectre_Japan"] = 3;
    self.Outfits["Spectre_Number"] = 4;
    self.Outfits["Spectre_Twitch"] = 6;

    self.Outfits["Torque_Money"] = 16;
    self.Outfits["Torque_Number"] = 14;
    self.Outfits["Torque_Twitch"] = 19;
    self.Outfits["Torque_ZombieKiller"] = 21;

    self.Outfits["Zero_Dark"] = 6;
    self.Outfits["Zero_Hero"] = 23;
    self.Outfits["Zero_Money"] = 27;
    self.Outfits["Zero_Number"] = 26;
    self.Outfits["Zero_Pirate"] = 16;
    self.Outfits["Zero_Twitch"] = 13;
    self.Outfits["Zero_Water"] = 14;
    self.Outfits["Zero_Zombie"] = 19;
}

SetCharacter(Character) {
    Character = self.Characters[Character];
    self setspecialistindex(Character);
    self player_role::update_fields();

    self setcharacteroutfit(0);
    self setcharacterwarpaintoutfit(0);
    self function_ab96a9b5("head", 0);
    self function_ab96a9b5("headgear", 0);
    self function_ab96a9b5("arms", 0);
    self function_ab96a9b5("torso", 0);
    self function_ab96a9b5("legs", 0);
    self function_ab96a9b5("palette", 0);
    self function_ab96a9b5("warpaint", 0);
    self function_ab96a9b5("decal", 0);
}

SetOutfit(Outfit){
    Outfit = self.Outfits[Outfit];
    self setcharacteroutfit(Outfit);
}