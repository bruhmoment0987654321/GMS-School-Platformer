//controls
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
jump = keyboard_check_pressed(vk_space);
run = keyboard_check(vk_lshift)||keyboard_check(vk_rshift);
inputs = left||right||up||down;
//calculate movement
state();
