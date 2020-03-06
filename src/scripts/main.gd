extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inst
export(PackedScene) var level
# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("restart_level", self, "_restart_level")

	inst = level.instance()

	add_child(inst)

func _restart_level():
	inst.queue_free()
	inst = level.instance()
	add_child(inst)
	Events.emit_signal("player_control",true)
	
func _process(delta):
	if Input.is_action_just_pressed("restart_level"):
		_restart_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
