extends Control

func _on_Start_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")

func _on_Quit_pressed():
	if OS.has_feature("JavaScript"):
		JavaScript.eval("window.close()")
	get_tree().quit()
