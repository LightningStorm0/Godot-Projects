extends KinematicBody2D

#physics
const SCALE = Vector2(1, 0.5)
const speed = 0.9
const acceleration = 1

var direction = 0
var velocity = Vector2()

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	move_and_slide(velocity*SCALE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
