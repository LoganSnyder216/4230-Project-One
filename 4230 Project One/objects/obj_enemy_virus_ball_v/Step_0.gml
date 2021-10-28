/// @description Insert description here

if (move_speed > 0)
{
	if (tilemap_get_at_pixel(tile_map, x, bbox_bottom) != 0)
	{
		y = y - (y mod tile_size) + (tile_size - 1) - (bbox_bottom - y);
		
		move_speed *= -1;
	}
}
else
{
	if (tilemap_get_at_pixel(tile_map, x, bbox_top) != 0)
	{
		y = y - (y mod tile_size) - (bbox_top - y);
		
		move_speed *= -1;
	}
}

y += move_speed;

