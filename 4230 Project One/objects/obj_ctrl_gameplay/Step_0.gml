/// @description Insert description here

//Press R to restart the room
if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}

//Press escape to exit to the main menu
if (keyboard_check(vk_escape))
{
	room_goto(rm_start_screen);
}

//Press H to fully heal Vaccine Boi
if (keyboard_check(ord("H")))
{
	if (instance_exists(obj_vaccine_boi))
	{
		obj_vaccine_boi.hp = 300;
	}
}