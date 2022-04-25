function::SetScore(playerid, score) {

    new player_score = GetPlayerScore(playerid);
    SetPlayerScore(playerid, 0);
    SetPlayerScore(playerid, player_score + score);
    return true;
}