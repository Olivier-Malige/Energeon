extends Area2D
var IsOpen = false
export var isBlue = true



func _ready():
	set_process(true)


func _process(delta):

	if IsOpen and not get_node("AnimationPlayer").get_current_animation() == "Open":
		get_node("AnimationPlayer").play("Open")
	elif not IsOpen :
		get_node("AnimationPlayer").play("Close")



func _on_BluePortal_body_enter( body ) :
	if body.get_name() == "Player" and IsOpen and get_parent().canTransfer :
		if  get_name() == "Portal1"  :
			#get_node("/root/World/SamplePlayer").play("Portal")
			body.set_pos(get_parent().get_node("Portal2").get_pos()+Vector2(0,16))
			get_parent().canTransfer = false

		elif get_name() == "Portal2" :
			body.set_pos(get_parent().get_node("Portal1").get_pos()+Vector2(0,16))
			#get_node("/root/World/SamplePlayer").play("Portal")
			get_parent().canTransfer = false




