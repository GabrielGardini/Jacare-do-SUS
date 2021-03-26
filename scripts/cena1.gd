extends Node2D
var points = 0

func _on_enemy_hitbox_area_entered(area):
	if area.is_in_group("bullet"):
		points -= 100
		if points <= 0:
			points = 0
		$CanvasLayer2/score_label.set_text("score: "+str(points))
	pass # Replace with function body.


func _on_virus_hitbox_area_entered(area):
	if area.is_in_group("bullet"):
		points += 100
		$CanvasLayer2/score_label.set_text("score: "+str(points))
	pass # Replace with function body.
