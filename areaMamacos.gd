extends  Node2D



var Mamaco = preload("res://personagens/Besouro.tscn")
#$mamaco1/posicao1 posicao

func spawnar(body,direcao,posicao):
	if body.name == "Player":
		var macaco = Mamaco.instance()	
		macaco.get_child(0).direcao = direcao
		#print(macaco.setar())
		
		#print(macaco.get_child(0).direcao)
		macaco.global_position = posicao.global_position
		
		get_tree().root.add_child(macaco)


func _on_mamaco1_body_entered(body):
	spawnar(body,-1,$mamaco1/posicao1)
	pass # Replace with function body.


func _on_mamaco2_body_entered(body):
	spawnar(body,-1,$mamaco2/posicao2)
	pass # Replace with function body.


func _on_mamaco3_body_entered(body):
	spawnar(body,1,$mamaco3/posicao3)
	pass # Replace with function body.
