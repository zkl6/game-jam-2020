extends Node

#get tilemap node we want to hook into
#Explanation: get NodePath from Inspector. onready, convert this into an actual node reference
export(NodePath) onready var tilemap = get_node(tilemap)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _process(delta):
	if AJP("ui_accept"):
       Events.emit_signal("update_level")


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