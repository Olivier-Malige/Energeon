extends Node
var cheat = false
var debug = false
var level = 1
var total_level = 2
var lives = 5
#var diamond = 0
var music = true
var sounds = true
var blue_buttun_ON = false
var red_buttun_ON  = false
var game_start = false 


func _ready():
	randomize()
	if game_start :
		set_process(true)
	
func _process(delta):
	if  not blue_buttun_ON :
		get_node("/root/World/Player/").bluePotion_on = false
	if not red_buttun_ON :
		get_node("/root/World/Player/").redPotion_on = false
