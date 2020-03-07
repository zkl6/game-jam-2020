extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inst
var level
var level_resource
# Called when the node enters the scene tree for the first time.
func _ready():
# warning-ignore:return_value_discarded
	Events.connect("restart_level", self, "_restart_level")
	Events.connect("load_level", self, "_on_load_level")

	#_on_load_level("1")

func _restart_level():
	level.queue_free()
	level = level_resource.instance()
	add_child(level)
	
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("restart_level"):
		_restart_level()

func _on_load_level(name):
	print("on load level")
	level_resource = load("res://src/scenes/levels/" + name + ".tscn")
	level = level_resource.instance()
	add_child(level)
