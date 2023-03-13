//controls
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
dashshoot = keyboard_check_pressed(vk_enter);
jump = keyboard_check_pressed(vk_space);
jump_held = keyboard_check(vk_space);
run = keyboard_check(vk_lshift)||keyboard_check(vk_rshift);
inputs = left||right||up||down;
onawall = place_meeting(x+1,y,Obj_wall) - place_meeting(x-1,y,Obj_wall);
//calculate movement
state();
