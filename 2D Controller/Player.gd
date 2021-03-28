extends KinematicBody2D

var movement = Vector2()
var speed = 250
func _physics_process(delta):
	movement = Vector2()
	if Input.is_action_pressed("w"):
		movement += Vector2.UP
	if Input.is_action_pressed("a"):
		movement += Vector2.LEFT
	if Input.is_action_pressed("s"):
		movement += Vector2.DOWN
	if Input.is_action_pressed("d"):
		movement += Vector2.RIGHT
	
	movement = movement.normalized()
	move_and_collide(movement * speed * delta)
