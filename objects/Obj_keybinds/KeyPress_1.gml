if(!keyboard_check_pressed(vk_escape)){
	if(which_key != Keys.Default){
		var newKey = keyboard_key;
		var _saveData = array_create(0);
		#region keys changing code
		switch(which_key){
			case Keys.Up:
				global.keyUp = newKey;
				//saving
				var _saveEntity = {
					keyup : global.keyUp,
					keydown : global.keyDown,
					keyleft : global.keyLeft,
					keyright : global.keyRight,
					keyrun : global.keyRun,
					keyjump : global.keyJump,
					keydash : global.keyDash,
					keyshoot : global.keyShoot,
					keybackto : global.keyBacktoTitle
				}
				array_push(_saveData,_saveEntity);
			break;
			case Keys.Down:
				global.keyDown = newKey;
				//saving
				var _saveEntity = {
					keyup : global.keyUp,
					keydown : global.keyDown,
					keyleft : global.keyLeft,
					keyright : global.keyRight,
					keyrun : global.keyRun,
					keyjump : global.keyJump,
					keydash : global.keyDash,
					keyshoot : global.keyShoot,
					keybackto : global.keyBacktoTitle
				}
				array_push(_saveData,_saveEntity);
			break;
			case Keys.Left:
				global.keyLeft = newKey;
				//saving
				var _saveEntity = {
					keyup : global.keyUp,
					keydown : global.keyDown,
					keyleft : global.keyLeft,
					keyright : global.keyRight,
					keyrun : global.keyRun,
					keyjump : global.keyJump,
					keydash : global.keyDash,
					keyshoot : global.keyShoot,
					keybackto : global.keyBacktoTitle
				}
				array_push(_saveData,_saveEntity);
			break;
			case Keys.Right:
				global.keyRight = newKey;
				//saving
				var _saveEntity = {
					keyup : global.keyUp,
					keydown : global.keyDown,
					keyleft : global.keyLeft,
					keyright : global.keyRight,
					keyrun : global.keyRun,
					keyjump : global.keyJump,
					keydash : global.keyDash,
					keyshoot : global.keyShoot,
					keybackto : global.keyBacktoTitle
				}
				array_push(_saveData,_saveEntity);
			break;
			case Keys.Run:
				global.keyRun = newKey;
				//saving
				var _saveEntity = {
					keyup : global.keyUp,
					keydown : global.keyDown,
					keyleft : global.keyLeft,
					keyright : global.keyRight,
					keyrun : global.keyRun,
					keyjump : global.keyJump,
					keydash : global.keyDash,
					keyshoot : global.keyShoot,
					keybackto : global.keyBacktoTitle
				}
				array_push(_saveData,_saveEntity);
			break;
			case Keys.Jump:
				global.keyJump = newKey;
				//saving
				var _saveEntity = {
					keyup : global.keyUp,
					keydown : global.keyDown,
					keyleft : global.keyLeft,
					keyright : global.keyRight,
					keyrun : global.keyRun,
					keyjump : global.keyJump,
					keydash : global.keyDash,
					keyshoot : global.keyShoot,
					keybackto : global.keyBacktoTitle
				}
				array_push(_saveData,_saveEntity);
			break;
			case Keys.Dash:
				global.keyDash = newKey;
				//saving
				var _saveEntity = {
					keyup : global.keyUp,
					keydown : global.keyDown,
					keyleft : global.keyLeft,
					keyright : global.keyRight,
					keyrun : global.keyRun,
					keyjump : global.keyJump,
					keydash : global.keyDash,
					keyshoot : global.keyShoot,
					keybackto : global.keyBacktoTitle
				}
				array_push(_saveData,_saveEntity);
			break;
			case Keys.Shoot:
				global.keyShoot = newKey;
				//saving
				var _saveEntity = {
					keyup : global.keyUp,
					keydown : global.keyDown,
					keyleft : global.keyLeft,
					keyright : global.keyRight,
					keyrun : global.keyRun,
					keyjump : global.keyJump,
					keydash : global.keyDash,
					keyshoot : global.keyShoot,
					keybackto : global.keyBacktoTitle
				}
				array_push(_saveData,_saveEntity);
			break;
			case Keys.BacktoTitle:
				global.keyBacktoTitle = newKey;
				//saving
				var _saveEntity = {
					keyup : global.keyUp,
					keydown : global.keyDown,
					keyleft : global.keyLeft,
					keyright : global.keyRight,
					keyrun : global.keyRun,
					keyjump : global.keyJump,
					keydash : global.keyDash,
					keyshoot : global.keyShoot,
					keybackto : global.keyBacktoTitle
				}
				array_push(_saveData,_saveEntity);
			break;
		}
		#endregion
		//turn all the data into a JSON string
		var _string = json_stringify(_saveData);
		var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
		buffer_write(_buffer,buffer_string,_string);
		buffer_save(_buffer,"ChangedKeys.sav");
		buffer_delete(_buffer);
		show_debug_message("Game Saved" + _string);
	}
	instance_destroy();
}
