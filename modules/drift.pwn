function::DriftSystem() {

    foreach(new i: Player) {

        if (!IsPlayerInAnyVehicle(i)) { drift_on[i] = false; } else {

            drift_on[i] = true;
            new vehicleid = GetPlayerVehicleID(i);

            if (IsDriftCar(vehicleid)) {

                new Float:x, Float:y, Float:z;
                GetVehicleVelocity(vehicleid, x, y, z);
                new speed = floatround(floatsqroot(x * x + y * y + z * z) * 200.0);

                if (speed > 25) {

                    new radianos = floatround(atan2(y, x));
                    if (radianos > 400) radianos -= 400;

                    switch (radianos) {
                        case 090..180 : radianos -= 90;
                        case 181..360 : radianos += 90;
                        default: radianos += 270;
                    }

                    static Float: angle;
                    GetVehicleZAngle(vehicleid, angle);

                    radianos = floatround(floatabs(radianos - angle));
                    if (radianos > 180) {
                        radianos = floatround(floatabs(radianos - 360));
                    }

                    new key[3];
                    GetPlayerKeys(i, key[0], key[1], key[2]);

                    // key[0] == 8 == "W" -> 32 = Espaço
                    if (key[0] != 32 && speed > 25) {
                        if (radianos > 3 && ((radianos * speed) / 30) < 300) {
                            DriftEarn(i, (radianos * speed) / 35);
                        }
                    }
                }
            }
        }
    }

    return true;
}

function::DriftEarn(playerid, score) {

    score *= 8;

    if (drift_on[playerid]) {

        drift_points[playerid] += score;
        TextDrawShowForPlayer(playerid, driftbar[playerid]);

        new str[128];
        switch (drift_points[playerid]) {

            case 000..1500 : str = "~b~Drift", drift_score[playerid] = 0;
            case 1501..2900 : str = "~r~Good Drift", drift_score[playerid] = 1;
            case 2901..3800 : str = "~g~Great Drift", drift_score[playerid] = 2;

            case 3801..6600 : str = "~y~SUPER DRIFT!", drift_score[playerid] = 3;
            case 6601..9600 : str = "~b~COLOSSAL DRIFT!", drift_score[playerid] = 4;
            case 9601..15000 : str = "~r~LEGENDARY DRIFT!", drift_score[playerid] = 5;
            case 15001..25000 : str = "~g~INSANE DRIFT!", drift_score[playerid] = 6;
            default: str = "~r~DRIFT KING!", drift_score[playerid] = 7;
        }

        format(str, sizeof(str), "x~r~%d ~w~%0d %s", drift_score[playerid] + 1, drift_points[playerid], str);
        TextDrawSetString(driftbar[playerid], str);

        KillTimer(drift_timer[playerid]);
        drift_timer[playerid] = SetTimerEx("DriftCheck", 1700, false, "id", drift_points[playerid], playerid);
    }
    return true;
}

function::DriftCheck(score, playerid) {

    if (drift_on[playerid]) {
        if (drift_points[playerid] == score) {

            drift_points[playerid] = 0;
            SetScore(playerid, drift_score[playerid]);
            TextDrawHideForPlayer(playerid, driftbar[playerid]);
        }
    }
    return true;
}

function::IsDriftCar(vehicleid) {
    switch (GetVehicleModel(vehicleid)) {
        case
        // 416, //ambulan - car
        // 445, //admiral - car
        // 602, //alpha - car
        // 485, //baggage - car
        // 568, //bandito - car
        // 429, //banshee - car
        // 499, //benson - car
        // 424, //bfinject, //car
        // 536, //blade - car
        // 496, //blistac - car
        // 504, //bloodra - car
        // 422, //bobcat - car
        // 609, //boxburg - car
        // 498, //boxville, //car
        // 401, //bravura - car
        // 575, //broadway, //car
        // 518, //buccanee, //car
        // 402, //buffalo - car
        // 541, //bullet - car
        // 482, //burrito - car
        // 431, //bus - car
        // 438, //cabbie - car
        // 457, //caddy - car
        // 527, //cadrona - car
        // 483, //camper - car
        // 524, //cement - car
        // 415, //cheetah - car
        // 542, //clover - car
        // 589, //club - car
        // 480, //comet - car
        // 596, //copcarla, //car
        // 599, //copcarru, //car
        // 597, //copcarsf, //car
        // 598, //copcarvg, //car
        // 578, //dft30 - car
        // 486, //dozer - car
        // 507, //elegant - car
        562 //elegy - car
        // 585, //emperor - car
        // 427, //enforcer, //car
        // 419, //esperant, //car
        // 587, //euros - car
        // 490, //fbiranch, //car
        // 528, //fbitruck, //car
        // 533, //feltzer - car
        // 544, //firela - car
        // 407, //firetruk, //car
        // 565, //flash - car
        // 455, //flatbed - car
        // 530, //forklift, //car
        // 526, //fortune - car
        // 466, //glendale, //car
        // 604, //glenshit, //car
        // 492, //greenwoo, //car
        // 474, //hermes - car
        // 434, //hotknife, //car
        // 502, //hotrina - car
        // 503, //hotrinb - car
        // 494, //hotring - car
        // 579, //huntley - car
        // 545, //hustler - car
        // 411, //infernus, //car
        // 546, //intruder, //car
        // 559, //jester - car
        // 508, //journey - car
        // 571, //kart - car
        // 400, //landstal, //car
        // 403, //linerun - car
        // 517, //majestic, //car
        // 410, //manana - car
        // 551, //merit - car
        // 500, //mesa - car
        // 418, //moonbeam, //car
        // 572, //mower - car
        // 423, //mrwhoop - car
        // 516, //nebula - car
        // 582, //newsvan - car
        // 467, //oceanic - car
        // 404, //peren - car
        // 514, //petro - car
        // 603, //phoenix - car
        // 600, //picador - car
        // 413, //pony - car
        // 426, //premier - car
        // 436, //previon - car
        // 547, //primo - car
        // 489, //rancher - car
        // 441, //rcbandit, //car
        // 594, //rccam - car
        // 564, //rctiger - car
        // 515, //rdtrain - car
        // 479, //regina - car
        // 534, //remingtn, //car
        // 505, //rnchlure, //car
        // 442, //romero - car
        // 440, //rumpo - car
        // 475, //sabre - car
        // 543, //sadler - car
        // 605, //sadlshit, //car
        // 495, //sandking, //car
        // 567, //savanna - car
        // 428, //securica, //car
        // 405, //sentinel, //car
        // 535, //slamvan - car
        // 458, //solair - car
        // 580, //stafford, //car
        // 439, //stallion, //car
        // 561, //stratum - car
        // 409, //stretch - car
        // 560, //sultan - car
        // 550, //sunrise - car
        // 506, //supergt - car
        // 601, //swatvan - car
        // 574, //sweeper - car
        // 566, //tahoma - car
        // 549, //tampa - car
        // 420, //taxi - car
        // 459, //topfun - car
        // 576, //tornado - car
        // 583, //tug - car
        // 451, //turismo - car
        // 558, //uranus - car
        // 552, //utility - car
        // 540, //vincent - car
        // 491, //virgo - car
        // 412, //voodoo - car
        // 478, //walton - car
        // 421, //washing - car
        // 529, //willard - car
        // 555, //windsor - car
        // 456, //yankee - car
        // 554, //yosemite - car
        // 477 //zr350 - car
        :
            return true;
    }
    return false;
}