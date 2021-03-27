extends KinematicBody2D


func _on_virus_hitbox_area_entered(area):#Tira o virus da cena caso ele seja atingido pela vacina
	if area.is_in_group("bullet"):
		queue_free()
	pass
