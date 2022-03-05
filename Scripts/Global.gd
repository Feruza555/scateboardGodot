extends Node

var note = preload("res://Scenes/Note.tscn")
var Obstacle = preload("res://Scenes/Obstacle_area.tscn")



enum chart_options {note1, note2, note3, obstacle, none}


var chart_list = [[1, chart_options.note1], [3, chart_options.obstacle], [2, chart_options.note3], [1, chart_options.note1], [3, chart_options.obstacle], [2, chart_options.note3], [1, chart_options.note1], [3, chart_options.obstacle], [2, chart_options.note3], [1, chart_options.note1], [3, chart_options.obstacle], [2, chart_options.note3], [1, chart_options.note1], [3, chart_options.obstacle], [2, chart_options.note3]]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
