extends KinematicBody2D
var speed = 1
var virus_delay = 1
var random_x = 10
var random_y = 10

func _ready():
	$virus_timer.start(virus_delay)

func _process(delta):
	move_and_collide(Vector2(random_x, random_y) * delta)
	pass


func _on_virus_hitbox_area_entered(area):#Tira o virus da cena caso ele seja atingido pela vacina
	if area.is_in_group("bullet"):
		queue_free()
	pass


func _on_virus_timer_timeout():
	random_x = rand_range(-50,50)
	random_y = rand_range(-50,50)
	pass # Replace with function body.
