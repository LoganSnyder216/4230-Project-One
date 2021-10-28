/// @description Insert description here

if (move_speed > 0)
{
	if (tilemap_get_at_pixel(tile_map, bbox_right, y) != 0)
	{
		x = x - (x mod tile_size) + (tile_size - 1) - (bbox_right - x);
		
		move_speed *= -1;
	}
}
else
{
	if (tilemap_get_at_pixel(tile_map, bbox_left, y) != 0)
	{
		x = x - (x mod tile_size) - (bbox_left - x);
		
		move_speed *= -1;
	}
}

x += move_speed;

