extends CharacterBody2D

@export var SPEED = 400.0

@export_group("Gun Attack")
@export var BULLET_SPEED = 600

@export_group("Melee Attack")
@export var MELEE_COOLDOWN = 1
@export var MELEE_ARC = 90 # in degrees?
var projectile = preload("res://projectile.tscn")
func _physics_process(_delta):
	look_at(get_global_mouse_position())
	var x_direction = Input.get_axis("move_left", "move_right")
	var y_direction = Input.get_axis('move_up', 'move_down')
	
	velocity = Vector2(x_direction, y_direction).normalized() * SPEED
	#velocity.y /= 2
	
	move_and_slide()
func fire_bullet(target):
	var new_projectile = projectile.instantiate()
	new_projectile.position = position
	new_projectile.linear_velocity = (target - position).normalized() * BULLET_SPEED
	new_projectile.look_at(target)
	get_parent().add_child(new_projectile)
func melee_attack():
	var target_vector = (get_global_mouse_position() - position).normalized()
	for enemy in $RikoMeleeAttack.get_overlapping_bodies():
		if acos(target_vector.dot((enemy.position - position).normalized)) > deg_to_rad(MELEE_ARC):
			continue
		if enemy.has_node("HealthComponent"):
			pass
func _input(event):
	if event.is_action_pressed("shoot"):
		fire_bullet(get_global_mouse_position())
