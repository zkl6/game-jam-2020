extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) onready var submenu = get_node(submenu)
export(PackedScene) var levelSelect
export(PackedScene) var controls
# Called when the node enters the scene tree for the first time.
func _ready():
	
	Events.connect("close_main_menu", self, "_on_close")
	Events.connect("load_control_view", self, "loadControls")

func _on_close():
	.queue_free()
	
func loadControls():
	clearMenu()
	submenu.add_child(controls.instance())
	
func loadLevelSelect():
	clearMenu()
	submenu.add_child(levelSelect.instance())
	
func clearMenu():
	submenu.remove_child(submenu.get_children()[0])