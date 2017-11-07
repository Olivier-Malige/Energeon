extends Node2D


func _ready():
	get_node("AnimationPlayer").play("Idle")
	set_process(true)


func _process(delta):
	if !get_node("AnimationPlayer").is_playing() :
		queue_free()

