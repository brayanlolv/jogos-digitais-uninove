extends Area2D



const DANO = 30
const PESO = 1
const VELOCIDADE = -10
#talvez ver o esquema para mudar direcao
#const FORCA_VERTICAL = 30

var velocidadeVertical  = -18
#forca inicial que o negocio vai subir
#negativo porque é assim

var jogou = false


func _process(delta):
	if jogou:
		get_parent().global_position.x += VELOCIDADE
		get_parent().global_position.y += velocidadeVertical
		$Sprite.rotation_degrees += 7
		velocidadeVertical += PESO


func _on_Area2D_body_entered(body):
	if body.has_method("dano"):
		body.dano(DANO)
		print("pneuzada")
		print(Global.vida_jogador)

