extends TileMap

var XCave = 1
var YCave = 1
var CavePerCentOfMap = 1500
var TotalTiles = 1
var ScannedTiles = 5
var MapTiles = 50
var SelectedTile



################################################
#PROCEDURAL GENERATION
################################################
func CaveGen():
	while TotalTiles < CavePerCentOfMap:
		randomize()
		
		YCave = rand_range(1, 50)
		XCave = rand_range(1, 50)
		
		if TotalTiles == 1:
			set_cell(rand_range(1, 50), rand_range(1, 50), -1)
			TotalTiles + 1
		
		
		################################################
		if get_cell(XCave - 1, YCave) == -1 or get_cell(XCave + 1, YCave) == -1 or get_cell(XCave, YCave + 1) == -1 or get_cell(XCave, YCave - 1) == -1:
			set_cell(XCave, YCave, -1)
			TotalTiles = TotalTiles + 1
		################################################	
		
	
	
		
	if get_cell(ScannedTiles - 1, 1) == -1 and get_cell(ScannedTiles + 1, 1) == -1 and get_cell(ScannedTiles, 1 + 1) == -1 and get_cell(ScannedTiles, 1 - 1) == -1:
		set_cell(ScannedTiles, 1, -1)
		
		


func _ready():
	CaveGen()
	
		



func _process(delta):
	
	
	
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



	
		  
		










