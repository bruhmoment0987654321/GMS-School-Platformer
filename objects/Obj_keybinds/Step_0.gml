if(!keyboard_check_pressed(vk_escape) && keyboard_check_pressed(vk_anykey)){
	if(which_key != Keys.Default){
		var newKey = keyboard_key;
		switch(which_key){
			case Keys.Up:
				global.keyUp = newKey;
			break;
			case Keys.Down:
				global.keyDown = newKey;
			break;
			case Keys.Left:
				global.keyLeft = newKey;
			break;
			case Keys.Right:
				global.keyRight = newKey;
			break;
			case Keys.Run:
				global.keyRun = newKey;
			break;
			case Keys.Jump:
				global.keyJump = newKey;
			break;
			case Keys.Dash:
				global.keyDash = newKey;
			break;
			case Keys.Shoot:
				global.keyShoot = newKey;
			break;
			case Keys.BacktoTitle:
				global.keyBacktoTitle = newKey;
			break;

		}
	}
	instance_destroy();
}
