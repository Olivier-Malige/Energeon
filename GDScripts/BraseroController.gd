extends Node



func _ready():
	set_process(true)


func _process(delta):
	var totalBrasero = 0
	var activBrasero = 0

	for ch in get_children() :

		if ch.is_in_group("brasero") :
			totalBrasero += 1
			if ch.isOnFire :
				activBrasero +=1

	if totalBrasero == activBrasero :
		for ch in get_children() :
			if ch.is_in_group("chest") :
				ch.isOpen = true
