extends KinematicBody2D

var velocidade = 100
var gravidade  = 20
var direita    = true
var mov        = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mov.y += gravidade
	
	if (not $RayCast2DEsq.is_colliding()):
		direita = true
	if (not $RayCast2Dir.is_colliding()):
		direita = false
	
	if (direita):
		$Sprite.flip_h = false
		mov.x = velocidade
	else:
		$Sprite.flip_h = true
		mov.x = -velocidade
		
	mov = move_and_slide(mov)
	
