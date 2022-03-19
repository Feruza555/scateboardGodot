extends Control

onready var score_label = $Score
onready var TweScore = $TweScore

var cur_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.HUD = self


func _set_score():
	if Global.score == cur_score:
		return
	cur_score = Global.score
	score_label.text = "Score: " + str(Global.score)
	if not TweScore.is_active():
		_tween_score()
	


func _tween_score():
	var S0 = score_label.rect_scale
	var S1 = S0 + Vector2(0.3, 0.3)
	var dur = 0.2
	TweScore.interpolate_property(score_label, "rect_scale", S0, S1, dur, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	TweScore.interpolate_property(score_label, "rect_scale", S1, S0, dur, Tween.TRANS_BOUNCE, Tween.EASE_OUT, dur)
	TweScore.start()
