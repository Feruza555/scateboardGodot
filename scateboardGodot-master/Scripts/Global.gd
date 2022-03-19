extends Node

var note = preload("res://Scenes/Note.tscn")
var Obstacle = preload("res://Scenes/Obstacles.tscn")
var HUD 

var score = 0
var combo = 0

var p_score = 3
var g_score = 2
var o_score = 1




enum chart_options {note1, note2, note3, obstacle, none}


var chart_list = [
	[2, chart_options.note2], 
	[2, chart_options.obstacle], 
	[3, chart_options.note1], 
	[1, chart_options.note2], 
	[1, chart_options.note3], 
	[2, chart_options.none], 
	[2, chart_options.note2], 
	[3, chart_options.note1], 
	[3, chart_options.obstacle], 
	[2, chart_options.note3], 
	[2, chart_options.none], 
	[1, chart_options.note1], 
	[3, chart_options.note2], 
	[1, chart_options.note3], 
	[1, chart_options.note2],
	[1, chart_options.obstacle],
	[3, chart_options.note3],
	[3, chart_options.obstacle],
	[2, chart_options.note1],
	[1, chart_options.note3],
	[1, chart_options.obstacle],
	[3, chart_options.note2],
	[2, chart_options.obstacle],
	[1, chart_options.note1],
	[2, chart_options.obstacle],
	[3, chart_options.note2],
	[3, chart_options.note1],
	[2, chart_options.none],
	[1, chart_options.note3],
	[1, chart_options.obstacle],
	[2, chart_options.note2],
	[3, chart_options.note1],
	[3, chart_options.obstacle],
	[1, chart_options.note3],
	[2,chart_options.note2],
	[3, chart_options.note1],
	[2, chart_options.note2],
	[2, chart_options.note2],
	[1, chart_options.obstacle],
	[3, chart_options.none],
	[3, chart_options.note3],
	[2, chart_options.note2],
	[2, chart_options.obstacle],
	[1, chart_options.note1],
	[2, chart_options.note2],
	[3, chart_options.note3],
	[3, chart_options.obstacle],
	[1, chart_options.note1],
	[2, chart_options.note2],
	[3, chart_options.note3],
	[3, chart_options.obstacle],
	[1, chart_options.note3],
	[2, chart_options.note2],
	[3, chart_options.note3],
	[2, chart_options.note1],
	[1, chart_options.none],
	[1, chart_options.note2],
	[2, chart_options.obstacle],
	[3, chart_options.note3],
	[2, chart_options.note2],
	[1, chart_options.note1],
	[1, chart_options.obstacle],
	[2, chart_options.note2],
	[3, chart_options.note1],
	[2, chart_options.note2],
	[1, chart_options.note3],
	[2, chart_options.note1],
	[2, chart_options.none],
	[2, chart_options.note2],
	[3, chart_options.note1],
	[3, chart_options.obstacle],
	[2, chart_options.note2],
	[1, chart_options.note1],
	[2, chart_options.obstacle],
	[3, chart_options.note3],
	[2, chart_options.note1],
	[1, chart_options.note2],
	[2, chart_options.note3],
	[3, chart_options.note1],
	[1, chart_options.note2],
	[2, chart_options.note3],
	[2, chart_options.obstacle],
	[1, chart_options.note1]
	]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
