function::CreateTexts(playerid) {

    // barra inferior
    footer = TextDrawCreate(650.000000, 437.000000, "_");
    TextDrawBackgroundColor(footer, 255);
    TextDrawFont(footer, 1);
    TextDrawLetterSize(footer, 0.500000, 1.000000);
    TextDrawColor(footer, -1);
    TextDrawSetProportional(footer, 1);
    TextDrawSetShadow(footer, 1);
    TextDrawUseBox(footer, 1);
    TextDrawBoxColor(footer, 0x000000AA);
    TextDrawTextSize(footer, -13.000000, -1.000000);

    // marcador de drift
    driftbar[playerid] = TextDrawCreate(510.000000, 438.000000, "drift: 0");
    TextDrawBackgroundColor(driftbar[playerid], 255);
    TextDrawFont(driftbar[playerid], 3);
    TextDrawLetterSize(driftbar[playerid], 0.200000, 0.799998);
    TextDrawColor(driftbar[playerid], -1);
    TextDrawSetOutline(driftbar[playerid], 1);
    TextDrawSetProportional(driftbar[playerid], 1);

    // velocimetro
    speedometer[playerid] = CreatePlayerTextDraw(playerid, 602.000000, 438.000000, "km/h:100");
    PlayerTextDrawBackgroundColor(playerid, speedometer[playerid], 255);
    PlayerTextDrawFont(playerid, speedometer[playerid], 3);
    PlayerTextDrawLetterSize(playerid, speedometer[playerid], 0.200000, 0.799998);
    PlayerTextDrawColor(playerid, speedometer[playerid], -1);
    PlayerTextDrawSetOutline(playerid, speedometer[playerid], 1);
    PlayerTextDrawSetProportional(playerid, speedometer[playerid], 1);

    return true;
}