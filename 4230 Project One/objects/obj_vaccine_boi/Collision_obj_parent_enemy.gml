/// @description Insert description here

if (!i_frames)
{
	audio_play_sound(snd_vb_damage, 1, false);
	hp -= other.damage;
	i_frames = true;
	alarm[0] = 30;
}

if (hp <= 0)
{
	instance_destroy();
}