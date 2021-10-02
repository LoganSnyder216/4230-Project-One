/// @description Insert description here

#region Player Input
	
	//Keys
	var _left = keyboard_check(ord("A")) or keyboard_check(vk_left);
	var _right = keyboard_check(ord("D")) or keyboard_check(vk_right);
	var _up = keyboard_check(ord("W")) or keyboard_check(vk_up);
	var _down = keyboard_check(ord("S")) or keyboard_check(vk_down);
	
	var _h_move_direction = (_right - _left);
	
	//Check if the player is on the ground
	var _on_ground = instance_place(x, y + 1, obj_block);

#endregion

#region Movement
	
	//Horizontal Movement
	x += (_h_move_direction) * h_move_speed;
	
	//Jumping
	if (_up)
	{
		if (_on_ground)
		{
			vspeed = -jump_height;
		}
	}
	
	//Gravity
	if (_on_ground)
	{
		gravity = 0;
	}
	else
	{
		gravity = 0.5;
	}
	
#endregion

#region Sprite Manipulation
	
	if (_h_move_direction != 0)
	{
		image_xscale = (_h_move_direction);
	}
	
#endregion

#region Clamp Everything
	
	vspeed = clamp(vspeed, -jump_height, 8);
	
#endregion
