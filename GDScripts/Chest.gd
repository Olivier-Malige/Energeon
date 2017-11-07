extends StaticBody2D
var treasurOUT
var isOpen = false 
export var Treasur = preload ("res://Scenes/Objects/NextLevelKey.tscn")

func _ready():
	set_process(true)

func _process(delta):

	if isOpen :
		get_node("AnimationPlayer").play("Open")
		if not treasurOUT :
			var pos = get_pos() + Vector2 (0,-15)
			var Trea = Treasur.instance()
			Trea.set_pos(pos)
			get_parent().add_child(Trea)
			treasurOUT = true
	else :
		get_node("AnimationPlayer").play("Closed")
