extends AnimatedSprite

var run_speed = 5000

const MAX_X = 211
const MIN_X = 115
const Line_1 = Vector2(115,500)
const Line_2 = Vector2(165,500)
const Line_3 = Vector2(211,500)

var collide = false;
var current_obstacle = null


func get_input():
	var right = Input.is_action_just_pressed('right')
	var left = Input.is_action_just_released('left')

	if right:
		position.x += 50
	if left:
		position.x -= 50
		

func _physics_process(delta):
	
	get_input()
	
	if current_obstacle != null:
		current_obstacle.destroy()
	
	position.x = clamp(position.x, MIN_X, MAX_X)
	position.y = clamp(position.y, 150, 150)

func _on_CollideArea_area_entered(area):
	if area.is_in_group("obstacles"):
		collide = true
		current_obstacle = area


func _on_CollideArea_area_exited(area):
	if area.is_in_group("obstacles"):
		collide = false
		current_obstacle = null

func _on_StartTimer_timeout():
	frame = 1


#extends KinematicBody2D
#
#
#const MAX_X = 710
#const MIN_X = 370
#
#const Line_1 = Vector2(370,500)
#const Line_2 = Vector2(530,500)
#const Line_3 = Vector2(710,500)
#
#var current_line = 1
#var current_pos = Vector2(370,500)
#
#var speed = 1
#var target = Vector2()
#
#
#
#
#func _physics_process(delta):
##	get_input()
#	var velocity = Vector2.ZERO 
#
#	position += Line_1 * delta
#	position.x = clamp(position.x, MIN_X, MAX_X)
#	position.y = clamp(position.y, 500, 500)
#
#
##func get_input():
##	var velocity = Vector2.ZERO 
##	if Input.is_action_pressed("right") && current_line == 1:
##		current_pos = Line_2
##		current_line = 2
##		print(current_pos)
##		print(current_line)
##	elif  Input.is_action_pressed("right") && current_line == 2:
##		current_pos = Line_3
##		current_line = 3
##		print(current_pos)
##		print(current_line)
##	elif Input.is_action_pressed("left") && current_line == 2:
##		current_pos = Line_1
##		current_line = 1
##		print(current_pos)
##		print(current_line)
##	elif  Input.is_action_pressed("left") && current_line == 3:
##		current_pos = Line_2
##		current_line = 2
##		print(current_pos)
##		print(current_line)
###	velocity = velocity * speed
##	velocity = current_pos
##	if position.distance_to(target) > 5:
##		velocity = move_and_slide(velocity)
##	position.x = clamp(position.x, MIN_X, MAX_X)
##	position.y = clamp(position.y, 500, 500)
##
##
##func _input(event):
##	if event.is_action_pressed("click"):
##		target = get_global_mouse_position()
