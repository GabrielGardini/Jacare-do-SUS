extends KinematicBody2D
var points = 0

func _on_hitbox_area_entered(area):
	if area.is_in_group("bullet"):
		queue_free()
	pass # Replace with function body.
