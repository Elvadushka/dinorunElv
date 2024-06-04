extends Node2D

@export var MOB_scene: PackedScene
var screen_size : Vector2i
var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $PlayerElv.position
	GHUD.start_game_btn.connect(new_game)

func new_game():
	$PlayerElv.position = PlayerInitialPosition
	$Floor.position.x = 0
	$MOB_Timer.start()

func game_over():
	GHUD.update_Higscore_lable() 

func _process(delta):
	$Floor.position.x =$PlayerElv.position.x - 150

func _on_mob_timer_timeout():
	print('entrando')
	var mob = MOB_scene.instantiate()
	mob.position.x = $PlayerElv. position.x + 1500
	mob.position.y = 640
	add_child(mob)
	mob.hit.connect(game_over)
	$MOB_Timer.wait_time =  1

