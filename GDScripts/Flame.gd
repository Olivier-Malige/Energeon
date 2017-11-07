extends Area2D

func _ready():
	get_node("AnimationPlayer").play("Idle")
	set_process(true)




func _on_Flame_body_enter( body ):
	if body.is_in_group("Ennemy"):
		#Smoking effect on ennemy die
		var smoke = preload ("res://Scenes/Objects/Smoke.tscn")
		var pos = body.get_pos()
		var sm = smoke.instance()
		sm.set_pos(pos)
		body.get_parent().add_child(sm)
		body.queue_free()
	if body.get_name() == "Player":
		get_node("/root/World").remove_life()