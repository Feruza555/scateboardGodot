extends Node2D


var new_note

var y_spawn = -47
var x_spawn = [115, 165, 205]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass




func select_note(beat):
	#get next note in chart list
	var next_chart = Global.chart_list[beat]
	
	var the_lane = next_chart[0]
	var next_note = next_chart[1]
	
	match next_note:
		Global.chart_options.none:
			return
		Global.chart_options.note1:
			spawn_note(the_lane, 0)
		Global.chart_options.note2:
			spawn_note(the_lane, 1)
		Global.chart_options.note3:
			spawn_note(the_lane, 2)
		Global.chart_options.obstacle:
			spawn_obstacle(the_lane)




func spawn_obstacle(lane):
	var obst = Global.Obstacle.instance()
	add_child(obst)
	obst.global_position.y = y_spawn
	
	#set lane
	obst.global_position.x = x_spawn[lane-1]




func spawn_note(lane, note):
	new_note = Global.note.instance()
	add_child(new_note)
	new_note.global_position.y = y_spawn
	
	new_note.set_frame(note)
	
	#set lane
	new_note.global_position.x = x_spawn[lane-1]
	


func _on_Song1_beat(position):
	select_note(position)
