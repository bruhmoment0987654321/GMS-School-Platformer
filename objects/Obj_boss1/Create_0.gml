Boss_state = "wait";
Boss_state_before = "";
_health = 5;
dir = 1;
wait_time_amount = 5*60;
wait_time = wait_time_amount;
jump_time = 60;
stomp_timer_amount = 3*60;
wait = false;
position = -1
spit_time_amount = 3*60;
spit_ball = noone;
spit_timer = spit_time_amount;
warning = instance_create_layer(-100,-100,"Behind",Obj_boss_warning);
stomp_timer = stomp_timer_amount;
exposed = false;
stomp_location = -1;
hsp = 0;
vsp = 0;