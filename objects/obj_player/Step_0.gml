var rightKey = keyboard_check(ord("D"));
var leftKey = keyboard_check(ord("A"));
var upKey = keyboard_check(ord("W"));
var downKey = keyboard_check(ord("S"));

// player movement
#region
	//get the direction
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	moveDir = point_direction(0, 0, _horizKey, _vertKey);

	// get the x and y speeds
	var _spd = 0;
	var _inputLevel = point_distance(0, 0, _horizKey, _vertKey);
	_inputLevel = clamp(_inputLevel, 0, 1);
	_spd = moveSpd * _inputLevel;

	xspd = lengthdir_x(_spd, moveDir);
	yspd = lengthdir_y(_spd, moveDir);

	// collision
	if place_meeting(x + xspd, y, obj_wall){
		xspd = 0;
	}
	if place_meeting(x, y + yspd, obj_wall){
		yspd = 0;
	}

	// move the player
	x += xspd;
	y += yspd;
	
	// depth
	depth = -bbox_bottom;
	
	
#endregion

// player aiming
	centerY = y + centerYOffset;
	
	// aim
	aimDir = point_direction(x, centerY, mouse_x, mouse_y);


#region SPRITE CONTROL (6 direções + idle/walk)

// 1) Definir a direção “face” (0..5) a partir do ângulo do mouse
// seu aimDir já foi calculado como point_direction(x, centerY, mouse_x, mouse_y)
var a = aimDir mod 360; if (a < 0) a += 360;

var up_flag = (mouse_y < centerY); // ajuda pra decidir nos setores “puros” left/right

// Mapear 6 setores (60° “puros” + 2 setores left/right que viram diagonais pelo up_flag)
// OBS: Em GameMaker: 0° = direita, 90° = cima, 180° = esquerda, 270° = baixo
if (a >= 67.5 && a < 112.5) {
    face = 5; // up
}
else if (a >= 247.5 && a < 292.5) {
    face = 0; // down
}
else if (a >= 22.5 && a < 67.5) {
    face = 4; // right_up
}
else if (a >= 292.5 && a < 337.5) {
    face = 3; // right_down
}
else if (a >= 112.5 && a < 157.5) {
    face = 2; // left_up
}
else if (a >= 202.5 && a < 247.5) {
    face = 1; // left_down
}
else if (a >= 337.5 || a < 22.5) {
    // setor “right puro”: decide pela vertical do mouse
    face = up_flag ? 4 : 3; // right_up ou right_down
}
else {
    // setor “left puro”: 157.5..202.5 — decide pela vertical
    face = up_flag ? 2 : 1; // left_up ou left_down
}

// 2) Idle vs Walk
var moving = (xspd != 0) || (yspd != 0);

// Se está parado: usa os sprites 6..11 (idle)
// Se está andando: usa os sprites 0..5 (walk)
var idx = moving ? face : (face + 6);

// 3) Aplicar sprite e velocidade de animação
if (sprite_index != sprite[idx]) {
    sprite_index = sprite[idx];
    if (!moving) image_index = 0; // idle começa do frame 0
}

// define a velocidade da animação (ajuste os números como preferir)
image_speed = moving ? 0.18 : 0.12;

#endregion
