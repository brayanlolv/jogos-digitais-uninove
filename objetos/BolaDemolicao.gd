extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


const DANO = 30
var dislocado = 0
const VELOCIDADE_QUEDA = 20
const VELOCIDADE_SUBIDA = 2.5
const DISTANCIA = 200
var subindo = true

func _process(delta):
	
	if subindo:
		get_parent().global_position.y -= VELOCIDADE_SUBIDA
		dislocado += VELOCIDADE_SUBIDA
		if dislocado == DISTANCIA:
			subindo = false
			dislocado = 0
		
	else:
		get_parent().global_position.y += VELOCIDADE_QUEDA
		dislocado += VELOCIDADE_QUEDA
		if dislocado == DISTANCIA:
			subindo = true
			dislocado = 0
		

func _on_areaBolaDemolicao_body_entered(body):
	if body.has_method("dano"):
		body.dano(DANO)
	pass # Replace with function body.
