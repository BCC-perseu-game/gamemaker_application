/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//Olhando para o lado certo
if abs(velh) > 0.1{ xscale = -sign(velh); }
image_xscale = xscale;

//Exibindo meu estado quando o usuário mandar
//if(position_meeting(mouse_x, mouse_y,id)) {
//	if(mouse_check_button_released(mb_left))
//		mostra_estado = !mostra_estado;
//}

image_speed = (img_spd / room_speed) * global.vel_mult;