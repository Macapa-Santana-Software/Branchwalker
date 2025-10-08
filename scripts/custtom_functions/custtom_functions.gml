function draw_my_weapon(){
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);

	// flip the wapon upright
	var _weaponYscl = 1;
	if aimDir > 90 && aimDir < 270 {
		_weaponYscl = -1;
	}

	draw_sprite_ext(spr_blueRod, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, 1);
}