extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# warning-ignore:unused_signal
signal player_position_updated
# warning-ignore:unused_signal
signal set_player_position(vec2)
# warning-ignore:unused_signal
signal can_move(boolean)
# warning-ignore:unused_signal
signal update_level
# warning-ignore:unused_signal
signal level_complete
# warning-ignore:unused_signal
signal level_fail
# warning-ignore:unused_signal
signal level_end(boolean)
# warning-ignore:unused_signal
signal restart_level
# warning-ignore:unused_signal
signal close_main_menu
# warning-ignore:unused_signal
signal load_level
# warning-ignore:unused_signal
signal load_main_menu

#Expects direction player wants to move
# warning-ignore:unused_signal
signal player_move_attempt(vec2)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
