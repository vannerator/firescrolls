extends CanvasLayer


func update_scrolls(num):
	$ScrollsLabel/ScrollsCount.text = str(num)
	
func update_lives(num):
	$LivesLabel/LivesCount.text = str(num)

func show_slowbar():
	if $BarTimer.time_left > 0:
		$BarTimer.stop()
		$BarTimer.emit_signal("timeout")
	$BarTimer.start()
	$SpeedBar.visible = true
	$SpeedBar/SlowBar.visible = true
	
func show_fastbar():
	if $BarTimer.time_left > 0:
		$BarTimer.stop()
		$BarTimer.emit_signal("timeout")
	$BarTimer.start()
	$SpeedBar.visible = true
	$SpeedBar/FastBar.visible = true

func _on_BarTimer_timeout():
	$SpeedBar.visible = false
	$SpeedBar/SlowBar.visible = false
	$SpeedBar/FastBar.visible = false
	$SpeedBar/SlowBar.rect_size.x = 71
	$SpeedBar/FastBar.rect_size.x = 71

func _process(delta):
	$SpeedBar/SlowBar.rect_size.x = 71 * ($BarTimer.time_left / 5)
	$SpeedBar/FastBar.rect_size.x = 71 * ($BarTimer.time_left / 5)
	
func show_gameover():
	$GameOver.visible = true

func _on_Button_pressed():
	get_tree().reload_current_scene()
