extends Area2D
var rat= preload("res://Scenes/Objects/Rat.tscn")
var spawningRats = false 
var accumDelta = 0
export var spawnDelay = 3 # Seconds 


func _ready():
	set_process(true)

func _process(delta):
	accumDelta += delta

	
	if spawningRats and accumDelta >= spawnDelay  :
		get_node("/root/World/SamplePlayer").play("rat")
		var  rats = rat.instance()
		var pos =  get_pos() + get_node("SpawnPos").get_pos() 
		rats.set_pos(pos)
		get_parent().add_child(rats)
		accumDelta = 0




func _on_RatsGenerator_body_enter( body ):
	if body.get_name()== "Player" :
		spawningRats = true 


func _on_RatsGenerator_body_exit( body ):
	if body.get_name()== "Player" :
		spawningRats = false 


