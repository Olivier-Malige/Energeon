extends Area2D


func _on_Spike_body_enter( body ):
	if body.get_name() == "Player":
		get_node("/root/World").remove_life()
