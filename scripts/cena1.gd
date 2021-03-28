extends Node2D
var points = 0
var PRE_VIRUS = preload("res://level design/level 1/virus.tscn")
var spawn_delay = 4
var virus
var virus_hitbox = null

func _ready():
	$spawn_timer.start(spawn_delay)
	pass
	
func _process(delta):
	if virus_hitbox != null:
		virus_hitbox.connect("area_entered",self,"_on_virus_hitbox_area_entered")
	pass	

func _on_enemy_hitbox_area_entered(area):#Pontua negativamente caso a vacina entre em contato com o agente
	if area.is_in_group("bullet"):
		$shot_trash.play() 
		points -= 1000
		if points <= 0:
			points = 0
		$CanvasLayer2/score_label.set_text("score: "+str(points))
	pass

func _on_virus_hitbox_area_entered(area):#Pontua positivamente caso a vacina entre em contato com o vírus
	if area.is_in_group("bullet"):
		$virus_kill.play()
		points += 100
		$CanvasLayer2/score_label.set_text("score: "+str(points))

func _on_spawn_timer_timeout():
	virus = PRE_VIRUS.instance()	
	add_child(virus)
	virus_hitbox = virus.get_child(2)
	virus.set_global_position(Vector2(rand_range(0,1016),rand_range(0,575)))
	pass # Replace with function body.
