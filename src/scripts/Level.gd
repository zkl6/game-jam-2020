extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var playerPosition: Vector2
var tileNames: Dictionary
##export(NodePath) onready var spreader = get_node(spreader)
var levelEnd = false


# Called when the node enters the scene tree for the first time.
func _ready():
	#Get our tileNames so that we can treat the english names as a sort of enumerator through a dictionary
	for each in self.tile_set.get_tiles_ids():
		tileNames[self.tile_set.tile_get_name(each)] = each
	
	#Find the player cell to initialize player position. 
	#Assumes single player cell. In case more than one exists, the first in the returned array is used.
	playerPosition = get_singleton_cell(tileNames.Player)
	
	
	#Events.connect("player_position_updated", self, "updatePlayerPos")
	Events.emit_signal("set_player_position", playerPosition)
	Events.connect("player_move_attempt", self, "_on_player_move_attempt")
	Events.connect("update_level",self, "updateLevel")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func updatePlayerPos(vec2):
	self.set_cellv(playerPosition, tileNames.Covered)
	playerPosition = vec2
	self.set_cellv(playerPosition, tileNames.Player)
	
func _on_player_move_attempt(vec2):
	var targetCell = get_singleton_cell(tileNames.Player)+vec2
	if isCellTraversable(targetCell):
		updatePlayerPos(targetCell)
		updateLevel()
	
func get_singleton_cell(name):
	return .get_used_cells_by_id(name)[0]

func updateLevel():
	if levelEnd:
		return
		
	if levelComplete():
		Events.emit_signal("level_end",true)
		Events.emit_signal("player_control", false)
		levelEnd = true
	elif Surrounded():
		#print("Loser!")
		Events.emit_signal("level_end", false)
		levelEnd = true

	
func Surrounded():
	if isCellTraversable(above(playerPosition)) \
	or isCellTraversable(below(playerPosition)) \
	or isCellTraversable(leftOf(playerPosition)) \
	or isCellTraversable(rightOf(playerPosition)):
		return false
	return true
	
func isCellTraversable(vec2):
	return .get_cellv(vec2) == tileNames.Uncovered

func above(vec2):
	return vec2+Vector2.UP

func below(vec2):
	return vec2+Vector2.DOWN
	
func leftOf(vec2):
	return vec2+Vector2.LEFT

func rightOf(vec2):
	return vec2+Vector2.RIGHT
	
func levelComplete():
	if .get_used_cells_by_id(tileNames.Uncovered).size() == 0:
		return true
	return false
