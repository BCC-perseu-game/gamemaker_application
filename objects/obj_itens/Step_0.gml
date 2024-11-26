/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
c += 2
y = ystart + dcos(c)*5

if place_meeting(x, y, obj_player){
	morre = true
}

if morre{
	image_xscale *= 0.9
	image_yscale = image_xscale
	image_angle += 10
	
	if image_xscale <= 0.01{
		instance_destroy(self)
	}
}