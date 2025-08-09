extends CharacterBody2D

@export var moveSpeed = 250.0;

var attacking = false;

@onready var weapon = $Weapon;

func _weapon_timer_done():
	attacking = false;
	weapon.hide();
	weapon.position = Vector2.ZERO;

func _process(dt: float) -> void:
	var moveInput = Input.get_vector("move_left", "move_right", "move_up", "move_down");
	if moveInput:
		velocity = moveInput * moveSpeed;
	else:
		velocity = Vector2.ZERO;

	var attackInput = Input.get_vector("attack_left", "attack_right", "attack_up", "attack_down");
	if attackInput && !attacking:
		attacking = true;
		weapon.show();
		weapon.position = attackInput * 80.0;
		
		var timer = Timer.new();
		add_child(timer);
		timer.wait_time = 0.5;
		timer.one_shot = true;
		timer.start();
		timer.timeout.connect(_weapon_timer_done);

func _physics_process(dt: float) -> void:
	move_and_slide();
