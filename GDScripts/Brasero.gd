extends StaticBody2D

var isOnFire = false 

func _ready():
	set_process(true)

func _process(delta):
	if isOnFire :
		get_node("Fire1").show()
		get_node("Fire2").show()
		get_node("Smoke").show()
		get_node("Light2D").show()
	else :
		get_node("Fire1").hide()
		get_node("Fire2").hide()
		get_node("Smoke").hide()
		get_node("Light2D").hide()
	

func _on_Area2D_area_enter( area ):
	if area.is_in_group("fire") :
		isOnFire = true