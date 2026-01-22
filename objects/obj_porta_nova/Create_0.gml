// Estados possíveis para uma porta

enum PORTA {
	fechada,
	abrindo,
	aberta,
	fechando,
}

estado = PORTA.fechada;

// A porta começa estática (animação parada)
image_speed = 0;
image_index = 0;