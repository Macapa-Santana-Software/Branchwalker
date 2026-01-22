/// @function get_player_input()                                                                                  │
/// @description Captura todos os inputs do jogador e retorna uma struct 
function get_player_input() {
    // Definição das teclas (fácil de alterar aqui)
    var _key_up    = InputCheck(INPUT_VERB.UP);
    var _key_down  = InputCheck(INPUT_VERB.DOWN);
    var _key_left  = InputCheck(INPUT_VERB.LEFT);
    var _key_right = InputCheck(INPUT_VERB.RIGHT);
    
    // Calcula eixos
    var _axis_x = _key_right - _key_left;
    var _axis_y = _key_down - _key_up;
    
    // Retorna tudo em um pacote (struct)
    return {
        axis_x: _axis_x,
        axis_y: _axis_y,
        // Adicione outras ações aqui futuramente, ex:
        // action_interact: keyboard_check_pressed(vk_space),
        // action_run: keyboard_check(vk_shift)
    };
}