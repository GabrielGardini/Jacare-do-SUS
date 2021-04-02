extends Button
onready var player = get_node("../player")
onready var reload_timer = get_node("../reload_timer")

func _ready():
	pass
func _process(delta):
	if self.disabled == false:
		reload_timer.wait_time = 2
		get_tree().paused = true
		 
	if Input.is_action_pressed("ui_cancel"):
		get_tree().paused = false
		get_tree().change_scene("res://menu.tscn")
		
	
func _on_player_hitbox_area_entered(area):
	if area.is_in_group("trash_can"):
		#get_tree().change_scene("res://level design/level 1/cena1.tscn")
		player.queue_free()
		self.visible = true 
		self.disabled = false
		
	pass # Replace with function body.


func _on_try_againbt_pressed():
		get_tree().paused = false
		get_tree().reload_current_scene()
		pass # Replace with function body.
