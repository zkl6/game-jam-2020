extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var Position = Vector2(0,0)
var hasControl: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("player_control", self, "set_player_control")
	
func _process(delta):
	if not hasControl:
		return
	if AJP("ui_left"):
		#left()
		Events.emit_signal("player_move_attempt", Vector2.LEFT)
	if AJP("ui_down"):
		#down()
		Events.emit_signal("player_move_attempt", Vector2.DOWN)
	if AJP("ui_up"):
		#up()
		Events.emit_signal("player_move_attempt", Vector2.UP)
	if AJP("ui_right"):
		#right()
		Events.emit_signal("player_move_attempt", Vector2.RIGHT)
	

func AJP(action):
	return Input.is_action_just_pressed(action)
	
func set_player_control(boolean):
	hasControl = boolean