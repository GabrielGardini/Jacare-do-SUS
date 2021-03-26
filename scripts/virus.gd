extends KinematicBody2D


func _on_virus_hitbox_area_entered(area):
	if area.is_in_group("bullet"):
		queue_free()
	pass # Replace with function body.
