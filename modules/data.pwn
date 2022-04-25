// barra inferor
new Text:footer;

// velocimetro
new PlayerText:speedometer[MAX_PLAYERS];

// sistema de drift
new Text:driftbar[MAX_PLAYERS];

new drift_points[MAX_PLAYERS];
new drift_timer[MAX_PLAYERS];
new drift_score[MAX_PLAYERS];
new bool: drift_on[MAX_PLAYERS] = false;