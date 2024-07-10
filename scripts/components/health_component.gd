extends Node

class_name HealthComponent

signal died

@export_range(0, 1000) var maxHealth = 100
var health = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	health = maxHealth # Replace with function body.
func damage(hit: float):
	health -= hit
	if health <= 0:
		get_parent().queue_free()
