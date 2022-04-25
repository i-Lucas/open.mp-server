stock GetVehicleSpeed(vehicleid) {

    new Float: Pos[3];
    GetVehicleVelocity(vehicleid, Pos[0], Pos[1], Pos[2]);
    return floatround(floatsqroot(Pos[0] * Pos[0] + Pos[1] * Pos[1] + Pos[2] * Pos[2]) * 170.00);
}