extends TileMap

func _process(delta):
	
	
	if Input.is_action_pressed("right_click"):
		var MousePos = get_global_mouse_position()
		var loc = world_to_map(MousePos)
		var cell = get_cell(loc.x, loc.y)
		if cell == -1:
			set_cell(loc.x, loc.y, 1)
			
			
	if Input.is_action_pressed("click"):
		var MousePos = get_global_mouse_position()
		var loc = world_to_map(MousePos)
		var cell = get_cell(loc.x, loc.y)
		if cell == 1:
			set_cell(loc.x, loc.y, -1)
	
