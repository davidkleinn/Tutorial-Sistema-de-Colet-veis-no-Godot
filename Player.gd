extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var score = 0
var combo = 1
var combo_time = 0.0
const max_combo_time = 3.0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var anim = $AnimatedSprite2D

	if not is_on_floor():
		anim.play("jump")
		anim.flip_h = direction > 0
	elif direction != 0:
		anim.play("run")
		anim.flip_h = direction > 0 # para virar o sprite para o lado certo
	else:
		anim.play("idle")

	move_and_slide()
	
func _process(delta):
	if combo > 1:
		combo_time -= delta
		if combo_time <= 0:
			combo = 1 # pra resetar o combo quando o tempo acabar
			refresh_screen()

func colect_coin():
	var points_scored = 10 * combo
	score += points_scored
	
	# pra aumentar o combo e resetar o tempo
	combo +=1
	combo_time = max_combo_time
	
	refresh_screen()

func refresh_screen():
	var hud = get_node("../HUD")
	if hud:
		hud.update_text(score, combo)

