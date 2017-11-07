extends Area2D
var fullPlaying = false



func _ready():
	set_process(true)

func _process(delta):
	if  global.blue_buttun_ON :
		fullPlaying = false
		get_node("AnimationPlayer").play("Empty")
	else : 
		if !fullPlaying :
			fullPlaying = true
			get_node("AnimationPlayer").play("Full")
			


func _on_BlueSpike_body_enter( body ):
	if body.get_name() == "Player" and not global.blue_buttun_ON:
		get_node("/root/World").remove_life()
	