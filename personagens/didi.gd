extends KinematicBody2D

export var direcao = -1
const VELOCIDADE = 500
var vida = 4
var mov = Vector2.ZERO
const GRAVIDADE = 35
const DANO = 30
		


func _ready(): 
	if(direcao < 0):
		$didi.flip_h = true
		
	mov.x = VELOCIDADE * direcao


func _process(_delta):
	
	if(is_on_floor()):
		mov.y = 0
	else:
		mov.y += GRAVIDADE
	
	$roda.rotation_degrees += 7 * direcao
	
	move_and_slide(mov, Vector2(0,-1)) #questionar isso


#se tomou bala
func _on_Area2D_area_entered(area):
	print(area.name)
	if area.name == "tiroArea":
		vida -= 1
		if(vida == 0 ):
			#talvez adicionar uma animacao aqui
			queue_free()


# se acertou o jogador
func _on_Area2D_body_entered(body):
	if body.has_method("dano"):
		body.dano(DANO)
	pass # Replace with function body.
