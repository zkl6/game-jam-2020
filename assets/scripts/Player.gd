extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Vector2) var Position



# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("get_player_position", self, "getPosition")
	
func _process(delta):
	if AJP("ui_left"):
		left()
		Events.emit_signal("player_position_updated", Position)
	if AJP("ui_down"):
		down()
		Events.emit_signal("player_position_updated", Position)
	if AJP("ui_up"):
		up()
		Events.emit_signal("player_position_updated", Position)
	if AJP("ui_right"):
		right()
		Events.emit_signal("player_position_updated", Position)
	

func AJP(action):
	return Input.is_action_just_pressed(action)
	
func left():
	Position.x -= 1
	Events.emit_signal("player_position_updated", Position)
	
func right():
	Position.x += 1
	Events.emit_signal("player_position_updated", Position)
	
func up():
	Position.y -= 1
	Events.emit_signal("player_position_updated", Position)
	
func down():
	Position.y += 1
	Events.emit_signal("player_position_updated", Position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func getPosition():
	Events.emit_signal("player_position_updated", Position)
	

