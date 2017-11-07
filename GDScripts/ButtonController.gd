extends Node

var RedButt_ON = false
var BlueButt_ON = false

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	get_node("/root/World/UI/RedButtunTimer").set_value (get_node("Red_buttun_Reset_Timer").get_time_left())
	get_node("/root/World/UI/BlueButtunTimer").set_value (get_node("Blue_buttun_Reset_Timer").get_time_left())


func _on_Red_buttun_Reset_Timer_timeout():
	global.red_buttun_ON = false


func _on_Blue_buttun_Reset_Timer_timeout():
	global.blue_buttun_ON = false
