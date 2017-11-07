
extends KinematicBody2D


# Member variables
const playerSpeed = 50 
var speedMotion
var anim = ""
var animSpeed = 2



var bluePotion_on = false  
var bluePotion_MoveSpeed  = playerSpeed + 30 #Speed Up  Pixels/seconds 
var bluePotion_AnimSpeed = 4

var redPotion_on = false
var fire = preload ("res://Scenes/Objects/Fire.tscn")
var onFire = false
var motion = Vector2()

func _ready():
	
	speedMotion = playerSpeed 
	set_fixed_process(true)


func _fixed_process(delta):
	var new_anim = anim 

	get_node("Anim").set_speed(animSpeed)

	if bluePotion_on && redPotion_on :
		get_node("playerSprite").set_modulate(Color(0.8,0.4,2,1)) #set player purple color
		speedMotion = bluePotion_MoveSpeed
	elif bluePotion_on :
		get_node("playerSprite").set_modulate(Color(0.4,0.8,2,1)) #set player blue color
		speedMotion = bluePotion_MoveSpeed
		get_node("Anim").set_speed(bluePotion_AnimSpeed)
	elif redPotion_on :
		get_node("playerSprite").set_modulate(Color(2,0.4,0.4,1)) #Set player Red color
	else : 
		get_node("playerSprite").set_modulate(Color(1,1,1,1)) #set player normal color
		speedMotion = playerSpeed
		get_node("Anim").set_speed(animSpeed)
		
	
	if anim == "Up":
		new_anim = "IdleUp"
	elif anim == "Down" :
		new_anim = "IdleDown"
	elif anim == "Left" :
		new_anim = "IdleLeft"
	elif anim == "Right" :
		new_anim = "IdleRight"


	
	if (Input.is_action_pressed("btn_up")):
		motion += Vector2(0, -1)
		new_anim = "Up"
	if (Input.is_action_pressed("btn_down")):
		motion += Vector2(0, 1)
		new_anim = "Down"
	if (Input.is_action_pressed("btn_right")):
		motion += Vector2(1, 0)
		new_anim = "Right"
	if (Input.is_action_pressed("btn_left")):
		motion += Vector2(-1, 0)
		new_anim = "Left"
	if (Input.is_action_pressed("btn_fire")) && redPotion_on && not onFire:
		#get_node("/root/World/SamplePlayer").play("RedPotionUP")
		onFire = true
		var fi = fire.instance()
		var pos = get_pos() + get_node("FirePos").get_pos() 
		fi.set_pos(pos)
		get_parent().add_child(fi)


	# Change animation
	if (new_anim != anim):
		anim = new_anim
		get_node("Anim").play(anim)
	
	motion = motion.normalized()*speedMotion*delta
	if not is_hidden() :
		motion = move(motion)
	
	# Make character slide nicely through the world
	var slide_attempts = 4
	while(is_colliding() and slide_attempts > 0):
		motion = get_collision_normal().slide(motion)
		motion = move(motion)
		slide_attempts -= 1
	


