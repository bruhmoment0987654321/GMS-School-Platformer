#region controls
left = keyboard_check(global.keyLeft);
right = keyboard_check(global.keyRight);
up = keyboard_check(global.keyUp);
down = keyboard_check(global.keyDown);
dash = keyboard_check_pressed(global.keyDash);
jump = keyboard_check_pressed(global.keyJump);
jump_held = keyboard_check(global.keyJump);
shoot = mouse_check_button_pressed(mb_left);	
run = keyboard_check(global.keyRun);
jump_is_inside_buffer = false; 
is_on_ground = false;
#endregion
state();
