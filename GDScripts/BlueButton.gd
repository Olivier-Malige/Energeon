extends Area2D

var buttPressed = false
export var blue = true
export var timer = 2
export var maxTimer = 30

func _ready():                             #more timer is longest bigger is it
	if timer <= 1 :
		scale(Vector2 (0.6,0.6))
	elif timer <= 3 :
		scale(Vector2 (0.8,0.8))
	elif timer <= 10 :
		scale(Vector2 (1,1))
	elif timer <= 15 :
		scale(Vector2 (1.2,1.2))
	elif timer <= 20 :
		scale(Vector2 (1.3,1.3))
	get_node("Timer").set_wait_time(timer)  #respawn delay  = timer 


func _on_Area2D_body_enter (body):
	# references
	var blue_butt_timer = get_parent().get_node("Blue_buttun_Reset_Timer")
	var red_butt_timer = get_parent().get_node("Red_buttun_Reset_Timer")

	if ((body.get_name() == "Player") and not buttPressed ) :
		buttPressed = true 
		if blue :
			if blue_butt_timer.get_wait_time()+ timer <= maxTimer :
				blue_butt_timer.set_wait_time(blue_butt_timer.get_time_left()+timer)
			else : blue_butt_timer.set_wait_time(maxTimer)
			blue_butt_timer.start()
			get_node("/root/World/SamplePlayer").play("BlueButtun")
			global.blue_buttun_ON = true
		else :
			if red_butt_timer.get_wait_time()+ timer <= maxTimer :
				red_butt_timer.set_wait_time(red_butt_timer.get_time_left()+timer)
			else : red_butt_timer.set_wait_time(maxTimer)
			red_butt_timer.start()
			get_node("/root/World/SamplePlayer").play("RedButtun")
			global.red_buttun_ON = true
		get_node("Sprite").set_frame(1)
		get_node("Timer").start()
		get_node("Particles2D").set_emitting(false)
		get_node("Light2D").set_enabled(false)
		
		

func _on_Timer_timeout():
	buttPressed = false
	get_node("Timer").stop()
	get_node("Particles2D").set_emitting(true)
	get_node("Light2D").set_enabled(true)
	get_node("Sprite").set_frame(0)
	
