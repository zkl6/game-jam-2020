extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal player_position_updated
signal set_player_position(vec2)
signal can_move(boolean)
signal update_level
signal level_complete
signal level_fail
signal player_control(boolean)

#Expects direction player wants to move
signal player_move_attempt(vec2)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
