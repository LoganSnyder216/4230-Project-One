/// @description Insert description here

image_angle += 9 * image_xscale;

if (instance_exists(obj_vaccine_boi))
{
	x = obj_vaccine_boi.x - (19 * obj_vaccine_boi.image_xscale);
	y = obj_vaccine_boi.y - 16;
	image_xscale = -obj_vaccine_boi.image_xscale;
}