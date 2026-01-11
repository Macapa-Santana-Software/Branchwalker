/// @description Coletar a chave

// 1. Atualiza a variável global (Mecânica de "Git Add")
global.tem_cartao_acesso = true;

// 2. Toca um som (opcional, se tiver)
// audio_play_sound(snd_pickup, 1, false);

// 3. Destrói este objeto da sala (ele foi "para o bolso")
instance_destroy();


// 4. Debug (Para você ver que funcionou na janela de Output)
show_debug_message("Cartão de Acesso Coletado!");
