extends Area2D

export var redPotionTimer = 2
var player      #ref to player object

func _ready():
	get_node("Anim").play("Void")
	player = get_node("/root/World/Player")

	set_process(true)

func _process(delta): 
	if global.red_buttun_ON && not player.redPotion_on :
		get_node("Anim").play("Activate")
	elif not global.red_buttun_ON  :
		get_node("Anim").play("Void")


func _on_RedPotion_body_enter( body ):
	if body.get_name() == "Player" and get_node("Anim").get_current_animation() == "Activate"  and global.red_buttun_ON and is_visible():
		get_node("RespawnTimer").start()
		#get_node("/root/World/SamplePlayer").play("Potion")
		player.redPotion_on = true
		hide()


func _on_RespawnTimer_timeout():
	if global.red_buttun_ON :
		show()

