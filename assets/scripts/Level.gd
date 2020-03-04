extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var playerPosition = Vector2(-100,-100)


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("player_position_updated", self, "updatePlayerPos")
	Events.emit_signal("get_player_position")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func updatePlayerPos(vec2):
	self.set_cellv(playerPosition, -1)
	playerPosition = vec2
	self.set_cellv(playerPosition, 3)
	
func eraseTile(vec2):
	var cells = self.get_used_cells()
	
