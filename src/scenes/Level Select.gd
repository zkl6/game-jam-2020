extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) onready var lineEdit = get_node(lineEdit)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_pressed():
	Events.emit_signal("load_level", lineEdit.text)
	Events.emit_signal("close_main_menu")
	