extends Area2D
export var open = false

func _ready():
	set_process(true)

func _process(delta):
	if open == true :
		get_node("Door").set_frame(0)
	else :
		get_node("Door").set_frame(1)



func _on_ExitDoor_body_enter( body ):
	if body.get_name() == "Player" :
		if get_node("/root/World").nextLevelKey and not open :
			open = true
			return
		if open:
			if global.level < global.total_level :
				global.level += 1
				get_node("/root/World").restart()
