//controls
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
dash = keyboard_check_pressed(vk_enter);
jump = keyboard_check_pressed(vk_space);
jump_held = keyboard_check(vk_space);
run = keyboard_check(vk_lshift)||keyboard_check(vk_rshift);
inputs = left||right||up||down;
onawall = place_meeting(x+1,y,Obj_solid) - place_meeting(x-1,y,Obj_solid);
shoot = keyboard_check_pressed(ord("P"));

state();
