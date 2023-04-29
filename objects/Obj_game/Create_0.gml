window_set_caption("The Silly Slime & The Ludicrous Boy");
global.keyUp = vk_up;
global.keyDown = vk_down;
global.keyLeft = vk_left;
global.keyRight = vk_right;
global.keyRun = vk_lshift;
global.keyJump = ord("Z");
global.keyDash = ord("X");
global.keyShoot = ord("C");
global.keyBacktoTitle = ord("L");
time = room_speed;
timer = time;
keybinds = "Up:\n\nDown:\n\nLeft:\n\nRight:\n\nRun:\n\nJump:\n\nDash:\n\nShoot:\n\nGoing back to the title:"
refresh = false;

enum Keys{
	Default,
	Up,
	Down,
	Left,
	Right,
	Run,
	Jump,
	Dash,
	Shoot,
	BacktoTitle
}