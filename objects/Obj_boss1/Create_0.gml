//boss state variables
Boss_state = "wait";
pre_boss_state = "";
//health variables
_health = 1;
lowered_health = 3;
//timer variables
wait_time_amount = 2.5*60;
wait_time = wait_time_amount;

spit_time_amount = 3*60;
spit_timer = spit_time_amount;

jump_time = 60;

stomp_timer_amount = 3*60;
stomp_timer = stomp_timer_amount;

attack_time = 60;

dash_timer = 5*60;

bounce_amount = 0;
bounce_amount_max = 6;
stomp2_timer = 2*60;

hit_timer = 1.5*60;
//direction and movement variables
dir = 1;
friction_ = 0.05;
stomp_location = -1;
hsp = 0;
vsp = 0;
//other variables
dash = false;
bounce = false;
wait = false;
wait2 = true;
warning = instance_create_layer(-100,-100,"Behind",Obj_boss_warning);

