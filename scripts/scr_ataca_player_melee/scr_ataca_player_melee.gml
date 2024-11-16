function scr_ataca_player_melee(){

	///@arg player
	///@arg dist
	///@arg xscale

	var outro = argument0;
	var dist = argument1;
	var xscale = argument2;

	//Checando se o player esta na minha linha de visao
	var player = collision_line(x, y - sprite_height/2, x + (dist * xscale), y - sprite_height/2, outro, 0, 1);

	//se player entrou na linha de visao, eu ataco 
	if (player){
		estado = "attack";
	}

}