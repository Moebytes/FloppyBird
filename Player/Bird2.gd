extends KinematicBody2D

export var jumpHeight = 109
export var gravity = 7

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += gravity
	move_and_slide(velocity)


func _on_Timer_timeout():
	velocity.y = -jumpHeight
	move_and_slide(velocity)
