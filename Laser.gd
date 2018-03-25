extends Node2D

export(int, 500, 2000) var LASER_SPEED = 600

func _ready():
	$Sprite.scale = Vector2(1,0)
	

func _process(delta):
	if($Sprite.scale.y < 0.5) :
		$Sprite.scale.y += LASER_SPEED * delta * 0.01
	var velocity = Vector2(0,-1) * LASER_SPEED
	position += velocity.rotated(rotation) * delta


func _on_Area2D_area_entered(area):
	area.get_parent().queue_free()
