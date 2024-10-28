/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var outro =instance_place(x, y, obj_entidade);

//Se eu estou tocando em alg
if(outro){
	//Se eu nao estou tocando no meu obj pai
	if(outro.id != pai){
		if(outro.vida_atual > 0){
			outro.estado = "hit";
			outro.image_index = 0;
			outro.vida_atual -= dano;
			instance_destroy();
		}
	}
}