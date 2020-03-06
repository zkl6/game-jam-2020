extends Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("level_end",self,"_on_level_end")

func _on_level_end(success):
	if not success:
		print("restart level in 2 seconds")
		.start()


func _on_timeout():
	Events.emit_signal("restart_level")
	Events.emit_signal("restart_level")
