#region controls
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
dash = keyboard_check_pressed(vk_enter);
jump = keyboard_check_pressed(vk_space);
jump_held = keyboard_check(vk_space);
inputs = left||right||up||down;
shoot = keyboard_check_pressed(ord("P"));		
#endregion
state();
