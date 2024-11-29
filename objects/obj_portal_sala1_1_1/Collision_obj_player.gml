/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Teletransporta o jogador para as coordenadas especificadas

if (!teleporting && other.object_index == obj_player) {
    teleporting = true; // Marca o portal como ativo para o teleporte
    other.teleporting = true; // Marca o jogador (obj_player) para ser teleportado
    teleporting_player = other; // Armazena o jogador na variável
    alarm[0] = room_speed * 0.5; // Delay de 0.5 segundos
}



//other.x = dest_x;
//other.y = dest_y;