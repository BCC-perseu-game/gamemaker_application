/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//criando a tela de gameover
if(game_over){
	//Pegando info
	var x1 = camera_get_view_x(view_camera[0]);
	var w = camera_get_view_width(view_camera[0]);
	var x2 = x1 + (w / 2);
	var meio_w = x2 / 2;
	var y1 = camera_get_view_y(view_camera[0]);
	var h = camera_get_view_height(view_camera[0]);
	var y2 = y1 + (h / 2);
	var meio_h = y2 / 2;
	
	var qtd = h * .15;
	
	valor = lerp(valor, 1, .01);
	
	draw_set_color(c_black);
	//Escurecendo a tela
	draw_set_alpha(valor - .3);
	draw_rectangle(x1, y1, x2, y2, false);
	
	//Desehando o retangulo de cima
	draw_set_alpha(1);
	draw_rectangle(x1, y1, x2, y1 + qtd * valor,false);

	//desenhando o retangulo de baixo
	draw_rectangle(x1, y2, x2, y2 - qtd * valor, false);
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	//dando delay para gameover
	if(valor > .35){
		contador = lerp(contador, 1, .01);
		//Escrevendo game over
		draw_set_alpha(contador);
		draw_set_font(fnt_gameover);
		draw_set_valign(1);
		draw_set_halign(1);
		//sombra
		draw_set_color(c_red);
		draw_text(meio_w, meio_h, "G a m e - O v e r");
		//texto
		draw_set_color(c_white);
		draw_text(meio_w + 1, meio_h - 1, "G a m e - O v e r");
		draw_set_font(-1);
		
		draw_text(meio_w, meio_h + 40, "Press ENTER to restart");
		
		draw_set_valign(-1);
		draw_set_halign(-1);
		
		draw_set_alpha(-1);
	}
}