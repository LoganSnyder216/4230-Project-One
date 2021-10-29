/// @description Insert description here

#region Player Input
	
	//Check which keys the player is pressing
	var _left = keyboard_check(ord("A")) or keyboard_check(vk_left);
	var _right = keyboard_check(ord("D")) or keyboard_check(vk_right);
	var _up = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
	var _space = keyboard_check_pressed(vk_space);
	
	//Horizontal movement direction
	var _h_move_direction = (_right - _left);
	
	//Check if the player is on the ground
	var _on_ground = 0;
	if ((tilemap_get_at_pixel(tile_map, bbox_left, bbox_bottom + 2) != 0) or (tilemap_get_at_pixel(tile_map, bbox_right, bbox_bottom + 2) != 0))
	{
		_on_ground = 1;
	}
	
	//Check if the player is attacking
	var _attacking = instance_exists(obj_syringe);

#endregion

#region Horizontal Movement Calculation
	
	//Horizontal speed calculation
	h_move_speed = (_h_move_direction) * base_speed;
	
	//Set horizontal speed to zero if the player is attacking
	if (_attacking)
	{
		h_move_speed = 0;
	}
	
#endregion

#region Vertical Movement Calculation
	
	//Jump if the player is on the ground and not attacking
	if (_up and _on_ground and !_attacking)
	{
		v_move_speed = -jump_height;
	}
	
	//Set gravity to zero when the player is on the ground
	if (_on_ground)
	{
		grav = 0;
	}
	//Set gravity based on the stage of the jump
	else
	{
		//Before the apex of the jump
		if (v_move_speed < 0)
		{
			grav = 0.875;
		}
		//Triple gravity after the apex of the jump
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

#region Collision
	
	//Bounding box in the direction of movement, used to check for collisions
	var _bbox;
	
	//Variable to hold the player's horizontal speed as an integer
	var _int_h_move_speed;
	
	//Variable to hold the player's vertical speed as an integer
	var _int_v_move_speed;
	
	#region Horizontal Tilemap Collision
		
		//Get the bounding box when moving right
		if (h_move_speed > 0)
		{
			_bbox = bbox_right;
			_int_h_move_speed = ceil(h_move_speed);
		}
		//Get the bounding box when moving left
		else
		{
			_bbox = bbox_left;
			_int_h_move_speed = floor(h_move_speed);
		}
	
		//Check for a collision with the collision tile map
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
		
			//Set horizontal speed to zero when colliding
			h_move_speed = 0;
			_int_h_move_speed = 0;
		}
	
	#endregion
	
	#region Vertical tilemap collision
		
		//Get the bounding box when moving down
		if (v_move_speed > 0)
		{
			_bbox = bbox_bottom;
			_int_v_move_speed = ceil(v_move_speed);
		}
		//Get the bounding box when moving up
		else
		{
			_bbox = bbox_top;
			_int_v_move_speed = floor(v_move_speed);
		}
	
		//Check for a collision with the collision tile map
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
		
			//Set vertical speed to zero when colliding
			v_move_speed = 0;
			_int_v_move_speed = 0;
		}
	
	#endregion
	
#endregion

#region Update Position
	
	//Only move integer amounts
	
	//Update x position
	x += _int_h_move_speed;
	
	//Update y position
	y += _int_v_move_speed;
	
#endregion

#region Attacking
	
	//Attack if the player is on the ground, not latched, and not already attacking
	if (_space and _on_ground and !latched and !_attacking)
	{
		instance_create_layer(x, y, "Instances", obj_syringe);
		_attacking = true;
	}
	
#endregion

 #region Sprite Manipulation
	
	//Set sprite to attacking if the player is attacking
	if (_attacking)
	{
		sprite_index = spr_swinging;
	}
	//If not attacking, set sprite based on the player's movement
	else
	{
		//Flip sprite in the direction of movement
		if (_h_move_direction != 0)
		{
			image_xscale = (_h_move_direction);
		}
		
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
		//Set sprite to idle when falling
		else
		{
			sprite_index = spr_vaccine_boi;
		}
	}
	
#endregion
