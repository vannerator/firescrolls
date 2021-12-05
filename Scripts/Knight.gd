extends KinematicBody2D

export var speed = 90

signal skeleton
signal potion
signal snake
signal scroll

var last_direction = Vector2(0,1)

func _ready():
	pass 
	
func update_speed(new_speed):
	speed = new_speed

func _process(delta):
	var direction: Vector2
	
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	var movement = speed * direction * delta
	animates_player(direction)
	var collision = move_and_collide(movement)
	if collision:
		if "Skeleton" in collision.collider.name:
			emit_signal("skeleton")
			collision.collider.queue_free()
		if "Potion" in collision.collider.name:
			emit_signal("potion")
			collision.collider.queue_free()
		if "Snake" in collision.collider.name:
			emit_signal("snake")
			collision.collider.queue_free()
		if "Scroll" in collision.collider.name:
			emit_signal("scroll")
			collision.collider.queue_free()
	
	

func animates_player(direction:Vector2):
	if direction != Vector2.ZERO:
		last_direction = direction
		
		var animation = "Walk" + get_animation_direction(last_direction)
		$AnimatedSprite.play(animation)
	else:
		var animation = "Idle" + get_animation_direction(last_direction)
		$AnimatedSprite.play(animation)


func get_animation_direction(direction:Vector2):
	var norm_direction = direction.normalized()
	
	if norm_direction.y >= 0.707:
		return "Down"
	elif norm_direction.y <= -0.707:
		return "Up"
	elif norm_direction.x >= 0.707:
		return "Right"
	elif norm_direction.x <= -0.707:
		return "Left"


