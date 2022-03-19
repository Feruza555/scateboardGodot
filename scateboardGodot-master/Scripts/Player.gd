extends AnimatedSprite

var run_speed = 5000

const MAX_X = 215
const MIN_X = 115
const Line_1 = Vector2(115,500)
const Line_2 = Vector2(165,500)
const Line_3 = Vector2(215,500)

var collide = false;
var current_obstacle = null


var perfect = false
var good = false
var okay = false
var current_note = null

#this following function handles the movement
func get_input():
	var right = Input.is_action_just_pressed('right')
	var left = Input.is_action_just_released('left')

	if right:
		position.x += 50
	if left:
		position.x -= 50
	
# this following function handles the tricks input
func _unhandled_input(event):
	if current_note != null:
		if event.is_action_pressed("a"): 
			if current_note.frame == 0:
				check_score()
			else:
				pass  #option for player feedback, e.g. right timing but wrong key press etc.
		elif event.is_action_pressed("w"): 
			if current_note.frame == 1:
				check_score()
			else: 
				pass #option for player feedback, e.g. right timing but wrong key press etc.
		elif  event.is_action_pressed("d"):
			if current_note.frame == 2:
				check_score()
			else:
				pass  #option for player feedback, e.g. right timing but wrong key press etc.
	
	else:
		get_parent()._increment_score(0)


		
func check_score():  #function checks accuracy of note hit and increments score 
		
		if perfect == true:
			get_parent()._increment_score(Global.p_score)
			current_note._destroy(Global.p_score)
		elif good == true:
			get_parent()._increment_score(Global.g_score)
			current_note._destroy(Global.g_score)
		elif okay == true:
			get_parent()._increment_score(Global.o_score)
			current_note._destroy(Global.o_score)


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

func _on_PerfectHitArea_area_entered(area):
	if area.is_in_group("note"):
		perfect = true

func _on_PerfectHitArea_area_exited(area):
	if area.is_in_group("note"):
		perfect = false
	
func _on_GoodHitArea_area_entered(area):
	if area.is_in_group("note"):
		good = true

func _on_GoodHitArea_area_exited(area):
	if area.is_in_group("note"):
		good = false
	
func _on_OkayHitArea_area_entered(area):
	if area.is_in_group("note"):
		okay = true
		current_note = area 

func _on_OkayHitArea_area_exited(area):
	if area.is_in_group("note"):
		okay = false
		current_note = null
