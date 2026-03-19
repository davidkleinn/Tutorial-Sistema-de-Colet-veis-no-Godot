extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var anim = $AnimatedSprite2D
	anim.play("rotating")

func _on_body_entered(body):
	if body.name == "Player":
		body.colect_coin()
		
		# desligar o score pro player nao pontuar 2x
		$CollisionShape2D.set_deferred("disabled", true)
		
		# criar uma animaçao via codigo
		var tween = create_tween().set_parallel(true)
		
		# a moeda sobe 30 pixels em 0.3 segundos
		tween.tween_property(self, "position", position + Vector2(0, -30), 0.3)
		# efeito fade out na moeda
		tween.tween_property(self, "modulate:a", 0.0, 0.3)
		
		# a animaçao acaba e a moeda some
		tween.chain().tween_callback(queue_free)
