extends KinematicBody2D

var motion = Vector2()
const speed = 100

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
	else:
		motion.x = 0
		motion.y = 0
