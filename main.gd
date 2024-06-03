extends Node2D

var screen_size : Vector2i
var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $PlayerElv.position

func new_game():
	$PlayerElv.position = PlayerInitialPosition
	$Floor.position.x = 0
	

func game_over():
	GHUD.update_Higscore_lable() 

func _process(delta):
	if ($PlayerElv.position.x-$Floor.position.x)> screen_size.x:
		$Floor.position.x =$PlayerElv.position.x - 150
