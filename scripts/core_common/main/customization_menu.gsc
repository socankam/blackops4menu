CustomizationMenu(){
    self createMenu("CustomizationMenu", "Customizations");
    self addOption("CustomizationMenu", "Change Primary Color", &OpenSubMenu, "PrimaryColor");
    self addOption("CustomizationMenu", "Change Secondary Color", &OpenSubMenu, "SecondaryColor");
    if(Multiplayer()){
        self addToggleOption("CustomizationMenu", "Enable Laptop / Briefcase", &EnableBriefcase, false);
        self addToggleOption("CustomizationMenu", "Enable Sound Effects", &SoundEffects, false);
    }
    self addToggleOption("CustomizationMenu", "Background Blur", &EnableMenuBlur, false);

    self createMenu("PrimaryColor", "Primary Color");
    self addOption("PrimaryColor", "Red", &setPrimaryColor, "^9");
    self addOption("PrimaryColor", "Green", &setPrimaryColor, "^2");
    self addOption("PrimaryColor", "Yellow", &setPrimaryColor, "^3");
    self addOption("PrimaryColor", "Blue", &setPrimaryColor, "^4");
    self addOption("PrimaryColor", "Cyan", &setPrimaryColor, "^5");
    self addOption("PrimaryColor", "Pink", &setPrimaryColor, "^6");
    self addOption("PrimaryColor", "Black", &setPrimaryColor, "^0");

    self createMenu("SecondaryColor", "Secondary");
    self addOption("SecondaryColor", "Red", &setSecondaryColor, "^9");
    self addOption("SecondaryColor", "Green", &setSecondaryColor, "^2");
    self addOption("SecondaryColor", "Yellow", &setSecondaryColor, "^3");
    self addOption("SecondaryColor", "Blue", &setSecondaryColor, "^4");
    self addOption("SecondaryColor", "Cyan", &setSecondaryColor, "^5");
    self addOption("SecondaryColor", "Pink", &setSecondaryColor, "^6");
    self addOption("SecondaryColor", "Black", &setSecondaryColor, "^0");
}

EnableBriefcase()
{
    self.Briefcase = !isDefined(self.Briefcase) || !self.Briefcase;
    self iPrintln("Setting will be applied when you re-open the menu.");
}

SoundEffects()
{
    self.SoundEffects = !isDefined(self.SoundEffects) || !self.SoundEffects;
}

EnableMenuBlur()
{
    self.MenuBlur = !isDefined(self.MenuBlur) || !self.MenuBlur;
    self iPrintln("Setting will be applied when you re-open the menu.");
}

setPrimaryColor(newPrimaryColor) {
    self.primaryColor = newPrimaryColor;
    ShieldClearHudElems();
    ShieldHUDS();
}

setSecondaryColor(newSecondaryColor) {
    self.secondaryColor = newSecondaryColor;
    ShieldClearHudElems();
    ShieldHUDS();
}

SoundEffect(){
    if(self.SoundEffects) {
        self playsound("mpl_fracture_deposit_1");
    }
}