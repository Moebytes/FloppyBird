extends Area2D

signal score_update

export var speed = 0.5
var newPos = 0

var rng = RandomNumberGenerator.new()

func _process(delta: float):
	translate(Vector2(-speed, 0))

func spawnNext():
	var n = self.duplicate()
	newPos += 150
	n.position.x += newPos
	n.position.y = rng.randf_range(position.y - 100, position.y + 100)
	get_node("/root/World/YSort").add_child(n)

func _on_Timer_timeout():
	spawnNext()


func _on_DoublePipes_body_entered(body):
	if (body.is_in_group("player")):
		emit_signal("score_update")
