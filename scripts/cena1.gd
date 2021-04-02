extends Node2D
onready var wont_move = $player/wont_move
onready var player = $player
var points = 0
var PRE_VIRUS = preload("res://level design/level 1/virus.tscn")
var spawn_delay = 2
var virus
var virus_hitbox = null

func _ready():
	$spawn_timer.start(spawn_delay)
	pass
	
func _process(delta):
	pass	
	
func _on_enemy_hitbox_area_entered(area):#Pontua negativamente caso a vacina entre em contato com o agente
	if area.is_in_group("bullet"):
		$shot_trash.play() 
		points -= 1000
		if points <= 0:
			points = 0
		$score/score_label.set_text("score: "+str(points))
	pass

func _on_virus_hitbox_area_entered(area):#Pontua positivamente caso a vacina entre em contato com o vírus
	if area.is_in_group("bullet"):
		$virus_kill.play()
		points += 100
		$score/score_label.set_text("score: "+str(points))

func _on_spawn_timer_timeout():
	virus = PRE_VIRUS.instance()	
	add_child(virus)
	virus_hitbox = virus.get_child(2)
	virus_hitbox.connect("area_entered",self,"_on_virus_hitbox_area_entered")
	virus.set_global_position(Vector2(rand_range(0,1016),rand_range(0,575)))
	pass # Replace with function body.

func _on_limit_area_entered(area):
	if area.is_in_group("bullet"):
		points -= 100
		if points <= 0:
			points = 0
		$shot_trash.play()
		$score/score_label.set_text("score: "+str(points))
	pass # Replace with function body.

# func _on_player_hitbox_area_entered(area):
# 	if area.is_in_group("virus"):
# 		wont_move.start(1)
# 		player.PAUSE_MODE_PROCESS
# 	elif wont_move.is_stopped():
# 		player.PAUSE_MODE_STOP
# 	pass # Replace with function body.
