/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(game_over){
	global.vel_mult = .5;
}else{
	global.vel_mult = 1;
	
	if instance_number(obj_inimigo_pai) == 0 and niveis_que_restam > 0{
		room_goto_next()
		niveis_que_restam--
	}
}

if (keyboard_check(vk_enter)) {
	game_restart();
}

if keyboard_check(vk_escape){
	game_end()
}

/*
if(keyboard_check(vk_up)){
	game_over = true;	
}else{
	game_over = false;	
}
*/