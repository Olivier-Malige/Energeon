extends Position2D

onready var player = get_node("/root/World/Player")

func _ready():
	player.set_pos(get_pos())
