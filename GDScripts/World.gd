extends Node
var nextLevelKey = false
var level = load("res://Levels/Level_"+str(global.level)+".tscn")
var pLive = preload("res://Scenes/Ui/Live.tscn")
var start_lives 
var shield = false



func _ready():
	global.red_buttun_ON = false
	global.blue_buttun_ON = false
	add_child(level.instance())
	start_lives = global.lives

	update_lifes()
	set_process_input(true)
	set_process(true)

func _process(delta):
	if nextLevelKey :
		get_node("UI/NextLevelKeyUI").show()
	else :
		get_node("UI/NextLevelKeyUI").hide()

func remove_life():
	if not shield:
		get_node("SamplePlayer").play("PlayerHurt")
		global.lives -= 1
		shield = true
		get_node("Player").set_opacity(0.5)
		get_node("Shield").start()
		update_lifes()

func add_life():
	global.lives += 1
	update_lifes()
	


func _on_shield_timeout():
	get_node("Player").set_opacity(1)
	shield = false

	

func update_lifes():
	if global.lives > 0:
		for el in get_node("UI/Lives").get_children():
			el.queue_free()
		for i in range(global.lives):
			var live = pLive.instance()
			live.set_pos(Vector2(32+i*48,32))
			get_node("UI/Lives").add_child(live)
	else:
		get_node("SamplePlayer").play("PlayerDeath")
		get_node("Player").hide()
		get_node("PlayerRespawn").start()
		
		
func restart():
	get_tree().change_scene("res://Levels/World.xml")
	global.lives = start_lives

func _input(event):
	if not event.is_echo() && event.is_pressed():
		if event.is_action("cheat") and global.cheat:
			global.level += 1
			restart()
		if event.is_action("ui_full_screen"):
			if not OS.is_window_fullscreen() :
				OS.set_window_fullscreen(true)
			else : OS.set_window_fullscreen(false)

		if event.is_action("ui_cancel"):
			get_tree().change_scene("res://scenes/main_menu.tscn")
		elif event.is_action("restart"):
			restart()
		if event.type == InputEvent.KEY:
			if event.scancode == KEY_F3:
				global.music = !global.music
				if global.music:
					get_node("StreamPlayer").play()
				else:
					get_node("StreamPlayer").stop()
			elif event.scancode == KEY_F9:
				get_tree().quit()


func _on_Shield_timeout():
	get_node("Player").set_opacity(1)
	shield = false




func _on_PlayerDeath_timeout():
	restart()
	
