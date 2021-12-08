extends Control

func _on_Bird_game_over():
	Global.game_over = true
	visible = true


func _on_Restart_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false


func _on_Quit_pressed():
	get_tree().change_scene("res://Levels/TitleScreen.tscn")
	get_tree().paused = false


func _on_Score_highscore_update(score):
	var text = find_node("0")
	text.text = str(score)
