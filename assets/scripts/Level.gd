extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var playerPosition = Vector2(0,0)



# Called when the node enters the scene tree for the first time.
func _ready():
	
	#Find the player cell to initialize player position. 
	#Assumes single player cell. In case more than one exists, the first in the returned array is used.
	playerPosition = self.get_used_cells_by_id(3)[0]
	
	#Events.connect("player_position_updated", self, "updatePlayerPos")
	Events.emit_signal("set_player_position", playerPosition)
	Events.connect("player_move_attempt", self, "_on_player_move_attempt")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func updatePlayerPos(vec2):
	self.set_cellv(playerPosition, -1)
	playerPosition = vec2
	self.set_cellv(playerPosition, 3)
	
func _on_player_move_attempt(vec2):
	var targetCell = get_player_cell()+vec2
	if .get_cellv(targetCell) == -1:
		updatePlayerPos(targetCell)
	
func get_player_cell():
	return .get_used_cells_by_id(3)[0]
