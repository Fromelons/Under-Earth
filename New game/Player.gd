extends KinematicBody2D
#constants, variables and signals.

var motion = Vector2()

var friction

const GRAVITY = 20
const ACCELERATION = 30
const MAX_SPEED = 220
const UP = Vector2(0, -1)
const JUMP_HEIGHT = -400

#Establishes Function "Jump"
############################################################
func Jump():
	print("jumped")
	motion.y = JUMP_HEIGHT
	if friction == true:
		motion.x = lerp(motion.x, 0, 0.2) 
	
#Establishes Function "move"
############################################################
func Move(flip, force):
	
	
	motion.x = min(motion.x, MAX_SPEED)
	$Sprite.play("Run")
	$Sprite.flip_h = flip;    
	motion.x = force
	if friction == true:
		motion.x = lerp(motion.x, 0, 5000)
#############################################################
			 
func Jump_Cut():
	print("jump cut")
	motion.y = -ACCELERATION

func _physics_process(_delta):
	
	
	motion.y += GRAVITY
	friction  = false
	
	if friction == true:
		motion.x = lerp(ACCELERATION, 0, 0.05)
		  
								 
	elif Input.is_action_pressed("ui_right"):
		Move(false, MAX_SPEED)
   
	   
	elif Input.is_action_pressed("ui_left"): 
		Move(true, -MAX_SPEED)
	
	
	else: 
		$Sprite.play("idle")
		motion.x = lerp(motion.x, 0, 0.3)
					
	############################################
	#infinite jumping patch
	if is_on_floor():
		
		if Input.is_action_pressed("ui_up"):
			Jump()
	else:
		$Sprite.play("Jump")
		if Input.is_action_just_released("ui_up"):
			Jump_Cut()
		if friction == true:
				motion.x = lerp(motion.x, 0, 0.05) 
	
	#terminal velocity and movement script
	motion = move_and_slide(motion, UP)
	pass
	
	 



