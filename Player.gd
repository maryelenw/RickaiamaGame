extends KinematicBody2D

const UP  = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -820
var life = 3
var motion = Vector2()

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
		
	else:
		motion.x = 0
		$Sprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			$jumpFx.play()
	else:
		$Sprite.play("Jump")
		
	motion = move_and_slide(motion, UP)

func _on_pes_body_entered(body):
	body.dano()
	$jumpFx.play()
	motion.y = JUMP_HEIGHT

func _on_dano_body_entered(body):
	life -= 1
	$dmgFx.play()	
	if life == 0:
		$".".queue_free()
		get_tree().change_scene("res://Menu.tscn")
		
func instalKill():
	$".".queue_free()
	get_tree().change_scene("res://Menu.tscn")
	
