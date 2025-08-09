extends CharacterBody2D

@export var moveSpeed = 250.0;

func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED;

func _process(dt: float) -> void:
	pass

func _physics_process(dt: float) -> void:
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down");
	if input:
		velocity = input * moveSpeed;
	else:
		velocity = Vector2.ZERO;
	#if Input.is_action_pressed("move_up"):
		#velocity = Vector2.UP * moveSpeed;
	#elif Input.is_action_pressed("move_down"):
		#velocity = Vector2.DOWN * moveSpeed;
	#elif Input.is_action_pressed("move_left"):
		#velocity = Vector2.LEFT * moveSpeed;
	#elif Input.is_action_pressed("move_right"):
		#velocity = Vector2.RIGHT * moveSpeed;
	#else:
		#velocity = Vector2.ZERO;
	move_and_slide();
