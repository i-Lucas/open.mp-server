#include <a_samp>
#include <foreach>

#include "..\modules\defines.pwn"
#include "..\modules\data.pwn"
#include "..\modules\texts.pwn"
#include "..\modules\vehicles.pwn"
#include "..\modules\drift.pwn"
#include "..\modules\util.pwn"

main() {

    print("\n----------------------------------");
    print(" Blank Gamemode by your name here");
    print("----------------------------------\n");
}

public OnGameModeInit() {

    SetGameModeText("GM");
    AddPlayerClass(23, -276.3746, 1556.0365, 75.3594, 133.5556, 0, 0, 0, 0, 0, 0);
    AddStaticVehicle(562, -275.2365, 1552.6189, 75.1911, 133.9876, 1, 1);

    SetTimer("DriftSystem", 850, true);
    return true;
}

public OnGameModeExit() {
    return true;
}

public OnPlayerRequestClass(playerid, classid) {

    SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
    SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
    SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
    return true;
}

public OnPlayerConnect(playerid) {

    CreateTexts(playerid);
    return true;
}

public OnPlayerDisconnect(playerid, reason) {

    PlayerTextDrawDestroy(playerid, speedometer[playerid]);
    TextDrawDestroy(driftbar[playerid]);
    TextDrawDestroy(footer);
    return true;
}

public OnPlayerSpawn(playerid) {

    TextDrawShowForPlayer(playerid, footer);
    return true;
}

public OnPlayerDeath(playerid, killerid, reason) {
    return true;
}

public OnVehicleSpawn(vehicleid) {
    return true;
}

public OnVehicleDeath(vehicleid, killerid) {
    return true;
}

public OnPlayerText(playerid, text[]) {
    return true;
}

public OnPlayerCommandText(playerid, cmdtext[]) {
    if (strcmp("/mycommand", cmdtext, true, 10) == 0) {
        // Do something here
        return true;
    }
    return false;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger) {
    return true;
}

public OnPlayerExitVehicle(playerid, vehicleid) {
    return true;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid) {

    if (drift_points[playerid] > 100 && drift_on[playerid]) {

        drift_points[playerid] = 0;        
        TextDrawSetString(driftbar[playerid], "~r~FAIL");
        KillTimer(drift_timer[playerid]);
        SetScore(playerid, -10);
    }
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate) {

    if (newstate == PLAYER_STATE_DRIVER) {

        PlayerTextDrawShow(playerid, speedometer[playerid]);

    } else if (oldstate == PLAYER_STATE_DRIVER) {

        PlayerTextDrawHide(playerid, speedometer[playerid]);
        TextDrawHideForPlayer(playerid, driftbar[playerid]);
    }
    return true;
}

public OnPlayerEnterCheckpoint(playerid) {
    return true;
}

public OnPlayerLeaveCheckpoint(playerid) {
    return true;
}

public OnPlayerEnterRaceCheckpoint(playerid) {
    return true;
}

public OnPlayerLeaveRaceCheckpoint(playerid) {
    return true;
}

public OnRconCommand(cmd[]) {
    return true;
}

public OnPlayerRequestSpawn(playerid) {
    return true;
}

public OnObjectMoved(objectid) {
    return true;
}

public OnPlayerObjectMoved(playerid, objectid) {
    return true;
}

public OnPlayerPickUpPickup(playerid, pickupid) {
    return true;
}

public OnVehicleMod(playerid, vehicleid, componentid) {
    return true;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid) {
    return true;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2) {
    return true;
}

public OnPlayerSelectedMenuRow(playerid, row) {
    return true;
}

public OnPlayerExitedMenu(playerid) {
    return true;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid) {
    return true;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    return true;
}

public OnRconLoginAttempt(ip[], password[], success) {
    return true;
}

public OnPlayerUpdate(playerid) {

    if (IsPlayerInAnyVehicle(playerid)) {

        new vehicleid = GetPlayerVehicleID(playerid);
        if (vehicleid != INVALID_VEHICLE_ID && IsDriftCar(vehicleid)) {
            new kmh[50];
            format(kmh, sizeof(kmh), "%02d km/h", GetVehicleSpeed(vehicleid));
            PlayerTextDrawSetString(playerid, speedometer[playerid], kmh);
        }
    }
    return true;
}

public OnPlayerStreamIn(playerid, forplayerid) {
    return true;
}

public OnPlayerStreamOut(playerid, forplayerid) {
    return true;
}

public OnVehicleStreamIn(vehicleid, forplayerid) {
    return true;
}

public OnVehicleStreamOut(vehicleid, forplayerid) {
    return true;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    return true;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source) {
    return true;
}