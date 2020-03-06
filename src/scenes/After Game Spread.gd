extends Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("level_end", self, "_on_level_end")

func _on_timeout():
	Events.emit_signal("update_level")
	
func _on_level_end(boolean):
	.start()
