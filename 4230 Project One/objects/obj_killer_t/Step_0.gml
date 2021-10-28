/// @description Insert description here

var _point_dir = 0;

if (instance_exists(obj_vaccine_boi))
{
	//If the player isn't already latched by a killer t cell
	if (!obj_vaccine_boi.latched)
	{
		//Move toward the player if they are inside the aggro range
		if (distance_to_object(obj_vaccine_boi) < aggro_range)
		{
			_point_dir = point_direction(x, y, obj_vaccine_boi.x, obj_vaccine_boi.y);
			direction = _point_dir;
			speed = move_speed;
		}
		//Go back to spawn if the player is outside their aggro range
		else
		{
			if (distance_to_point(spawn_x, spawn_y) > move_speed)
			{
				_point_dir = point_direction(x, y, spawn_x, spawn_y);
				direction = _point_dir;
				speed = move_speed;
			}
			else
			{
				direction = 0;
				speed = 0;
			}
		}
	}
	//If the player is currently latched by a killer t cell
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
				
				if (break_count >= 20)
				{
					obj_vaccine_boi.latched = false;
					instance_destroy();
				}
			}
			vb_prev_h_speed = obj_vaccine_boi.h_move_speed;
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

