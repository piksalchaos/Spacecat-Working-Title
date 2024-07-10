extends RigidBody2D

func clean_up():
	queue_free()
func hit(body):

	clean_up()
func _ready():
	$Timer.timeout.connect(clean_up)
	body_entered.connect(hit)
