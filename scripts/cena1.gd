extends Node2D
var points = 0
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

