extends KinematicBody2D


const cena_disparo = preload("res://personagens/tiro.tscn")
#var vida =  100
# rever essa logica do tempo 
var mov = Vector2.ZERO
const GRAVIDADE = 30
const VELOCIDADE = 300
const FORCA_PULO = 600
const TEMPO_ANIM_ATIRANDO = .4
var pulando = false # tirar isso daqui uma hora
var atirando = 0
var count = 0
var isAgindo = false # so pra test
var movimento = 1

func _ready():
	$AnimatedSprite.play("parado")

func _process(_delta):
	setarMovimento()
	
	if Global.vida_jogador < 1:
		atirando += _delta
		if atirando > 4:
			if Global.vidas > 1 :
				get_tree().reload_current_scene()
				Global.vidas -= 1
			else:
				get_tree().change_scene("res://telas/gameOver.tscn")
			
		elif atirando > 2:
			$AnimatedSprite.play("explodindo")
		else :
			$AnimatedSprite.play("rastejando")		
			
			#$AnimatedSprite.rotation_degrees += 8
		
		return 
	
	
	


	if Input.is_action_pressed("ui_left"):
		mov.x = -VELOCIDADE
		$AnimatedSprite.flip_h = true
		$Sprite.flip_h = false
		$AnimatedSprite.play("andando")
		
	elif Input.is_action_pressed("ui_right"):
		mov.x = VELOCIDADE
		$AnimatedSprite.flip_h = false
		$Sprite.flip_h =  true
		$AnimatedSprite.play("andando")
		
		
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		mov.y = - FORCA_PULO 
		pulando = true
		
	if Input.is_action_just_pressed("quadrado") and Global.balas_tela < 6:
		atirar()
		atirando += _delta
	
	
	
	if pulando:#por algum motive certas# plataformas ele nao considera chao
		$AnimatedSprite.play("pulando")
	elif(mov.x == 0 ):
		$AnimatedSprite.play("parado")
		
	if(atirando > 0 ):
		if(atirando > TEMPO_ANIM_ATIRANDO):
			atirando = 0
		else:
			atirando += _delta
			$AnimatedSprite.play("atirando")
	
	#print(isAgindo)
	move_and_slide(mov, Vector2(0,-1)) #questionar isso

#
		

func atirar():
	var obj_disparo  = cena_disparo.instance()	
	obj_disparo.global_position = $Position2D.global_position
	Global.balas_tela += 1
	obj_disparo.get_node("tiroArea").ready($AnimatedSprite.flip_h)
	get_tree().root.add_child(obj_disparo)

func dano(dano):
	#incrementar isso aqui
	Global.vida_jogador -= dano
	print("vida ", Global.vida_jogador)


func setarMovimento():
	mov.x = 0
	if(is_on_floor()):
		mov.y = 0
		pulando = false
	else:
		mov.y += GRAVIDADE
		

