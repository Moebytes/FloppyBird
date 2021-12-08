extends Label

signal highscore_update(score)

var score = 0
var highscore = 0

func _ready():
	read()
	emit_signal("highscore_update", highscore)

func save(highscore: int):
	var file = File.new()
	file.open("user://highscore.save", File.WRITE)
	file.store_var(highscore)
	file.close()

func read():
	var file = File.new()	
	if file.file_exists("user://highscore.save"):
		file.open("user://highscore.save", File.READ)
		highscore = int(file.get_var())
		file.close()
		
func _on_DoublePipes_score_update():
	score += 1
	self.text = str(score)
	
	if (score > highscore):
		highscore = score
		save(highscore)
		emit_signal("highscore_update", score)
