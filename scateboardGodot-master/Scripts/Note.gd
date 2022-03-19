extends Area2D

onready var noteSprite = $NoteSprite

const TARGET_Y = 164
const SPAWN_Y = -16
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

const LEFT_LANE_SPAWN = Vector2(120, SPAWN_Y)
const CENTRE_LANE_SPAWN = Vector2(160, SPAWN_Y)
const RIGHT_LANE_SPAWN = Vector2(200, SPAWN_Y)

export var speed = 300

var hit = false
var frame = 0


func _ready():
	pass



func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > 700:
			queue_free()
			#get_parent().reset_combo()



func set_frame(fr):
	frame = fr
	noteSprite.frame = frame
	

func _destroy(score):
	$NoteSprite.visible = false
	$DestructionTimer.start()
	hit = true
	if score == 3:
		pass	#place the "Perfect" label here
	elif score == 2: 
		pass	#place the "Good" label here
	elif score == 1:
		pass	#place the "Okay" label here
		


func _on_DestructionTimer_timeout():
	queue_free()
