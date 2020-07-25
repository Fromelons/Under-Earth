extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_just_released("ui_zoom_in"):
		
		zoom.x += 0.25
		zoom.y += 0.25
		print(zoom.x, " x  ", zoom.y, " y")
	
	if Input.is_action_just_released("ui_zoom_out"):
		
		zoom.x -= 0.25
		zoom.y -= 0.25
		print(zoom.x, " x  ", zoom.y, " y")
		
	if zoom.x < 0.5:
		zoom.x = 0.5
	if zoom.x > 1.25:
		zoom.x = 1.25
	if zoom.y < 0.5:
		zoom.y = 0.5
	if zoom.y > 1.25:
		zoom.y = 1.25
	
		
		
		
