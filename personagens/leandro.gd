extends KinematicBody2D


const cena_disparo = preload("res://personagens/tiro.tscn")
# rever essa logica do tempo 
var mov = Vector2.ZERO

const TEMPO_SEGURANDO = 1
const TEMPO_ATIRANDO = 2
#const TEMPO_ANIMACAO_ATIRANDO
const GRAVIDADE = 20
const VELOCIDADE = 300
const FORCA_PULO = 600
const TEMPO_ANIM_ATIRANDO = .4
const TEMPO_PAUSA = 0.5
var contador = 0
var direcao = true
var pegouPneu = false
var movimentoIndex = 1
var vida = 200
var time = 0
const pneu_cena = preload("res://personagens/pneu.tscn")
	
func _ready():
	$tocador.stream.loop = false
	$tocador.volume_db = (Global.volume_efeitos - 20)
	
func _process(_delta):
	
	if(vida < 1):
		
		if movimentoIndex == 4:
			get_tree().root.remove_child(pneu)

		if time > 3:
			get_tree().change_scene("res://telas/vitoria.tscn")
			queue_free()
		else: 
			time += _delta
		mov.x =  (-VELOCIDADE * .75)  +contador
		mov.y = (-FORCA_PULO * 1.5) +contador
		contador += GRAVIDADE
		$animacoes.rotation_degrees += 7
		$CollisionShape2D.disabled = true
		
		
			
	else:
		if !movimentoIndex % 2 == 0:
			#print("a")
			pausa(_delta)
		else:
			if(movimentoIndex == 2):
				pular()
			elif movimentoIndex == 4:
				atirar(_delta)
		
	

	#print(movimentoIndex)
	mov = move_and_slide(mov, Vector2(0,-1))
	gravidade()
	

	

var pneu  = pneu_cena.instance()	
func atirar(_delta):
	$animacoes.play("segurando")
	contador += _delta

	# talvez jogar isso no escopo global
	if !pegouPneu:
		pneu  = pneu_cena.instance()
		pegouPneu = true
		pneu.global_position = $shot.global_position
		get_tree().root.add_child(pneu)
			
	if contador > TEMPO_SEGURANDO :
		$animacoes.play("jogando")
		pneu.get_node("Area2D").jogou = true
		
	if(contador > TEMPO_ATIRANDO):
		mudarMovimento()
		pegouPneu = false



func dano(dano):
	vida -= dano
	print("chefe dano, vida = ",vida)
	

func pular():
	if direcao:
		mov.x = -VELOCIDADE
	else:
		mov.x = VELOCIDADE
		
	if is_on_floor():
		if contador == 1:
			contador=0
			mov.x = 0
			$tocador.play()
			mudarMovimento()
			direcao = novaDirecao()
		else:
			$animacoes.play("pulando")
			print("oi")
			mov.y  = -FORCA_PULO
			contador= 1
		
func pausa(_delta):
	$animacoes.play("parado")
	if contador < TEMPO_PAUSA:
		contador += _delta
	else:
		mudarMovimento()

func gravidade():
	if is_on_floor():
		mov.y = 0
	else:
		mov.y += GRAVIDADE

func novaDirecao():
	if direcao:
		return false
	return true
		
		
func mudarMovimento():
	contador = 0
	if movimentoIndex > 4 :
		movimentoIndex = 1
	else:
		movimentoIndex += 1

