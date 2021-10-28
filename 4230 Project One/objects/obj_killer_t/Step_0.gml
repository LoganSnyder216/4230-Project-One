/// @description Insert description here

var _point_dir = 0;

if (instance_exists(obj_vaccine_boi))
{
	//Move toward the player if they aren't latched by a killer t
	if (!obj_vaccine_boi.latched)
	{
		_point_dir = point_direction(x, y, obj_vaccine_boi.x, obj_vaccine_boi.y);
		direction = _point_dir;
		speed = move_speed;
	}
	else
	{
		//Stay latched to the player if they are the one latching
		if (latched)
		{
			x = obj_vaccine_boi.x;
			y = obj_vaccine_boi.y - 32;
			
			if (vb_prev_h_speed != obj_vaccine_boi.h_move_speed)
			{
				break_count++;
				
				if (break_count >= 30)
				{
					obj_vaccine_boi.latched = false;
					instance_destroy();
				}
			}
		}
		//Go back to spawn if they aren't the one latching
		else
		{
			_point_dir = point_direction(x, y, spawn_x, spawn_y);
			direction = _point_dir;
			speed = move_speed;
		}
	}
	
}

