extends KinematicBody2D
#constants, variables and signals.

var motion = Vector2()



const GRAVITY = 20
const ACCELERATION = 30
const MAX_SPEED = 300
const UP = Vector2(0, -1)
const JUMP_HEIGHT = -400

func _physics_process(_delta):
	
	
	motion.y += GRAVITY
	var friction  = false
	
	if friction == true:
		motion.x = lerp(ACCELERATION, 0, 0.05) 
	#left and right controls####################                               
	elif Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x, MAX_SPEED)
		$Sprite.play("Run")
		$Sprite.flip_h = false;    
		motion.x += ACCELERATION 
		if friction == true:
			motion.x = lerp(motion.x, 0, 5000) 
   
	   
	elif Input.is_action_pressed("ui_left"): 
		$Sprite.play("Run")
		$Sprite.flip_h = true;  
		motion.x -= ACCELERATION
		motion.x = max(motion.x, -MAX_SPEED)
	
	
	else: 
		$Sprite.play("idle")
		motion.x = lerp(motion.x, 0, 0.3)
					
	############################################
	#infinite jumping patch
	if is_on_floor():
		
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.2) 
	else:
		$Sprite.play("Jump")
		if friction == true:
				motion.x = lerp(motion.x, 0, 0.05) 
	
	#terminal velocity and movement script
	motion = move_and_slide(motion, UP)
	pass
	
	 



