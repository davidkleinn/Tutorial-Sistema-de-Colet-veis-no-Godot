extends CanvasLayer

@onready var score_text = $ScoreText
@onready var combo_text = $ComboText

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_text(new_score, new_combo):
	score_text.text = "Pontuação: " + str(new_score)
	combo_text.text = "Combo: x" + str(new_combo)
