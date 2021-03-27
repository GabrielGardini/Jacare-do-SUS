extends KinematicBody2D
var speed = -75

func _process(delta):
	translate(Vector2(speed,0) * delta)
	pass


func _on_virus_hitbox_area_entered(area):#Tira o virus da cena caso ele seja atingido pela vacina
	if area.is_in_group("bullet"):
		queue_free()
	pass
