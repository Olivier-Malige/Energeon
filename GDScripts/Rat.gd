extends KinematicBody2D

var speedMotion 
var anim = ""
var animSpeed = 3
var motion 



func _ready():
	motion = _randomise_movement()
	set_fixed_process(true)
	
func _fixed_process(delta):
	var new_anim = anim 
	
	
	if motion == Vector2(-1,0):
		new_anim = "Left"
	if motion == Vector2(1,0):
		new_anim = "Right"
	if motion == Vector2(0,-1):
		new_anim = "Up"
	if motion == Vector2(0,1):
		new_anim = "Down"	
	
	if is_colliding() :
		motion = _randomise_movement()
		
	move(motion*speedMotion*delta)
	if (new_anim != anim): 
		anim = new_anim
		get_node("Anim").play(anim)
	
func _randomise_movement():
	speedMotion = randi()%30+30
	var r = randi()%4+1
	if r == 1 :
		return  Vector2(-1,0)
	elif r == 2 :
		return Vector2(1,0)
	elif r == 3 :
		return Vector2(0,1)
	elif r == 4 :
		return Vector2(0,-1)



func _on_RandomiseMouvment_timeout():
	motion = _randomise_movement()


func _on_Area2D_body_enter( body ):
	if body.get_name() == "Player":
		get_node("/root/World").remove_life()
