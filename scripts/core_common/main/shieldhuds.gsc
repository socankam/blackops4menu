ShieldHUDS(){
        self.Top = -615;
        self.Bottom = 65;
        self.Left = -875 - 400;

        self.TextSize = 31;
        self.Size = 8;

        for (i = 0; i < 40; i++)
            ShieldRegisterHudElem(#"TitleBar" + i, self.primaryColor + "_", 0xFFFFC0EB,
            -199 + i * 10, 93,
            1, 0,
            0, 0,
            0.50
            );

        for (i = 0; i < 110; i++)
            ShieldRegisterHudElem(#"FooterBar" + i, self.primaryColor + "_", 0xFFFFC0EB,
            -199 + i * 10, 745,
            1, 0,
            0, 0,
            0.50
            );
        for (i = 0; i < 40; i++)
            ShieldRegisterHudElem(#"X1" + i, self.primaryColor + "_", 0xFFFFC0EB,
            -199 + i * 10, 85 - 40,
            1, 0,
            0, 0,
            0.50
            );

        for (i = 0; i < 110; i++)
            ShieldRegisterHudElem(#"X2" + i, self.primaryColor + "_", 0xFFFFC0EB,
            -199 + i * 10, 825 - 40,
            1, 0,
            0, 0,
            0.50
            );
        /*
         for (i = 0; i < 30; i++)
            ShieldRegisterHudElem(#"X3" + i, self.primaryColor + "_", 0xFFFFC0EB,
            203 + i * 10, 645,
            1, 0,
            0, 0,
            0.50
            );
        */
        for (i = 0; i < 35; i++)
            ShieldRegisterHudElem(#"Y1" + i, self.primaryColor + "|", 0xFFFFC0EB,
            199, 105 + i * 20 - 40,
            1, 0,
            0, 0,
            0.50
            );
        for (i = 0; i < 37; i++)
            ShieldRegisterHudElem(#"Y2" + i, self.primaryColor +"|", 0xFFFFC0EB,
            -202, 105 + i * 20 - 40,
            1, 0,
            0, 0,
            0.50
            );
        
        for (i = 0; i < 2; i++)
            ShieldRegisterHudElem(#"Y3" + i, self.primaryColor +"|", 0xFFFFC0EB,
            899, 805 + i * 20 - 40,
            1, 0,
            0, 0,
            0.51
            );
        /*
        for (i = 0; i < 5; i++)
            ShieldRegisterHudElem(#"Y4" + i, self.primaryColor +"|", 0xFFFFC0EB,
            501, 705 + i * 20 - 40,
            1, 0,
            0, 0,
            0.50
            );
        */
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

        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"TitleBar" + i, self.primaryColor + "_");
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"FooterBar" + i, self.primaryColor + "_");
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"X1" + i, self.primaryColor + "_");
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"X2" + i, self.primaryColor + "_");
        //for (i = 0; i < 30; i++) ShieldHudElemSetText(#"X3" + i, self.primaryColor + "_");
        for (i = 0; i < 35; i++) ShieldHudElemSetText(#"Y1" + i, self.primaryColor + "|");
        for (i = 0; i < 32; i++) ShieldHudElemSetText(#"Y2" + i, self.primaryColor + "|");
        for (i = 0; i < 2; i++) ShieldHudElemSetText(#"Y3" + i, self.primaryColor + "|");
        //for (i = 0; i < 5; i++) ShieldHudElemSetText(#"Y4" + i, self.primaryColor + "|");
}

BouncingText()
{
    hudElemName = "BouncingText";

    x = 0;
    y = 0;
    xSpeed = 5;
    ySpeed = 3;
    maxX = -920;
    maxY = 95;

    minX = -1 * maxX;
    minX = minX + 50;
    minY = -1 * maxY;
    minY = minY + 50;

    ShieldRegisterHudElem(
        hudElemName,
        "",
        0xFFFFC0EB,
        x, y,
        2, 1,
        1, 1,
        1
    );

    while (true)
    {
        x = x + xSpeed;
        y = y + ySpeed;

        if (x >= maxX)  
        {
            xSpeed = xSpeed * -1;
        }
        if (x <= minX)  
        {
            xSpeed = xSpeed * -1;
        }

        if (y >= maxY)  
        {
            ySpeed = ySpeed * -1;
        }
        if (y <= minY)  
        {
            ySpeed = ySpeed * -1;
        }

        ShieldRegisterHudElem(
            hudElemName,
            "",
            0xFFFFC0EB,
            x, y,
            2, 1,
            1, 1,
            0.5
        );

        ShieldHudElemSetText(hudElemName, "^3Menu Beta ^5v1.0");

        wait 0.05;
    }
}

ScrollingText()
{
    self endon("menu_closed");

    hudElemName = "ScrollingText";
    
    x = -870;
    y = 67;
    speed = 5;
    maxX = -650;
    
    textArray = [];
    textArray[0] = self.secondaryColor + "Shoot ";
    textArray[1] = self.primaryColor + "= down | ";
    textArray[2] = self.secondaryColor + "Aim ";
    textArray[3] = self.primaryColor + "= up | ";
    textArray[4] = self.secondaryColor + "Reload ";
    textArray[5] = self.primaryColor + "= select | ";
    textArray[6] = self.secondaryColor + "Melee ";
    textArray[7] = self.primaryColor + "= back";

    totalParts = textArray.size;
    visibleParts = totalParts;

    ShieldRegisterHudElem(
        hudElemName,
        "",
        0xFFFFC0EB,
        x, y,
        2, 1,
        1, 1,
        0.45
    );

    while (self.ScrollingText)
    {
        x = x + speed;

        if (x >= maxX)
        {
            visibleParts--;

            if (visibleParts <= 0)
            {
                x = -870;
                visibleParts = 0;
            }
        }
        else if (x <= -870 + (totalParts * 20))
        {
            visibleParts++;
            if (visibleParts > totalParts)
            {
                visibleParts = totalParts;
            }
        }

        displayText = "";
        for (i = 0; i < visibleParts; i++)
        {
            displayText = displayText + textArray[i];
        }

        ShieldRegisterHudElem(
            hudElemName,
            "",
            0xFFFFC0EB,
            x, y,
            2, 1,
            1, 1,
            0.45
        );

        ShieldHudElemSetText(hudElemName, displayText);

        if (!self.ScrollingText)
        {
            break;
        }

        wait 0.05;
    }
}