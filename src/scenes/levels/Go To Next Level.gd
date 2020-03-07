extends Timer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var next_level: String

func _ready():
	Events.connect("level_end",self,"_on_level_end")

func _on_level_end(success):
	if success:
		print("Next level in 2 seconds")
		.start()

func _on_timeout():
	Events.emit_signal("load_level", next_level)