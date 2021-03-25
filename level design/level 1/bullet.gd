extends Area2D

var speed = 50

func _physics_process(delta):
	position += transform.x * speed * delta
