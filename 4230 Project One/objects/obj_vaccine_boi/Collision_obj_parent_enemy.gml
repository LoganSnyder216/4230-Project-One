/// @description Insert description here

hp -= other.damage;

if (hp <= 0)
{
	instance_destroy();
}