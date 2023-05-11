// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_refreshkeybinds(){
	with(Obj_key){
		switch(keytype){
				case Keys.Default:
					keystring = "None"
				break;
				case Keys.Up:
					keystring = getUnicodeString(global.keyUp);
				break;
				case Keys.Down:
					keystring = getUnicodeString(global.keyDown);
				break;
		
				case Keys.Left:
					keystring = getUnicodeString(global.keyLeft);
				break;
				case Keys.Right:
					keystring = getUnicodeString(global.keyRight);
				break;
				case Keys.Run:
					keystring = getUnicodeString(global.keyRun);
				break;
				case Keys.Jump:
					keystring = getUnicodeString(global.keyJump);
				break;
				case Keys.Dash:
					keystring = getUnicodeString(global.keyDash);
				break;
				case Keys.BacktoTitle:
					keystring = getUnicodeString(global.keyBacktoTitle);
				break;
		}
	}
}