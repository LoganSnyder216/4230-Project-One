/// @description Insert description here

#region Player Input
	
	//Keys
	var _left = keyboard_check(ord("A")) or keyboard_check(vk_left);
	var _right = keyboard_check(ord("D")) or keyboard_check(vk_right);
	var _up = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
	var _down = keyboard_check(ord("S")) or keyboard_check(vk_down);
	var _space = keyboard_check(vk_space);
	
	//Horizontal Movement Direction
	var _h_move_direction = (_right - _left);
	
	//Check if the player is on the ground
	var _on_ground = 0;
	if ((tilemap_get_at_pixel(tile_map, bbox_left, bbox_bottom + 2) != 0) or (tilemap_get_at_pixel(tile_map, bbox_right, bbox_bottom + 2) != 0))
	{
		_on_ground = 1;
		global.player_state = e_player_state.idle;
	}

#endregion

#region Horizontal Movement Calculation
	
	//Horizontal speed calculation
	h_move_speed = (_h_move_direction) * base_speed;
	
#endregion

#region Vertical Movement Calculation
	
	//Jumping
	if (_up)
	{
		if (_on_ground)
		{
			v_move_speed = -jump_height;
			global.player_state = e_player_state.jumping;
		}
	}
	
	//Apply gravity based on the stage of the jump.
	if (_on_ground)
	{
		grav = 0;
	}
	else
	{
		if (v_move_speed < 0)
		{
			grav = 0.875;
		}
		else
		{
			grav = 2.625;
		}
	}
	
	//Vertical speed calculation
	v_move_speed = v_move_speed + grav;
	
	//Clamp vertical speed
	v_move_speed = clamp(v_move_speed, -jump_height, jump_height);
	
#endregion

#region Backup Naive Collision
	
	//Horizontal collision
	/*if (place_meeting(x + h_move_speed, y, obj_block))
	{	
		while (!place_meeting(x + _h_move_direction, y, obj_block))
		{
			x += _h_move_direction;
		}
		
		h_move_speed = 0;
	}
	
	//Vertical collision
	if (place_meeting(x, y + v_move_speed, obj_block))
	{
		while (!place_meeting(x, y + (sign(v_move_speed) * 2), obj_block))
		{
			y += sign(v_move_speed);
		}
		
		v_move_speed = 0;
	}*/
	
#endregion

#region Collision
	
	//Bounding box in the direction of movement
	var _bbox;
	
	//Horizontal tilemap collision
	var _int_h_move_speed;
	
	if (h_move_speed > 0)
	{
		_bbox = bbox_right;
		_int_h_move_speed = ceil(h_move_speed);
	}
	else
	{
		_bbox = bbox_left;
		_int_h_move_speed = floor(h_move_speed);
	}
	
	if ((tilemap_get_at_pixel(tile_map, _bbox + _int_h_move_speed, bbox_top) != 0) or (tilemap_get_at_pixel(tile_map, _bbox + _int_h_move_speed, bbox_bottom) != 0))
	{
		//Snap to grid
		//If moving right
		if (h_move_speed > 0)
		{
			x = x - (x mod tile_size) + (tile_size - 1) - (bbox_right - x);
		}
		//If moving left
		else
		{
			x = x - (x mod tile_size) - (bbox_left - x);
		}
		
		h_move_speed = 0;
		_int_h_move_speed = 0;
	}
	
	//Vertical tilemap collision
	var _int_v_move_speed;
	
	if (v_move_speed > 0)
	{
		_bbox = bbox_bottom;
		_int_v_move_speed = ceil(v_move_speed);
	}
	else
	{
		_bbox = bbox_top;
		_int_v_move_speed = floor(v_move_speed);
	}
	
	if ((tilemap_get_at_pixel(tile_map, bbox_left, _bbox + _int_v_move_speed) != 0) or (tilemap_get_at_pixel(tile_map, bbox_right, _bbox + _int_v_move_speed) != 0))
	{
		//Snap to grid
		//If moving down
		if (v_move_speed > 0)
		{
			y = y - (y mod tile_size) + (tile_size - 1) - (bbox_bottom - y);
		}
		//If moving up
		else
		{
			y = y - (y mod tile_size) - (bbox_top - y);
		}
		
		v_move_speed = 0;
		_int_v_move_speed = 0;
	}
	
#endregion

#region Update Position
	
	//Only move integer amounts
	
	//Update x position
	x += _int_h_move_speed;
	
	//Update y position
	y += _int_v_move_speed;
	
#endregion



#region Attacking
	
	if (_space and !instance_exists(obj_syr_inge))
	{
		instance_create_layer(x, y, "Instances", obj_syr_inge);
	}
	
#endregion

 #region Sprite Manipulation
	
	//Flip sprite in the direction of movement
	if (_h_move_direction != 0)
	{
		image_xscale = (_h_move_direction);
	}
	
	if (instance_exists(obj_syr_inge))
	{
		//sprite_index = spr_swinging;
	}
	else
	{
		//Set sprite to idle or walking
		if (_on_ground)
		{
			if (h_move_speed == 0)
			{
				sprite_index = spr_vaccine_boi;
			}
			else
			{
				sprite_index = spr_vaccine_boi_walking;
			}
		}
		else
		{
			sprite_index = spr_vaccine_boi;
		}
	}
	
#endregion
