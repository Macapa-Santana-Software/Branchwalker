// Máquina de estados da porta

switch (estado) {
	case PORTA.fechada:
		// Defini o estado inicial no frame da porta fechada
		image_index = 0;
		
		if (InputCheck(INPUT_VERB.ACTION) && distance_to_object(obj_player) < 32) {
			image_speed = 1; // Inicia a animação para frente
			estado = PORTA.abrindo;
		}
	break;
	case PORTA.abrindo:
		// Verifica se a animação chegou ao final
		if (image_index >= image_number -1) {
			image_speed = 0; // Para a animação
			estado = PORTA.aberta; // Muda o estado
		}
	break;
	case PORTA.aberta:
		// Define o estado da porta aberta no último frame
		image_index = image_number - 1;
		
		if (InputCheck(INPUT_VERB.ACTION) && distance_to_object(obj_player) < 32) {
			image_speed = -1; // Inicia a animação para trás (reveso)
			estado = PORTA.fechando;
		}
	break;
	case PORTA.fechando:
        // Verifica se chegou perto de 0 OU se deu a volta (loop) e foi lá pro frame 2 ou 3
        // Usamos uma margem de segurança (0.1) e checamos o wrap (> 2)
        if (image_index <= 0.1 || image_index >= image_number - 1) {
            image_speed = 0;
            image_index = 0; // Força visualmente o frame 0 (fechado) para garantir
            estado = PORTA.fechada;
        }
    break;
}