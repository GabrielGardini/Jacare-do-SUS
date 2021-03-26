extends Area2D
var look = null

var speed = 500
func _physics_process(delta):
	position += transform.x * speed * delta
#	look_at(get_global_mouse_position())
#	look_at(get_global_position())
	pass
func _on_vacina_body_entered(body):
	if body.is_in_group("trash_can"):
		queue_free()
	pass # Replace with function body.

#func vac_direction():
#	look=look_at(get_global_mouse_position())
#	look=null
#	pass
