extends Node2D



func _ready():
	get_node("AnimationPlayer").play("Yeah")
	set_process_input(true)

func _input(event):
	if event.is_action("start"):
		global.game_start = true
		get_tree().change_scene("res://Levels/World.xml")