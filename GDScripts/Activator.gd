extends StaticBody2D

export  var redBlockColor = true
export var inverse = false 

func _ready():
	set_process(true)

func _process(delta):
	if (redBlockColor and global.red_buttun_ON) or (!redBlockColor and global.blue_buttun_ON) :
		if not inverse :
			get_node("Sprite").set_frame(1) 
			get_node("CollisionShape2D").set_trigger(true)
		else : 
			get_node("Sprite").set_frame(0)
			get_node("CollisionShape2D").set_trigger(false)
	else: 
		if not inverse :
			get_node("Sprite").set_frame(0)
			get_node("CollisionShape2D").set_trigger(false)
		else :
			get_node("Sprite").set_frame(1) 
			get_node("CollisionShape2D").set_trigger(true)

func _on_Area2D_body_enter( body ):
	pass
	
