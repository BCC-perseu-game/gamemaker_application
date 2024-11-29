function scr_ataca_player_melee(argument0, argument1, argument2) {
    /// @arg player
    /// @arg dist
    /// @arg xscale

    var outro = argument0; // O objeto jogador
    var dist = argument1*2;  // Distância máxima de detecção
    var xscale = argument2; // Direção do inimigo (-1 ou 1)

    // Coordenadas iniciais e finais da linha de colisão
    var start_x = x; // Ponto inicial X (posição do inimigo)
    var start_y = y - sprite_height / 4; // Ponto inicial Y (altura ajustada)
    var end_x = start_x + (-(dist+20)* xscale) // Ponto final X, ajustado pela direção
    var end_y = start_y; // Linha horizontal, mesma altura do início

    // Checar colisão ao longo da linha de visão
    var player = collision_line(start_x, start_y, end_x, end_y, outro, false, true);

    // Atacar se o jogador estiver na linha de visão
    if (player) {
        estado = "attack";
    }
}
