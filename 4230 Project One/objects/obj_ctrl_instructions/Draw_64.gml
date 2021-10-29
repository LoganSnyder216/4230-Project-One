/// @description Insert description here

var _initial_x = tile_size;
var _initial_y = tile_size;
var _y_offset = (tile_size / 2) + 32;
var _big_offset = tile_size / 2;
var _small_offset = tile_size / 4;

#region Vaccine Boi Instructions
	
	draw_set_halign(fa_left);
	
	draw_text_transformed(_initial_x, _initial_y, "Controls", 2, 2, 0);
	
	//Horizontal Movement Instructions
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Move Left: Press A or Left Arrow Key", 1, 1, 0);
	_y_offset += _big_offset;
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Move Right: Press D or Right Arrow Key", 1, 1, 0);
	_y_offset += _big_offset;

	//Jumping Instructions
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Jump: Press W or Up Arrow Key", 1, 1, 0);
	_y_offset += _big_offset;

	//Attacking Instructions
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Attack: Press Spacebar", 1, 1, 0);
	_y_offset += _small_offset + 16;
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Vaccine Boi swings his sword Syr Inge in an overhead attack.", 0.5, 0.5, 0);
	_y_offset += _small_offset;
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Vaccine Boi can only attack while on the ground, and cannot move or jump while attacking.", 0.5, 0.5, 0);
	_y_offset += _small_offset;
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Defeating enemies with Syr Inge restores some of Vaccine Boi's health.", 0.5, 0.5, 0);
	_y_offset += _big_offset;
	
#endregion

#region Goal Information
	
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Goal", 2, 2, 0);
	_y_offset += _big_offset + _small_offset;
	draw_text_ext_transformed(_initial_x, _initial_y + _y_offset, "Reach the white blood cell at the end of the level to deliver the vaccine and complete your mission.", _small_offset, (room_width / 2) - tile_size, 1, 1, 0);
	_y_offset += tile_size + _big_offset;
	_initial_x += 64;
	draw_sprite(spr_white_blood_cell, 0, _initial_x + (tile_size * 0), _initial_y + _y_offset);
	_initial_x += 64;
	draw_sprite(spr_white_blood_cell, 1, _initial_x + (tile_size * 1), _initial_y + _y_offset);
	_initial_x += 64;
	draw_sprite(spr_white_blood_cell, 2, _initial_x + (tile_size * 2), _initial_y + _y_offset);
	_initial_x += 64;
	draw_sprite(spr_white_blood_cell, 3, _initial_x + (tile_size * 3), _initial_y + _y_offset);
	
#endregion
 
#region Enemy Information
	
	_initial_x = (room_width / 2) + tile_size;
	_y_offset = (tile_size / 2) + 32;
	//draw_set_halign(fa_right);
	
	draw_text_transformed(_initial_x, _initial_y, "Enemies", 2, 2, 0);
	
	//Virus Ball Information
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Virus Ball", 1, 1, 0);
	_y_offset += _small_offset + 16;
	draw_sprite(spr_virus_ball, 0, _initial_x + (tile_size * 5), _initial_y + _y_offset);
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Virus Balls bounce up and down or back and forth.", 0.5, 0.5, 0);
	_y_offset += _small_offset;
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "They're mostly passive, but still deal damage if you run into them.", 0.5, 0.5, 0);
	_y_offset += _big_offset;
	
	//Killer T Information
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Killer T", 1, 1, 0);
	_y_offset += _small_offset + 16;
	draw_sprite(spr_killer_t, 0, _initial_x + (tile_size * 5), _initial_y + _y_offset + 16);
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Killer T cells chase you if you get too close.", 0.5, 0.5, 0);
	_y_offset += _small_offset;
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "If one touches you, it will latch on and start draining your health.", 0.5, 0.5, 0);
	_y_offset += _small_offset;
	draw_text_transformed(_initial_x, _initial_y + _y_offset, "Move left and right in rapid succession to shake them off.", 0.5, 0.5, 0);
	_y_offset += _big_offset;
	
#endregion

