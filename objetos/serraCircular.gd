extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
const VELOCIDADE_GIRO = 11.3
var subindo = false
const VELOCIDADE = 30
#const TEMPO_ESPERA = .5
const ACELERACAO = 1
const DANO = 10

var velocidade 
var altura_inicial 
const  DISTANCIA = 300

var rng = RandomNumberGenerator.new()
#se pa jogar isso no global
func _ready():
	altura_inicial = get_parent().global_position.y
	velocidade = rng.randi_range(-20,20)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.rotation_degrees -= VELOCIDADE_GIRO 
	
	if subindo:
		velocidade -= ACELERACAO
	#	print("cima",$cima.global_position.y)
		if get_parent().global_position.y <= altura_inicial - DISTANCIA:
			velocidade = 0
			subindo = false
			#-.+print("subiu ")
	
	else:
		velocidade += ACELERACAO
		if get_parent().global_position.y >= altura_inicial + DISTANCIA:
			velocidade = 0
			subindo = true
			#print("desceu")
	
	get_parent().global_position.y += velocidade
		
		


func _on_Area2D_body_entered(body):
	if body.has_method("dano"):
		body.dano(DANO)
	pass # Replace with function body.
