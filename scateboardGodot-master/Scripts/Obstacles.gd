extends Area2D

onready var obstacle_sprite = $AnimatedSprite


const TARGET_Y = 155
const SPAWN_Y = -16
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

const LEFT_LANE_SPAWN = Vector2(105, SPAWN_Y)
const CENTRE_LANE_SPAWN = Vector2(155, SPAWN_Y)
const RIGHT_LANE_SPAWN = Vector2(195, SPAWN_Y)

export var speed = 100
var hit = false

# Called when the node enters the scene tree for the first time.
func _ready():
	obstacle_sprite.frame = floor(rand_range(0,2.99))

func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > 200:
			queue_free()
			#get_parent().reset_combo()
	else:
		$Node2D.position.y -= speed * delta
	
	

func initialize(lane):
	pass
	# if lane == 0:
	#	$AnimatedSprite.frame = 0
	#	position = LEFT_LANE_SPAWN
	#elif lane == 1:
	#	$AnimatedSprite.frame = 1
	#	position = CENTRE_LANE_SPAWN
	#elif lane == 2:
	#	$AnimatedSprite.frame = 2
	#	position = RIGHT_LANE_SPAWN
	#else:
	#	printerr("Invalid lane set for note: " + str(lane))
	#	return
	
	

func destroy():
	$CPUParticles2D.emitting = true
	$AnimatedSprite.visible = false
	$Timer.start()
	hit = true
	$Node2D/Label.text = "Finished"
	$Node2D/Label.modulate = Color("f6d6bd")
	# Global._increment_punkness(-5)   this had a freakout, took the entire bar down. could be bc its under process for player?
	
func _on_Timer_timeout():
	queue_free() # Replace with function body.
