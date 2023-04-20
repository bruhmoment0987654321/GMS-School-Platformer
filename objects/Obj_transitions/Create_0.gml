/// @desc mode and size setup
w = display_get_gui_width();
h = display_get_gui_height();
h_half = h/2;
enum TRANS_MODE{
	OFF,
	NEXT,
	RESTART,
	INTRO,
	GOTO
}

mode = TRANS_MODE.INTRO;
percent = 1;
percent_target = 1.5;
target = room;