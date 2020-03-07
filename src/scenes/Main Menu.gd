extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("close_main_menu", self, "_on_close")

func _on_close():
	.queue_free()