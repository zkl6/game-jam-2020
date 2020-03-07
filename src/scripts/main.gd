extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inst
var level
var level_resource
onready var menu_resource = load("res://src/scenes/Main Menu.tscn")
onready var menu
# Called when the node enters the scene tree for the first time.
func _ready():
# warning-ignore:return_value_discarded
	Events.connect("restart_level", self, "_restart_level")
	Events.connect("load_level", self, "_on_load_level")
	Events.connect("load_main_menu", self, "_on_load_main_menu")
	Events.emit_signal("load_main_menu")


func _restart_level():
	if not level_is_in_memory():
		return
	level.queue_free()
	level = level_resource.instance()
	add_child(level)
	
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("restart_level"):
		_restart_level()
	if Input.is_action_just_pressed("ui_cancel"):
		_on_load_main_menu()

func _on_load_level(name):
	if level_is_in_memory(): level.queue_free()
	level_resource = load("res://src/scenes/levels/" + name + ".tscn")
	level = level_resource.instance()
	add_child(level)

func _on_load_main_menu():
	if level_is_in_memory(): level.queue_free()
	if not (menu and is_instance_valid(menu)): 
		menu = menu_resource.instance()
		add_child(menu)

func level_is_in_memory():
	return level and is_instance_valid(level)