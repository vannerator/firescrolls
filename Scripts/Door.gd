extends Area2D

signal win

func _on_Door_body_entered(body):
	if body.name == "Knight":
		emit_signal("win")
		print("test")
