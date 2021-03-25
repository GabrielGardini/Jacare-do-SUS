extends KinematicBody2D
var move = Vector2.ZERO
var player = null
var speed = 1

func _physics_process(delta):
	move = Vector2.ZERO
	if player != null:
		move = position.direction_to(player.position) * speed
	else:
		move = Vector2.ZERO
	
	move = move.normalized()
	move = move_and_collide(move)
	
func _on_Area2D_body_entered(body):
	if body != self:
		player = body
		

func _on_Area2D_body_exited(body):
	player = null
