/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Sistema de colisão e movimentação
var _velh = sign(velh);
var _velv = sign(velv);
//horizontal
repeat(abs(velh)){
	if (place_meeting(x + _velh, y, obj_block)){
		estado = "parado"
		velh *= -1;
		break;
	}
	x += _velh;
}
//vertical
repeat(abs(velv)){
	if (place_meeting(x, y + _velv, obj_block)){
		velv = 0;
		break;
	}else{
		estado = "parado"
	}
	y += _velv;
}
