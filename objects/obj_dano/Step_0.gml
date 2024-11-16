var outro = instance_place(x, y, obj_entidade);

// Se eu estou tocando em algum objeto
if (outro) {
    // Verifica se o outro objeto não é o meu próprio pai (obj_entidade)
    if (outro.id != pai) {
        // Checando quem é o pai do outro
        var papi = object_get_parent(outro.object_index);
        
        // Se não for o mesmo pai, mostra o nome do pai do outro
        //show_message(object_get_name(papi));
        
        // Verifica se o pai do inimigo é diferente do pai do jogador
        if (papi != object_get_parent(pai.object_index)) {
            // Aplica dano ao inimigo
            if (outro.vida_atual > 0) {
                outro.estado = "hit";
                outro.image_index = 0;
                outro.vida_atual -= dano;
                instance_destroy();
            }
        }
    }
}
