extends Node
var canTransfer = true
var accum = 0 #delay to teleport




func _ready():
	set_process(true)


func _process(delta):
	accum += delta
	if accum >= 2 :
		canTransfer = true
		accum = 0
 
	
	

	for ch in get_children() : 
		if ch.is_in_group("Portal") :
			if ch.isBlue and global.blue_buttun_ON:
				ch.IsOpen = true
			elif not ch.isBlue and global.red_buttun_ON:
					ch.IsOpen = true
			else : ch.IsOpen = false




func _on_canTransfertDelay_timeout():
	pass
