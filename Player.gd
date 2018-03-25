extends Node2D

export(int, 200, 800) var PLAYER_SPEED = 400
export(PackedScene) var laser

var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2(0,0)
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
		$ShootTimer.start()
	
	if Input.is_action_just_released("ui_accept"):
		$ShootTimer.stop()
		
	velocity = velocity.normalized()
	
	position += velocity * delta * PLAYER_SPEED
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	

func shoot():
	var position1 = $Canon1.position
	var position2 = $Canon2.position
	var laser1 = laser.instance()
	var laser2 = laser.instance()
	
	laser1.position = position1
	laser2.position = position2
	
	get_parent().add_child(laser1)
	get_parent().add_child(laser2)

func _on_ShootTimer_timeout():
	shoot()
