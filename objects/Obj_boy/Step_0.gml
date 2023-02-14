// Inherit the parent event
event_inherited();

transform = keyboard_check_pressed(ord("T"));
if (transform){
	instance_change(Obj_transfoslime,true);
}
