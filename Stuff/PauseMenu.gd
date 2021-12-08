extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state


func _on_Resume_pressed():
	get_tree().paused = false
	visible = false


func _on_Restart_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false


func _on_Quit_pressed():
	get_tree().change_scene("res://Levels/TitleScreen.tscn")
	get_tree().paused = false
