extends Area2D

var speed = 500

func _physics_process(delta):
	position += transform.x * speed * delta



func _on_vacina_body_entered(body):
	if body.is_in_group("trash_can"):
		queue_free()
	pass # Replace with function body.
