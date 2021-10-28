/// @description Insert description here

instance_create_layer(x, y, "Enemies", obj_rna_explosion);

if (instance_exists(obj_vaccine_boi))
{
	if (latched and obj_vaccine_boi.latched)
	{
		obj_vaccine_boi.latched = false;
	}
}

