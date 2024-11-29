/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//iniciando variaveis
var right,left,jump,attack,dash;
var chao = place_meeting(x, y + vspeed + 1, obj_block);

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(ord("W"));
attack = keyboard_check_pressed(ord("J"));
dash = keyboard_check_pressed(ord("K"));

if(ataque_buff > 0) ataque_buff -= 1;

//Aplicando gravidade
if(!chao){
	if(velv < max_velv * 2){
	 	velv += GRAVIDADE * massa * global.vel_mult;
	}
}
 
if place_meeting(x, y, obj_bota_de_hermes) and !bota_de_hermes{
	massa *= 0.8;
	max_velh *= 1.2;
    max_velv *= 1.5;       // Aumenta a velocidade horizontal máxima
    bota_de_hermes = true; // Marca que a bota já foi coletada
}
 
 
 //Iniciando a maquina de estados
switch(estado)
{
	#region parado
	case "parado":
	{
		//Comportamento do estado
		sprite_index = spr_player_parado1;
		
		//Condição de troca de estado
		//Movendo		
		if(right || left)
		{
			estado = "movendo";
		}else if(jump || velv != 0){	
			estado = "pulando";
			velv = (-max_velv * jump);
			image_index = 0;
		}else if(attack){
			estado = "ataque";
			//velh = 0;
			image_index = 0;
		}
		else if(dash){
			estado = "dash";
			image_index = 0;
		}
		
		break;
	}
	#endregion
	
	#region movendo
	case "movendo":
	{
		//Código de movimentacao
		velh = (right - left) * max_velh * global.vel_mult;
		
		//Comportamento do estado de movimento
		sprite_index = spr_player_run;
		
		//código de movimentação
		//velh = (right - left) * max_velh;
		
		//condição de troca de estado
		//Parado
		if(abs(velh) < .1)
		{
			estado = "parado";
			velh = 0;
		}else if(jump || velv != 0){			
			estado = "pulando";
			velv = (-max_velv * jump);
			image_index = 0;
		}else if(attack){
			estado = "ataque";
			//velh = 0;
			image_index = 0;
		}
		else if(dash){
			estado = "dash";
			image_index = 0;
		}
		
		break;	
	}
	#endregion
	
	#region pulando
	case "pulando":
	{
		//Código de movimentacao
		velh = (right - left) * max_velh * global.vel_mult;
		
		if(velv > 0){
			sprite_index = spr_player_fall;
		}else{
			sprite_index = spr_player_pulo;
			//Garantindo que a animação nao repita
			if(image_index >= image_number-1){
				image_index = image_number - 1;
			}
		}
		//Condição de troca de estado
		if(chao){
			if abs(velh) < 0.1{ 
				estado = "parado";
				velh = 0;
			}
			else{
				estado = "movendo"
			}
		}
		break;
	}
	#endregion
	
	#region ataque
	case "ataque":
	{
		velh *= 0.9;
		
		if(combo == 0){
			sprite_index = spr_player_ataque1;
		}else if(combo == 1){
			sprite_index = spr_player_ataque2;
		}else if(combo == 2){
			sprite_index = spr_player_ataque3;
		}
		
		//Criando objeto de dano
		if (image_index >= 2 && dano == noone && posso){
			dano = instance_create_layer(x + sprite_width/2 , y - sprite_height/2, layer, obj_dano);
			dano.dano = ataque * ataque_mult;
			dano.pai = id;
			posso = false;
		}
		
		//Configurando com o buff
		if(attack && combo < 2){
			ataque_buff = room_speed;
		}
		
		if(ataque_buff && combo < 2 && image_index >= image_number-1){
			combo++;
			image_index = 0;
			posso = true;
			ataque_mult += .5; //MUDAR DANO NO COMBO
			if(dano){
				instance_destroy(dano, false);
				dano = noone;
			}
			
			//Zerar buff
			ataque_buff = 0;
		}
		if(image_index > image_number-1){
			estado = "parado";
			velh = 0;
			combo = 0;
			posso = true;
			ataque_mult = 1;
			if(dano){
				instance_destroy(dano, false);
				dano = noone;
			}
		}
		if(dash){
			estado = "dash";
			image_index = 0;
			combo = 0;
			if(dano){
				instance_destroy(dano, false);
				dano = noone;
			}
		}	
		if(velv != 0){
			estado = "pulando";
			image_index = 0;
		}
		break;
	}
	#endregion

	#region dash
	
	/*
	case "dash":
	{
		sprite_index = spr_player_dash;
		
		//Velocidade
		velh = image_xscale * dash_vel;
		
		//Saindo do estado
		if(image_index >= image_number - 1){
			estado = "parado";	
		}
	}
	*/
	
	case "dash":
	{
	    if(sprite_index != spr_player_dash){
			sprite_index = spr_player_dash;
			image_index = 0;
		}
		velh = image_index * dash_vel;
	    // Verificar direção do dash com base nas teclas pressionadas
	    if (right) {
	        velh = dash_vel;
	    } else if (left) {
	        velh = -dash_vel;
	    }else {
			velh = image_xscale * dash_vel;
		}
	
	    // Saindo do estado de dash ao final da animação
	    if (image_index >= image_number - 1) {
	        estado = "parado";
			velh = 0;
	    }
		
		break;
	}
	#endregion
	
	case "hit":
	{
	    // Verifica se o player já não está no estado "hit"
	    if (sprite_index != spr_player_hit) {
	        sprite_index = spr_player_hit;
	        image_index = 0; // Reseta o índice da imagem para começar a animação do hit
        
	        // Tremendo a tela
	        screenshake(5);
	    }
    
	    // Ajusta a velocidade horizontal para evitar movimento
	    velh = 0;
    
	    // Verifica quando a animação termina para voltar ao estado "parado" ou "dead"
	    if (image_index >= image_number - 1) {
	        if (vida_atual <= 0) {
	            estado = "dead";  // Se a vida for 0 ou menor, vai para o estado de morte
	        } else {
	            estado = "parado"; // Caso contrário, volta para o estado "parado"
	        }
	    }

	    break;
	}

	case "dead":
	{
		velh = 0;
		//checando se controlador existe
		if(instance_exists(obj_game_controller)){
			with(obj_game_controller){
				game_over = true;
			}
		}
	    // Reseta a animação da morte
	    if (sprite_index != spr_player_dead) {
	        sprite_index = spr_player_dead;
	        image_index = 0; // Começa a animação de morte
	    }
   
	    // Animação de morte
	    if (image_index >= image_number - 1) {
	        image_speed = 0; // Pausa a animação
	        image_alpha -= 0.01; // Fade-out do player
	        if (image_alpha <= 0) {
	            instance_destroy(); // Destroi o player após a animação de morte
	        }
	    }

	    break;
	}


	
	//Estado Padrao
	default:
	{
		estado = "parado";	
	}
}