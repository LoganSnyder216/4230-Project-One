/// @description Insert description here

if (instance_exists(obj_vaccine_boi))
{
	var _half_tile = (tile_size / 2);
	
	//Draw Healthbar
	var _x1 = _half_tile + 48;
	var _y1 = _half_tile - 32;
	var _x2 = _x1 + 168;
	var _y2 = _y1 + 63;
	var _amount = (obj_vaccine_boi.hp / obj_vaccine_boi.max_hp) * 100;
	
	draw_healthbar(_x1, _y1, _x2, _y2,_amount, c_black, c_orange, c_aqua, 0, false, false);
	draw_sprite_ext(spr_health_bar_syringe, 0, _half_tile, _half_tile, 2, 2, 0, c_white, 1);
}
