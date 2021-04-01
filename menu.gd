extends Control

func _on_start_pressed():
	get_tree().change_scene("res://level design/level 1/cena1.tscn")


func _on_quit_pressed():
	get_tree().quit()
