extends Node2D

signal _on_ui_accept()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("_on_ui_accept")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
