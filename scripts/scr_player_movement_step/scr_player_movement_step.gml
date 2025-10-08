function scr_player_movement_step(){
	/// scr_player_movement_step()
	/// Entrada (WASD) + aceleração/desaceleração suave -> define vx, vy

	// Defaults (caso não tenham sido criadas no Create)
	if (!variable_instance_exists(id, "move_spd")) move_spd = 2.5;
	if (!variable_instance_exists(id, "acc"))      acc      = 0.35;
	if (!variable_instance_exists(id, "dec"))      dec      = 0.20;
	if (!variable_instance_exists(id, "vx"))       vx       = 0;
	if (!variable_instance_exists(id, "vy"))       vy       = 0;

	// Entrada
	var right = keyboard_check(ord("D"));
	var left  = keyboard_check(ord("A"));
	var up    = keyboard_check(ord("W"));
	var down  = keyboard_check(ord("S"));

	var hx = right - left;   // -1..0..1
	var hy = down  - up;     // -1..0..1

	// Normaliza para mesma velocidade na diagonal
	var len = sqrt(hx*hx + hy*hy);
	if (len > 0) { hx /= len; hy /= len; }

	// Velocidade alvo
	var tvx = hx * move_spd;
	var tvy = hy * move_spd;

	// Suavização (acelera quando há input; desacelera quando solta)
	var k = (len > 0) ? acc : dec;
	vx = lerp(vx, tvx, k);
	vy = lerp(vy, tvy, k);

	// Evita drift numérico
	if (abs(vx) < 0.001) vx = 0;
	if (abs(vy) < 0.001) vy = 0;
}