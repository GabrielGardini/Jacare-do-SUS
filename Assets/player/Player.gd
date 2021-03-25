extends KinematicBody2D

var motion = Vector2()
const speed = 100
export (PackedScene) var vacina
#onready var vacina = preload("res://level design/level 1/bullet.tscn")
var vac_speed = 50

func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		move_and_slide(motion)
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		move_and_slide(motion)
	elif Input.is_action_pressed("ui_up"):
		motion.y = -speed
		move_and_slide(motion)
	elif Input.is_action_pressed("ui_down"):
		motion.y = speed
		move_and_slide(motion)
	elif Input.is_action_pressed("ui_mouse_left_click"):
		shooting()
	else:
		motion.x = 0
		motion.y = 0

func shooting():
	var vac = vacina.instance()
	owner.add_child(vac)
	vac.transform = $Position2D.global_transform
	
	
	
	
