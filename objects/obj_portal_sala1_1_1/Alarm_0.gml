/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Teleporta o jogador (other é o objeto que colidiu)
// Ao invés de 'obj_player.destino_x', use as variáveis do portal para o teleporte
if (teleporting_player != undefined && teleporting_player.teleporting) { // Verifica se o jogador ainda está marcado para ser teleportado
    teleporting_player.x = destino_x; // Move o jogador para a posição X do portal
    teleporting_player.y = destino_y; // Move o jogador para a posição Y do portal
    teleporting_player.teleporting = false; // Reseta a variável do jogador
    teleporting = false; // Reseta a variável do portal
}
