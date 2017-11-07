extends Node2D

var flame = preload ("res://Scenes/Objects/Flame.tscn")
var flameON = false
var fl 

func _ready():
	set_process(true)
	
	
func _process(delta):
	if not flameON :
		get_node("Smoke").set_amount(4)



func _on_Delay_timeout():
	flameON = true
	get_node("flameLife").start()
	#get_node("/root/World/SamplePlayer").play("Flame")
	fl = flame.instance()
	var rot = get_rot()
	
	var pos = get_pos() + get_node("Spawn").get_pos() 
	get_node("Smoke").set_amount(10)
	fl.set_rot(rot)
	fl.set_pos(pos)
	get_parent().add_child(fl)


func _on_flameLife_timeout():
	fl.queue_free()
	flameON = false
	


	

