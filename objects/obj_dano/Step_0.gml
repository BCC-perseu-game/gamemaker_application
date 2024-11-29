var outro;

var outro_lista = ds_list_create();
var quantidade = instance_place_list(x,y,obj_entidade, outro_lista, 0);

for(var i = 0; i < quantidade; i++){
	//Checando o atual
	var atual = outro_lista[| i];
	
	//show_message(object_get_name(atual.object_index));
	//checando se a colisao nao é com um filho do meu pai
	if(object_get_parent(atual.object_index) != object_get_parent(pai.object_index))
	{
		//Isso só vai rodar se eu puder dar dano no coisinho
		
		//Checar se eu realmente posso dar dano
 
		//checar se o atual ja esta na lista
		var pos = ds_list_find_index(aplicar_dano, atual);
		if(pos == -1){
			//O atual ainda nao esta na minha lista de dano
			//Adiciono o atual a lista de dano
			ds_list_add(aplicar_dano, atual);
		}
	}
}
//Aplicando o dano
var tam = ds_list_size(aplicar_dano);
for(var i = 0; i < tam; i++){
	
	outro = aplicar_dano[| i].id;
	if (outro.vida_atual > 0) {
		outro.estado = "hit";
		outro.image_index = 0;
		outro.vida_atual -= dano;
		outro.velh += 4 * -sign(outro.x - obj_player.x)
		if outro.velh != 0 { outro.xscale = -sign(outro.velh) }
		
		//preciso checar se to acertando o inimigo
		//checando se sou filho do inimigo pai
		if(object_get_parent(outro.object_index) == obj_inimigo_pai){
			//dando screenshake apenas para inimigos
			screenshake(3);
		}
	}
}


//destruindo minhas listas
ds_list_destroy(aplicar_dano);
ds_list_destroy(outro_lista);

instance_destroy();
/*
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
}*/
