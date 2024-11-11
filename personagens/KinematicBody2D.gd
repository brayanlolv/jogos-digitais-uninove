
func _process(_delta):
	
	if movimentoIndex % 2 == 0:
		pausa(_delta)
	else:
		if(movimentoIndex == 1):
			pular()
	
	
	
	print(movimentoIndex)
	gravidade()
	move_and_slide(mov)
	pass




func atirar():
	pass

func pular():
	if is_on_floor():
		if direcao:
			mov.x = VELOCIDADE
		else:
			mov.x = -VELOCIDADE

		print("a")
	elif contador:
		print("b")
		contador=0
		mudarMovimento()
		mov.y = 0
	else:
		print("c")
		mov.y = FORCA_PULO
		contador= 1
		
func pausa(_delta):
	if contador < TEMPO_PAUSA:
		contador += _delta
	else:
		mudarMovimento()

func gravidade():
	if is_on_floor():
		mov.y = 0
	else:
		mov.y += GRAVIDADE
	
		
		
func mudarMovimento():
	contador = 0
	if movimentoIndex > 1 :
		movimentoIndex = 0
	else:
		movimentoIndex += 1
