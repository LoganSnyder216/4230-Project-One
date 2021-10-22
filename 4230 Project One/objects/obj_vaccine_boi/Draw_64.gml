/// @description Insert description here

//Test Values
draw_text(0, 256, "H Speed: " + string(h_move_speed));
draw_text(0, 194, "V Speed: " + string(v_move_speed));
draw_text(0, 128, "Grav: " + string(grav));

for (var i = 0; i < hp; i++)
{
	draw_sprite_ext(spr_health_bar_syringe, 0, 144, 64 * (i+1), 1, 1, 135, c_white, 1);
}