extends Area2D

var velocidade = 10
var direcao = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (direcao==1):
		$Sprite.flip_h = false
	elif (direcao==-1):
		$Sprite.flip_h = true

	get_parent().global_position.x += (velocidade * direcao)

