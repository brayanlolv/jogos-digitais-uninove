extends Node2D


#musica vai do -40 ao -10, padrao -20


func _ready():
	Global.cena_anterior = get_tree().current_scene.filename
	Global.vida_jogador = 100
	
	$MusicaFase.volume_db = (Global.volume_musica - 40)
	pass # Replace with function body.


func _process(_delta):
	if Input.is_action_pressed("menu"):
		get_tree().change_scene("res://telas/configuracoes.tscn")



func _on_mamaco3_body_entered(body):
	pass # Replace with function body.
