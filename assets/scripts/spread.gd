extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tilemap


# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap = self.get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _process(delta):
	if AJP("ui_accept"):
       get_parent().updateLevel()


#shortcut for Input.is_action_just_pressed
func AJP(action):
	return Input.is_action_just_pressed(action)
	
	

func _spread():
	#print (tilemap.get_used_cells())
	for each in tilemap.get_used_cells():
		if tilemap.get_cellv(each) == 1:
			#print ("found enemy")
			spreadUp(each)
			spreadDown(each)
			spreadLeft(each)
			spreadRight(each)
		
func spreadDown(tileVec2):
	if tilemap.get_cell(tileVec2.x,tileVec2.y+1) == -1:
		tilemap.set_cell(tileVec2.x,tileVec2.y+1,1)
		
func spreadLeft(tileVec2):
	if tilemap.get_cell(tileVec2.x-1,tileVec2.y) == -1:
		tilemap.set_cell(tileVec2.x-1,tileVec2.y,1)

func spreadRight(tileVec2):
	if tilemap.get_cell(tileVec2.x+1,tileVec2.y) == -1:
		tilemap.set_cell(tileVec2.x+1,tileVec2.y,1)
		
func spreadUp(tileVec2):
	if tilemap.get_cell(tileVec2.x,tileVec2.y-1) == -1:
		tilemap.set_cell(tileVec2.x,tileVec2.y-1,1)