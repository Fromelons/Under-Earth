extends TileMap

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

enum TILES {Dirt, Air}

var current_map_size = Vector2(50, 50)
var total_walkers = []
var spawn_chance = 0.005
var percentage_to_fill = 0.35

class walker extends Reference:
	var pos

	func _init(starting_position):
		pos = starting_position
		
func _ready():
	randomize()
	for x in current_map_size.x:
		for y in current_map_size.y:
			set_cell(x,y, 0)
	move_walkers()
	
func move_walkers():
		var iterations = 0
		var pos = Vector2((current_map_size.x / 2), current_map_size.y / 2)
		var w = walker.new(pos)
		total_walkers.append(w)
		while iterations < 10000:
			for walk in total_walkers:
				var num = randi() % 4
				match num:
					0:
						walk.pos += Vector2(1, 0)
					1:
						walk.pos += Vector2(0, 1)
					2:
						walk.pos += Vector2(-1, 0)
					3:
						walk.pos += Vector2(0, -1)
				
				walk.pos.x = clamp(walk.pos.x, 1, current_map_size.x - 2)
				walk.pos.y = clamp(walk.pos.x, 1, current_map_size.y - 2)
			
				set_cell(walk.pos.x, walk.pos.y, TILES.Dirt)
				#chance to spawn near new walker
				if randf() < spawn_chance and total_walkers.size() < 10:
					var y = walker.new(walk.pos)
					total_walkers.append(y)
					
				#chance to delete walker
				if randf() < spawn_chance / 2 and total_walkers.size() > 1:
					total_walkers.erase(walk)
	
		iterations += 1
		yield(get_tree(), "idle_frame")
		
		if count_floors() / (current_map_size.x *current_map_size.y ) > percentage_to_fill:
			pass
		
	
func count_floors():
	var floor_count = 0
	for x in current_map_size.x:
		for y in current_map_size.y:
			var current_cell =  get_cell(x,y)
			if current_cell == TILES.Floor:
				floor_count += 1
				
		return floor_count   
		
		  
		










