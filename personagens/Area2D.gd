extends Area2D

const DANO = 200#10
const VELOCIDADE = 10
var direcao = 1
const POSICAO_INICIAL = 40

func ready(flip): # chamar manualmente porq o _ready nao me deixa mudar
	#sua assinatura original
	$Sprite.flip_v = flip
	if flip:
		direcao = -1
		
	get_parent().global_position.x += POSICAO_INICIAL * direcao

	
func _process(_delta):
	get_parent().global_position.x += (VELOCIDADE * direcao)



func _on_Area2D_body_entered(body):
	if body.has_method("dano"):
		body.dano(DANO)
	pass # Replace with function body.
