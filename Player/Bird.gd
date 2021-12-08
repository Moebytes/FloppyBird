extends KinematicBody2D

signal game_over

export var jumpHeight = 20
export var gravity = 7

var velocity = Vector2()

var initial_x = 0

func _ready():
	Global.game_over = false
	initial_x = position.x

func _physics_process(delta):
	if (position.x != initial_x): 
		position.x = initial_x
	
	velocity.y += gravity
	
	if (Input.is_action_just_pressed("jump") and not Global.game_over):
		velocity.y = -jumpHeight
		
	if (is_on_wall()):
		velocity.y = 0
	
	move_and_slide(velocity)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision.collider.is_in_group("hazards")):
			emit_signal("game_over")


func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("game_over")
