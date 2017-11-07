extends Area2D
export var bluePotionTimer = 2
var player      #ref to player object


func _ready():
	player = get_node("/root/World/Player")

	set_process(true)

func _process(delta): 
	if global.blue_buttun_ON && not player.bluePotion_on :
		get_node("Anim").play("Activate") 
	elif not global.blue_buttun_ON  :
		get_node("Anim").play("Void")



func _on_BluePotion_body_enter( body ):
	#Set PowerUp 
	if (body.get_name() == "Player") and get_node("Anim").get_current_animation() == "Activate" and global.blue_buttun_ON and is_visible() :
		get_node("/root/World/SamplePlayer").play("BluePotionUP")
		get_node("RespawnTimer").start()
		player.bluePotion_on = true
		hide()



func _on_RespawnTimer_timeout(): 
		show()