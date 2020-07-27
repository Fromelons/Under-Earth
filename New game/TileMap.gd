extends TileMap

var XCave = 1
var YCave = 1



var SelectedCell

func CaveGen():
	YCave = rand_range(1, 50)
	XCave = rand_range(1, 50)
	SelectedCell = get_cell(XCave - 1, YCave)
	if  SelectedCell == 0:
		print("yep, that's dirt")
	else:
		set_cell(XCave, YCave, -1)

func _ready():
	CaveGen()
	
		



func _process(delta):
	CaveGen()
	
	if Input.is_action_pressed("right_click"):
		var MousePos = get_global_mouse_position()
		var loc = world_to_map(MousePos)
		var cell = get_cell(loc.x, loc.y)
		if cell == -1:
			set_cell(loc.x, loc.y, 0)
			
			
	if Input.is_action_pressed("click"):
		var MousePos = get_global_mouse_position()
		var loc = world_to_map(MousePos)
		var cell = get_cell(loc.x, loc.y)
		if cell == 0:
			set_cell(loc.x, loc.y, -1)
	
#############################################################



	
		  
		










