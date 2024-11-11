extends KinematicBody2D

var gravidade = 234
var velocidade = 300
var forca_pulo = 800
var mov = Vector2.ZERO
var pulando  = false
var atacando = false
var direcao = 1
func _process(delta):
	mov.x = 0
	mov.y += gravidade
	if (not atacando):
		if (Input.is_action_pressed("ui_left")):
			mov.x = -velocidade
			$Sprite.flip_h = false
			direcao = -1
			
		elif (Input.is_action_pressed("ui_right")):
			mov.x = velocidade
			$Sprite.flip_h = true
			direcao = 1
			
	if (Input.is_action_just_pressed("ui_up") and is_on_floor()):
		mov.y = -forca_pulo
	
	if (mov.x==0 and is_on_floor() and not atacando):
		$AnimationPlayer.play("parado")
	elif (mov.x!=0 and is_on_floor() and not atacando):
		$AnimationPlayer.play("andando")
	
	if (not is_on_floor()):
		if (not pulando):
			$AnimationPlayer.play("pulando")
			pulando  = true
			atacando = false
	else: 
		pulando = false
		
	if (Input.is_action_just_pressed("quadrado")):
		$AnimationPlayer.play("atirando")
		atacando = true
	
	if ($AnimationPlayer.current_animation=="" or not is_on_floor()):
		atacando = false
		
	mov = move_and_slide(mov, Vector2(0,-1))


func disparar(anim_name):
	if (anim_name=="atirando"):
		var cena_disparo = preload("res://coisasProfessor/cena_disparo.tscn")
		var obj_disparo  = cena_disparo.instance()
		obj_disparo.get_node("Area2D").ready($Sprite.flip_h) 
		get_tree().root.add_child(obj_disparo)
		
		if (direcao==1):
			obj_disparo.global_position = $Position2DDir.global_position
		elif (direcao==-1):
			obj_disparo.global_position = $Position2DEsq.global_position
			
		
	
	
	
	
	
	
	
