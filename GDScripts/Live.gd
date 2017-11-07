extends Sprite



func _ready():
	get_node("AnimationPlayer").play("Idle")
	set_process(true)
	
func _process(delta):
	if global.lives == 1 :
		get_node("AnimationPlayer").set_speed(2)
	else : 
		get_node("AnimationPlayer").set_speed(0.8)
	
