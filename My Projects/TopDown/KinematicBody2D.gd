extends KinematicBody2D

#physics
const SCALE = Vector2(1, -0.5)
const speed = 0.5
const acceleration_speed = 100

var acceleration = Vector2()
var velocity = Vector2()
var accelerating

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	#controlls
	accelerating = false
	acceleration = Vector2(0, 0)
	
	if(Input.is_action_pressed("UP")):
		acceleration = acceleration + Vector2(0, 1)
		accelerating = true
	
	if(Input.is_action_pressed("DOWN")):
		acceleration = acceleration + Vector2(0, -1)
		accelerating = true
		
	if(Input.is_action_pressed("LEFT")):
		acceleration = acceleration + Vector2(-1, 0)
		accelerating = true
		
	if(Input.is_action_pressed("RIGHT")):
		acceleration = acceleration + Vector2(1, 0)
		accelerating = true
		
	#pre movement calculations
	if(accelerating):
		#acceleration
		velocity = velocity + (acceleration * acceleration_speed)
		#decay
	velocity = velocity * Vector2(speed, speed)
	
	#actually moving:
	move_and_slide(velocity*SCALE)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
