extends Node2D

var score = 0
var combo = 0

var perfect = 0
var good = 0
var okay = 0
var missed = 0


var bpm = 60

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0

var lane = 0
var rand = 0
var obstacles = load("res://Scenes/Obstacles.tscn")
var instance


func _ready():
	randomize()
	$Song1.play_with_beat_offset(1) 




func _on_Song1_beat(position):
	pass
#	if position == 1:
#		_spawn_notes(spawn_1_beat)
#	elif position == 2:
#		_spawn_notes(spawn_2_beat)
#	elif position == 3:
#		_spawn_notes(spawn_3_beat)
#	elif position == 4:
#		_spawn_notes(spawn_4_beat)


func _on_Song1_measure(position):
	pass
#	song_position_in_beats = position
#	if song_position_in_beats > 36:
#		spawn_1_beat = 1
#		spawn_2_beat = 1
#		spawn_3_beat = 1
#		spawn_4_beat = 1
#	if song_position_in_beats > 46:
#		spawn_1_beat = 2
#		spawn_2_beat = 0
#		spawn_3_beat = 1
#		spawn_4_beat = 0
#	if song_position_in_beats > 132:
#		spawn_1_beat = 0
#		spawn_2_beat = 2
#		spawn_3_beat = 0
#		spawn_4_beat = 2
#	if song_position_in_beats > 162:
#		spawn_1_beat = 2
#		spawn_2_beat = 2
#		spawn_3_beat = 1
#		spawn_4_beat = 1
#	if song_position_in_beats > 194:
#		spawn_1_beat = 2
#		spawn_2_beat = 2
#		spawn_3_beat = 1
#		spawn_4_beat = 2
#	if song_position_in_beats > 228:
#		spawn_1_beat = 0
#		spawn_2_beat = 2
#		spawn_3_beat = 1
#		spawn_4_beat = 2
#	if song_position_in_beats > 258:
#		spawn_1_beat = 1
#		spawn_2_beat = 2
#		spawn_3_beat = 1
#		spawn_4_beat = 2
#	if song_position_in_beats > 288:
#		spawn_1_beat = 0
#		spawn_2_beat = 2
#		spawn_3_beat = 0
#		spawn_4_beat = 2
#	if song_position_in_beats > 322:
#		spawn_1_beat = 3
#		spawn_2_beat = 2
#		spawn_3_beat = 2
#		spawn_4_beat = 1
#	if song_position_in_beats > 388:
#		spawn_1_beat = 1
#		spawn_2_beat = 0
#		spawn_3_beat = 0
#		spawn_4_beat = 0
#	if song_position_in_beats > 396:
#		spawn_1_beat = 0
#		spawn_2_beat = 0
#		spawn_3_beat = 0
#		spawn_4_beat = 0

func _spawn_obstacles():
	pass
	#if to_spawn > 0:
	#lane = randi() % 3
	#instance = obstacles.instance()
	#instance.initialize(lane)
	#add_child(instance)
#	if to_spawn > 1:
#		while rand == lane:
#			rand = randi() % 3
#		lane = rand
#		instance = obstacles.instance()
#		instance.initialize(lane)
#		add_child(instance)


func _on_ObstacleFinish_timeout():
	pass
	#_spawn_obstacles() # Replace with function body.

func _increment_score(by):
	#handles combos
	if by > 0:
		Global.combo += 1
	else:
		Global.combo = 0
	#handles keeping track of what player hit throughout song
	if by == Global.p_score:
		perfect += 1
	elif by == Global.g_score:
		good += 1
	elif by == Global.o_score:
		okay += 1
	else:
		missed += 1

	Global.score += by * Global.combo  #think about changing this number, Jimbo
	Global.HUD._set_score()
	
	
