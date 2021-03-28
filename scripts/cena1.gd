extends Node2D
var points = 0
var PRE_VIRUS = preload("res://level design/level 1/virus.tscn")
var spawn_delay = 4
func _ready():
	$spawn_timer.start(spawn_delay)
	pass
	
func _on_enemy_hitbox_area_entered(area):#Pontua negativamente caso a vacina entre em contato com o agente
	if area.is_in_group("bullet"):
		$shot_trash.play() 
		points -= 100
		if points <= 0:
			points = 0
		$CanvasLayer2/score_label.set_text("score: "+str(points))
	pass

func _on_virus_hitbox_area_entered(area):#Pontua positivamente caso a vacina entre em contato com o vírus
	if area.is_in_group("bullet"):
		points += 100
		$CanvasLayer2/score_label.set_text("score: "+str(points))
		$virus_kill.play()

func _on_spawn_timer_timeout():
	var virus = PRE_VIRUS.instance()
	add_child(virus)
	virus.set_global_position(Vector2(rand_range(0,1016),rand_range(0,575)))
	pass # Replace with function body.
