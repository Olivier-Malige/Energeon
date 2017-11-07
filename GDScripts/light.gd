extends Light2D

var accum = 0

func _ready():
	set_process(true)
	
func _process(delta):
	accum += delta
	if accum >= 0.05 :
		set_energy(rand_range (0.8,1))
		accum = 0
	
