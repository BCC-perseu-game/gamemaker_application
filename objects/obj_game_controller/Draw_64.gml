
var cam = camera_get_active()
draw_set_colour(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text(0, 0, $"{camera_get_view_width(cam)} - {view_get_wport(0)} - {view_wport[0]} - ")
//criando a tela de gameover
if(game_over){
	//Pegando info
	var w = view_wport[0] / 2
	var meio_w = w / 2;
	var h = view_hport[0] / 2
	var meio_h = h / 2;
	
	var qtd = (h / 2) * (2/3);
	
	valor = lerp(valor, 1, .01);
	go_valor2 = 1
	valor2 +=  (go_valor2 - valor2)/10
	
	draw_set_color(c_black);
	//Escurecendo a tela
	draw_set_alpha(valor - .3);
	draw_rectangle(0, 0, w, h, false);
	
	//Desehando o retangulo de cima
	draw_set_alpha(1);
	draw_rectangle(0, 0, w, qtd * valor2,false);

	//desenhando o retangulo de baixo
	draw_rectangle(0, h, w, h - qtd * valor2, false);
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	//dando delay para gameover
	if(valor > .35){
		contador = lerp(contador, 1, .01);
		//Escrevendo game over
		draw_set_alpha(contador);
		draw_set_font(fnt_gameover);
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		//sombra
		draw_set_color(c_red);
		draw_text(meio_w, meio_h, "G a m e - O v e r");
		//texto
		draw_set_color(c_white);
		draw_text(meio_w + 1, meio_h - 1, "G a m e - O v e r");
		draw_set_font(-1);
		
		ncos_restart += 4
		draw_set_alpha(0.5 + dcos(ncos_restart)/2)
		draw_text(meio_w, meio_h + h * 0.2, "Press ENTER to restart");
		draw_set_alpha(1)
		
		draw_set_valign(-1);
		draw_set_halign(-1);
		
		draw_set_alpha(-1);
	}
}