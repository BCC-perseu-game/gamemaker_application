/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//iniciando variaveis
var right,left,jump,attack;
var chao = place_meeting(x, y + 1, obj_block);

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(ord("W"));
attack = keyboard_check_pressed(ord("J"));

//Aplicando gravidade
if(!chao){
	if(velv < max_velv * 2){
	 	velv += GRAVIDADE * massa;
	}
} 
 
 //Iniciando a maquina de estados
switch(estado)
{
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
			velh = 0;
			image_index = 0;
		}
		
		break;
	}
		
	case "movendo":
	{
		//Comportamento do estado de movimento
		sprite_index = spr_player_run;
		
		//código de movimentação
		velh = (right - left) * max_velh;
		
		//condição de troca de estado
		//Parado
		if(abs(velh) < .1)
		{
			estado = "parado";
			velh = 0;
		}else if(jump){
			estado = "pulando";
			velv = -max_velv
			image_index = 0;

		}else if(attack){
			estado = "ataque";
			velh = 0;
			image_index = 0;
		}
		
		break;	
	}
	
	case "pulando":
	{
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
			estado = "parado";
			velh = 0;
		}
		break;
	}
	case "ataque":
	{
		velh = 0;
		
		if(combo == 0){
			sprite_index = spr_player_ataque1;
		}else if(combo == 1){
			sprite_index = spr_player_ataque2;
		}else if(combo == 2){
			sprite_index = spr_player_ataque3;
		}
		
		if(attack && combo < 2 && image_index >= image_number-2){
			combo++;
			image_index = 0;
		}
		if(image_index > image_number-1){
			estado = "parado";
			velh = 0;
			combo = 0;
		}
			
		break;
	}
}