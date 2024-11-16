/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var chao = place_meeting(x, y+1 , obj_block);

if (!chao){
	velv += GRAVIDADE * massa;	
}

/*
if(mouse_check_button_pressed(mb_right)){
	estado = "attack";
}
*/

switch(estado){
	case "parado":{
		velh = 0;
		timer_estado++;
		if(sprite_index != spr_inimigo_esqueleto_idle){
			//iniciando o estado
			image_index = 0;
		}
		sprite_index = spr_inimigo_esqueleto_idle;
		
		//condição de troca de estado
		if(position_meeting(mouse_x,mouse_y,self)){
			if(mouse_check_button_pressed(mb_right)){
				estado = "hit";
			
			}
		}
		//Indo para o estado de patrulha
		if(irandom(timer_estado) > 300){
			estado = choose("walk", "parado", "walk");
			timer_estado = 0;
		}
		
		scr_ataca_player_melee(obj_player, dist, xscale);

		break;
	}
	case "walk":
	{
		timer_estado++;
		if(sprite_index != spr_inimigo_esqueleto_walk){
			image_index = 0;
			velh = choose(1, -1);

		}
		sprite_index = spr_inimigo_esqueleto_walk;
		
		//Condicao de saida do estado
		if(irandom(timer_estado) > 300){
			estado = choose("parado", "parado", "walk");
			timer_estado = 0;
		}
		scr_ataca_player_melee(obj_player, dist, xscale);
		
		break;
	}
	case "attack":
	{
		velh = 0;
		if(sprite_index != spr_inimigo_esqueleto_attack){
			image_index = 0;
			posso = true;
			dano = noone;
		}
		sprite_index = spr_inimigo_esqueleto_attack;
		
		if(image_index > image_number - 1){
			estado = "parado";
		}
		
		//Criando o dano
		//ATENCAO: MUDAR PARA A NOSSA SPRITE, MOMENTO EM QUE O PLAYER SENTE O DANO
		if(image_index >= 8 && dano == noone && image_index < 15 && posso){
			dano = instance_create_layer(x + sprite_width/2 ,y - sprite_height/3, layer, obj_dano);
			dano.dano = ataque;
			dano.pai = id;
			posso = false;
		}
		
		//Desetruindo o dano
		if(dano != noone && image_index >= 15){
			instance_destroy(dano);
			dano = noone;
		}
		
		//Saindo do estado
		break;
	}
	case "hit":
	
		if(sprite_index != spr_inimigo_esqueleto__hit){
			//iniciando o que for preciso para este estado
			image_index = 0;
			//vida_atual--;
		}
		sprite_index = spr_inimigo_esqueleto__hit;
		
		//condicao para sair do estado
		if(vida_atual > 0){
			if(image_index > image_number - 1)
				estado = "parado";
		}
		else if(image_index >= 3){
			estado = "dead";
		}
		break;
	
		
	case "dead":
	{
		velh = 0;
		if(sprite_index != spr_inimigo_esqueleto_dead){
			//iniciando o que for preciso para este estado
			image_index = 0;
		}
		sprite_index = spr_inimigo_esqueleto_dead;
		
		//Morrendo de vdd
		if(image_index > image_number - 1)
			image_speed = 0;
			image_alpha-= .01;
			if(image_alpha <= 0) instance_destroy();
	}
}