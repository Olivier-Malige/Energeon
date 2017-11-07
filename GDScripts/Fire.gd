extends Area2D



func _ready():
	get_node("AnimationPlayer").play("idle")
	set_process(true)
	
func _process(delta):
	set_pos(get_node("/root/World/Player/").get_pos()+get_node("/root/World/Player/FirePos").get_pos() )
	if !get_node("AnimationPlayer").is_playing():
		get_parent().get_node("Player").onFire = false
		queue_free()
	


func _on_Area2D_body_enter( body ):

	if body.is_in_group("Ennemy"):
		#Smoking effect on ennemy die
		var smoke = preload ("res://Scenes/Objects/Smoke.tscn")
		var pos = body.get_pos()
		var sm = smoke.instance()
		sm.set_pos(pos)
		body.get_parent().add_child(sm)
		body.queue_free()
