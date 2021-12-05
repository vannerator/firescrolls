extends Node2D

var scrolls = 5
var lives = 3

func _ready():
	$GUI.update_scrolls(scrolls)
	$GUI.update_lives(lives)
	
func skeleton_hit():
	$SkeletonSound.play()
	lives -= 1
	$GUI.update_lives(lives)
	if lives == 0:
		game_over()
	else:
		$Knight.update_speed(30)
		$SpeedTimer.start()
		$GUI.show_slowbar()	
		yield($SpeedTimer, "timeout")
		$Knight.update_speed(90)
	
func snake_hit():
	$SnakeSound.play()
	lives -= 1
	$GUI.update_lives(lives)
	if lives == 0:
		game_over()
	else:
		$Knight.update_speed(30)
		$SpeedTimer.start()
		$GUI.show_slowbar()	
		yield($SpeedTimer, "timeout")
		$Knight.update_speed(90)
	
func potion_hit():
	$PickupSound.play()
	$Knight.update_speed(150)
	$SpeedTimer.start()
	$GUI.show_fastbar()	
	yield($SpeedTimer, "timeout")
	$Knight.update_speed(90)
	
func scroll_pickup():
	$PickupSound.play()
	scrolls -= 1
	$GUI.update_scrolls(scrolls)
	
func game_over():
	$Music.stop()
	$DeathSound.play()
	$Knight.queue_free()
	$GUI.show_gameover()
	
func next_level():
	if scrolls == 0:
		$Music.stop()
		$WinSound.play()
		yield(get_tree().create_timer(5.0), "timeout")
		get_tree().change_scene("res://Scenes/Level2.tscn")
