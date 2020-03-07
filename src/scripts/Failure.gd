extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("level_end", self, "_on_level_fail")
	
func _on_level_fail(success):
	if not success:
		.set_visible(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
