extends Area2D

signal hit

func _ready():
	var collisions = [
		$ScuareCol, 
		$Sprite_enemyCol
	]
	var sptites =[
		$Scuare,
		$Sprite_enemy
	]
	var random_int = randi() % collisions.size()
	var selected_collisions = collisions[random_int]
	
	selected_collisions.visible = true
	selected_collisions.visible = true
	selected_collisions.disabled = false


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body. is_in_group('player elv'):
		print('Ouch!')
		hit.emit()
