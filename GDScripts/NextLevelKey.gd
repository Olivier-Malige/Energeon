extends Area2D


func _ready():
	set_process(true)

func _process(delta):
		if not get_node("AnimationPlayer").is_playing() :
			get_node("AnimationPlayer").play("Idle")
	


func _on_BigKey_body_enter( body ):
	if body.get_name() == "Player":
		get_node("/root/World").nextLevelKey = true
		queue_free()
		
